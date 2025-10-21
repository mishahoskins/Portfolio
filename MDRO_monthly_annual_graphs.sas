
/*
 *------------------------------------------------------------------------------
 * Program Name:  MDRO_monthly_annual_graphs.sas 
 * Author:        Mikhail Hoskins
 * Date Created:  08/20/2025
 * Date Modified: 10/20/2025
 * Description:   Uses code: analysis_forgraphs.sas from HAI_case_counts.sas program and working dataset to create graphics showing case counts monthly for current year and annually since 2015 for MDROs.
 *				  Grouped by CPO + C.auris and GAS. 				  
 *
 * Inputs:       HAI_case_counts.sas <-- run this first
 * Output:       T:\HAI\Code library\Epi curve example\analysis\MDRO_trends 2025_&sysdate..xlsx
 * Notes:        Skillsets:
 *					SQL, database management, HEAVY macro use, table of contents, report building, data visualization (bar, line, table, output orientation etc.), rural/urban (risk factor) rates
 *------------------------------------------------------------------------------
 */

/*Macros for dates and disease*/

	/*update these*/
%let mindate = 01Jan2025; /*Minimum date you want to view (usually start of the year for monthly graphs). We also use this for the year max to make sure we're displaying non-complete data for the most recent year*/
%let maxmonth = 01Sep2025;/*Same as above but most recent month 1-denorm table month*/

	/*don't update these*/
%let disease1 = CPO;
/*there used to be a disease 2 when we did CRE + CPO, fixed in first SQL step (~line 40)*/
%let disease3 = GAS; 
%let disease4 = CAURIS;

	/*State pop.(update annually) for IRs*/
%let state_pop = 10835491;
%let ruraltotalpop = 3646750;
%let nonruralpop = 6792638;/*Urban + Suburban counties = 'Non-rural' from here: https://www.ncruralcenter.org/how-we-define-rural/*/
%let mindate = 01Jan2025; /*Minimum date you want to view (usually start of the year for monthly graphs). We also use this for the year max to make sure we're displaying non-complete data for the most recent year*/
%let maxmonth = 01Sep2025;/*Same as above but most recent month 1-denorm table month*/


libname analysis 'T:\HAI\Code library\Epi curve example\SASData';/*output path for sas7bdat file*/
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


/*Classifying urban/rural and social vulnerability index (SVI) in NC*/
data analysis;
set analysis.analysis_forgraphs;

	/*Rurality
			1=non-rural
			0=rural
	*/
	density=.;

	if owning_jd= "Alamance County"
	or owning_jd= "Buncombe County"
	or owning_jd= "Cabarrus County"
	or owning_jd= "Catawba County"
	or owning_jd= "Cumberland County"
	or owning_jd= "Davidson County"
	or owning_jd= "Durham County"
	or owning_jd= "Forsyth County"
	or owning_jd= "Gaston County"
	or owning_jd= "Guilford County"
	or owning_jd= "Henderson County"
	or owning_jd= "Iredell County"
	or owning_jd= "Johnston County"
	or owning_jd= "Lincoln County"
	or owning_jd= "Mecklenburg County"
	or owning_jd= "New Hanover County"
	or owning_jd= "Onslow County"
	or owning_jd= "Orange County"
	or owning_jd= "Pitt County"
	or owning_jd= "Rowan County"
	or owning_jd= "Union County"
	or owning_jd= "Wake County"

	then density=0;

	else density=1;

	/*SVI
		1= GE than 0.80
		0= LT than 0.80
	*/
		svi=.;

	if owning_jd= 'Lenoir County'
	or owning_jd= 'Robeson County'
	or owning_jd= 'Scotland County'
	or owning_jd= 'Greene County'
	or owning_jd= 'Halifax County'
	or owning_jd= 'Warren County'
	or owning_jd= 'Richmond County'
	or owning_jd= 'Vance County'
	or owning_jd= 'Bertie County'
	or owning_jd= 'Sampson County'
	or owning_jd= 'Anson County'
	or owning_jd= 'Wayne County'
	or owning_jd= 'Edgecombe County'
	or owning_jd= 'Wilson County'
	or owning_jd= 'Duplin County'
	or owning_jd= 'Columbus County'
	or owning_jd= 'Hertford County'
	or owning_jd= 'Cumberland County'
	or owning_jd= 'Swain County'
	or owning_jd= 'Hyde County'

	then svi=1;

	else svi=0;


	

