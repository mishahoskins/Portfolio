/*
 *------------------------------------------------------------------------------
 * Program Name:  Medicare_ptD_analysis_new.sas 
 * Author:        Mikhail Hoskins
 * Date Created:  10/21/2025
 * Date Modified: 
 * Description:   Revised from Meg Sredl's code to create a look at Medicare part D antibiotic prescribing practices in NC. 
 *				  				  
 *
 * Inputs:       C:\Users\mhoskins1\Desktop\Work Files\Medicaid Data Request\Medicare pt D analysis\Data all data grouped by year.
 * Output:       
 * Notes:        Skillsets:
 *					Full ETL pipeline from raw data extract, transformations, to loading a useable dataset. Outputs in a clear manner. Macros, SQL. 
 *					
 *------------------------------------------------------------------------------
 */



/*Macros for dates and disease*/

	/*update these*/
%let mindate = 01Jan2025; /*Minimum date you want to view (usually start of the year for monthly graphs). We also use this for the year max to make sure we're displaying non-complete data for the most recent year*/
%let maxmonth = 01Sep2025;/*Same as above but most recent month 1-denorm table month*/

%let datapath = C:\Users\mhoskins1\Desktop\Work Files\Medicaid Data Request\Medicare pt D analysis\Data\;
%let outpath = C:\Users\mhoskins1\Desktop\Work Files\Medicaid Data Request\Medicare pt D analysis\Output\;

libname analysis 'C:\Users\mhoskins1\Desktop\Work Files\Medicaid Data Request\Medicare pt D analysis\sasdata';/*output path for sas7bdat file*/




/*SKP THIS UNLESS PULLING IN NEW DATA; GO TO 'START HERE'*/

/*Import all datasets: macro because lazy*/
%macro import  (year=,);
proc import datafile="&datapath.Medicare_Part_D_Prescribers_by_Provider_&year..csv"
            out=medD_&year
            dbms=csv replace;
			getnames=yes;
			datarow=2;
run;
/*Add year variable for annual grouping*/
data medD_&year._clean;
set medD_&year;

	year_var = &year;
run;

proc sql;
create table medD_&year._clean_2 as
select

	year_var,
	prscrbr_type, 
	antbtc_tot_clms as abx_tot_clms, 
	antbtc_tot_benes as abx_tot_benes, 
	tot_clms, 
	tot_benes as tot_benes, 
	prscrbr_npi as npi, 
	prscrbr_crdntls,
	Prscrbr_St1,/*provider address*/
	Prscrbr_RUCA_Desc /*Rurality*/


from medD_&year._clean
;
quit;

%mend;

%import(year=2023);
%import(year=2022);
%import(year=2021);
%import(year=2020);
%import(year=2019);
%import(year=2018);


proc contents data=medD_2023_clean_2 order=varnum;run;


/*2023 being a pain in the butt with a character value for total beneficiaries, recode to numeric*/
proc sql;
create table medD_2023_clean_3 as
select 

	year_var,
	prscrbr_type, 
	put(abx_tot_clms, 3.) as abx_tot_clms, 
	put (abx_tot_benes, 3.) as abx_tot_benes, 
	tot_clms, 
	tot_benes,
	npi, 
	prscrbr_crdntls,
	Prscrbr_St1,
	Prscrbr_RUCA_Desc

from medD_2023_clean_2
;
quit;

/*Merge them all together, one big Medicare pt D 2018-2023 dataset*/
data medD_all;
	set medD_2018_clean_2 medD_2019_clean_2 medD_2020_clean_2 medD_2021_clean_2 medD_2022_clean_2 medD_2023_clean_3;

run;



/*Save to SAS dataset folder*/
data analysis.medD_2018_2023;
	set medD_all;
run;



/*START HERE*/


