
/*
 *------------------------------------------------------------------------------
 * Program Name:  RIPS_Dashboard_Cleaning 
 * Author:        Mikhail Hoskins
 * Date Created:  08/28/2025
 * Date Modified: 09/08/2025
 * Description:   SAS code for cleaning ICAR visits and other educational touchpoints from the RIPS team. 
				  
 *
 * Inputs:       https://app.smartsheet.com/sheets/Xcvxc7M33QV6whv9FvvMjFjxF24JGxMcqHf2XVX1?view=grid , https://survey.dph.ncdhhs.gov/redcap_v14.6.2/DataExport/index.php?pid=64
 * Output:       ICAR_final.csv , ICAR_excel.xlsx
 * Notes:        Modification of prior code. Removed environmental rounds piece, no longer used. Basically a big 'ol pivot. Moving to SAS. 
 *				 Note: 8/28/2025: we are now pulling from SHARPPS ICAR TOOL, the RIPS ICAR TOOL is no longer in use. Need to confine to ripsvist = 1 (Yes) [Was this a RIPS Visit? Yes only.]
 *				 Variables to keep: Record ID, Facility Name, Facility Type, Facility County, Assessment date,	
 *				 Variables to create: IP Area, IP Gap, Compliance
 *				 
 *
 *------------------------------------------------------------------------------
 */


/*Set library and file path names*/
libname RIPS 'C:\Users\mhoskins1\Desktop\Work Files\RIPS Dashboard\Data';
%let output C:\Users\mhoskins1\Desktop\Work Files\RIPS Dashboard\;
	%put &output;
%let data = C:\Users\mhoskins1\Desktop\Work Files\RIPS Dashboard\;
	%put &data;
/*Set report date automatically to "today"*/
%let repdate = %qsysfunc(today(),MONNAME3.) %qsysfunc(today(),DAY2.), %qsysfunc(today(),YEAR4.);/*Date of report set to "today"*/
	%put &repdate;
/*Clear prior outputs*/
dm 'odsresults; clear';


/*Import from RedCap Code, keep only Ripsvisits*/
data icar_raw;	
	set RIPS.icar_sas;
where ripsvisit in (1);

run;


proc freq data=icar_raw; tables  facility_type___10   / norow nocol nopercent;run;
/*Group facilities into SNF/nursing home, adult care, and other*/
proc sql;
create table facility_groups as
select

	*,

	case when facility_type___14 in (1) then 'SNF/Nursing Home'
		 when facility_type___15 in (1) then 'Adult Care Homes/Behavioral Hlth. Fac.'
		 when facility_type___16 in (1) then 'Other Congregate Living Fac.'
	/*	 when facility_type___9 in (1) or facility_type___1 in (1) then 'Acute Care Fac.'
		 when facility_type___2 in (1) or facility_type___12 in (1) then 'LTAC, LTACH'*/

		 else 'Other' end as facility_type_group

from icar_raw
;

create table facility_sum as
select
/*Calculate percentage of each in a nice table for outputs*/
	sum (case when facility_type_group not in ('') then 1 else 0 end) as tot_visits 'Total facility visits',
	sum (case when facility_type_group in ('SNF/Nursing Home') then 1 else 0 end) as SNF_nurs 'SNF/Nursing Home',
		calculated SNF_nurs / calculated tot_visits as pct_SNF "Nursing Home/ Skilled Nursing Facilities" format percent10.2,
	sum (case when facility_type_group in ('Adult Care Homes/Behavioral Hlth. Fac.') then 1 else 0 end) as AD_BHF 'Adult Care Homes/Behavioral Hlth. Fac.',
		calculated AD_BHF / calculated tot_visits as pct_ADBHF "Assisted Living Facilities" format percent10.2,
	sum (case when facility_type_group in ('Other Congregate Living Fac.') then 1 else 0 end) as Oth_cong 'Other Congregate Living Fac.',
		calculated Oth_cong / calculated tot_visits as pct_oth "Other Congregate Living Facilities" format percent10.2

from facility_groups;
	alter table facility_sum drop tot_visits, SNF_nurs, AD_BHF, Oth_cong
;
quit;
/*Bonus for transitioning this to R, do this: new_df <- old_df %>% select(ends_with("_obs"))*/

