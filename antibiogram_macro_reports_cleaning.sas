
/*
 *---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*
 * Program Name:  antibiogram_macro_reports_cleaning
 * Author:        Mikhail Hoskins
 * Date Created:  01/10/2025
 * Date Modified: 10/21/2025
 * Description:   This code makes an antibiogram on event data from NHSN and produces a sendable Excel file.
 *					NHSN uses the format:
 *
 *					col1	   col2			 col3
 *					pathogen | treatment_1 | treatment_n
 *					_____________________________________
 *					staph_a		S				R
 *					ecoli		R				R
 *					kleb		N				S-DD
 *					pseud		S				S
 *					ent_fae		S-DD			S
 *					staph_a		R				.
 *					...
 *
 *					So we want to group all S+S-DD and divide by total isolated for each disease and group by treatment option. ie. what % of E coli. were susceptible to Ciprofloxacin. 
 *					I think it's also important to define the spectrum of the antibiotics in a general sense so that is built into the final order. 
 *
 *					As always, most of the challenges lie in generating the table(s) we want. There are probably better ways to do that but there are a few macros/do loops that help in certain places. 
 *
 *					Infectious agents to consider:
 *					_____________________________
 *
 *					Enterococcus  faecalis
 *					Escherichia coli
 *					Klebsiella pneumoniae
 *					Pseudomonas aeruginosa
 *					Staphylococcus aureus 
 *
 *					Underlying question:
 *
 *								What are the antibiotic prescribing practices of prescribers in North Carolina? What, how long, how much, and for which infections?
 *
 * Input:        linelisting_antibiogram.sas7bdat: C:\Users\mhoskins1\Desktop\Work Files\NHSN\2019-2024 Archive data
 * Output:       anitbiogram_2024_ALL_TYPES_06MAR25.xlsx C:\Users\mhoskins1\Desktop\Work Files\antibiogram
 *
 * Notes:        Skillsets:
 *				 	SQL, macros, data management/wrangling, report generation for multiple view styles/layouts
 *
 *---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*
 */

libname archive "C:\Users\mhoskins1\Desktop\Work Files\NHSN\2019-2024 Archive data"; /*2019-2024 data*/
%let type = UTI;
%put &=type;




data antibio_raw;
set archive.linelisting_antibiogram;
	where eventDate > '31Dec23'd
			/*and eventType in ("&type");confine dates*/;
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
	sum (case when pathogen_2 in ('AMOX') then . else . end) as dummy "Pathogen Isolated",
	eventType 'Event Type',


	sum (case when pathogen_2 in ('Escherichia coli') then 1 else 0 end) as EC "Escherichia coli",
	sum (case when pathogen_2 in ('Klebsiella pneumoniae') then 1 else 0 end) as KP "Klebsiella pneumoniae",
	sum (case when pathogen_2 in ('Enterococcus faecalis') then 1 else 0 end) as EF "Enterococcus faecalis",
	sum (case when pathogen_2 in ('Pseudomonas aeruginosa') then 1 else 0 end) as PA "Pseudomonas aeruginosa",
	sum (case when pathogen_2 in ('Staphylococcus aureus') then 1 else 0 end) as SA "Staphylococcus aureus"
from antibio_path 
where pathogen_2 not in (' ') 
	group by eventType
;
quit;

/*Rework the dummy variable to create a nice table output for pathogen totals*/
data pathogen_tot_2;
set pathogen_tot;

*if dummy_2 = put(dummy, 32.) ;
dummy_2="Total # of Isolates";
run;

proc sql;
create table pathogen_tot_final as
select


	eventType,
	EC,
	KP,
	EF,
	PA,
	SA
from pathogen_tot_2
	order by eventType
;
create table pathogen_pct_final as
select
	
	
	sum (EC) as sum_EC "Sum Escherichia coli",
	sum (KP) as sum_KP "Sum Klebsiella pneumoniae",
	sum (EF) as sum_EF "Sum Enterococcus faecalis",
	sum (PA) as sum_PA "Sum Pseudomonas aeruginosa",
	sum (SA) as sum_SA "Sum Staphylococcus aureus"
	

from pathogen_tot_final
;
quit;

proc print data=pathogen_tot_final noobs label;run;

