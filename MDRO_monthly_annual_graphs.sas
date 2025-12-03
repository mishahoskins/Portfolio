
/*
 *------------------------------------------------------------------------------
 * Program Name:  MDRO_monthly_annual_graphs.sas 
 * Author:        Mikhail Hoskins
 * Date Created:  08/20/2025
 * Date Modified: 11/18/2025
 * Description:   Uses code: HAI_case_counts.sas and the HAI_updated working dataset to create graphics showing case counts monthly for current year and annually since 2015 for MDROs.
 *				  Grouped by CPO + C.auris and GAS. 				  
 *
 * Inputs:       HAI_case_counts.sas <-- run this first then use this: analysis_forgraphs.sas7bdat
 * Output:       T:\HAI\Code library\Epi curve example\analysis\MDRO_trends 2025_&sysdate..xlsx
 * Notes:        Updated November 2025 to clean up output, automate, and display mechanisms for CPO. Organism still tbd on when to include. 
 *------------------------------------------------------------------------------
 */

/*Macros for dates and disease*/
	/*don't update these*/
%let disease1 = CPO;
/*there used to be a disease 2 when we did CRE + CPO, fixed in first SQL step (~line 60)*/
%let disease3 = GAS; 
%let disease4 = CAURIS;

/*State pop.(update annually)*/
%let state_pop = 10835491;

					/*------------*/
					/*update these*/
					/*------------*/
%let mindate = 01Jan2025; /*Minimum date you want to view (usually start of the year for monthly graphs). We also use this for the year max to make sure we're displaying non-complete data for the most recent year*/
%let maxmonth = 01Oct2025;/*Same as above but most recent month 1-denorm table month*/

libname analysis 'T:\HAI\Code library\Epi curve example\SASData';/*output path for sas7bdat file*/

/*From here should run nice and smoothly*/
/*Check min max dates. Should be 2015 - current date*/
proc sql;
create table min_max as
select

	max(event_date) as max_date format date9.,
	case when type in ('CAURIS') then min(event_date) else . end as min_date_cauris format date9.,
	
	case when type in ('CRE') then min(event_date) else . end as min_date_cre format date9.


from analysis.analysis_forgraphs
	having event_date GE ('01JAN2025'd)
	order min_date_cauris
;
quit;

/*Ok, main step here: group CRE + CPO and rename STRA to GAS. Then we are assigning the most recent month/year a "tag" so we display those as a separate graph. The most recent month/year data will display in a slightly
lighter shaded bar in the output as "data not complete"*/
/*Step 1: create month and year tags, CRE + CPO = CPO, and STRA = GAS*/
proc sql;
create table rename as
select *,

/*Create timeframe tags. Month and Year.*/
	intnx("month", (EVENT_DATE), 0, "end") as monthtag "Month Ending Date" format=monname.,
	intnx("year", (EVENT_DATE), 0, "end") as yeartag "Year Ending Date" format=year4.,

	case when type in ('STRA') then 'GAS' 
		 when type in ('CRE' , 'CPO') then 'CPO'

	else type end as type_new 

from analysis.analysis_forgraphs
	where type in ('STRA', 'CPO', 'CRE', 'CAURIS') 
		/*having monthtag GE ('01jan25'd)*/
;
quit;

/*Step 2: CPO can have multiple mechanisms but we only want to count them once in our case count, quick dedupe step but only for case counts, 
		  for mechanism counts we want to include ALL CPO mechanisms even if we double count an individual person*/
proc sort data=rename out=rename_2 nodupkey;
by case_id type_new;
run;

/*Step 3: Create a "tag" for everything but the most recent month, then a separate column for the most recent month. We'll make the transparency higher to indicate data may not be complete*/
proc sql;
create table cases_count as
select 

	monthtag,
	yeartag,
	type_new,
	event_date,
/*Create max month tag for events in that month (current month usually)*/
	/*month tags*/
	case when (type_new) not in ('') and event_date LT ("&maxmonth"d) then 1 else . end as cases_tag,
	case when (type_new) not in ('') and event_date GE ("&maxmonth"d) then 1 else . end as recent_month_tag,

