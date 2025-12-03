
/*
 *------------------------------------------------------------------------------
 * Program Name:  MDRO_assignments 
 * Author:        Mikhail Hoskins
 * Date Created:  09/25/2025
 * Date Modified: 10/01/2025
 * Description:   The purpose of this code is to extract all MDRO events from the denormalized tables and match them with who has worked on each event.
 *				  Although rare, each event can have multiple state employees who have commented, or otherwise worked on the case. 
 *
 * Inputs:       laboratory_dd_table_cre : Z:\YYYYMMDD
 * Output:       assignments_&sysdate..xlsx <-- a line list of all MDRO within specified date range to review assignments. 
 * Notes:        
 *				
 *				 Annotations are between /* to help guide. We use an ETL process: extract raw data, transform (kinda) into what we want, 
 * 				 load a dataset to use in future analysis. 
 *				 
 *
 *------------------------------------------------------------------------------
 */


/*Set your pathway. Must have Z drive (or however you are mapped to denormalized tables) access.*/
libname denorm 'Z:\20251001'; /*Select the file name you want from the Z drive. Format is YYYYMMDD. Tables are created monthly*/

			/*or, if you have server access, use this*/


/*SQL Server connection code*/

libname mydblib odbc
  noprompt = "Driver={SQL Server}; 
        Server=wv5dphcdcodb02p\pool;
        Database=DD_Reports;
        Trusted_Connection=Yes;"
  schema=dbo;

/*Pulling frm the SQL server changes code we need to make our "own" tables. Included for alternate option.*/

/*Set your date range of interest in the format specified.*/
%let start_dte = 01Jan25; /*Set your start date for range of values DDMMYY*/
%let end_dte = 01Oct25; /*Set your end date for range of values DDMMMYY*/

/*Now we'll set our case manager names: update as needed to the number/names of those responding to NCEDSS entries AS THEIR NAMES APPEAR IN NCEDSS.*/
/*Misspelled names or different capitalizations my throw off numbers by 1 or 2. Make sure names are correct in NCEDSS*/
%let name1 = *****;;
%let name2 = *****;;	
%let name3 = *****;;
%let name4 = *****;;
%let name5 = *****;

/*Worth checking the log to make sure they're displaying properly*/
	%put &name1;
	%put &name2;
	%put &name3;
	%put &name4;
	%put &name5;


/*clear all your other terrible results*/
dm 'odsresults; clear';


						/*I.		EXTRACT			*/

/*Modified dashboard data set creation. In this case we want everything we're investigating that is confirmed/probable. Reporting to CDC or not included.*/
/*Get C.auris and STRA (GAS)*/
proc sql;
create table CASE_COMBO as
select 

	s.*, /*a.State*/
	a.EVENT_STATE, 
	b.RPTI_SOURCE_DT_SUBMITTED

from DENORM.CASE as s left join Denorm.CASE_PHI as a on s.case_id=a.case_id
		left join Denorm.Admin_question_package_addl as b on s.case_id=b.case_id

/*	from mydblib.CASE as s left join mydblib.CASE_PHI as a on s.case_id=a.case_id
		left join mydblib.Admin_question_package_addl as b on s.case_id=b.case_id*/

	where s.CLASSIFICATION_CLASSIFICATION in ("Confirmed", "Probable")
			and s.type in ("CAURIS", "STRA")
			/*and s.REPORT_TO_CDC = 'Yes' /*right now we want ALL cases, even those not confirmed/sent to CDC yet*/
;

quit;

/*Get CRE/CPO*/
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
/*Combine to one dataset*/
data MDRO_raw;
set CASE_COMBO CASE_COMBO_2;
	where DATE_FOR_REPORTING GE ("&start_dte"d);
run;

/*Check dates; confirm we have the correct date range specificed above in the macro (just this year? many years? a few months/weeks?)*/
proc sql;
create table min_max_dt as
select

	sum (case when DATE_FOR_REPORTING not in (.) then 1 else . end) as obs_count_1 "Obs count, drop miss",
	count (*) as obs_count_2 "Obs count, miss incl.", /*Count all rows in set, including missing for count*/
	min(DATE_FOR_REPORTING) as min_date format date11.,
	max(DATE_FOR_REPORTING) as max_date format date11.

from MDRO_raw
	where DATE_FOR_REPORTING not in (.)
;
quit;
proc contents data=denorm.lab_results order=varnum;run;


proc sql;
create table specdate_add as
select distinct

	case_id,
	product,
	max(SPECIMEN_DT) as max_spec_date "Most Recent Specimen date" format date9.,
	min(SPECIMEN_DT) as min_spec_date "First Specimen date" format date9.