/*Keep only question variables to assess*/ 
data icar_working;

set facility_groups
	(keep = facility_name record_id facility_type_group

	/*Hand Hygiene*/
			:hh_policies
			:hh_sinkavail
			:hh_throughout
			:hh_only
			:hh_supplies
			:hh_nails
	/*transmission based precautions*/
			:transmission_policy
			:ppe_supplies
			:semipriv
			:tbp_admit
			:tbp_transfer
			:tbp_change
			:ebp_identify
			:trans_signforclean
			:resp_entrance
			:resp_station
			:resp_visitors
			:fit_testing
	/*Environmental cleaning and observation*/
			:policy_disinf
			:contact_disinf
			:hightouch_disinf
			:room_disinf
			:equip_disinf
			:gluc_disinf
			:disinf_glucavail
			:gluc_disinfection_2
			:shower_disinf
			:showindicate_disinf
			:supp_disinf
			:sink_obs
			:undersink_obs
			:cleansupp_obs
			:cleandirty_obs
			:disinfectequip_obs
			:eqip_obs
			:coverlinen_obs
			:soiled_obs
			:sharps_obs
			:medprep_obs
			:expir_obs
	/*Injection and Medication Safety*/
			:gluc_supplies
			:stor_gluc
			:insulin_pens
			:insulin_storage
			:inject_policy
			:one_time_syringe
			:single_dose
			:multi_dose
			:gloves_inject
	/*Healthcare laundry*/
			:supp_laund___1	
			:supp_laund___2	
			:supp_laund___3	

		
);

run;
proc print data=icar_raw; var showindicate_disinf___1; run;
/*Keep only the variables we'll need, there's like 900+ variables and most of them we won't use. We want to keep ALL variables associated with each IP area.*/


/*clear all your other terrible results*/
dm 'odsresults; clear';
/*Part II of keeping variables needed, keeping only the true/false answers*/
/*Create a variable list*/
proc contents data=icar_working out=vars(keep=name) noprint;
run;
/*Select variables that end in __1 (true) or __2 (false)*/
proc sql noprint;
  select name into :obs_vars separated by ' '
  from vars
  where name like '%___2' or name like '%___1';
quit;

/*Keep only question variables to assess*/ 
data icar_working_2;

set icar_working
	(keep = facility_name record_id facility_type_group
	/*only keep T/F variables*/
			&obs_vars);
run;
proc print data=icar_working_2;run;


/*This macro takes each prefix and assigns 1=True 0=False to a new prefix-named column. Essentially it combines our ___1 and ___2 T/F columns into one column that we'll name compliance later*/
%macro combine_pairs(prefixes=

/*
  showindicate_disinf__ 
  fit_testing__ 
  cleansupp_obs__ 
  sink_obs__ 
  supp_disinf__*/ 

cleandirty_obs_
cleansupp_obs_
contact_disinf_
coverlinen_obs_
disinf_glucavail_2_
disinf_glucavail_
disinfectequip_obs_
ebp_identify_
eqip_obs_
equip_disinf_
expir_obs_
fit_testing_
gloves_inject_
gluc_disinf_2_
gluc_disinf_
gluc_disinfection_2_
gluc_disinfection_
gluc_supplies_
hh_nails_
hh_only_
hh_policies_
hh_sinkavail_
hh_supplies_
hh_throughout_
hightouch_disinf_
inject_policy_
insulin_pens_
insulin_storage_
medprep_obs_
multi_dose_
one_time_syringe_
policy_disinf_
ppe_supplies_
resp_entrance_
resp_station_
resp_visitors_
room_disinf_
semipriv_
sharps_obs_
shower_disinf_
showindicate_disinf_
single_dose_
sink_obs_
soiled_obs_
stor_gluc_
supp_disinf_
supp_laund_
tbp_admit_
tbp_change_
tbp_transfer_
trans_signforclean_
transmission_policy_
undersink_obs_

);