run;







/*Ok, main step here: group CRE +CPO and rename STRA to GAS. Then we are assigning the most recent month/year a "tag" so we display those as a separate graph. The most recent month/year data will display in a slightly
lighter shded bar in the output as "data not complete"*/
proc sql;
create table rename as
select *,

/*Create timeframe tags. Month and Year.*/
	intnx("month", (EVENT_DATE), 0, "end") as monthtag "Month Ending Date" format=monname.,
	intnx("year", (EVENT_DATE), 0, "end") as yeartag "Year Ending Date" format=year4.,

	case when type in ('STRA') then 'GAS' 
		 when type in ('CRE' , 'CPO') then 'CPO'

	else type end as type_new 

from analysis
	where type in ('STRA', 'CPO', 'CRE', 'CAURIS') 
		/*having monthtag GE ('01jan25'd)*/
;
/*Create a "tag" for everything but the most recent month, then a separate column for the most recent month. We'll make the transparency higher to indicate data may not be complete*/
create table cases_count as
select

	monthtag,
	yeartag,
	type_new,
	event_date,
	svi "Social Vulnerability Index",
	density "Rural/Non. Rural Status",
/*Create max month tag for events in that month (current month usually)*/
	/*month tags*/
	case when (type_new) not in ('') and event_date LT ("&maxmonth"d) then 1 else . end as cases_tag,
	case when (type_new) not in ('') and event_date GE ("&maxmonth"d) then 1 else . end as recent_month_tag,

/*Same thing but for the most recent year*/
	/*year tags*/
	case when (type_new) not in ('') and yeartag LT ("&mindate"d) then 1 else . end as cases_tag_yr,
	case when (type_new) not in ('') and monthtag GE ("&mindate"d) then 1 else . end as  recent_yr_tag


from rename

;
quit;


/*Macros because lazy*/

/*Macros help this not be like 1000 lines of sgplot B.S.. First macro just does cases and rates by individual MDRO; CPO/GAS/CAURIS*/
%macro metrics  (disease=,);
proc sql;
create table quick_metrics as
select

	
	intnx("month", (EVENT_DATE), 0, "end") as testreportmonth "Month" format=monname.,
/*Total*/
		sum (case when type_new in ("&disease") then 1 else 0 end) as tot_&disease "Total &disease per Month",
		(calculated tot_&disease / &state_pop) * 100000 as ir_tot_&disease "Statewide IR/ 100,000K pop &disease" format 10.2,

/*Urban/rural*/
	sum (case when type_new in ("&disease" , "&disease2") and density in (0) then 1 else 0 end) as nonrural_&disease "Non-rural &disease per Month",
		(calculated nonrural_&disease / &nonruralpop) * 100000 as nonrural_ir_&disease "Non-rural IR/ 100,000K pop &disease" format 10.2,
	sum (case when type_new in ("&disease" , "&disease2") and density in (1) then 1 else 0 end) as RURAL_&disease "Rural &disease  per Month",
		(calculated RURAL_&disease / &ruraltotalpop) * 100000 as rural_ir_&disease "Rural IR/ 100,000K pop &disease" format 10.2

from rename
where EVENT_DATE ge ('01jan25'd)
	group by testreportmonth
;

create table quick_metrics_year as
select

	
	intnx("year", (EVENT_DATE), 0, "end") as testyear "Year" format=year4.,

/*Total*/
		sum (case when type_new in ("&disease") then 1 else 0 end) as tot_&disease "Total &disease per Year",
		(calculated tot_&disease / &state_pop) * 100000 as ir_tot_&disease "Statewide IR/ 100,000K pop. &disease" format 10.2,