/*Step 2: This macro takes each treatment variable and creates a table that shows the % susceptible for each of the 10-12 most common Pathogens. Remember 30+ pathogens must be isolated to create an antibiogram*/

%macro antibio_all_2 (abx=);

proc sql;
create table antibio_calc_1_&abx as
select

	/*eventtype,*/
	pathogen_2 'Pathogen Isolated',
	sum (case when  &abx in ('S', 'S-DD') then 1 else 0 end) as path_&abx._SUSC_ "Pathogen + &abx Susceptible",
	sum (case when  &abx not in (' ','N') then 1 else 0 end) as path_&abx._iso_ "Pathogen + &abx Total Isolated",
	
		calculated path_&abx._SUSC_  / calculated path_&abx._iso_ as pct_susc_&abx "Percent Susceptible &abx" format percent10.1


from antibio_path
where pathogen_2 not in (' ')
	group by pathogen_2
	
	having calculated path_&abx._iso_  GE 30
;

create table antibio_calc_1a_&abx as
select 
	
	pathogen_2,
	path_&abx._iso_,
	pct_susc_&abx
	
	from antibio_calc_1_&abx
;

quit;


/*Use this to group %(# isolated)*/
data antibio_calc_grp_&abx;
set antibio_calc_1a_&abx;

label &abx._combine = "% Susceptible &abx (Total Isolated)";
	&abx._combine = cats(put(pct_susc_&abx, percent10.1),  "(", put(path_&abx._iso_, comma5.), ")");

run;
/*finalize table*/
proc sql;
create table antibio_grpfinal_&abx as
select
	pathogen_2, &abx._combine

from antibio_calc_grp_&abx
;
quit;



/*This piece transposes from columns for each treatment to columns for each pathogen*/
proc transpose data=antibio_calc_1a_&abx out=antibio_calc_2_&abx;
*by pct_susc_&abx;
id pathogen_2;

run;

*proc print data=antibio_calc_2_&abx noobsrun;

%mend antibio_all_2;

/*Step 3: Run all treatments and join together into one big gross table*/
/*Run ALL treatments*/
%antibio_all_2(abx=AMK);
%antibio_all_2(abx=AMOX);
%antibio_all_2(abx=AMP);
%antibio_all_2(abx=AMPSUL);
%antibio_all_2(abx=AMXCLV);
%antibio_all_2(abx=ANID);
%antibio_all_2(abx=AZT);
%antibio_all_2(abx=CASPO);
%antibio_all_2(abx=CEFAZ);
%antibio_all_2(abx=CEFEP);
%antibio_all_2(abx=CEFOT);
%antibio_all_2(abx=CEFOX);
%antibio_all_2(abx=CEFTAR);
%antibio_all_2(abx=CEFTAVI);
%antibio_all_2(abx=CEFTAZ);
%antibio_all_2(abx=CEFTOTAZ);
%antibio_all_2(abx=CEFTRX);
%antibio_all_2(abx=CEFUR);
%antibio_all_2(abx=CHLOR);
%antibio_all_2(abx=CIPRO);
%antibio_all_2(abx=CLIND);
%antibio_all_2(abx=COL);
%antibio_all_2(abx=CTET);
%antibio_all_2(abx=DAPTO);
%antibio_all_2(abx=DORI);
%antibio_all_2(abx=DOXY);
%antibio_all_2(abx=ERTA);
%antibio_all_2(abx=ERYTH);
%antibio_all_2(abx=FLUCO);
%antibio_all_2(abx=FLUCY);
%antibio_all_2(abx=GENT);
%antibio_all_2(abx=GENTHL);
%antibio_all_2(abx=IMI);
%antibio_all_2(abx=IMIREL);
%antibio_all_2(abx=ITRA);
%antibio_all_2(abx=LEVO);
%antibio_all_2(abx=LNZ);
%antibio_all_2(abx=MERO);
%antibio_all_2(abx=MERVAB);
%antibio_all_2(abx=METH);
%antibio_all_2(abx=MICA);
%antibio_all_2(abx=MINO);
%antibio_all_2(abx=MOXI);
%antibio_all_2(abx=OX);
%antibio_all_2(abx=PB);
%antibio_all_2(abx=PENG);
%antibio_all_2(abx=PIP);
%antibio_all_2(abx=PIPTAZ);
%antibio_all_2(abx=QUIDAL);
%antibio_all_2(abx=RIF);
%antibio_all_2(abx=STREPHL);
%antibio_all_2(abx=TETRA);
%antibio_all_2(abx=TICLAV);
%antibio_all_2(abx=TIG);
%antibio_all_2(abx=TMZ);
%antibio_all_2(abx=TOBRA);
%antibio_all_2(abx=VANC);
%antibio_all_2(abx=VORI);
%antibio_all_2(abx=AZITH);
%antibio_all_2(abx=CEPH);
%antibio_all_2(abx=CLARTH);
%antibio_all_2(abx=GATI);
%antibio_all_2(abx=METRO);
%antibio_all_2(abx=OFLOX);