/*Same thing but for the most recent year*/
	/*year tags*/
	case when (type_new) not in ('') and yeartag LT ("&mindate"d) then 1 else . end as cases_tag_yr,
	case when (type_new) not in ('') and monthtag GE ("&mindate"d) then 1 else . end as  recent_yr_tag


from rename_2

;
/*Do the same for mechanism, but without the deduplicated set*/
create table cases_count_mech as
select 

	monthtag,
	yeartag,
	type_new,
	CPO_CARB_MECHANISM "Mechanism",
	event_date,

/*Create max month tag for events in that month (current month usually)*/
	/*month tags*/
	case when (type_new) in ('CPO') and event_date LT ("&maxmonth"d) then 1 else . end as cases_tag,
	case when (type_new) in ('CPO') and event_date GE ("&maxmonth"d) then 1 else . end as recent_month_tag,

/*Same thing but for the most recent year*/
	/*year tags*/
	case when (type_new) in ('CPO') and yeartag LT ("&mindate"d) then 1 else . end as cases_tag_yr,
	case when (type_new) in ('CPO') and monthtag GE ("&mindate"d) then 1 else . end as  recent_yr_tag


from rename
;
quit;

/*Done, now we have a working dataset that has the most recent month/year clearly tagged or "flagged" for our graphs. Proc sgplot gets really dicey with
  order and syntax and usually just trial and error. For me it's worth the effort so I don't have to touch any of this in Excel later on, but you could
  print your datasets from here and do this in excel with pivot tables if you're a psycopath.*/

/*Macros because lazy*/

/*Macros help this not be like 1000 lines of sgplot B.S.. First macro just does cases and rates by individual MDRO; CPO/GAS/CAURIS*/
%macro metrics  (disease=, color_schm=, );
proc sql;
create table quick_metrics as
select

	
	intnx("month", (EVENT_DATE), 0, "end") as testreportmonth "Month" format=monname.,
/*
	sum (case when type_new in ("&disease" , "&disease2") and density in (1) then 1 else 0 end) as nonrural_&disease "Non-rural &disease + &disease2 per Quarter",
		(calculated nonrural_&disease / &nonruralpop) * 100000 as nonrural_ir_&disease "Non-rural IR/ 100,000K pop &disease + &disease2" format 10.2,

	sum (case when type_new in ("&disease" , "&disease2") and density in (0) then 1 else 0 end) as RURAL_&disease "Rural &disease + &disease2  per Quarter",
		(calculated RURAL_&disease / &ruraltotalpop) * 100000 as rural_ir_&disease "Rural IR/ 100,000K pop &disease + &disease2" format 10.2,

Total*/
		sum (case when type_new in ("&disease") then 1 else 0 end) as tot_&disease "Total &disease per Month",
		(calculated tot_&disease / &state_pop) * 100000 as ir_tot_&disease "Statewide IR/ 100,000K pop &disease" format 10.2



from rename_2 /*deduped dataset*/
where EVENT_DATE ge ('01jan25'd)
	group by testreportmonth

;

quit;
ods proclabel="&disease Table";
proc print data=quick_metrics noobs label contents= "Month, Total, IR by &disease";run;


ods proclabel="&disease Graph";
proc sgplot data=quick_metrics noborder noautolegend
description = "&disease case count by month";
	/*series X=testreportqtr Y=nonrural_ir_&disease / datalabel lineattrs=(thickness=3)  datalabelattrs=(family="Arial" size=10);/* Plot for non-rural*/
	/*series X=testreportqtr Y=rural_ir_&disease / datalabel lineattrs=(thickness=3)  datalabelattrs=(family="Arial" size=10);/* Plot for non-rural*/

	series X=testreportmonth Y=tot_&disease / datalabel lineattrs=(thickness=3 color= &color_schm)  datalabelattrs=(family="Arial" size=10);

	xaxis label = "Month"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight= bold size=10)
		;

	yaxis label = "&disease cases"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight=bold size=10)
		;
		
	/*lineattrs datacolors= &color_schm;	From: http://ftp.sas.com/techsup/download/graph/color_list.pdf
																				page 8 for greenscale colors used. Can use other 
																				scales/combinations but consitency would be beneficial*/

		    keylegend / title=" " location=outside position=topleft 
                across=1 noborder;

