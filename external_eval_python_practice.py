
# Program Name:  External_eval_Python_practice
# Author:        Mikhail Hoskins
# Date Created:  12/19/2025
# Date Modified: 01/08/2026
# Description:   Four tables of basic information from three joined tables. A few plots because those help me understand the data.
#
# Inputs:       Patient_Demographics.csv , Patient_Diagnosis_(2).csv , Patient_Treatment_(2).csv
# Output:       Idk how to do this yet...
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

from pathlib import Path
from statistics import median
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
from sqlalchemy import create_engine
from pandasql import sqldf

#Running SQL locally

pysqldf = lambda q: sqldf(q, globals())
# Connect to server and pull in data


# Create connection to SQL Server
engine = create_engine(
    'mssql+pyodbc://LAPTOP-PTVDVGSP\\SQL2025/Projects_Database'
    '?driver=ODBC+Driver+17+for+SQL+Server'
    '&trusted_connection=yes'
)

# Extract the three tables you uploaded
pt_demo = pd.read_sql('SELECT * FROM dbo.Patient_Demographics', engine)
pt_diag = pd.read_sql('SELECT * FROM dbo.Patient_Diagnosis__2_', engine)
pt_treat = pd.read_sql('SELECT * FROM dbo.Patient_Treatment__2_', engine)


#GIT
from git import Repo
# URL
repo = Repo('C:\\Data\\FlatIron Skills Test\\Code\\Python')
remote_url = "https://github.com/mishahoskins/Portfolio.git"

#Set filepath (kind of like a macro in SAS)
filepath = Path("C:\\Data\\Skills Test\\Data")

joined_pt_info = pysqldf("""
    select 
 	    a.patient_id, a.birth_sex, a.birth_date, a.region,
	    b.diagnosis_date, b.diagnosis_code, b.diagnosis, b.stage_dx,
	    c.treatment_date, c.drug_code

            from pt_demo a left join pt_diag b on a.patient_id = b.patient_id
			   left join pt_treat c on a.patient_id = c.patient_id
""")
print(joined_pt_info)

# Because we're in Python using native-ish SQL, we don't need to reformat dates like we do in SAS or even R
#Table 1| Proportion and count of cancer type
#____________________________________________

# ID max(not actually max, just a way to get the value) breast and colon cancer diagnoses in each individual (either 1 or 0 for each person)
# Group by ID to only sum each individual

cancer_type_tbl1 = pysqldf("""
    select
        bc_only,
	    (bc_only*1.0 / (total)) as prop_bc_only,
	    cc_only,
	    (cc_only*1.0 / (total)) as prop_cc_only,
	    can_both,
	    (can_both*1.0 / (total)) as prop_both

   from (select 
	    sum (case when breast_cancer_flag in (1) and colon_cancer_flag in (0) then 1 else 0 end) as bc_only,
	    sum (case when breast_cancer_flag in (0) and colon_cancer_flag in (1) then 1 else 0 end) as cc_only,
	    sum (case when breast_cancer_flag in (1) and colon_cancer_flag in (1) then 1 else 0 end) as can_both,
	    sum (case when breast_cancer_flag not in (99) and colon_cancer_flag not in (99) then 1 else 0 end) as total

    from (select
        patient_id,
	    max (case when diagnosis in ('Breast Cancer') then 1 else 0 end) as breast_cancer_flag ,
	    max (case when diagnosis in ('Colon Cancer') then 1 else 0 end) as colon_cancer_flag
          
    from pt_diag
        group by patient_id))
	""")
# Convert to percentage for easier interpretation. This is a personal preference, but I find it easier to interpret proportions in this way. SQL all the way until the very end then 
# a quick format.
cancer_type_tbl1[['prop_bc_only', 'prop_cc_only', 'prop_both']] = \
    cancer_type_tbl1[['prop_bc_only', 'prop_cc_only', 'prop_both']] * 100
#Table 1 Final
print (cancer_type_tbl1)


#Table 2| Time to treatment
#__________________________
# DATEDIFF(day, diagnosis_date, treatment_date) AS days_between
# Run your first query as-is to get the dates
time_to_treat = pysqldf("""   
   select 
        patient_id,
        diagnosis,
        case when diagnosis in ('Breast Cancer') then min(diagnosis_date) else NULL end as first_diag_bc,
        case when diagnosis in ('Breast Cancer') then min(treatment_date) else NULL end  as first_treat_bc,
        case when diagnosis in ('Colon Cancer') then min(diagnosis_date) else NULL end as first_diag_cc,
        case when diagnosis in ('Colon Cancer') then min(treatment_date) else NULL end  as first_treat_cc
            from joined_pt_info
            group by patient_id""")

# Convert to datetime in pandas
time_to_treat['first_diag_bc'] = pd.to_datetime(time_to_treat['first_diag_bc'])
time_to_treat['first_treat_bc'] = pd.to_datetime(time_to_treat['first_treat_bc'])
time_to_treat['first_diag_cc'] = pd.to_datetime(time_to_treat['first_diag_cc'])
time_to_treat['first_treat_cc'] = pd.to_datetime(time_to_treat['first_treat_cc'])