/*Make variables numeric where needed*/
proc sql;
create table medD_prep as
select

	year_var,
	prscrbr_type, 
	input(abx_tot_clms, best.) as abx_tot_clms, 
	input(abx_tot_benes, best.) as abx_tot_benes, 
	tot_clms, 
	tot_benes, 
	npi, 
	prscrbr_crdntls,
	Prscrbr_St1,
	Prscrbr_RUCA_Desc,

		case when prscrbr_type in ("Dentist") then "Dentist"
	 	 when prscrbr_type in ("Internal Medicine") then "Internal Medicine"
	 	 when prscrbr_type in ("Nurse Practitioner") then "Nurse Practitioner"
		 when prscrbr_type in ("Physician Assistant") then "Physician Assistant"
		 when prscrbr_type in ("Urology") then "Urology"
		 when prscrbr_type like '%Family%' then "Family Practice"
		 when prscrbr_type not in ("Dentist", "Internal Medicine", "Nurse Practitioner", "Physician Assistant", "Urology" , "Family") then "Other"

	else "" end as type_new

from analysis.medD_2018_2023
;
quit;


/*Creating two separate 90th percentile thresholds. First is for each year across ALL specialties. Second is by specialty aggregated from 2018-2023, so 90th percentile for Dentists using all ABX claims from 2018-2023 for example*/
/*Annual threshold*/
proc sort data=medD_prep;
	by year_var;
run;

proc univariate data=medD_prep noprint;
	var abx_tot_clms;
	by year_var;
	output out=medD_prep_1 p90=p90 median=median mean=mean;
run;

/*Specialty type threshold*/
proc sort data=medD_prep;
	by type_new;
run;

proc univariate data=medD_prep noprint;
	var abx_tot_clms;
	by type_new;
	output out=specialty_90 p90=p90 median=median mean=mean;
run;


proc print data=medD_prep_1 noobs;run;
proc print data=specialty_90 noobs;run;



proc sql;
create table medD_prep_2 as
select 
	*,
/*Take our univariate values for each year's 90th percentile and flag high prescribers*/
	case when year_var in (2018, 2019) and abx_tot_clms GE 189 then 1
		 when year_var in (2020) and abx_tot_clms GE 163 then 1
		 when year_var in (2021) and abx_tot_clms GE 155 then 1
		 when year_var in (2022) and abx_tot_clms GE 168 then 1
		 when year_var in (2023) and abx_tot_clms GE 174 then 1
	
	else 0 end as p90_flag,

	(abx_tot_clms / tot_benes) * 1000 as rate "Prescribing Rate per 1000 Beneficiaries",

/*Take our univariate values for each specialty's 90th percentile and flag high prescribers*/
	case when type_new in ("Internal Medicine") and abx_tot_clms GE 278 then 1
		 when type_new in ("Nurse Practitioner") and abx_tot_clms GE 179 then 1
		 when type_new in ("Physician Assistant") and abx_tot_clms GE 175 then 1
		 when type_new in ("Urology") and abx_tot_clms GE 542 then 1
		 when type_new in ("Family Practice") and abx_tot_clms GE 278 then 1
		 when type_new in ("Dentist") and abx_tot_clms GE 120 then 1
		 when type_new in ("Other") and abx_tot_clms GE 101 then 1
	
	else 0 end as p90_flag_spec

from medD_prep;


create table _90th_ as
select

	year_var "Year",
	p90 "90th Percentile Threshold by Year"

from medD_prep_1;

create table _90th_spec as
select

	type_new "Specialty",
	p90 "90th Percentile Threshold by Specialty"

from specialty_90;


quit;



/*Analysis*/
proc sql;
create table medD_analysis_1 as
select

	year_var "Year",
	count (npi) as num_providers "Number of providers reporting to CMS" format comma10.0,
	sum (case when abx_tot_clms not in (.) then 1 else 0 end) as num_abx "Number of ABX claims" format comma10.0,
	sum (case when abx_tot_clms not in (.) and p90_flag in (1) then 1 else 0 end) as Hnum_abx "Number of ABX claims from High Subscribers" format comma10.0,
	sum (case when abx_tot_clms not in (.) and p90_flag in (0) then 1 else 0 end) as Lnum_abx "Number of ABX claims from non-High Subscribers" format comma10.0,

	median(abx_tot_clms) as med_claims "Median number of ABX Claims",
	median(rate) as med_rate "Median Prescribing Rate per 1000 Beneficiaries" format 10.1
	/*,
	IQR(abx_tot_clms) as iqr_claims "IQR number of ABX Claims"*/


