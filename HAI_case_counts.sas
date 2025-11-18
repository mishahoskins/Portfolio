
/*
 *------------------------------------------------------------------------------
 * Program Name:  HAI_case_counts
 * Author:        Mikhail Hoskins
 * Date Created:  03/26/2025
 * Date Modified: 11/18/2025
 * Description:   Case count data pull from monthly denormalized tables. Easy to run in office, can take longer
				  on VPN. 
 *
 * Inputs:       case.sas7bdat , case_phi.sas7bdat , Admin_question_package_addl.sas7bdat : Z:\YYYYMMDD
 * Output:       none, frequency table at end of program
 * Notes:        Program pulls reportable HAIs. CRE, Cauris, and GAS. Updated Nov 2025 to include CPO mechanism.
 *
 *
 *
 *
 *				 If the code doesn't work or numbers don't align, check here: 
 *				 https://github.com/NC-DPH/Communicable-Disease-Dashboards/blob/main/NCD3v2%20In%20Progress.sas
 *
 *------------------------------------------------------------------------------
 */

/*Step 1: set your pathway. Must have Z drive (or however you are mapped to denormalized tables) access.*/
libname denorm 'Z:\20251101'; /*Select the file name you want from the Z drive. Format is YYYYMMDD. Tables are created monthly*/
libname output 'T:\HAI\Code library\Epi curve example\SASData';/*output path for sas7bdat file*/
/*Step 1a: set your date range in the format specified.*/
%let start_dte = 01jan15; /*Set your start date for range of values DDMMYY*/
%let end_dte = 31Oct25; /*Set your end date for range of values DDMMMYY*/



/*From here below should run without touching anything*/

/*Step 1a: Table 1 GAS, CAURIS, and administrative package questions (date reported variable)*/
/*Get C.auris and STRA (GAS)*/
proc sql;
create table CASE_COMBO as
select 

	s.*, /*a.State*/
	a.EVENT_STATE, 
	b.RPTI_SOURCE_DT_SUBMITTED

from DENORM.CASE as s left join Denorm.CASE_PHI as a on s.case_id=a.case_id
		left join Denorm.Admin_question_package_addl as b on s.case_id=b.case_id

	where s.CLASSIFICATION_CLASSIFICATION in ("Confirmed", "Probable")
			and s.type in ("CAURIS", "STRA"/*, "SAUR", "TSS", "TSSS"*/)
			and s.REPORT_TO_CDC = 'Yes'
;

quit;


/*Get CRE (CPO as of November 2024)*/
proc sql;
create table CASE_COMBO_2 as
select 

	s.*, 
	a.EVENT_STATE, 
	b.RPTI_SOURCE_DT_SUBMITTED

from DENORM.CASE as s left join Denorm.CASE_PHI as a on s.case_id=a.case_id
		left join Denorm.Admin_question_package_addl as b on s.case_id=b.case_id

	where s.CLASSIFICATION_CLASSIFICATION in ("Confirmed", "Probable")
			and (s.type = "CRE" or s.type = "CPO");	*CRE became CPO event in May 2025;
/*Removed the REPORT_TO_CDC=”Yes” filter for Carbapenem-resistant Enterobacteriaceae*/

quit;


/*BREAK*/

/*Step 3: Merge the two HAI sets to get one set with CPO, CAURIS, and GAS*/
data CASE_COMBO_SUB;
set CASE_COMBO CASE_COMBO_2;
run;

/*Step 4: Table 3: Confine to certain key variables. You can add and subtract variables here to fit your needs if necessary*/
proc sql;
create table HAI_updated as
select distinct *, /*Distinct here for unique values, can add or remove variables as needed*/
		OWNING_JD,
		TYPE, 
		TYPE_DESC, 
		CLASSIFICATION_CLASSIFICATION, 
		CASE_ID,
		REPORT_TO_CDC,

		input(MMWR_YEAR, 4.) as MMWR_YEAR, 
		MMWR_DATE_BASIS, 

		count(distinct CASE_ID) as Case_Ct label = 'Counts', 
		'Healthcare Acquired Infection' as Disease_Group,
		AGE, 
		GENDER, 
		HISPANIC,
		BIRTH_DATE, 
		RACE1, 
		RACE2, 
		RACE3, 
		RACE4, 
		RACE5, 
		RACE6,