/*Urban/rural*/
	sum (case when type_new in ("&disease" , "&disease2") and density in (0) then 1 else 0 end) as nonrural_&disease "Non-rural &disease per Year",
		(calculated nonrural_&disease / &nonruralpop) * 100000 as nonrural_ir_&disease "Non-rural IR/ 100,000K pop. &disease" format 10.2,
	sum (case when type_new in ("&disease" , "&disease2") and density in (1) then 1 else 0 end) as RURAL_&disease "Rural &disease  per Year",
		(calculated RURAL_&disease / &ruraltotalpop) * 100000 as rural_ir_&disease "Rural IR/ 100,000K pop. &disease" format 10.2


from rename
where EVENT_DATE ge ('01jan15'd)
	group by testyear

;

quit;


ods proclabel="&disease Table and Graphs";
proc print data=quick_metrics_year noobs label 
    contents="Year, Total, IR, Rurality by &disease1"
/*General styling to fit a portrait orientation*/
style(table)=[cellpadding=4 cellspacing=0 borderwidth=0 frame=void rules=none width=100%];

var testyear nonrural_&disease nonrural_ir_&disease RURAL_&disease rural_ir_&disease tot_&disease ir_tot_&disease  
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

/*Statewide graph*/

ods proclabel="&disease Statewide Graph";
proc sgplot data=quick_metrics_year noborder noautolegend
description = "&disease IR, NC by Year";

		series X=testyear Y=ir_tot_&disease / datalabel lineattrs=(thickness=2 pattern=mediumdash color=black)  datalabelattrs=(family="Arial" size=10);/* Plot for statewide total*/

	xaxis label = "Month"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight= bold size=10)
		;

	yaxis label = "&disease Rate per 100k Pop"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight=bold size=10)
		;


		    keylegend / title=" " location=outside position=topleft 
                across=1 noborder;

run;

/*Urban/Rural graph*/

ods proclabel="&disease Urban/Rural Graph";
proc sgplot data=quick_metrics_year noborder noautolegend
description = "&disease IR by year by Urban/Rural";
	series X=testyear Y=nonrural_ir_&disease / datalabel lineattrs=(thickness=2 pattern=MediumDashDotDot)  datalabelattrs=(family="Arial" size=10);/* Plot for non-rural*/
	series X=testyear Y=rural_ir_&disease / datalabel lineattrs=(thickness=2 pattern=MediumDashDotDot)  datalabelattrs=(family="Arial" size=10);/* Plot for rural*/

	xaxis label = "Month"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight= bold size=10)
		;

	yaxis label = "&disease Rate per 100k Pop"
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

/*Macro for stacked bar graphs. Diabolical, lightly shaded last bar for most recent data to show incompleteness*/
%macro stack_graphs (contentslabel=, timevar=, response_1=, timevar2=, response_2=, timeframe=, title= , color_schm=, disease=, startdate=);  
ods proclabel="Bar Graphs, &timevar2: &contentslabel";
proc sgplot data = cases_count pad=(top=10) noborder 
	description= "&contentslabel by &timevar2";
/*year by cases up to current year (but not including current month), group by disease type, stack*/
vbar &timevar / response= &response_1 group =  type_new groupdisplay=stack fillattrs=(transparency=0.2) outlineattrs=(color=white thickness=0)

		datalabel
		datalabelattrs=(color=black size=10 family="Arial");

xaxis label = "&timeframe"

		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight= bold size=10)
		;

	yaxis label = "Number of Cases &title"
		valueattrs= (family="Arial" size=10)
		labelattrs= (family="Arial" weight=bold size=10)
		;

	styleattrs datacolors= (&color_schm);

			    keylegend / title="MDRO:" titleattrs= (size=10 family="Arial" weight=bold) valueattrs= (size=10 family="Arial") location=outside position=topleft 
                across=3 noborder;

				keylegend / title="*Data in current &timevar2 may not be complete" titleattrs= (size=8 family="Arial" ) 
				exclude= ("GAS" "CPO" "CAURIS") location=outside position=topright
                noborder;

/*month by cases IN current month, group by disease type, stack*/
				/*Tricky SAS thing here: this needs to go after the keylegend so it doesn't display a separate legend for the lightly shaded "inocomplete" data.*/