/*Now merge them together for one big table*/
data merge_test;
set 
antibio_grpfinal_AMK
antibio_grpfinal_AMOX
antibio_grpfinal_AMP
antibio_grpfinal_AMPSUL
antibio_grpfinal_AMXCLV
antibio_grpfinal_ANID
antibio_grpfinal_AZT
antibio_grpfinal_CASPO
antibio_grpfinal_CEFAZ
antibio_grpfinal_CEFEP
antibio_grpfinal_CEFOT
antibio_grpfinal_CEFOX
antibio_grpfinal_CEFTAR
antibio_grpfinal_CEFTAVI
antibio_grpfinal_CEFTAZ
antibio_grpfinal_CEFTOTAZ
antibio_grpfinal_CEFTRX
antibio_grpfinal_CEFUR
antibio_grpfinal_CHLOR
antibio_grpfinal_CIPRO
antibio_grpfinal_CLIND
antibio_grpfinal_COL
antibio_grpfinal_CTET
antibio_grpfinal_DAPTO
antibio_grpfinal_DORI
antibio_grpfinal_DOXY
antibio_grpfinal_ERTA
antibio_grpfinal_ERYTH
antibio_grpfinal_FLUCO
antibio_grpfinal_FLUCY
antibio_grpfinal_GENT
antibio_grpfinal_GENTHL
antibio_grpfinal_IMI
antibio_grpfinal_IMIREL
antibio_grpfinal_ITRA
antibio_grpfinal_LEVO
antibio_grpfinal_LNZ
antibio_grpfinal_MERO
antibio_grpfinal_MERVAB
antibio_grpfinal_METH
antibio_grpfinal_MICA
antibio_grpfinal_MINO
antibio_grpfinal_MOXI
antibio_grpfinal_OX
antibio_grpfinal_PB
antibio_grpfinal_PIPTAZ
antibio_grpfinal_QUIDAL
antibio_grpfinal_RIF
antibio_grpfinal_TETRA
antibio_grpfinal_TIG
antibio_grpfinal_TMZ
antibio_grpfinal_TOBRA
antibio_grpfinal_VANC
antibio_grpfinal_VORI
;

run;

/*Step 4: 
Macro #2: This takes all of the listed treatments and runs a loop on the big, joined table created above to make a condensed table eliminating blank rows and columns.
This uses max case when the antibiotic treatment is not blank or " " and loops it for every treatment column (1-55 - pathogen)*/
%macro condense_table(merge_test);
    /* Get the list of antibiotic column names*/
proc sql noprint;

    select name 
    into :abx_cols separated by ' ' 
    from dictionary.columns 
    where libname = 'WORK' 
    and memname = 'MERGE_TEST' /*Must be upper case idk why SAS is dumb sometimes*/
    and name not in ('pathogen_2');  /* Exclude the pathogen_2 column (just antibiotic prescribing) */
quit;

/*SELECT and GROUP BY clauses for each pathogen by each treatment where "cell" is not blank/missing. this is what will get repeated in the SQL below for each antibiotic*/
	/*Let statements for hardcoded values count of abx, columns of abx, group by pathogen_2*/
%let abx_count = %sysfunc(countw(&abx_cols));
%let select_clause = ;
%let group_by_clause = pathogen_2; /* Group by pathogen_2 */
/*Keep list is the list of antibiotics we're interested in keeping: Pathogen + any antibiotics we want to view*/
%let keep_list = 
	Pathogen_2
	AMK_combine
	AMP_combine
	AMPSUL_combine
	CEFAZ_combine
	CEFEP_combine
	CEFTRX_combine
	CIPRO_combine
	CLIND_combine
	ERYTH_combine
	GENT_combine
	IMI_combine
	LEVO_combine
	MERO_combine
	PIPTAZ_combine
	TOBRA_combine;