/*This piece should match exactly or almost exactly to the dashboard code found here: https://github.com/NC-DPH/Communicable-Disease-Dashboards/blob/main/NCD3v2%20In%20Progress.sas
		some of the variable names may be different but the counts need to align*/

		/*don't delete this section, it's a logic path for how the state creates an event date based on submission, lab, and symptom dates. So many people will ask you about how we determine "event date" it would be good to know this well*/
	case 
	    when MMWR_DATE_BASIS ne . then MMWR_DATE_BASIS
		when SYMPTOM_ONSET_DATE ne . then SYMPTOM_ONSET_DATE
	    when (SYMPTOM_ONSET_DATE = . ) and  RPTI_SOURCE_DT_SUBMITTED  ne . then RPTI_SOURCE_DT_SUBMITTED
	    else datepart(CREATE_DT)
	    end as EVENT_DATE format=DATE9., 

	year(calculated EVENT_DATE) as Year, 
	month(calculated EVENT_DATE) as Month, 
	QTR(calculated EVENT_DATE) as Quarter,
/*Additional variables for MDRO report*/
	SYMPTOM_ONSET_DATE, 
	DISEASE_ONSET_QUALIFIER, 
	DATE_FOR_REPORTING,
	RPTI_SOURCE_DT_SUBMITTED, 
	CREATE_DT, 
	STATUS

from CASE_COMBO_sub
where calculated EVENT_DATE >= "&start_dte."d and calculated EVENT_DATE <= "&end_dte."d
	/*and STATUS = 'Closed'*/
	/*and STATE in ('NC' ' ')*/
order by TYPE_DESC, YEAR, OWNING_JD;


quit;



/*Begin CPO/CRE mechanism extract: 

			There is a CPO mechanism variable created via the DD tables and allegedly imputed into the laboratory denormalized tables. However, I find I have more control when scraping the lab results themselves.
			If there is a CPO mech in the future that's more useful and equally (or more) complete, use that and you can just add it above and skip this step probably. Who knows if anyone will read this code beyond 2027.

*/

/*Take all CPOs and search for mechanisms in the lab results where the result is confirmed*/
proc contents data=denorm.laboratory_dd_table_cre order=varnum;run;


proc freq data=denorm.laboratory_dd_table_cre ;tables CRE_CARB_PRODUCE_MECHANISM / norow nocol nopercent; where LAB_CREATE_DATE GE ('01JAN25'd);run;

proc sql;
create table CPO_mechext as
select distinct

	Case_ID,

/*Take all CPOs and search for MECHANISMS in the lab results where the result is confirmed. then any lingering CRE mechanisms and CRE mechanisms for pre-November 2024*/
case  when product in ("CPO") and TEST like '%KPC%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown') then 'KPC'
		  when product in ("CPO") and  TEST like '%NDM%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'NDM'
		  when product in ("CPO") and  TEST like '%OXA-48%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'OXA-48' 
		  when product in ("CPO") and  TEST like '%OXA-23%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'OXA-23'
		  when product in ("CPO") and  TEST like '%OXA-24%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'OXA-24'  
		  when product in ("CPO") and  TEST like '%OTHER%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'Other' 
		  when product in ("CPO") and  TEST like '%VIM%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'VIM' 
		  when product in ("CPO") and  TEST like '%IMP%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'IMP' 
		  when product in ("CRE") and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then CRE_CARB_PRODUCE_MECHANISM
		  	
		   else '' end as CPO_CARB_MECHANISM "CPO mechanism"



from denorm.laboratory_dd_table_cre

	having CPO_CARB_MECHANISM not in ('') /*don't need missing values, only counting where we identified 1 or more mechanism(s)*/
;
quit;


/*Now join them all with table 1 from the denormalized, confirmed, deduplicated, and reported to CDC count (final table, woohoo!))*/
proc sql;
create table CRE_mech_add as
select 

	a.*,
	b.CPO_CARB_MECHANISM

from HAI_updated as a 
	left join CPO_mechext as b on a.case_ID = b.case_ID

;

quit;


/*Dupes check assign a value of how many times a case_id appears then view multiples (remember we can have multiple mechs per CPO)*/

proc sql; 
create table counts as 
select 
	case_id, 
	CPO_CARB_MECHANISM,
	count(*) as IDCount 

from CRE_mech_add 
group by case_id
	order by case_id desc; 

quit; 

proc print data=counts (obs=100) noobs;where IDCount GE (2); run;







/*Put dataset in common T drive location for everyone to use!*/


dm 'odsresults; clear';

data output.analysis_forgraphs;
set CRE_mech_add;
run;


/*fin*/