run;
%mend;
/*Now macro for mechanism, not entirely necessary... but in a macro-ing mood and may help later? idk.*/
%macro mech_line (disease=);
proc sql;
create table mech_metrics as
select

	
	intnx("month", (EVENT_DATE), 0, "end") as testreportmonth "Month" format=monname.,

		sum (case when CPO_CARB_MECHANISM in ("IMP") then 1 else 0 end) as IMP "IMP",
		sum (case when CPO_CARB_MECHANISM in ("KPC") then 1 else 0 end) as KPC "KPC",
		sum (case when CPO_CARB_MECHANISM in ("OXA-48") then 1 else 0 end) as OXA48 "OXA-48",
		sum (case when CPO_CARB_MECHANISM in ("OXA-24") then 1 else 0 end) as OXA24 "OXA-24",
		sum (case when CPO_CARB_MECHANISM in ("OXA-23") then 1 else 0 end) as OXA23 "OXA-23",
		sum (case when CPO_CARB_MECHANISM in ("VIM") then 1 else 0 end) as VIM "VIM",
		sum (case when CPO_CARB_MECHANISM in ("NDM") then 1 else 0 end) as NDM "NDM",
		sum (case when CPO_CARB_MECHANISM in ("Other") then 1 else 0 end) as oth "Other"

from rename /*not deduped dataset, counting mechanisms not unique individuals here*/
where EVENT_DATE ge ('01jan25'd)
	group by testreportmonth
;
quit;

ods proclabel="CPO Mechanism Table";
proc print data=mech_metrics noobs label contents= "Month, CPO Mechanism";run;

ods proclabel="CPO Mechanism Graphs";
proc sgplot data=mech_metrics noborder noautolegend
description = "Mechanism count by month";
	/*series X=testreportqtr Y=nonrural_ir_&disease / datalabel lineattrs=(thickness=3)  datalabelattrs=(family="Arial" size=10);/* Plot for non-rural*/
	/*series X=testreportqtr Y=rural_ir_&disease / datalabel lineattrs=(thickness=3)  datalabelattrs=(family="Arial" size=10);/* Plot for non-rural*/

	series X=testreportmonth Y=IMP / datalabel lineattrs=(thickness=2 color= STY) datalabelattrs=(family="Arial" size=10);
	series X=testreportmonth Y=KPC / datalabel lineattrs=(thickness=2 color= VIGB) datalabelattrs=(family="Arial" size=10);
	series X=testreportmonth Y=OXA48 / datalabel lineattrs=(thickness=2 color= DAPPK) datalabelattrs=(family="Arial" size=10);
	series X=testreportmonth Y=OXA24 / datalabel lineattrs=(thickness=2 color= BIPPK) datalabelattrs=(family="Arial" size=10);
	series X=testreportmonth Y=OXA23 / datalabel lineattrs=(thickness=2 color= VIV) datalabelattrs=(family="Arial" size=10);
	series X=testreportmonth Y=VIM / datalabel lineattrs=(thickness=2 color= STR) datalabelattrs=(family="Arial" size=10);
	series X=testreportmonth Y=NDM / datalabel lineattrs=(thickness=2 color= VIYPK) datalabelattrs=(family="Arial" size=10);
	series X=testreportmonth Y=oth / datalabel lineattrs=(thickness=2 color= BIP) datalabelattrs=(family="Arial" size=10);

	xaxis label = "Month"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight= bold size=10)
		;

	yaxis label = "Mechanism Count"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight=bold size=10)
		;
		
	/*lineattrs datacolors= &color_schm;	From: http://ftp.sas.com/techsup/download/graph/color_list.pdf
																				page 8 for greenscale colors used. Can use other 
																				scales/combinations but consitency would be beneficial*/

	keylegend / title="Key:" titleattrs= (size=9 family="Arial" weight=bold) valueattrs= (size=8 family="Arial") location=outside position=topleft 
    across=3 noborder;

run;

%mend;


/*Macro for stacked bar graphs. Diabolical two vbar code here, lightly shaded last bar for most recent data to show incompleteness.*/
%macro stack_graphs (source=, measure=, contentslabel=, timevar=, response_1=, timevar2=, response_2=, timeframe=, title= , color_schm=, disease=, startdate=, exclusion=);  
ods proclabel="Bar Graphs, &timevar2: &contentslabel";
proc sgplot data = &source pad=(top=10) noborder 
	description= "&contentslabel by &timevar2";