/*Do loop for 1 to abx # select max case when col not missing (ie. first non-missing value per column)*/
%do i = 1 %to &abx_count; /*1 to number of abx*/
    %let abx_col = %scan(&abx_cols, &i);
    %let select_clause = &select_clause
        , max(case when &abx_col ne '' then &abx_col else '' end) as &abx_col; /*Cool trick, put the comma (,) at the front so it doesn't tack an extra comma at the end of your SQL list and return an error*/
%end;

/*test select_clause: view log here if something f's up. it's probably this.*/
%put &=select_clause; 

/* Now run the final PROC SQL query with the generated SELECT statement */
proc sql;
create table condensed_table as
select 

		&group_by_clause /*Could just put pathogen_2 here, but if that changes &group_by_clause works too*/
        &select_clause

	from merge_test /* OG dataset name */
    	group by pathogen_2;
quit;

/*Can do some cleaning here if necessary and keeping only antibiotics we're concerned with*/
data condensed_table_2;
set condensed_table (keep = &keep_list rename=(pathogen_2=pathogen_dummy));

   length pathogen_2 $64;
   pathogen_2=cats(pathogen_dummy, ': % Susceptible (# Isolates)');/*Add final piece of label to pathogens, will look nicer in output*/
   drop pathogen_dummy;

   label pathogen_2 = "Pathogen Isolated";

label AMK_combine = "Amikacin";
label AMP_combine = "Ampicillin";
label AMPSUL_combine = "Ampicillin/ Sulbactam";
label CEFAZ_combine = "Cefazolin";
label CEFEP_combine = "Cefepime";
label CEFTRX_combine = "Ceftriaxone";
label CIPRO_combine = "Ciprofloxacin";
label CLIND_combine = "Clindamycin";
label ERYTH_combine = "Erythromycin";
label GENT_combine = "Gentamicin";
label IMI_combine = "Imipenem/ Cilastatin/ Relebacam";
label LEVO_combine = "Levofloxacin";
label MERO_combine = "Meropenem/ Vaborbactam";
label PIPTAZ_combine = "Piperacillin/ Tazobactam";
label TOBRA_combine = "Tobramycin";

run;
/*Doesn't really need to be in the macro but why not*/
/*order table from most narrow to most broad antibiotics*/
proc sql;
create table condensed_table_final as
select

	pathogen_2,

	CLIND_combine,
	CEFAZ_combine,
	GENT_combine,
	TOBRA_combine,
	AMK_combine,
	CIPRO_combine,
	LEVO_combine,
	AMP_combine,
	AMPSUL_combine,
	CEFTRX_combine,
	CEFEP_combine,
	MERO_combine,
	IMI_combine,
	PIPTAZ_combine,
	ERYTH_combine

from condensed_table_2
;
quit;

%mend;

%condense_table(merge_test);
/*View table*/
proc print data=condensed_table_final noobs ;run;