from medD_prep_2
	group by year_var;

/*Overall prescribing part D abx*/
create table medD_analysis_1a as
select

	type_new "Specialty",
	count (distinct npi) as num_providers "Number of providers reporting to CMS" format comma10.0,
	sum (case when abx_tot_clms not in (.) then abx_tot_clms else 0 end) as num_abx "Number of ABX claims" format comma10.0,
	sum (case when abx_tot_clms not in (.) and p90_flag in (1) then abx_tot_clms else 0 end) as Hnum_abx "Number of ABX claims from High Subscribers" format comma10.0,
	sum (case when abx_tot_clms not in (.) and p90_flag in (0) then abx_tot_clms else 0 end) as Lnum_abx "Number of ABX claims from Non-High Subscribers" format comma10.0,

	median(abx_tot_clms) as med_claims "Median number of ABX Claims (Overall)",
	median(rate) as med_rate "Median Prescribing Rate per 1000 Beneficiaries (Overall)" format 10.1
	/*,
	IQR(abx_tot_clms) as iqr_claims "IQR number of ABX Claims"*/


from medD_prep_2
	group by type_new;

/*high prescriber part D abx*/
create table medD_analysis_1b as
select

	type_new "Specialty",
	count (distinct npi) as num_providers "Number of High Prescribing providers reporting to CMS" format comma10.0,
	sum (case when abx_tot_clms not in (.) then abx_tot_clms else 0 end) as num_abx "Number of High Prescriber ABX claims" format comma10.0,

	median(abx_tot_clms) as med_claims "Median number of ABX Claims Among High Prescribers",
	median(rate) as med_rate "Median Prescribing Rate per 1000 Beneficiaries Among High Prescribers" format 10.1
	/*,
	IQR(abx_tot_clms) as iqr_claims "IQR number of ABX Claims"*/


from medD_prep_2
where p90_flag in (1)
	group by type_new ;

/*Non-high prescriber part D abx*/
create table medD_analysis_1c as
select

	type_new "Specialty",
	count (distinct npi) as num_providers "Number of Non-High Prescribing providers reporting to CMS" format comma10.0,
	sum (case when abx_tot_clms not in (.) then abx_tot_clms else 0 end) as num_abx "Number of Non-High Prescriber ABX claims" format comma10.0,

		sum(abx_tot_clms) as test_sum,
	
	median(abx_tot_clms) as med_claims "Median number of ABX Claims Among Non-High Prescribers",
	median(rate) as med_rate "Median Prescribing Rate per 1000 Beneficiaries Among Non-High Prescribers" format 10.1
	/*,
	IQR(abx_tot_clms) as iqr_claims "IQR number of ABX Claims"*/


from medD_prep_2
where p90_flag in (0)
	group by type_new ;
