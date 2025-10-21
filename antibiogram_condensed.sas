
/*
 *---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*
 * Program Name:  antibiogram_condensed (very similar to: antibiogram_macro_reports_cleaning, but super condensed)
 * Author:        Mikhail Hoskins
 * Date Created:  03/26/2025
 * Date Modified: 10/20/2025
 * Description:   This code takes our antibiogram event data from NHSN and produces trends of treatment resistance.
 *					
 *
 * Input:        antibiogram_2005_2025.sas7bdat: C:\Users\mhoskins1\Desktop\Work Files\NHSN\2019-2024 Archive data (Included all years available file says 2005-2025 but susceptiblity data is from 2012-2025 [2024 is most updated complete year]).
 * Output:      anitbiogram_trends_2005_2025_&sysdate..xlsx : C:\Users\mhoskins1\Desktop\Work Files\antibiogram\anitbiogram_trends_2005_2025_&sysdate..xlsx
 *
 * Notes:        SQL, heavy macro emphasis, clean SQL output(s)
 *
 *---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*
 */

libname archive "C:\Users\mhoskins1\Desktop\Work Files\NHSN\2019-2024 Archive data"; /*2019-2024 data*/


data antibio_raw;
set archive.antibiogram_2005_2025;
	/*where eventDate > '31Dec23'd
			and eventType in ("&type");confine dates*/;
run;


/*Antibiogram Macro to replicate this equation:
		%S= (susceptible isolates / total isolates) x 100
*/

/*Step 1: Create a table of the 10-12 most common Pathogens identified*/

/*Add additional cleaning here if necessary*/
data antibio_path;
set antibio_raw;

	format treatment $32.;
	format pathogen_2 $32.;
		pathogen_2= ' ';

if pathogen in ('EC') then pathogen_2 = 'Escherichia coli'; 
if pathogen in ('ENTFS') then pathogen_2 = 'Enterococcus faecalis';
if pathogen in ('PA') then pathogen_2 = 'Pseudomonas aeruginosa';
if pathogen in ('KP') then pathogen_2 = 'Klebsiella pneumoniae';
if pathogen in ('SA') then pathogen_2 = 'Staphylococcus aureus';
/*add more as needed: these are defined in the macro*/

run;

/*Step 1a: Group them*/
proc sql;
create table pathogen_tot as
select

		intnx("year", (eventDate), 0, "end") as eventYR "Year" format=year10.,

	sum (case when pathogen_2 in ('Escherichia coli') then 1 else 0 end) as EC "Escherichia coli",
	sum (case when pathogen_2 in ('Klebsiella pneumoniae') then 1 else 0 end) as KP "Klebsiella pneumoniae",
	sum (case when pathogen_2 in ('Enterococcus faecalis') then 1 else 0 end) as EF "Enterococcus faecalis",
	sum (case when pathogen_2 in ('Pseudomonas aeruginosa') then 1 else 0 end) as PA "Pseudomonas aeruginosa",
	sum (case when pathogen_2 in ('Staphylococcus aureus') then 1 else 0 end) as SA "Staphylococcus aureus"
from antibio_path 
where pathogen_2 not in (' ') 
	group by eventYR
;
quit;


proc print data=antibio_path (obs=10) noobs label;run;




%macro antibio_trend (abx=);

proc sql;
create table antibio_trends_&abx as
select

	intnx("year", (eventDate), 0, "end") as eventYR "Year" format=year10.,
	/*pathogen_2 'Pathogen Isolated',*/


	sum (case when  &abx in ('S', 'S-DD') then 1 else 0 end) as path_&abx._SUSC_ "Pathogen + &abx Susceptible",
	sum (case when  &abx not in (' ','N') then 1 else 0 end) as path_&abx._iso_ "Pathogen + &abx Total Isolated",
	
		calculated path_&abx._SUSC_  / calculated path_&abx._iso_ as pct_susc_&abx "Percent Susceptible &abx" format percent10.1

from antibio_path
	where &abx not in ('')
	group by eventYR 

;

create table antibio_trends_2_&abx as
select

	eventYR,
	pct_susc_&abx

from antibio_trends_&abx
;
quit;

proc sort data=antibio_trends_&abx;
	by eventYR;
run;

%mend antibio_trend;



/*Step 3: Run all treatments and join together into one big gross table*/
/*Run ALL treatments*/%antibio_trend(abx=AMK);
%antibio_trend(abx=AMOX);
%antibio_trend(abx=AMP);
%antibio_trend(abx=AMPSUL);
%antibio_trend(abx=AMXCLV);
%antibio_trend(abx=ANID);
%antibio_trend(abx=AZT);
%antibio_trend(abx=CASPO);
%antibio_trend(abx=CEFAZ);
%antibio_trend(abx=CEFEP);
%antibio_trend(abx=CEFOT);
%antibio_trend(abx=CEFOX);
%antibio_trend(abx=CEFTAR);
%antibio_trend(abx=CEFTAVI);
%antibio_trend(abx=CEFTAZ);
%antibio_trend(abx=CEFTOTAZ);
%antibio_trend(abx=CEFTRX);
%antibio_trend(abx=CEFUR);
%antibio_trend(abx=CHLOR);
%antibio_trend(abx=CIPRO);
%antibio_trend(abx=CLIND);
%antibio_trend(abx=COL);
%antibio_trend(abx=CTET);
%antibio_trend(abx=DAPTO);
%antibio_trend(abx=DORI);
%antibio_trend(abx=DOXY);
%antibio_trend(abx=ERTA);
%antibio_trend(abx=ERYTH);
%antibio_trend(abx=FLUCO);
%antibio_trend(abx=FLUCY);
%antibio_trend(abx=GENT);
%antibio_trend(abx=GENTHL);
%antibio_trend(abx=IMI);
%antibio_trend(abx=IMIREL);
%antibio_trend(abx=ITRA);
%antibio_trend(abx=LEVO);
%antibio_trend(abx=LNZ);
%antibio_trend(abx=MERO);
%antibio_trend(abx=MERVAB);
%antibio_trend(abx=METH);
%antibio_trend(abx=MICA);
%antibio_trend(abx=MINO);
%antibio_trend(abx=MOXI);
%antibio_trend(abx=OX);
%antibio_trend(abx=PB);
%antibio_trend(abx=PENG);
%antibio_trend(abx=PIP);
%antibio_trend(abx=PIPTAZ);
%antibio_trend(abx=QUIDAL);
%antibio_trend(abx=RIF);
%antibio_trend(abx=STREPHL);
%antibio_trend(abx=TETRA);
%antibio_trend(abx=TICLAV);
%antibio_trend(abx=TIG);
%antibio_trend(abx=TMZ);
%antibio_trend(abx=TOBRA);
%antibio_trend(abx=VANC);
%antibio_trend(abx=VORI);
%antibio_trend(abx=AZITH);
%antibio_trend(abx=CEPH);
%antibio_trend(abx=CLARTH);
%antibio_trend(abx=GATI);
%antibio_trend(abx=METRO);
%antibio_trend(abx=OFLOX);