/*year by cases up to current year (but not including current month), group by disease type, stack*/
vbar &timevar / response= &response_1 group =  &measure groupdisplay=stack fillattrs=(transparency=0.2) outlineattrs=(color= "0000")

		datalabel
		datalabelattrs=(color=black size=10 family="Arial");

		*inset "(*ESC*){sup '*'} current &timevar2 data" "may be incomplete" / position=bottomright backcolor= "white" valuealign=right;

		
xaxis label = "&timeframe"

		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight= bold size=10)
		;

	yaxis label = "Number of Cases &title"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight=bold size=10)
		;

	styleattrs datacolors= (&color_schm);

			    keylegend / title="Key:" titleattrs= (size=10 family="Arial" weight=bold) valueattrs= (size=10 family="Arial") location=outside position=topleft 
                across=3 noborder;


/*month by cases IN current month, group by disease type, stack*/
				/*Tricky SAS thing here: this needs to go after the keylegend so it doesn't display a separate legend for the lightly shaded "inocomplete" data.*/
vbar &timevar / response= &response_2 group = &measure groupdisplay=stack fillattrs=(transparency=0.8) outlineattrs=(color= "0000")

		datalabel
		datalabelattrs=(color=black size=10 family="Arial");

	where type_new in &disease and monthtag GE (&startdate);

				keylegend / title="*Data in current &timevar2 may not be complete" titleattrs= (size=8 family="Arial" ) 
				exclude= (&exclusion) location=outside position=topright
                noborder;

run;

%mend;


dm 'odsresults; clear';
/*ODS PDF output*/
ods graphics /noborder;
title; footnote;

/*Set your output pathway here*/ 
ods pdf file="T:\HAI\Code library\Epi curve example\analysis\MDRO_trends 2025_&sysdate..pdf" 
/*Named a generic overwriteable name so we can continue to reproduce and autopopulate a template;*/
style=journal startpage=no contents=yes;

options number nodate;

title font="Arial" height=12pt "&disease1";
%metrics(disease=&disease1, color_schm= STB);

ods pdf startpage=now;
title font="Arial" height=12pt "&disease3";
%metrics(disease=&disease3, color_schm= DEYG);

ods pdf startpage=now;
title "&disease4";
%metrics(disease=&disease4, color_schm = DEYPK);


/*CPO mechanism plot*/
ods pdf startpage=now;
title font="Arial" height=12pt "Monthly CPO Mechanism";
%mech_line (disease=);
title;
%stack_graphs(source=cases_count_mech, measure=CPO_CARB_MECHANISM, timevar= monthtag, response_1= cases_tag, timevar2= month, 
					exclusion= "KPC" "IMP" "VIM" "Other" "OXA-48" "OXA-23" "OXA-24" "NDM", response_2= recent_month_tag, timeframe= Month, 
					title= (CPO Mechanism), color_schm= VIGB VIYPK DAPPK BIP STR VIV STY BIPPK, disease= ("CPO" ), startdate="&mindate"d);

/*Monthly plots*/
ods pdf startpage=now;
title font="Arial" height=12pt "Monthly Bar Graphs";
/*Monthly graphs*/
%stack_graphs(source=cases_count, measure=type_new, timevar= monthtag, response_1= cases_tag, timevar2= month, response_2= recent_month_tag, timeframe= Month, 
					exclusion= "GAS" "CPO" "CAURIS", title= (CPO + C.auris), color_schm= DEYPK STB, disease= ("CAURIS" "CPO" ), startdate="&mindate"d);
title;
%stack_graphs(source=cases_count, measure=type_new, timevar= monthtag, response_1= cases_tag, timevar2= month, response_2= recent_month_tag, timeframe = Month, 
					exclusion= "GAS" "CPO" "CAURIS", title = (GAS), color_schm = DEYG, disease = ("GAS"), startdate="&mindate"d);