/*High prescribers by specialty 90th percentile*/
create table medD_analysis_2 as
select distinct

	year_var "Year",

	sum (case when prscrbr_type in ("Dentist") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_dent "Dentist (High Prescriber)",
		sum (case when prscrbr_type in ("Dentist") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_dent "Dentist (Not high Prescriber)",

	sum (case when prscrbr_type in ("Internal Medicine") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_int "Internal Medicine (High Prescriber)",
		sum (case when prscrbr_type in ("Internal Medicine") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_int "Internal Medicine (Not high Prescriber)",

	sum (case when prscrbr_type in ("Nurse Practitioner") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_NP "Nurse Practitioner (High Prescriber)",
		sum (case when prscrbr_type in ("Nurse Practitioner") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_NP "Nurse Practitioner (Not high Prescriber)",

	sum (case when prscrbr_type in ("Physician Assistant") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_PA "Physician Assistant (High Prescriber)",
		sum (case when prscrbr_type in ("Physician Assistant") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_PA "Physician Assistant (Not high Prescriber)",

	sum (case when prscrbr_type in ("Urology") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_uro "Urology (High Prescriber)",
		sum (case when prscrbr_type in ("Urology") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_uro "Urology (Not high Prescriber)",

	sum (case when prscrbr_type like '%Family%' and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_fam "Family Medicine (High Prescriber)",
		sum (case when prscrbr_type like '%Family%' and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_fam "Family Medicine (Not high Prescriber)",

	sum (case when prscrbr_type not in ("Dentist", "Internal Medicine", "Nurse Practitioner", "Physician Assistant", "Urology" , "Family") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_oth "Other (High Prescriber)",
		sum (case when prscrbr_type not in ("Dentist", "Internal Medicine", "Nurse Practitioner", "Physician Assistant", "Urology" , "Family") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_oth "Other (Not high Prescriber)",


/*Percentages*/

	(calculated prscrbr_type_dent/ (calculated Nprscrbr_type_dent+ calculated prscrbr_type_dent)) as pct_dent_high "Percent Dentist High Prescriber" format percent10.2,
	(calculated prscrbr_type_int/ (calculated Nprscrbr_type_int+ calculated prscrbr_type_int)) as pct_int_high "Percent Internal Medicine High Prescriber" format percent10.2,
	(calculated prscrbr_type_NP/ (calculated Nprscrbr_type_NP+ calculated prscrbr_type_NP)) as pct_NP_high "Percent Nurse Practitioner High Prescriber" format percent10.2,
	(calculated prscrbr_type_PA/ (calculated Nprscrbr_type_PA+ calculated prscrbr_type_PA)) as pct_PA_high "Percent Physician Assistant High Prescriber" format percent10.2,
	(calculated prscrbr_type_uro/ (calculated Nprscrbr_type_uro+ calculated prscrbr_type_uro)) as pct_uro_high "Percent Urology High Prescriber" format percent10.2,
	(calculated prscrbr_type_fam/ (calculated Nprscrbr_type_fam+ calculated prscrbr_type_fam)) as pct_fam_high "Percent Family Medicine High Prescriber" format percent10.2,
	(calculated prscrbr_type_oth/ (calculated Nprscrbr_type_oth+ calculated prscrbr_type_oth)) as pct_oth_high "Percent 'Other' High Prescriber" format percent10.2

from medD_prep_2
	group by year_var ;

/*High perscribers by annual 90th percentile*/

create table medD_analysis_2a as
select distinct

	year_var "Year",

	sum (case when prscrbr_type in ("Dentist") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_dent "Dentist (High Prescriber)",
		sum (case when prscrbr_type in ("Dentist") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_dent "Dentist (Not high Prescriber)",

	sum (case when prscrbr_type in ("Internal Medicine") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_int "Internal Medicine (High Prescriber)",
		sum (case when prscrbr_type in ("Internal Medicine") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_int "Internal Medicine (Not high Prescriber)",

	sum (case when prscrbr_type in ("Nurse Practitioner") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_NP "Nurse Practitioner (High Prescriber)",
		sum (case when prscrbr_type in ("Nurse Practitioner") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_NP "Nurse Practitioner (Not high Prescriber)",

	sum (case when prscrbr_type in ("Physician Assistant") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_PA "Physician Assistant (High Prescriber)",
		sum (case when prscrbr_type in ("Physician Assistant") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_PA "Physician Assistant (Not high Prescriber)",

	sum (case when prscrbr_type in ("Urology") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_uro "Urology (High Prescriber)",
		sum (case when prscrbr_type in ("Urology") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_uro "Urology (Not high Prescriber)",

	sum (case when prscrbr_type like '%Family%' and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_fam "Family Medicine (High Prescriber)",
		sum (case when prscrbr_type like '%Family%' and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_fam "Family Medicine (Not high Prescriber)",

	sum (case when prscrbr_type not in ("Dentist", "Internal Medicine", "Nurse Practitioner", "Physician Assistant", "Urology" , "Family") and p90_flag_spec in (1) then 1 else . end) as prscrbr_type_oth "Other (High Prescriber)",
		sum (case when prscrbr_type not in ("Dentist", "Internal Medicine", "Nurse Practitioner", "Physician Assistant", "Urology" , "Family") and p90_flag_spec in (0) then 1 else . end) as Nprscrbr_type_oth "Other (Not high Prescriber)",


/*Percentages*/

	(calculated prscrbr_type_dent/ (calculated Nprscrbr_type_dent+ calculated prscrbr_type_dent)) as pct_dent_high "Percent Dentist High Prescriber" format percent10.2,
	(calculated prscrbr_type_int/ (calculated Nprscrbr_type_int+ calculated prscrbr_type_int)) as pct_int_high "Percent Internal Medicine High Prescriber" format percent10.2,
	(calculated prscrbr_type_NP/ (calculated Nprscrbr_type_NP+ calculated prscrbr_type_NP)) as pct_NP_high "Percent Nurse Practitioner High Prescriber" format percent10.2,
	(calculated prscrbr_type_PA/ (calculated Nprscrbr_type_PA+ calculated prscrbr_type_PA)) as pct_PA_high "Percent Physician Assistant High Prescriber" format percent10.2,
	(calculated prscrbr_type_uro/ (calculated Nprscrbr_type_uro+ calculated prscrbr_type_uro)) as pct_uro_high "Percent Urology High Prescriber" format percent10.2,
	(calculated prscrbr_type_fam/ (calculated Nprscrbr_type_fam+ calculated prscrbr_type_fam)) as pct_fam_high "Percent Family Medicine High Prescriber" format percent10.2,
	(calculated prscrbr_type_oth/ (calculated Nprscrbr_type_oth+ calculated prscrbr_type_oth)) as pct_oth_high "Percent 'Other' High Prescriber" format percent10.2

from medD_prep_2
	group by year_var ;

quit;

proc print data=medD_analysis_2;run;
/*clear all your other terrible results*/
dm 'odsresults; clear';

ods graphics /noborder;
title; footnote;

/*Set your output pathway here*/ 

ods rtf file="&outpath.Medicare_ptD_tables_&sysdate..rtf" 
/*Named a generic overwriteable name so we can continue to reproduce and autopopulate a template;
style=journal */startpage=no;

options number nodate;


ods rtf text= "Antibiotic Prescribing Claims by Year, North Carolina 2018-2023";
proc print data=medD_analysis_1 noobs label 
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var year_var num_providers num_abx Hnum_abx Lnum_abx med_claims med_rate   
    / 
/*Specific "table 1" styling*/
    /* Header: top and bottom borders only */
    style(header)=[
        font_weight=bold 
        backgroundcolor=white 
        just=center 
        borderbottomcolor=black borderbottomwidth=1 
        bordertopcolor=black bordertopwidth=1 
        borderleftwidth=0 borderrightwidth=0]

    /* Data: center everything, don't bold anything but headers*/
    style(data)=[
        just=center 
        fontsize=9pt 
        bordercolor=white borderwidth=0];


run;
title;


ods rtf text= "Overall Antibiotic Prescribing Claims by Specialty Type, North Carolina 2018-2023";
proc print data=medD_analysis_1a noobs label 
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var type_new num_providers num_abx Hnum_abx Lnum_abx med_claims med_rate    
    / 
/*Specific "table 1" styling*/
    /* Header: top and bottom borders only */
    style(header)=[
        font_weight=bold 
        backgroundcolor=white 
        just=center 
        borderbottomcolor=black borderbottomwidth=1 
        bordertopcolor=black bordertopwidth=1 
        borderleftwidth=0 borderrightwidth=0]

    /* Data: center everything, don't bold anything but headers*/
    style(data)=[
        just=center 
        fontsize=9pt 
        bordercolor=white borderwidth=0];


run;


ods rtf text= "High Prescriber Antibiotic Prescribing Claims by Specialty Type, North Carolina 2018-2023";
proc print data=medD_analysis_1b noobs label 
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var type_new num_providers num_abx med_claims med_rate     
    / 
/*Specific "table 1" styling*/
    /* Header: top and bottom borders only */
    style(header)=[
        font_weight=bold 
        backgroundcolor=white 
        just=center 
        borderbottomcolor=black borderbottomwidth=1 
        bordertopcolor=black bordertopwidth=1 
        borderleftwidth=0 borderrightwidth=0]

    /* Data: center everything, don't bold anything but headers*/
    style(data)=[
        just=center 
        fontsize=9pt 
        bordercolor=white borderwidth=0];


run;

ods rtf text= "Non-High Prescriber Antibiotic Prescribing Claims by Specialty Type, North Carolina 2018-2023";
proc print data=medD_analysis_1c noobs label 
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var type_new num_providers num_abx med_claims med_rate     
    / 
/*Specific "table 1" styling*/
    /* Header: top and bottom borders only */
    style(header)=[
        font_weight=bold 
        backgroundcolor=white 
        just=center 
        borderbottomcolor=black borderbottomwidth=1 
        bordertopcolor=black bordertopwidth=1 
        borderleftwidth=0 borderrightwidth=0]

    /* Data: center everything, don't bold anything but headers*/
    style(data)=[
        just=center 
        fontsize=9pt 
        bordercolor=white borderwidth=0];


run;

ods rtf text=  "Percent High Prescribers Compared to Annual Threshold by Specialty Type, Year, North Carolina 2018-2023";
proc print data=medD_analysis_2 noobs label 
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var year_var pct_dent_high pct_int_high pct_NP_high pct_PA_high pct_uro_high pct_fam_high pct_oth_high    
    / 
/*Specific "table 1" styling*/
    /* Header: top and bottom borders only */
    style(header)=[
        font_weight=bold 
        backgroundcolor=white 
        just=center 
        borderbottomcolor=black borderbottomwidth=1 
        bordertopcolor=black bordertopwidth=1 
        borderleftwidth=0 borderrightwidth=0]

    /* Data: center everything, don't bold anything but headers*/
    style(data)=[
        just=center 
        fontsize=9pt 
        bordercolor=white borderwidth=0];


run;

ods rtf text=  "Percent of High Prescribers Compared to like Specialties by Specialty Type, Year, North Carolina 2018-2023";
proc print data=medD_analysis_2a noobs label 
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var year_var pct_dent_high pct_int_high pct_NP_high pct_PA_high pct_uro_high pct_fam_high pct_oth_high    
    / 
/*Specific "table 1" styling*/
    /* Header: top and bottom borders only */
    style(header)=[
        font_weight=bold 
        backgroundcolor=white 
        just=center 
        borderbottomcolor=black borderbottomwidth=1 
        bordertopcolor=black bordertopwidth=1 
        borderleftwidth=0 borderrightwidth=0]

    /* Data: center everything, don't bold anything but headers*/
    style(data)=[
        just=center 
        fontsize=9pt 
        bordercolor=white borderwidth=0];


run;

ods rtf text=  "Annual 90th Percentile of Prescribing, North Carolina CMS Prescribers, 2018-2023";
proc print data=_90th_ noobs label 
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var year_var p90     
    / 
/*Specific "table 1" styling*/
    /* Header: top and bottom borders only */
    style(header)=[
        font_weight=bold 
        backgroundcolor=white 
        just=center 
        borderbottomcolor=black borderbottomwidth=1 
        bordertopcolor=black bordertopwidth=1 
        borderleftwidth=0 borderrightwidth=0]

    /* Data: center everything, don't bold anything but headers*/
    style(data)=[
        just=center 
        fontsize=9pt 
        bordercolor=white borderwidth=0];


run;

ods rtf text=  "Specialty 90th Percentile of Prescribing, North Carolina CMS Prescribers, 2018-2023";
proc print data=_90th_spec noobs label 
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var type_new p90     
    / 
/*Specific "table 1" styling*/
    /* Header: top and bottom borders only */
    style(header)=[
        font_weight=bold 
        backgroundcolor=white 
        just=center 
        borderbottomcolor=black borderbottomwidth=1 
        bordertopcolor=black bordertopwidth=1 
        borderleftwidth=0 borderrightwidth=0]

    /* Data: center everything, don't bold anything but headers*/
    style(data)=[
        just=center 
        fontsize=9pt 
        bordercolor=white borderwidth=0];


run;

ods rtf close;