/*Now merge them together for one big table*/
data merge_trends;
set antibio_trends_2_AMK
antibio_trends_2_AMOX
antibio_trends_2_AMP
antibio_trends_2_AMPSUL
antibio_trends_2_AMXCLV
antibio_trends_2_ANID
antibio_trends_2_AZT
antibio_trends_2_CASPO
antibio_trends_2_CEFAZ
antibio_trends_2_CEFEP
antibio_trends_2_CEFOT
antibio_trends_2_CEFOX
antibio_trends_2_CEFTAR
antibio_trends_2_CEFTAVI
antibio_trends_2_CEFTAZ
antibio_trends_2_CEFTOTAZ
antibio_trends_2_CEFTRX
antibio_trends_2_CEFUR
antibio_trends_2_CHLOR
antibio_trends_2_CIPRO
antibio_trends_2_CLIND
antibio_trends_2_COL
antibio_trends_2_CTET
antibio_trends_2_DAPTO
antibio_trends_2_DORI
antibio_trends_2_DOXY
antibio_trends_2_ERTA
antibio_trends_2_ERYTH
antibio_trends_2_FLUCO
antibio_trends_2_FLUCY
antibio_trends_2_GENT
antibio_trends_2_GENTHL
antibio_trends_2_IMI
antibio_trends_2_IMIREL
antibio_trends_2_ITRA
antibio_trends_2_LEVO
antibio_trends_2_LNZ
antibio_trends_2_MERO
antibio_trends_2_MERVAB
antibio_trends_2_METH
antibio_trends_2_MICA
antibio_trends_2_MINO
antibio_trends_2_MOXI
antibio_trends_2_OX
antibio_trends_2_PB
antibio_trends_2_PIPTAZ
antibio_trends_2_QUIDAL
antibio_trends_2_RIF
antibio_trends_2_TETRA
antibio_trends_2_TIG
antibio_trends_2_TMZ
antibio_trends_2_TOBRA
antibio_trends_2_VANC
antibio_trends_2_VORI

;

	by eventYR;

run;


proc print data=merge_trends;run;






/*Step 4: 
Macro #2: This takes all of the listed treatments and runs a loop on the big, joined table created above to make a condensed table eliminating blank rows and columns.
This uses max case when the antibiotic treatment is not blank or " " and loops it for every treatment column (1-55 - pathogen)*/
%macro condense_table(merge_trends);
    /* Get the list of antibiotic column names*/
proc sql noprint;

    select name 
    into :abx_cols separated by ' ' 
    from dictionary.columns 
    where libname = 'WORK' 
    and memname = 'MERGE_TRENDS' /*Must be upper case idk why SAS is dumb sometimes*/
     and name not in ('eventYR');  /*Exclude the EVENT YEAR column (just antibiotic resistance) */
	 ;
quit;

/*SELECT and GROUP BY clauses for each pathogen by each treatment where "cell" is not blank/missing. this is what will get repeated in the SQL below for each antibiotic*/
	/*Let statements for hardcoded values count of abx, columns of abx, group by pathogen_2*/
%let abx_count = %sysfunc(countw(&abx_cols));
%let select_clause = ;

/*Do loop for 1 to abx # select max case when col not missing (ie. first non-missing value per column)*/
%do i = 1 %to &abx_count; /*1 to number of abx*/
    %let abx_col = %scan(&abx_cols, &i);
    %let select_clause = &select_clause
        , max(case when &abx_col ne . then &abx_col else . end) as &abx_col  format percent10.2; /*Cool trick, put the comma (,) at the front so it doesn't tack an extra comma at the end of your SQL list and return an error*/
%end;

/*test select_clause: view log here if something f's up. it's probably this.*/
%put &=select_clause; 

/* Now run the final PROC SQL query with the generated SELECT statement */
proc sql;
create table condensed_table as
select 

		eventYr
        &select_clause 

	from merge_trends /* OG dataset name */
    	group by eventYr;
quit;

%mend;
%condense_table(merge_trends);


/*output table*/


/*Report output*/
title; footnote;
/*Set your output pathway here*/
ods excel file="C:\Users\mhoskins1\Desktop\Work Files\antibiogram\anitbiogram_trends_2005_2025_&sysdate..xlsx";

ods excel options (sheet_interval = "none" sheet_name = "% Sus." embedded_titles='Yes');
proc print data=condensed_table noobs label ;run;

ods excel close;