vbar &timevar / response= &response_2 group = type_new groupdisplay=stack fillattrs=(transparency=0.8) outlineattrs=(color=white thickness=0)

		datalabel
		datalabelattrs=(color=black size=10 family="Arial");

	where type_new in &disease and monthtag GE (&startdate);


run;

%mend;





/*ODS PDF output*/

dm 'odsresults; clear';

ods graphics /noborder;
title; footnote;

/*Set your output pathway here*/ 

ods pdf file="T:\HAI\Code library\Epi curve example\analysis\MDRO_trends 2025_&sysdate..pdf" 
/*Named a generic overwriteable name so we can continue to reproduce and autopopulate a template;*/
/*style=journal*/ startpage=no contents=yes pdftoc=6;

options number nodate;

title font="Arial" height=10pt justify=left "&disease1";
%metrics(disease=&disease1);

ods pdf startpage=now;
title font="Arial" height=10pt justify=left "&disease3" ;
%metrics(disease=&disease3);

ods pdf startpage=now;
title font="Arial" height=10pt justify=left "&disease4";
%metrics(disease=&disease4);

/*Monthly plots*/
ods pdf startpage=now;

title justify=left "(2025) Monthly Bar Graphs";
/*Monthly graphs*/
%stack_graphs(contentslabel= &disease1 &disease4, timevar= monthtag, response_1= cases_tag, timevar2= month, response_2= recent_month_tag, timeframe= Month, title= (CPO + C.auris), color_schm= DEYPK STB, disease= ("CAURIS" "CPO" ), startdate="&mindate"d);
title;
%stack_graphs(contentslabel= &disease3, timevar= monthtag, response_1= cases_tag, timevar2= month, response_2= recent_month_tag, timeframe = Month, title = (GAS), color_schm = DEYG, disease = ("GAS"), startdate="&mindate"d);

/*Annual plots*/
ods pdf startpage=now;
title font="Arial" height=10pt justify=left "Annual Bar Graphs";
/*Annual graphs*/
%stack_graphs(contentslabel= &disease1 &disease4, timevar= yeartag, response_1= cases_tag_yr, timevar2= year, response_2= recent_yr_tag, timeframe= Year, title= (CPO + C.auris), color_schm= STB DEYPK, disease= ("CPO" "CAURIS"), startdate="01jan2015"d);
title;
%stack_graphs(contentslabel= &disease3, timevar= yeartag, response_1= cases_tag_yr, timevar2= year, response_2= recent_yr_tag, timeframe = Year, title = GAS, color_schm = DEYG, disease = ("GAS"), startdate="01jan2015"d);

ods pdf close;






proc template;
list styles;
run;

dm 'odsresults; clear';


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




/*Monthly plots*/
ods excel options (sheet_interval = "now" sheet_name = "bar monthly" embedded_titles='Yes');
/*Monthly graphs*/
%stack_graphs(timevar= monthtag, response_1= cases_tag, timevar2= month, response_2= recent_month_tag, timeframe= Month, title= (CPO + C.auris), color_schm= DEYPK STB, disease= ("CAURIS" "CPO" ), startdate="&mindate"d);
%stack_graphs(timevar= monthtag, response_1= cases_tag, timevar2= month, response_2= recent_month_tag, timeframe = Month, title = (GAS), color_schm = DEYG, disease = ("GAS"), startdate="&mindate"d);

/*Annual plots*/
ods excel options (sheet_interval = "now" sheet_name = "bar annual" embedded_titles='Yes');
/*Annual graphs*/
%stack_graphs(contentslabel= &disease1 &disease3, timevar= yeartag, response_1= cases_tag_yr, timevar2= year, response_2= recent_yr_tag, timeframe= Year, title= (CPO + C.auris), color_schm= STB DEYPK, disease= ("CPO" "CAURIS"), startdate="01jan2015"d);
%stack_graphs(contentslabel= &disease1 &disease3,timevar= yeartag, response_1= cases_tag_yr, timevar2= year, response_2= recent_yr_tag, timeframe = Year, title = GAS, color_schm = DEYG, disease = ("GAS"), startdate="01jan2015"d);

ods excel close;