/*Super repetitive but lets pull out the isolated counts... I don't even know why I'm doing it this way*/
proc sql;
create table isolated_only as
select 
		pathogen_2,

        substr(CLIND_combine, 
               index(CLIND_combine, '(') + 1, 
               index(CLIND_combine, ')') - index(CLIND_combine, '(') - 1) as CLIND_iso "Clindamycin Isolated", 
        substr(CEFAZ_combine, 
               index(CEFAZ_combine, '(') + 1, 
               index(CEFAZ_combine, ')') - index(CEFAZ_combine, '(') - 1) as CEFAZ_iso "Cefazolin Isolated", 
        substr(GENT_combine, 
               index(GENT_combine, '(') + 1, 
               index(GENT_combine, ')') - index(GENT_combine, '(') - 1) as GENT_iso "Gentamicin Isolated", 
        substr(TOBRA_combine, 
               index(TOBRA_combine, '(') + 1, 
               index(TOBRA_combine, ')') - index(TOBRA_combine, '(') - 1) as TOBRA_iso "Tobramycin Isolated", 
        substr(AMK_combine, 
               index(AMK_combine, '(') + 1, 
               index(AMK_combine, ')') - index(AMK_combine, '(') - 1) as AMK_iso "Amikacin Isolated", 
        substr(CIPRO_combine, 
               index(CIPRO_combine, '(') + 1, 
               index(CIPRO_combine, ')') - index(CIPRO_combine, '(') - 1) as CIPRO_iso "Ciprofloxacin Isolated", 
        substr(LEVO_combine, 
               index(LEVO_combine, '(') + 1, 
               index(LEVO_combine, ')') - index(LEVO_combine, '(') - 1) as LEVO_iso "Levofloxacin Isolated", 
        substr(AMP_combine, 
               index(AMP_combine, '(') + 1, 
               index(AMP_combine, ')') - index(AMP_combine, '(') - 1) as AMP_iso "Ampicillin Isolated", 
        substr(AMPSUL_combine, 
               index(AMPSUL_combine, '(') + 1, 
               index(AMPSUL_combine, ')') - index(AMPSUL_combine, '(') - 1) as AMPSUL_iso "Ampicillin/ Sulbactam Isolated", 
        substr(CEFTRX_combine, 
               index(CEFTRX_combine, '(') + 1, 
               index(CEFTRX_combine, ')') - index(CEFTRX_combine, '(') - 1) as CEFTRX_iso "Ceftriaxone Isolated", 
		substr(PIPTAZ_combine, 
               index(PIPTAZ_combine, '(') + 1, 
               index(PIPTAZ_combine, ')') - index(PIPTAZ_combine, '(') - 1) as PIPTAZ_iso "Piperacillin/ Tazobactam Isolated", 
		substr(IMI_combine, 
               index(IMI_combine, '(') + 1, 
               index(IMI_combine, ')') - index(IMI_combine, '(') - 1) as IMI_iso "Imipenem/ Cilastatin/Relebacam Isolated", 
		substr(MERO_combine, 
               index(MERO_combine, '(') + 1, 
               index(MERO_combine, ')') - index(MERO_combine, '(') - 1) as MERO_iso "Meropenem/ Vaborbactam Isolated", 
		substr(CEFEP_combine, 
               index(CEFEP_combine, '(') + 1, 
               index(CEFEP_combine, ')') - index(CEFEP_combine, '(') - 1) as CEFEP_iso "Cefepime Isolated"



from condensed_table_final

		order by pathogen_2;
quit;

proc print data=isolated_only noobs label;run;



/*Transpose to look nicer*/
proc transpose data=condensed_table_final out=condensed_2(drop=_NAME_);
    var CLIND_combine CEFAZ_combine GENT_combine TOBRA_combine AMK_combine CIPRO_combine LEVO_combine AMP_combine AMPSUL_combine CEFTRX_combine CEFEP_combine MERO_combine IMI_combine PIPTAZ_combine ERYTH_combine; /*group to one column*/
    id pathogen_2; /*name other columns*/
run;

/*Clean and finalize labels*/
proc sql;
create table condensed_table_final_2 as
select

	_LABEL_ as Treatment 'Treatment',
	Enterococcus_faecalis____Suscept as entero_fac 'Enterococcus faecalis: % Susceptible (# Isolates)',
	Escherichia_coli____Susceptible as ecoli 'Escherichia coli: % Susceptible (# Isolates)',
	Klebsiella_pneumoniae____Suscept as kelb_pneu 'Klebsiella pneumoniae: % Susceptible (# Isolates)',
	Pseudomonas_aeruginosa____Suscep as pseud_aerg 'Pseudomonas aeruginosa: % Susceptible (# Isolates)',
	Staphylococcus_aureus____Suscept as stap_a 'Staphylococcus aureus: % Susceptible (# Isolates)'

from condensed_2
;
quit;

/*Step 5: Clean for reporting and make a report*/



data table_report;
set condensed_table_final;


gramstain = 'Gram positive';
if pathogen_2 not in ("Enterococcus faecalis: % Susceptible (# Isolates)" ,"Staphylococcus aureus: % Susceptible (# Isolates)") then gramstain='Gram negative';
;
run;


