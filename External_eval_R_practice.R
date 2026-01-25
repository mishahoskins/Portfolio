# Program Name:  External_eval_R_practice
# Author:        Mikhail Hoskins
# Date Created:  12/19/2025
# Date Modified: 01/24/2026 <- installed pacman begin tidyverse translastion for portfolio
# Description:   Four tables of basic information from three joined tables. A few plots because those help me understand the data. 
#
# Inputs:       Patient_Demographics.csv , Patient_Diagnosis_(2).csv , Patient_Treatment_(2).csv
# Output:       Tables_plots_output.HTML
# Notes:        Program pulls three files, joins on pt ID, and runs descriptive epi. When I see multiple tables, I revert to 
#               relational database (diagnosis, demographics, treatment) management. Each table has its own characteristics and is "related"
#               to the others based on an identifier. I believe in using methods that are transferable between programming languages. Ie. R/SAS/Python etc. For that reason,
#               and at the risk of disqualifying myself I'm running this in the most table-centric manner with SQL (sqlDF). 
#               That's a hill I'll die on for the following reasons:
#               i.  We almost never have data this clean in real-world development and analysis, data is useless without proper denormalization and the ability to normalize and convert
#                   to both event, person, and longtidy versions depending on our use case.
#               ii. Inevitably, we will have additional questions and a clean track and record of tables created at each stage can be useful.
#               iii.Pivots are much easier IMO.
#               iv. SQL doesn't limit our cross-program functionality .
#               v.  Personal preference (this may be the disqualifying part but SQL is just so intuitive to me).
#
#               Annotations are at # (between /* in SAS) to help guide.

#Install and load the following packages:
# library(sqldf)
# library(dplyr)
# library(tidyverse)
# library(kableExtra)
# install.packages("pacman")                                                                   
                                                                                    
                                                                                    
pacman::p_load(dplyr, rvest, lubridate, rio, tidyverse, skimr, sqldf, gtsummary, openxlsx, kableExtra, knitr)
                                                                                    

#Bring in data
pt_demo <- read.csv("C:\\Data\\Skills Test\\Data\\Patient_Demographics.csv")
pt_diag <- read.csv("C:\\Data\\Skills Test\\Data\\Patient_Diagnosis_(2).csv")
pt_treat <- read.csv("C:\\Data\\Skills Test\\Data\\Patient_Treatment_(2).csv")

#Basic SQL syntax that we'll follow throughout: 
#table_name <- sqldf(""
    
    #stuff goes here select, col names, from group by, left/right/full join on etc.(in between quotes)
  
#)#end note

#Tidyverse for reasons:
Rspecific_join_all <- pt_demo |>
      left_join(pt_diag, by = "patient_id", relationship = "many-to-many") |>
      left_join(pt_treat, by = "patient_id", relationship = "many-to-many")