create table combine_tf_vars as
  select
    facility_name, record_id, facility_type_group,
    %let n=%sysfunc(countw(&prefixes));/*Identify prefixes above*/
	/*1 - n number of prefixes listed above*/
    %do i=1 %to &n;
      %let p=%scan(&prefixes, &i); 
      case
	  /*taking each prefix and if they end in __1 then true (if 1) if they end in __2 then false (if 1 we label 0). Now we 
	  	have combined each two column value into a one column T/F column AND we've run it through a macro to get the specified prefixes.
	  	This can be applied to ALL columns but generally we want to avoid select * in SQL*/
        when &p.__1 = 1 then 1 /*True*/
        when &p.__2 = 1 then 0 /*False*/
        else .
      end as &p._ 

      %if &i < &n %then ,; /*Sneaky code to not add an extra comma in your macro, no comma for last value 'i'*/

    %end;
  from icar_working_2;

%mend;

/*Now we put the macro into an SQL and go.*/
proc sql;

  %combine_pairs(prefixes=
/*
  showindicate_disinf__ 
  fit_testing__ 
  cleansupp_obs__ 
  sink_obs__ 
  supp_disinf__ */
cleandirty_obs_
cleansupp_obs_
contact_disinf_
coverlinen_obs_
disinf_glucavail_2_
disinf_glucavail_
disinfectequip_obs_
ebp_identify_
eqip_obs_
equip_disinf_
expir_obs_
fit_testing_
gloves_inject_
gluc_disinf_2_
gluc_disinf_
gluc_disinfection_2_
gluc_disinfection_
gluc_supplies_
hh_nails_
hh_only_
hh_policies_
hh_sinkavail_
hh_supplies_
hh_throughout_
hightouch_disinf_
inject_policy_
insulin_pens_
insulin_storage_
medprep_obs_
multi_dose_
one_time_syringe_
policy_disinf_
ppe_supplies_
resp_entrance_
resp_station_
resp_visitors_
room_disinf_
semipriv_
sharps_obs_
shower_disinf_
showindicate_disinf_
single_dose_
sink_obs_
soiled_obs_
stor_gluc_
supp_disinf_
supp_laund_
tbp_admit_
tbp_change_
tbp_transfer_
trans_signforclean_
transmission_policy_
undersink_obs_

)
quit;

proc print data=combine_tf_vars ;run;

/*label our IP gaps as they become relevant. Starting with 'top 5' and add more*/
data COMBINE_TF_VARS;
set COMBINE_TF_VARS;


label showindicate_disinf__ = "The facility has a process indicating cleaning of the shower room/treatment room.";
label  fit_testing__ = " N-95 respirators have been properly fit-tested and staff trained on proper use.";
label  cleansupp_obs__ = "Supplies are stored in a manner to prevent soiling or contamination.";
label  sink_obs__ = "Supplies and patient equipment are stored at least 3 feet away from sink."; /*validated 12/2/2025*/
label  supp_disinf__ = "Cleaning and disinfection supplies are readily available in shower rooms."; /*validated 12/2/2025*/

run;



/*Sort by record ID and transpose*/
proc sort data=combine_tf_vars; by record_id;run;
/*Pivot long way to create an easy to group series of tables; Could do this column by column but I think this saves a little bit of time.*/
proc transpose data=combine_tf_vars out=pivot_long;
   by record_id facility_name facility_type_group;
run;

proc print data=pivot_long (obs=10); where _NAME_ in ('resp_visitors__');run;

/*Now create IP Areas for each group of IP Gaps we are keeping from pivot long to create a plots table but alos to create percent compliant compliant and not compliant*/