data table_report_2;
set condensed_table_final_2;
format class $32.;
format subclass $32.;
class = 'Other';
if treatment in ('Amikacin','Gentamicin','Tobramycin') then class = 'Aminoglycosides';
if treatment in ('Ampicillin', 'Ampicillin/ Sulbactam',  'Piperacillin', 'Cefazolin', 'Ceftriaxone', 
				'Cefepime', 'Meropenem', 'Meropenem/ Vaborbactam', 'Piperacillin/ Tazobactam', 'Imipenem/ Cilastatin/ Relebacam', 'Imipenem') then class = 'Beta-Lactams';
if treatment in ('Ciprofloxacin', 'Levofloxacin') then class = 'Fluoroquinolones';
if treatment in ('Erythromycin') then class = 'Macrolides';

subclass = '';

	if class in ('Beta-Lactams') and treatment in ('Ampicillin', 'Peperacillin', 'Piperacillin/ Tazobactam', 'Ampicillin/ Sulbactam') then subclass = 'Penicillins';
	if class in ('Beta-Lactams') and treatment in ('Cefazolin', 'Ceftriaxone', 'Cefepime') then subclass = 'Cephalosporins';
	if class in ('Beta-Lactams') and treatment in ('Meropenem', 'Imipenem', 'Meropenem/ Vaborbactam', 'Imipenem/ Cilastatin/ Relebacam') then subclass = 'Carbapenems';

run;


/*Report output*/
title; footnote;
/*Set your output pathway here*/
ods excel file="C:\Users\mhoskins1\Desktop\Work Files\antibiogram\anitbiogram_2024_ALL_TYPES_&sysdate..xlsx";

ods excel options (sheet_interval = "none" sheet_name = "summary" embedded_titles='Yes');

title height=8pt justify=left "Pathogen identified in North Carolina 2024 by Type";
proc print data=pathogen_tot_final noobs label;run;


ods excel options (sheet_interval = "now" sheet_name = "antibiogram_1" embedded_titles='Yes');
title height=8pt justify=left"Pathogen identified and susceptibility by treatment, North Carolina 2024";
title2 height=8pt justify=left "		*among reportable events";

proc report data=table_report_2 headline headskip
style(report)= [frame=hsides] 

	style(header)=[background=lightgrey bordertopcolor=black borderbottomcolor=black borderrightcolor=darkgray]

	style(column)=[background=white  bordertopcolor=black borderleftcolor=black borderbottomcolor = black];


	  column class subclass Treatment ('Gram Positive' entero_fac stap_a) ('Gram Negative' ecoli kelb_pneu pseud_aerg ) ;



define class / group "Class"
		style (column)=[borderbottomcolor = white bordertopcolor = white borderleftcolor = white];

define subclass / group missing "Subclass"
		style (column)=[borderbottomcolor = white bordertopcolor = white borderleftcolor = white];

run;

ods excel options (sheet_interval = "now" sheet_name = "antibiogram_2" embedded_titles = 'Yes');
title height=8pt justify=left"Pathogen identified and susceptibility by treatment, North Carolina 2024";
title2 height=8pt justify=left "		*among reportable events";

proc report data=table_report headline headskip

style(report)= [frame=hsides rules=rows] 

	style(header)=[background=lightgrey bordertopcolor=black borderbottomcolor=black borderrightcolor=darkgray]

	style(column)=[background=white  bordertopcolor=black borderleftcolor=black borderbottomcolor = black];

column gramstain pathogen_2 

('Aminoglycosides' ( ' ' GENT_combine TOBRA_combine AMK_combine))

('Beta-Lactams' 
	('Carbapenems' MERO_combine IMI_combine) ('Cephalosporins' CEFAZ_combine CEFEP_combine CEFTRX_combine) 
	('Penicillins' PIPTAZ_combine AMP_combine AMPSUL_combine))

('Fluoroquinolones' (' ' CIPRO_combine LEVO_combine)) ('Macrolides'(' ' ERYTH_combine)) ('Other' (' ' CLIND_combine))
;

define gramstain / group "Gram Stain" 
		style (column)=[borderbottomcolor = white bordertopcolor = white borderleftcolor = white];


compute CLIND_combine; 
            if (find(CLIND_combine, "67")>0) then  call define(_col_,"style","style={background=lightgray}");	
			endcomp;

run;

ods excel close;