# Calculate differences in days
time_to_treat['time2treat_bc'] = (time_to_treat['first_treat_bc'] - time_to_treat['first_diag_bc']).dt.days
time_to_treat['time2treat_cc'] = (time_to_treat['first_treat_cc'] - time_to_treat['first_diag_cc']).dt.days
#Python doesn't have a median in their SQL for some insane reason so we'll use Pandas
# Summary statistics for time to treatment
summary_time_to_treat = time_to_treat[['time2treat_bc', 'time2treat_cc']].agg(['median', 'min', 'max', 'std'])

# Transpose for better readability (cancer types as rows)
summary_time_to_treat = summary_time_to_treat.T
summary_time_to_treat.index = ['Breast Cancer', 'Colon Cancer']

summary_time_to_treat



# First we take the first treatment date for each individual and diagnosis (can have >1 diagnosis)
first_line_treatment = pysqldf("""
    select
        patient_id,
	    diagnosis,

        min(treatment_date) as first_treatment
        
            from joined_pt_info
            group by patient_ID, diagnosis""")

#Next we join on drug code for the first treatment date. Now we have a table with all treatments administered on the first date of treatment where
# first treatment date aligns with the treatment administered for that first treatment ***this is the crux of this code***.
treatment = pysqldf("""
    select
        a.patient_ID,
        a.diagnosis,
        a.first_treatment,
        b.drug_code
        
            from first_line_treatment a left join joined_pt_info b
            on a.patient_ID = b.patient_ID and a.first_treatment = b.treatment_date""")

# Now it gets a little tricky. We'll use max again to get the first non-missing drug in each category A-D and put them into a separate column. Then group by DISTINCT pt id, diagnosis, and first treatment date
# so we can look at treatment breakdown by cancer type specifically. One patient, diagnosis, and treatment type per line. Could have the same patient with a different diagnosis and subsequent treatment,
# but that would be it becuase we pulled the first treatment by type There may be a quicker way to do this, but in the interest of time we'll just do this.
treatment_II = pysqldf("""
    select distinct
        patient_id,
        diagnosis,
        first_treatment,
        
        max(case when drug_code = 'A' then drug_code else '' end) as drug_A,
        max(case when drug_code = 'B' then drug_code else '' end) as drug_B,
        max(case when drug_code = 'C' then drug_code else '' end) as drug_C,
        max(case when drug_code = 'D' then drug_code else '' end) as drug_D
    
            from treatment
            group by patient_id, diagnosis, first_treatment""")


# Extra step to create a flag that denotes more than one kind of cancer diagnosed.But necessary in the event there are > 2 kinds of
# cancer. Best practice. Each additional column in treatment or cancer type makes this piece more valuable. Now we'll create a summary table to look at drug combinations.
treatment_both = pysqldf("""
    select
        patient_id,
        count (*) as multiple_flag
        
        from treatment_II
        group by patient_id""")

re_join_flag = pysqldf("""
    select distinct
        a.patient_id, a.first_treatment, a.drug_A, a.drug_B, a.drug_C, a.drug_D ,
        a.diagnosis,
        case when b.multiple_flag > 1 then 1 else 0 end as flag_both_cancer

        from treatment_II a left join treatment_both b on a.patient_ID = b.patient_ID""")
# Add 'both' diagnoses back in (can't use calculated in SQLdf)
re_join_flag_2 = pysqldf("""
    select distinct
        patient_id, drug_A, drug_B, drug_C, drug_D,
        case when  flag_both_cancer in (1) then 'Breast and Colon' else diagnosis end as diagnosis_new
        from re_join_flag""")

#Individual and pairs identified from a spot check of re_join_flag_2. If there are extended columns, can be easily added for future iterations. This one was fun!
summary_treatment_tbl3 = pysqldf("""
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
        group by diagnosis_new""")


# Reshape data for better display
summary_long = summary_treatment_tbl3.melt(
    id_vars='cancer_diagnosis',
    var_name='treatment_combination',
    value_name='count'
)

# Filter out zero counts for cleaner display
summary_long = summary_long[summary_long['count'] > 0]

# Pivot for a nice cross-tab view
summary_pivot = summary_long.pivot(
    index='cancer_diagnosis',
    columns='treatment_combination',
    values='count'
).fillna(0).astype(int)

summary_pivot


#Outputs:
#table 1: cancer_type_tbl1
cancer_type_tbl1


#table 2: time to treatment summary
summary_time_to_treat

#table 3: treatment combinations by cancer type
summary_pivot

#table 3: visualization of treatment combinations by cancer type
# Create a bar chart
plt.figure(figsize=(12, 6))
summary_long_filtered = summary_long[summary_long['count'] > 0]

sns.barplot(
    data=summary_long_filtered,
    x='treatment_combination',
    y='count',
    hue='cancer_diagnosis',
    palette='Set2'
)

plt.title('First-Line Treatment Combinations by Cancer Type')
plt.xlabel('Treatment Combination')
plt.ylabel('Number of Patients')
plt.legend(title='Cancer Diagnosis', bbox_to_anchor=(1.05, 1), loc='upper left')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