proc sql; 
create table plots_longtidy as
select



	record_id "Record ID", 
	facility_name "Facility Name",
	_NAME_ as var_name "Variable Name",
	facility_type_group "Facility Type",

	/*Using a regex here couldn't get %like% to work for some reason and lazy.*/
		/*Hand hygeiene*/
	case when prxmatch("/hh_/", _NAME_) > 0 then 'Hand Hygiene' 

		/*transmission based precautions*/
		 when (prxmatch("/transmission_policy/", _NAME_) > 0) or (prxmatch("/trans_/", _NAME_) > 0) or (prxmatch("/ppe_supplies/", _NAME_) > 0) or (prxmatch("/semipriv/", _NAME_) > 0) or
			  (prxmatch("/tbp_/", _NAME_) > 0) or (prxmatch("/ebp_/", _NAME_) > 0) or (prxmatch("/resp_/", _NAME_) > 0) or (prxmatch("/fit_/", _NAME_) > 0) then 'Transmission based precautions' 
	/*Ok now %like% works cool cool*/
		/*Environmental cleaning and observation*/
		 when _NAME_ like 'policy_disinf%' or _NAME_ like 'contact_disinf%' or _NAME_ like 'hightouch_disinf%' or _NAME_ like 'room_disinf%' or _NAME_ like 'equip_disinf%' or _NAME_ like 'gluc_disinf%' or _NAME_ like 'disinf_glucavail%'
		 	  or _NAME_ like 'gluc_disinfection_2%' or _NAME_ like 'shower_disinf%' or _NAME_ like 'supp_disinf%' or _NAME_ like 'sink_obs%' or _NAME_ like 'undersink_obs%' or _NAME_ like 'cleansupp_obs%' or _NAME_ like 'cleandirty_obs%'
			  or _NAME_ like 'disinfectequip_obs%' or _NAME_ like 'eqip_obs%' or _NAME_ like 'coverlinen_obs%' or _NAME_ like 'soiled_obs%' or _NAME_ like 'sharps_obs%' or _NAME_ like 'medprep_obs%' or _NAME_ like 'expir_obs%'
			  or _NAME_ like 'showindicate_disinf%'
						then 'Environmental Observation/Cleaning' 
		/*Injection and medication safety*/
		 when _NAME_ like 'gluc_supplies%' or _NAME_ like 'stor_gluc%' or _NAME_ like 'insulin_pens%' or _NAME_ like 'insulin_storage%' or _NAME_ like 'inject_policy%' or _NAME_ like 'one_time_syringe%' or _NAME_ like 'single_dose%'
		 	  or _NAME_ like 'multi_dose%' or _NAME_ like 'gloves_inject%' 
			  			then 'Injc. and Medication Safety'

		/*Healthcare laundry*/
		  when (prxmatch("/supp_laund/", _NAME_) > 0) 
		  				then 'Healthcare Laundry'

		else '' end as ip_area "IP Area",

	/*Create IP Gap labeled where we have a label and by prior variable name (_NAME_) to fill in gaps. We'll add more labels as we go*/
	case when _LABEL_ not in ('') then _LABEL_ else _NAME_ end as ip_gap "IP Gap",
	COL1 as compliance




from pivot_long;
quit;


proc sql;
/*Now create percent compliant for each IP gap but using the shortened labels we created earlier.
This is actually our second figure that is linked to a graph in our template. Any column/row changes here may result in needing to edit the template*/
create table ipgap_plot as
select

		ip_gap,
		sum (case when compliance in (1) then 1 else 0 end) as sum_t "Total compliant",
		sum (case when compliance in (0) then 1 else 0 end) as sum_f "Total non-compliant",

			calculated sum_f / (calculated sum_t + calculated sum_f) as pct_noncomp format percent10.1 "Percent non-compliant",
			1- calculated pct_noncomp as pct_comp format percent10.1 "Percent compliant"

from plots_longtidy
	group by ip_gap order by pct_noncomp desc;

quit;


/*Summary Tables: Area, facililty, facility and area*/
proc sql;
create table sum_IPAREAS as
select

	ip_area,
		sum (case when compliance in (1) then 1 else 0 end) as sum_t "Total compliant",
		sum (case when compliance in (0) then 1 else 0 end) as sum_f "Total non-compliant",

			calculated sum_f / (calculated sum_t + calculated sum_f) as pct_noncomp format percent10.1 "Percent non-compliant",
			1- calculated pct_noncomp as pct_comp format percent10.1 "Percent compliant"

from plots_longtidy
	group by ip_area
;

create table sum_FACTYPE as
select

	facility_type_group,
		sum (case when compliance in (1) then 1 else 0 end) as sum_t "Total compliant",
		sum (case when compliance in (0) then 1 else 0 end) as sum_f "Total non-compliant",

			calculated sum_f / (calculated sum_t + calculated sum_f) as pct_noncomp format percent10.1 "Percent non-compliant",
			1- calculated pct_noncomp as pct_comp format percent10.1 "Percent compliant"


from plots_longtidy
	group by facility_type_group
;