from  denorm.laboratory_denormalized_table
	where product in ('CPO','CRE', 'STRA', 'CAURIS') and SPECIMEN_DT GE ("&start_dte"d)
	group by case_ID;


	proc sql;
create table cpo_mechs as
select distinct

	case_id,
	product,

	
/*Take all CPOs and search for MECHANISMS in the lab results where the result is confirmed*/
	case  when product in ("CPO", "CRE") and TEST like '%KPC%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown') then 'KPC'
		  when product in ("CPO", "CRE") and  TEST like '%NDM%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'NDM'
		  when product in ("CPO", "CRE") and  TEST like '%OXA-48%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'OXA-48' 
		  when product in ("CPO", "CRE") and  TEST like '%OXA-23%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'OXA-23'
		  when product in ("CPO", "CRE") and  TEST like '%OXA-24%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'OXA-24'  
		  when product in ("CPO", "CRE") and  TEST like '%OTHER%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'Other' 
		  when product in ("CPO", "CRE") and  TEST like '%VIM%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'VIM' 
		  when product in ("CPO", "CRE") and  TEST like '%IMP%' and result not in ('Not Detected' , 'Not detected', 'Negative' , 'Unknown')  then 'IMP' 
		   else '' end as cpo_cre_mech "CPO/CRE mechanism"

from denorm.laboratory_dd_table_cre
	where SPECIMEN_DT GE ("&start_dte"d) having cpo_cre_mech not in ('')
;
quit;

proc print data=cpo_mechs (obs=100);run;
	proc sql;
create table merge_dates_mech as
select 

	a.*,
	b.cpo_cre_mech

from specdate_add as a left join cpo_mechs as b on a.case_id = b.case_id
;
quit;



proc print data=merge_dates_mech;run;











/*pull out just we need from denormalized tables, will make future steps and edits quicker*/
proc sql;
create table assignments_base as
select

	a.CASE_ID,
	a.NAME_OF_CASE_MANAGER as case_manag,
		case when a.NAME_OF_CASE_MANAGER in ("&name1.", "&name2.", "&name3.", "&name4.", "&name5.") then 1 else 0 end as dhhs_tag,
	a.CODE,
	a.ASSIGNED_TO_DT,

	b.max_spec_date,
	b.min_spec_date,
	b.cpo_cre_mech

from denorm.admin_trail as a left join merge_dates_mech as b on a.case_id = b.case_id
	where a.ASSIGNED_TO_DT GE ("&start_dte"d) and a.CODE in ('STRA', 'CRE', 'CPO', 'CAURIS') and a.ASSIGNED_TO_GROUP in ('State Disease Registrar')
	having dhhs_tag in (1);
quit;


						/*II.		TRANSFORM			*/

/*No union all select or transposing really necessary, we just want to join properly accounting for the cases/events that may have more than
one case manager (unocommon in HAI)*/

proc sql;
create table assignments_final as
select distinct
	
	a.CASE_ID as Event_ID 'Event ID',	
	case when a.TYPE in ('STRA') then 'GAS' else a.TYPE end as MDRO_class 'MDRO',
	a.DATE_FOR_REPORTING as report_date 'Report date',
	b.max_spec_date,
	b.min_spec_date,	
	b.cpo_cre_mech,

	b.case_manag 'Assigned To:'

from MDRO_raw a left join assignments_base b on a.CASE_ID = b.CASE_ID
		having MDRO_class not in ('GAS')
	order by report_date asc

;

quit;

/*Create a duplicate table that we'll include for a quick reference*/
proc sql;
create table dupes as
select

	Event_ID,
	count(Event_ID) as count 'Occurances',
	MDRO_class,
	case_manag

from assignments_final
group by Event_ID
	having count >1;
quit;


/*one last clear of any results*/
dm 'odsresults; clear';

						/*III.		LOAD			*/

/*Export/load the data into a spreadsheet that anyone can use to view how many people/who is viewing X number of events*/
/*Output so team can review in a nice clean excel sheet*/
title; footnote;
/*Set your output pathway here*/
*ods excel file="T:\HAI\Code library\Epi curve example\analysis\CPO_ALL_&sysdate..xlsx"; /*<-- use this name if you include KPC*/
ods excel file="T:\HAI\Code library\Epi curve example\analysis\MDRO_assignments_&sysdate..xlsx";
ods excel options (sheet_interval = "now" sheet_name = "&start_dte. - &end_dte." embedded_titles='Yes');
proc print data=assignments_final noobs label;run;

ods excel options (sheet_interval = "none" sheet_name = "dupes/dates" embedded_titles='Yes');

/*Print duplicates, multiple state assignees to an event and date range of values*/
proc print data=dupes noobs label; run;
proc print data=min_max_dt noobs label;run;


ods excel close;