/*Annual plots*/
ods pdf startpage=now;
title font="Arial" height=12pt "Annual Bar Graphs";
/*Annual graphs*/
%stack_graphs(source=cases_count, measure=type_new, contentslabel= &disease1 &disease3, timevar= yeartag, response_1= cases_tag_yr, timevar2= year, response_2= recent_yr_tag, timeframe= Year,
					exclusion= "GAS" "CPO" "CAURIS", title= (CPO + C.auris), color_schm= STB DEYPK, disease= ("CPO" "CAURIS"), startdate="01jan2015"d);
title;
%stack_graphs(source=cases_count, measure=type_new, contentslabel= &disease1 &disease3, timevar= yeartag, response_1= cases_tag_yr, timevar2= year, response_2= recent_yr_tag, timeframe = Year,
					exclusion= "GAS" "CPO" "CAURIS", title = GAS, color_schm = DEYG, disease = ("GAS"), startdate="01jan2015"d);
ods pdf close;



/*Excel output*/



ods graphics /noborder;
title; footnote;
/*Set your output pathway here*/
ods excel file="T:\HAI\Code library\Epi curve example\analysis\MDRO_trends 2025_&sysdate..xlsx";*<----- Named a generic overwriteable name so we can continue to reproduce and autopopulate a template;

ods excel options (sheet_interval = "none" sheet_name = "&disease1" embedded_titles='Yes');
%metrics(disease=&disease1, color_schm= STB);

ods excel options (sheet_interval = "now" sheet_name = "&disease3" embedded_titles='Yes');
%metrics(disease=&disease3, color_schm= DEYG);

ods excel options (sheet_interval = "now" sheet_name = "&disease4" embedded_titles='Yes');
%metrics(disease=&disease4,  color_schm = DEYPK);


/*CPO mechanism plot*/
ods excel options (sheet_interval = "now" sheet_name = "CPO Mech" embedded_titles='Yes');
title font="Arial" height=12pt "Monthly CPO Mechanism";
%mech_line (disease=);
title;
%stack_graphs(source=cases_count_mech, measure=CPO_CARB_MECHANISM, timevar= monthtag, response_1= cases_tag, timevar2= month, 
					exclusion= "KPC" "IMP" "VIM" "Other" "OXA-48" "OXA-23" "OXA-24" "NDM", response_2= recent_month_tag, timeframe= Month, 
					title= (CPO Mechanism), color_schm= VIGB VIYPK DAPPK BIP STR VIV STY BIPPK, disease= ("CPO" ), startdate="&mindate"d);


/*Monthly plots*/
ods excel options (sheet_interval = "now" sheet_name = "bar monthly" embedded_titles='Yes');
title font="Arial" height=12pt "Monthly Bar Graphs";
%stack_graphs(source=cases_count, measure=type_new, timevar= monthtag, response_1= cases_tag, timevar2= month, response_2= recent_month_tag, timeframe= Month, 
					exclusion= "GAS" "CPO" "CAURIS", title= (CPO + C.auris), color_schm= DEYPK STB, disease= ("CAURIS" "CPO" ), startdate="&mindate"d);
title;
%stack_graphs(source=cases_count, measure=type_new, timevar= monthtag, response_1= cases_tag, timevar2= month, response_2= recent_month_tag, timeframe = Month, 
					exclusion= "GAS" "CPO" "CAURIS", title = (GAS), color_schm = DEYG, disease = ("GAS"), startdate="&mindate"d);

/*Annual plots*/
ods excel options (sheet_interval = "now" sheet_name = "bar annual" embedded_titles='Yes');
title font="Arial" height=12pt "Annual Bar Graphs";
%stack_graphs(source=cases_count, measure=type_new, contentslabel= &disease1 &disease3, timevar= yeartag, response_1= cases_tag_yr, timevar2= year, response_2= recent_yr_tag, timeframe= Year,
					exclusion= "GAS" "CPO" "CAURIS", title= (CPO + C.auris), color_schm= STB DEYPK, disease= ("CPO" "CAURIS"), startdate="01jan2015"d);
title;
%stack_graphs(source=cases_count, measure=type_new, contentslabel= &disease1 &disease3, timevar= yeartag, response_1= cases_tag_yr, timevar2= year, response_2= recent_yr_tag, timeframe = Year,
					exclusion= "GAS" "CPO" "CAURIS", title = GAS, color_schm = DEYG, disease = ("GAS"), startdate="01jan2015"d);

ods excel close;


proc template;
list styles;
run;