create table sum_fac_iparea as
select

	facility_type_group,
	ip_area,
		sum (case when compliance in (1) then 1 else 0 end) as sum_t "Total compliant",
		sum (case when compliance in (0) then 1 else 0 end) as sum_f "Total non-compliant",

			calculated sum_f / (calculated sum_t + calculated sum_f) as pct_noncomp format percent10.1 "Percent non-compliant",
			1- calculated pct_noncomp as pct_comp format percent10.1 "Percent compliant"

from plots_longtidy
	group by facility_type_group, ip_area order by facility_type_group, ip_area
;

quit;

							/*Import smartsheet for overall counts*/








/*Import RIPS-consultant list (SMARTSHEET)*/
proc import datafile = "&data.\Data\RIPS Team Biweekly Metrics.xlsx"
	out=RIPS_visits
	dbms=xlsx replace;
	getnames=yes;

run;




/*Define dates, they're in a text string with other information so we're searching for year and month where applicable. This is absurdly bad data practice though.*/
proc sql;
create table RIPS_visits_2 as
select *,

/*Remove Year 2024 or Month/year Dec2024 combo... patch not a fix*/
	case when (Date_of_Reporting like '%2024%') then 0 else 1 end as date_flag_new

from RIPS_visits
;
quit;



/*Create beginning metrics: assessments, unique facilities, and breakdown of visits by facility*/
proc sql;
create table pg_1_header as
select
	
	sum (Assessment_Visits) as assessments,
	sum (Assessments___education_visits__) as educ_visits,
	sum (Other_types_of_visits__if_0__lea) as other_visits, 
	sum (Education_Module_Visits__if_0__l) as educ_mod_visists,

	(calculated assessments + calculated educ_visits + calculated other_visits + calculated educ_mod_visists) as tot_assessment "Completed Assessments"

	/* count (distinct Record_ID) as fac_contact "Completed ICAR Assessments"commenting out for now but keeping as a separate table in case we go back to only ICAR counts,
	count (distinct Facility_Name) as unique_fac "Total Unique Facilities" Removed unique facilities due to typos and "unique" facilities that aren't "unique"*/

from RIPS_visits_2 /*use RIPS_25 for ICAR counts only*/
	where date_flag_new in (1)
;
	alter table pg_1_header 
		drop assessments , educ_visits  /*drop assessments and educ visits, we just need total*/

		add date_col char(12); /*Add date column*/

create table pg_1_header_b as
select 

	How_many_staff_did_you_educate__,
	Total_number_of_OB_contacts__if,
	Date_of_Reporting,
	date_flag_new

from RIPS_visits_2
;

create table pg_1_header_2 as
select

	sum (How_many_staff_did_you_educate__) as educ_visits "Total Staff Educated",
	sum (Total_number_of_OB_contacts__if) as OB_contact "Total Outbreak Contacts"
		
from pg_1_header_b
	where date_flag_new in (1)
;
alter table pg_1_header_2 
		add date_col char(12); /*Add date column*/

/*First table/display in final output*/
create table join_pg1 as
select

	case when a.date_col in ('') then "&repdate." else '' end as date_col_2 "Date of Report",
	a.tot_assessment,
	/*a.unique_fac,*/
	b.educ_visits,
	b.OB_contact

from pg_1_header a left join pg_1_header_2 b on a.date_col = b.date_col /*Join on manually created date column (trust me this works)*/
;
quit;




				
				/*Output tables!*/





dm 'odsresults; clear';
/*Output for raw tables*/
title; footnote;
/*Set your output pathway here*/
ods excel file="&output.RIPS_metrics_raw_2.xlsx";*<----- Named a generic overwriteable name so we can continue to reproduce and autopopulate a template;
ods excel options (sheet_interval = "none" sheet_name = "tables" embedded_titles='Yes');

proc print data=facility_sum noobs label; run;
proc print data=sum_IPAREAS noobs label; var ip_area pct_noncomp pct_comp; run;
proc print data=sum_FACTYPE noobs label; var facility_type_group pct_noncomp pct_comp; run;
proc print data=sum_fac_iparea noobs label; var ip_area facility_type_group pct_noncomp pct_comp; run;
proc print data=ipgap_plot noobs label; var ip_gap pct_noncomp pct_comp; run;

ods excel options (sheet_interval = "now" sheet_name = "summary table" embedded_titles='Yes');

proc print data=join_pg1 noobs label;run;



ods excel close;

/*fin*/