#Join them all on pt. ID
#Join all data, we may or may not use this but having a patient ID level denormalized table is never bad.
joined_pt_info <- sqldf(" 

    select 

 	    a.patient_id, a.birth_sex, a.birth_date, a.region,
	    b.diagnosis_date, b.diagnosis_code, b.diagnosis, b.stage_dx,
	    c.treatment_date, c.drug_code

            from pt_demo a left join pt_diag b on a.patient_id = b.patient_id
			   left join pt_treat c on a.patient_id = c.patient_id") 

# Fix dates, there are three and it's always a good test to make sure they're uniform so we add/subtract them properly later. 
    #SQL in R-SQLdf doesn't always handle dates properly so we'll use R's internal reformatting here. 
joined_pt_info$diagnosis_date <- as.Date(joined_pt_info$diagnosis_date, format = "%m/%d/%y")
joined_pt_info$treatment_date <- as.Date(joined_pt_info$treatment_date, format = "%m/%d/%y")
joined_pt_info$birth_date <- as.Date(joined_pt_info$birth_date, format = "%Y-%m-%d")
pt_demo$birth_date <- as.Date(pt_demo$birth_date, format = "%Y-%m-%d") #fix this too
pt_diag$diagnosis_date <- as.Date(pt_diag$diagnosis_date, format = "%m/%d/%y") #and this

#Take a look at the table to make sure nothing is super wonky.
head(joined_pt_info, 100)


#Table 1| Proportion and count of cancer type
#____________________________________________

# ID max(not actually max, just a way to get the value) breast and colon cancer diagnoses in each individual (either 1 or 0 for each person)
# Group by ID to only sum each individual
cancer_type_group <- sqldf(" 
         
    select distinct

	    patient_id,
	    max (case when diagnosis in ('Breast Cancer') then 1 else 0 end) as breast_cancer_flag,
	    max (case when diagnosis in ('Colon Cancer') then 1 else 0 end) as colon_cancer_flag

            from pt_diag
	        group by patient_id")        

# The one disadvantage of SQL in R is we can't really link tables together in one statement, minor flaw and there's probably a work-around
# but in the interest of time we're just going to slap these tables on top of each other. On a positive note, the environment in R is amazing
# for tracking the process.

# Use sums to create counts and proportions.
cancer_type_tbl1_prep <- sqldf(" 


	select
	    sum (case when breast_cancer_flag in (1) and colon_cancer_flag in (0) then 1 else 0 end) as bc_only,
	    sum (case when breast_cancer_flag in (0) and colon_cancer_flag in (1) then 1 else 0 end) as cc_only,
	    sum (case when breast_cancer_flag in (1) and colon_cancer_flag in (1) then 1 else 0 end) as both,
	    sum (case when breast_cancer_flag not in (99) and colon_cancer_flag not in (99) then 1 else 0 end) as total
  from cancer_type_group")

# Remember R SQL server works a little differently with integers and we need to define them as having a decimal or the server will match the vibe and
# only give us 0 as an output.
cancer_type_tbl1 <- sqldf(" 

    select
        bc_only,
	    (bc_only*1.0 / (total)) as prop_bc_only,
	    cc_only,
	    ( cc_only*1.0 / (total)) as prop_cc_only,
	    both,
	    ( both*1.0 / (total)) as prop_both
             from cancer_type_tbl1_prep")

#Table 2| Time to treatment
#__________________________

# Assign a first diagnosis and treatment date for each individual based on their diagnosis
joined_pt_info$diagnosis_date <- as.Date(joined_pt_info$diagnosis_date, format = "%m/%d/%y")
joined_pt_info$treatment_date <- as.Date(joined_pt_info$treatment_date, format = "%Y-%m-%d")

time_to_treatment <- sqldf("
                           
    select 

        patient_id,
	    diagnosis,
	    diagnosis_date,
	    drug_code,

	    case when diagnosis in ('Breast Cancer') then  min(diagnosis_date) else NULL end as first_diag_bc,
	    case when diagnosis in ('Breast Cancer') then min(treatment_date) else NULL end  as first_treat_bc,
	    case when diagnosis in ('Colon Cancer') then min(diagnosis_date) else NULL end as first_diag_cc,
	    case when diagnosis in ('Colon Cancer') then min(treatment_date) else NULL end  as first_treat_cc

            from joined_pt_info
        	group by patient_id")  



# Absolute value difference in days from diagnosis to first treatment
time_to_treatment_2 <- sqldf("                         
                           
    select 
    
    	patient_id,
	    diagnosis,
	    first_diag_bc,
	    first_treat_bc,
	    first_diag_cc,
	    first_treat_cc,

        abs(first_diag_bc - first_treat_bc) AS time2treat_bc,
        abs(first_diag_cc - first_treat_cc) AS time2treat_cc
     
            from time_to_treatment")

# Distinct patient and diagnosis level
time_to_treatment_3 <- sqldf("
                             
    select 

	    patient_id,
	    diagnosis,
	    first_diag_bc,
	    first_treat_bc,
	    first_diag_cc,
	    first_treat_cc,
	    time2treat_bc,
	    time2treat_cc 
	        
	        from time_to_treatment_2")

# mean (average), med, max, min for each diagnosis*/                          
treatment_time_tbl2 <- sqldf("
                             
    select
	
	    avg(time2treat_bc) as mean_bc_t2t,
    	median(time2treat_bc) as med_bc_t2t,
    	max(time2treat_bc) as max_bc_t2t,
    	min(time2treat_bc) as min_bc_t2t,

    	avg(time2treat_cc) as mean_cc_t2t,
    	median(time2treat_cc) as med_cc_t2t,
    	max(time2treat_cc) as max_cc_t2t,
    	min(time2treat_cc) as min_cc_t2t
	
            from time_to_treatment_2")   
                      
#Table 3| First treatment if the patient has breast cancer only, colon cancer only, or both.
#_____________________________________________________________________________________

# First we take the first treatment date for each individual and diagnosis (can have >1 diagnosis)
first_line_treatment <- sqldf("

    select
    
        patient_ID,
    	diagnosis,
	    min(treatment_date) as first_treatment

            from joined_pt_info
	        group by patient_ID, diagnosis")   

#Next we join on drug code for the first treatment date. Now we have a table with all treatments administered on the first date of treatment.                            
treatment <- sqldf("
                   
    select 
	
    	a.patient_ID,
    	a.diagnosis,
    	a.first_treatment,
		b.drug_code

            from first_line_treatment a left join joined_pt_info b
	    	on a.patient_ID = b.patient_ID and a.first_treatment = b.treatment_date")   
                 
# Now it gets a little tricky. We'll use max again to get the first non-missing drug in each category A-D and put them into a separate column. Then group by pt id, diagnosis, and first treatment date
# so we can look at treatment breakdown by cancer type specifically. There may be a quicker way to do this, but in the interest of time we'll just do this.
treatment_II <- sqldf("
                      
    select distinct
    
        patient_id,
	    diagnosis,
	    first_treatment,
	    max(case when drug_code = 'A' then drug_code else '' end) as drug_A,
	    max(case when drug_code = 'B' then drug_code else '' end) as drug_B,
	    max(case when drug_code = 'C' then drug_code else '' end) as drug_C,
	    max(case when drug_code = 'D' then drug_code else '' end) as drug_D
                      
                 
            from treatment
	        group by patient_id, diagnosis, first_treatment")     
                      
# Extra step to create a flag that denotes more than one kind of cancer diagnosed.But necessary in the event there are > 2 kinds of
# cancer. Best practice. Each additional column in treatment or cancer type makes this piece more valuable. Now we'll create a summary table to look at drug combinations. 

treatment_both <- sqldf("
                        
    select

	    patient_id,
	    count (*) as multiple_flag

            from treatment_II 
	        group by patient_id")
                        
re_join_flag <- sqldf("
                      
    select distinct

	a.patient_id, a.first_treatment, a.drug_A, a.drug_B, a.drug_C, a.drug_D ,
    a.diagnosis,
	case when b.multiple_flag > 1 then 1 else 0 end as flag_both_cancer

        from treatment_II a left join treatment_both b on 
    	a.patient_ID = b.patient_ID")      
                      
# Add 'both' diagnoses back in (can't use calculated in SQLdf)                      
re_join_flag_2 <- sqldf("

    select distinct
    
        patient_id, drug_A, drug_B, drug_C, drug_D,
    	case when  flag_both_cancer in (1) then 'Breast and Colon' else diagnosis end as diagnosis_new                                             
        from re_join_flag")           

#Individual and pairs identified from a spot check of re_join_flag_2. If there are extended columns, can be easily added for future iterations. This one was fun!        
summary_treatment_tbl3 <- sqldf("
                                
    select
    
	    diagnosis_new as cancer_diagnosis,

	    sum (case when drug_A in ('A') and drug_B in ('') and drug_C in ('') and drug_D in ('') then 1 else 0 end) as A_only,
	    sum (case when drug_A in ('') and drug_B in ('B') and drug_C in ('') and drug_D in ('') then 1 else 0 end) as B_only,
	    sum (case when drug_A in ('') and drug_B in ('') and drug_C in ('C') and drug_D in ('') then 1 else 0 end) as C_only,
	    sum (case when drug_A in ('') and drug_B in ('') and drug_C in ('') and drug_D in ('D') then 1 else 0 end) as D_only,

	    sum (case when drug_A in ('A') and drug_B in ('B') and drug_C in ('') and drug_D in ('') then 1 else 0 end) as AB_only,
	    sum (case when drug_A in ('') and drug_B in ('B') and drug_C in ('C') and drug_D in ('') then 1 else 0 end) as BC_only,
	    sum (case when drug_A in ('') and drug_B in ('') and drug_C in ('C') and drug_D in ('D') then 1 else 0 end) as CD_only,
	    sum (case when drug_A in ('A') and drug_B in ('') and drug_C in ('') and drug_D in ('D') then 1 else 0 end) as AD_only

            from re_join_flag_2 
	        group by diagnosis_new")                       
                                

#Table 4| Demographics table
#_____________________________________________________________________________________                                
  
# First we take the first treatment date for each individual and diagnosis (can have >1 diagnosis)                              
first_diag <- sqldf("
      
   select distinct

	patient_ID,
	min(diagnosis_date) as first_diag

        from joined_pt_info
	    group by patient_ID")   

# Join to demographic data (min stage for ties in all other categories if necessary. **should** default to earliest stage ID'd but there was one or two wonky ones.)                   
join_demo_prsn_lvl <- sqldf("
    
    select distinct

	    a.patient_ID,
	    a.first_diag,
	    
	    b.birth_sex,
	    abs (b.birth_date - a.first_diag) as age_diag_days,
	    b.region,
	    
	    min(c.stage_dx) as earliest_stage 

            from first_diag a left join pt_demo b 
	        on a.patient_ID = b.patient_ID
	        left join pt_diag c
	        on a.patient_ID = c.patient_ID
	        group by a.patient_ID")

#Dummy table for matching                        
create_match <- sqldf("
      
    select

	    patient_ID,
	    diagnosis_date as date_match ,
	    diagnosis

            from pt_diag") 

# Final table: using full year for age at diagnosis but also kept age in days since that can be relevant too especially with time to event questions              
summary_demo_tbl4 <- sqldf("
     
     select distinct

    	a.*,
    	round(a.age_diag_days / 365.25, 0) as age_diag_years,
    	b.diagnosis

            from join_demo_prsn_lvl a left join create_match b 
        	on a.patient_id = b.patient_id and a.first_diag = b.date_match")                      
                           


# I find visualizations to be much more intuitive in R. I like to use the easiest possible
# package to look at quick metrics. The biostats package is nice and keeps me from having to learn and keep up with a bunch of syntax. 
library(biostats)

#rename for working file
viz_demographics <- summary_demo_tbl4
#summary view
head(viz_demographics,10)

# Boxplot of age in years by diagnosis grouped by sex at birth. Is one age older at diagnosis? Does age at diagnosis change by type?                                               
diag_age_sex_box <- plot_box(viz_demographics, x ="diagnosis", y = "age_diag_years", group =  "birth_sex") 
    print(diag_age_sex_box)
# Boxplot of age in years by earliest stage detected grouped by sex at birth. Is one age older at diagnosis? Does age at diagnosis change by stage?
stage_age_sex_box <- plot_box(viz_demographics, x ="earliest_stage", y = "age_diag_years", group =  "birth_sex")
    print(stage_age_sex_box)  
    
# Boxplot of age in years by region no grouping here. Does region matter? Does age at diagnosis change by region?                                               
diag_age_region <- plot_box(viz_demographics, x ="region", y = "age_diag_years")
    print(diag_age_region)
              #Comparison of means or medians could work here for an evaluation of whether any region is different in age at diagnosis. 
              #Kruskal-Wallis probably, multiple predictors (>2 regions), likely not normal data. 
    
    
    
#Median age of diagnosis by cancer type
age_diag_hist <- plot_hist(viz_demographics, x = "age_diag_years", group = "diagnosis", stat = "median")
    print(age_diag_hist)
#Median age of diagnosis by sex at birth
age_sex_hist <- plot_hist(viz_demographics, x = "age_diag_years", group = "birth_sex", stat = "median")
    print(age_sex_hist)                    
                    
#Normal dist. check on age in days, used days because it is more granular than rounded years. Imperative first step for any modeling.
    
normal_dist_agedays <- normality(data = viz_demographics, "age_diag_days")
    print(normal_dist_agedays)                                  
                               #Well I was wrong, data is normal. ANOVA could work using mean age at whatever metric to assess differences. That's why we run this I guess.

    
#fin.












