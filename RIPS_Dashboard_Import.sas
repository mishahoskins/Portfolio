

libname RIPS 'C:\Users\mhoskins1\Desktop\Work Files\RIPS Dashboard\Data';

/* Edit the following line to reflect the full path to your CSV file */
%let csv_file = 'C:\Users\mhoskins1\Desktop\Work Files\RIPS Dashboard\Data\ICAR_SAS.csv';

OPTIONS nofmterr;


proc format;
	value assessor___1_ 0='Unchecked' 1='Checked';
	value assessor___2_ 0='Unchecked' 1='Checked';
	value assessor___3_ 0='Unchecked' 1='Checked';
	value assessor___4_ 0='Unchecked' 1='Checked';
	value assessor___5_ 0='Unchecked' 1='Checked';
	value assessor___6_ 0='Unchecked' 1='Checked';
	value assessor___7_ 0='Unchecked' 1='Checked';
	value assessor___8_ 0='Unchecked' 1='Checked';
	value assessor___9_ 0='Unchecked' 1='Checked';
	value assessor___10_ 0='Unchecked' 1='Checked';
	value visit_remote_ 1='On-site' 2='Remote';
	value reason___1_ 0='Unchecked' 1='Checked';
	value reason___2_ 0='Unchecked' 1='Checked';
	value reason___3_ 0='Unchecked' 1='Checked';
	value reason___4_ 0='Unchecked' 1='Checked';
	value reason___5_ 0='Unchecked' 1='Checked';
	value reason___6_ 0='Unchecked' 1='Checked';
	value reason___7_ 0='Unchecked' 1='Checked';
	value outbreak_type___1_ 0='Unchecked' 1='Checked';
	value outbreak_type___2_ 0='Unchecked' 1='Checked';
	value outbreak_type___3_ 0='Unchecked' 1='Checked';
	value outbreak_type___4_ 0='Unchecked' 1='Checked';
	value outbreak_type___5_ 0='Unchecked' 1='Checked';
	value outbreak_type___6_ 0='Unchecked' 1='Checked';
	value outbreak_type___7_ 0='Unchecked' 1='Checked';
	value outbreak_mdro___1_ 0='Unchecked' 1='Checked';
	value outbreak_mdro___2_ 0='Unchecked' 1='Checked';
	value outbreak_mdro___3_ 0='Unchecked' 1='Checked';
	value outbreak_mdro___4_ 0='Unchecked' 1='Checked';
	value outbreak_mdro___5_ 0='Unchecked' 1='Checked';
	value facility_county_ 1='Alamance' 2='Alexander' 
		3='Alleghany' 4='Anson' 
		5='Ashe' 6='Avery' 
		7='Beaufort' 8='Bertie' 
		9='Bladen' 10='Brunswick' 
		11='Buncombe' 12='Burke' 
		13='Cabarrus' 14='Caldwell' 
		15='Camden' 16='Carteret' 
		17='Caswell' 18='Catawba' 
		19='Chatham' 20='Cherokee' 
		21='Chowan' 22='Clay' 
		23='Cleveland' 24='Columbus' 
		25='Craven' 26='Cumberland' 
		27='Currituck' 28='Dare' 
		29='Davidson' 30='Davie' 
		31='Duplin' 32='Durham' 
		33='Edgecombe' 34='Forsyth' 
		35='Franklin' 36='Gaston' 
		37='Gates' 38='Graham' 
		39='Granville' 40='Greene' 
		41='Guilford' 42='Halifax' 
		43='Harnett' 44='Haywood' 
		45='Henderson' 46='Hertford' 
		47='Hoke' 48='Hyde' 
		49='Iredell' 50='Jackson' 
		51='Johnston' 52='Jones' 
		53='Lee' 54='Lenoir' 
		55='Lincoln' 56='Macon' 
		57='Madison' 58='Martin' 
		59='McDowell' 60='Mecklenburg' 
		61='Mitchell' 62='Montgomery' 
		63='Moore' 64='Nash' 
		65='New Hanover' 66='Northampton' 
		67='Onslow' 68='Orange' 
		69='Pamlico' 70='Pasquotank' 
		71='Pender' 72='Perquimans' 
		73='Person' 74='Pitt' 
		75='Polk' 76='Randolph' 
		77='Richmond' 78='Robeson' 
		79='Rockingham' 80='Rowan' 
		81='Rutherford' 82='Sampson' 
		83='Scotland' 84='Stanly' 
		85='Stokes' 86='Surry' 
		87='Swain' 88='Transylvania' 
		89='Tyrrell' 90='Union' 
		91='Vance' 92='Wake' 
		93='Warren' 94='Washington' 
		95='Watauga' 96='Wayne' 
		97='Wilkes' 98='Wilson' 
		99='Yadkin' 100='Yancey';
	value ripsvisit_ 1='Yes' 2='No';
	value facility_type___1_ 0='Unchecked' 1='Checked';
	value facility_type___2_ 0='Unchecked' 1='Checked';
	value facility_type___3_ 0='Unchecked' 1='Checked';
	value facility_type___4_ 0='Unchecked' 1='Checked';
	value facility_type___5_ 0='Unchecked' 1='Checked';
	value facility_type___6_ 0='Unchecked' 1='Checked';
	value facility_type___7_ 0='Unchecked' 1='Checked';
	value facility_type___8_ 0='Unchecked' 1='Checked';
	value facility_type___9_ 0='Unchecked' 1='Checked';
	value facility_type___10_ 0='Unchecked' 1='Checked';
	value facility_type___11_ 0='Unchecked' 1='Checked';
	value facility_type___12_ 0='Unchecked' 1='Checked';
	value facility_type___13_ 0='Unchecked' 1='Checked';
	value facility_type___14_ 0='Unchecked' 1='Checked';
	value facility_type___15_ 0='Unchecked' 1='Checked';
	value facility_type___16_ 0='Unchecked' 1='Checked';
	value facility_type___17_ 0='Unchecked' 1='Checked';
	value facility_type___18_ 0='Unchecked' 1='Checked';
	value facility_type___19_ 0='Unchecked' 1='Checked';
	value facility_type___20_ 0='Unchecked' 1='Checked';
	value system_facility_ 1='Yes' 2='No';
	value full_ip_ 1='Yes' 2='Part-time' 
		3='Position vacant' 4='No, facility does not have an on-site IP';
	value ip_ 1='Yes' 2='No';
	value ip_training___1_ 0='Unchecked' 1='Checked';
	value ip_training___2_ 0='Unchecked' 1='Checked';
	value ip_training___3_ 0='Unchecked' 1='Checked';
	value ip_training___4_ 0='Unchecked' 1='Checked';
	value facility_information_complete_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value report_list___1_ 0='Unchecked' 1='Checked';
	value report_list___2_ 0='Unchecked' 1='Checked';
	value report_list___3_ 0='Unchecked' 1='Checked';
	value report_list___4_ 0='Unchecked' 1='Checked';
	value ph_contact___1_ 0='Unchecked' 1='Checked';
	value ph_contact___2_ 0='Unchecked' 1='Checked';
	value ph_contact___3_ 0='Unchecked' 1='Checked';
	value ph_contact___4_ 0='Unchecked' 1='Checked';
	value comm_infect___1_ 0='Unchecked' 1='Checked';
	value comm_infect___2_ 0='Unchecked' 1='Checked';
	value comm_infect___3_ 0='Unchecked' 1='Checked';
	value comm_infect___4_ 0='Unchecked' 1='Checked';
	value infect_intake___1_ 0='Unchecked' 1='Checked';
	value infect_intake___2_ 0='Unchecked' 1='Checked';
	value infect_intake___3_ 0='Unchecked' 1='Checked';
	value infect_intake___4_ 0='Unchecked' 1='Checked';
	value ip_policies___1_ 0='Unchecked' 1='Checked';
	value ip_policies___2_ 0='Unchecked' 1='Checked';
	value ip_policies___3_ 0='Unchecked' 1='Checked';
	value ip_policies___4_ 0='Unchecked' 1='Checked';
	value ip_policies___5_ 0='Unchecked' 1='Checked';
	value policies_reviewed___1_ 0='Unchecked' 1='Checked';
	value policies_reviewed___2_ 0='Unchecked' 1='Checked';
	value policies_reviewed___3_ 0='Unchecked' 1='Checked';
	value policies_reviewed___4_ 0='Unchecked' 1='Checked';
	value lab_notif___1_ 0='Unchecked' 1='Checked';
	value lab_notif___2_ 0='Unchecked' 1='Checked';
	value lab_notif___3_ 0='Unchecked' 1='Checked';
	value lab_notif___4_ 0='Unchecked' 1='Checked';
	value infect_monitoring___1_ 0='Unchecked' 1='Checked';
	value infect_monitoring___2_ 0='Unchecked' 1='Checked';
	value infect_monitoring___3_ 0='Unchecked' 1='Checked';
	value infect_monitoring___4_ 0='Unchecked' 1='Checked';
	value ip_process___1_ 0='Unchecked' 1='Checked';
	value ip_process___2_ 0='Unchecked' 1='Checked';
	value ip_process___3_ 0='Unchecked' 1='Checked';
	value ip_process___4_ 0='Unchecked' 1='Checked';
	value outbreak_response___1_ 0='Unchecked' 1='Checked';
	value outbreak_response___2_ 0='Unchecked' 1='Checked';
	value outbreak_response___3_ 0='Unchecked' 1='Checked';
	value outbreak_response___4_ 0='Unchecked' 1='Checked';
	value resp_program___1_ 0='Unchecked' 1='Checked';
	value resp_program___2_ 0='Unchecked' 1='Checked';
	value resp_program___3_ 0='Unchecked' 1='Checked';
	value resp_program___4_ 0='Unchecked' 1='Checked';
	value emergency_plan___1_ 0='Unchecked' 1='Checked';
	value emergency_plan___2_ 0='Unchecked' 1='Checked';
	value emergency_plan___3_ 0='Unchecked' 1='Checked';
	value emergency_plan___4_ 0='Unchecked' 1='Checked';
	value riskassess___1_ 0='Unchecked' 1='Checked';
	value riskassess___2_ 0='Unchecked' 1='Checked';
	value riskassess___3_ 0='Unchecked' 1='Checked';
	value riskassess___4_ 0='Unchecked' 1='Checked';
	value respetc_site___1_ 0='Unchecked' 1='Checked';
	value respetc_site___2_ 0='Unchecked' 1='Checked';
	value respetc_site___3_ 0='Unchecked' 1='Checked';
	value work_exclusions___1_ 0='Unchecked' 1='Checked';
	value work_exclusions___2_ 0='Unchecked' 1='Checked';
	value work_exclusions___3_ 0='Unchecked' 1='Checked';
	value work_exclusions___4_ 0='Unchecked' 1='Checked';
	value tb_hire___1_ 0='Unchecked' 1='Checked';
	value tb_hire___2_ 0='Unchecked' 1='Checked';
	value tb_hire___3_ 0='Unchecked' 1='Checked';
	value tb_hire___4_ 0='Unchecked' 1='Checked';
	value tb_risk___1_ 0='Unchecked' 1='Checked';
	value tb_risk___2_ 0='Unchecked' 1='Checked';
	value tb_risk___3_ 0='Unchecked' 1='Checked';
	value tb_risk___4_ 0='Unchecked' 1='Checked';
	value bloodborne_plan___1_ 0='Unchecked' 1='Checked';
	value bloodborne_plan___2_ 0='Unchecked' 1='Checked';
	value bloodborne_plan___3_ 0='Unchecked' 1='Checked';
	value bloodborne_plan___4_ 0='Unchecked' 1='Checked';
	value hepb_vac___1_ 0='Unchecked' 1='Checked';
	value hepb_vac___2_ 0='Unchecked' 1='Checked';
	value hepb_vac___3_ 0='Unchecked' 1='Checked';
	value hepb_vac___4_ 0='Unchecked' 1='Checked';
	value annual_flu___1_ 0='Unchecked' 1='Checked';
	value annual_flu___2_ 0='Unchecked' 1='Checked';
	value annual_flu___3_ 0='Unchecked' 1='Checked';
	value annual_flu___4_ 0='Unchecked' 1='Checked';
	value annual_covid___1_ 0='Unchecked' 1='Checked';
	value annual_covid___2_ 0='Unchecked' 1='Checked';
	value annual_covid___3_ 0='Unchecked' 1='Checked';
	value annual_covid___4_ 0='Unchecked' 1='Checked';
	value vac_record___1_ 0='Unchecked' 1='Checked';
	value vac_record___2_ 0='Unchecked' 1='Checked';
	value vac_record___3_ 0='Unchecked' 1='Checked';
	value vac_record___4_ 0='Unchecked' 1='Checked';
	value tb_patient___1_ 0='Unchecked' 1='Checked';
	value tb_patient___2_ 0='Unchecked' 1='Checked';
	value tb_patient___3_ 0='Unchecked' 1='Checked';
	value tb_patient___4_ 0='Unchecked' 1='Checked';
	value tb_patient___5_ 0='Unchecked' 1='Checked';
	value offer_vac___1_ 0='Unchecked' 1='Checked';
	value offer_vac___2_ 0='Unchecked' 1='Checked';
	value offer_vac___3_ 0='Unchecked' 1='Checked';
	value offer_vac___4_ 0='Unchecked' 1='Checked';
	value vac_edu___1_ 0='Unchecked' 1='Checked';
	value vac_edu___2_ 0='Unchecked' 1='Checked';
	value vac_edu___3_ 0='Unchecked' 1='Checked';
	value vac_edu___4_ 0='Unchecked' 1='Checked';
	value indiv_antistew___1_ 0='Unchecked' 1='Checked';
	value indiv_antistew___2_ 0='Unchecked' 1='Checked';
	value indiv_antistew___3_ 0='Unchecked' 1='Checked';
	value indiv_antistew___4_ 0='Unchecked' 1='Checked';
	value indiv_antistew___5_ 0='Unchecked' 1='Checked';
	value indiv_antistew___6_ 0='Unchecked' 1='Checked';
	value spice_referral_ 1='Yes, referral made' 2='No SPICE referral made';
	value employee_and_patient_v_0_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value ip_education___1_ 0='Unchecked' 1='Checked';
	value ip_education___2_ 0='Unchecked' 1='Checked';
	value ip_education___3_ 0='Unchecked' 1='Checked';
	value ip_education___4_ 0='Unchecked' 1='Checked';
	value ip_education___5_ 0='Unchecked' 1='Checked';
	value ip_education___6_ 0='Unchecked' 1='Checked';
	value ip_education___7_ 0='Unchecked' 1='Checked';
	value ip_education___8_ 0='Unchecked' 1='Checked';
	value ip_education___9_ 0='Unchecked' 1='Checked';
	value ip_education___10_ 0='Unchecked' 1='Checked';
	value competency___1_ 0='Unchecked' 1='Checked';
	value competency___2_ 0='Unchecked' 1='Checked';
	value competency___3_ 0='Unchecked' 1='Checked';
	value competency___4_ 0='Unchecked' 1='Checked';
	value competency___5_ 0='Unchecked' 1='Checked';
	value demonstrateskills___1_ 0='Unchecked' 1='Checked';
	value demonstrateskills___2_ 0='Unchecked' 1='Checked';
	value demonstrateskills___3_ 0='Unchecked' 1='Checked';
	value demonstrateskills___4_ 0='Unchecked' 1='Checked';
	value demonstrateskills___5_ 0='Unchecked' 1='Checked';
	value demonstrateskills___6_ 0='Unchecked' 1='Checked';
	value demonstrateskills___7_ 0='Unchecked' 1='Checked';
	value demonstrateskills___8_ 0='Unchecked' 1='Checked';
	value testtopics___1_ 0='Unchecked' 1='Checked';
	value testtopics___2_ 0='Unchecked' 1='Checked';
	value testtopics___3_ 0='Unchecked' 1='Checked';
	value testtopics___4_ 0='Unchecked' 1='Checked';
	value testtopics___5_ 0='Unchecked' 1='Checked';
	value testtopics___6_ 0='Unchecked' 1='Checked';
	value testtopics___7_ 0='Unchecked' 1='Checked';
	value testtopics___8_ 0='Unchecked' 1='Checked';
	value annualskills___1_ 0='Unchecked' 1='Checked';
	value annualskills___2_ 0='Unchecked' 1='Checked';
	value annualskills___3_ 0='Unchecked' 1='Checked';
	value annualskills___4_ 0='Unchecked' 1='Checked';
	value annualskills___5_ 0='Unchecked' 1='Checked';
	value annualskills___6_ 0='Unchecked' 1='Checked';
	value annualskills___7_ 0='Unchecked' 1='Checked';
	value annualskills___8_ 0='Unchecked' 1='Checked';
	value audits___1_ 0='Unchecked' 1='Checked';
	value audits___2_ 0='Unchecked' 1='Checked';
	value audits___3_ 0='Unchecked' 1='Checked';
	value audits___4_ 0='Unchecked' 1='Checked';
	value audits___5_ 0='Unchecked' 1='Checked';
	value audits___6_ 0='Unchecked' 1='Checked';
	value audits___7_ 0='Unchecked' 1='Checked';
	value audits___8_ 0='Unchecked' 1='Checked';
	value audits___9_ 0='Unchecked' 1='Checked';
	value hh_audits_ 1='0-10 per month' 2='10-25 per month' 
		3='25-50 per month' 4='50-100 per month' 
		5='100+ per month';
	value audit_ppe_ 1='0-5 per month' 2='5-15 per month' 
		3='15-30 per month' 4='30+ per month';
	value audit_cleandisinf_ 1='0-5 per month' 2='5-15 per month' 
		3='15-30 per month' 4='30+ per month';
	value audit_injectsafety_ 1='0-5 per month' 2='5-15 per month' 
		3='15-30 per month' 4='30+ per month';
	value audit_poc_ 1='0-5 per month' 2='5-15 per month' 
		3='15-30 per month' 4='30+ per month';
	value audit_repro_ 1='0-5 per month' 2='5-15 per month' 
		3='15-30 per month' 4='30+ per month';
	value audits_feedback___1_ 0='Unchecked' 1='Checked';
	value audits_feedback___2_ 0='Unchecked' 1='Checked';
	value audits_feedback___3_ 0='Unchecked' 1='Checked';
	value audits_feedback___4_ 0='Unchecked' 1='Checked';
	value audits_feedback___5_ 0='Unchecked' 1='Checked';
	value audits_feedback___6_ 0='Unchecked' 1='Checked';
	value trainingaudits_complete_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value hh_policies___1_ 0='Unchecked' 1='Checked';
	value hh_policies___2_ 0='Unchecked' 1='Checked';
	value hh_policies___3_ 0='Unchecked' 1='Checked';
	value hh_policies___4_ 0='Unchecked' 1='Checked';
	value hh_expectations___1_ 0='Unchecked' 1='Checked';
	value hh_expectations___2_ 0='Unchecked' 1='Checked';
	value hh_expectations___3_ 0='Unchecked' 1='Checked';
	value hh_expectations___4_ 0='Unchecked' 1='Checked';
	value hh_expectations___5_ 0='Unchecked' 1='Checked';
	value hh_expectations___6_ 0='Unchecked' 1='Checked';
	value hh_expectations___7_ 0='Unchecked' 1='Checked';
	value hh_expectations___8_ 0='Unchecked' 1='Checked';
	value hh_expectations___9_ 0='Unchecked' 1='Checked';
	value hh_inout___1_ 0='Unchecked' 1='Checked';
	value hh_inout___2_ 0='Unchecked' 1='Checked';
	value hh_inout___3_ 0='Unchecked' 1='Checked';
	value hh_sinkavail___1_ 0='Unchecked' 1='Checked';
	value hh_sinkavail___2_ 0='Unchecked' 1='Checked';
	value hh_sinkavail___3_ 0='Unchecked' 1='Checked';
	value hh_sinkavail___4_ 0='Unchecked' 1='Checked';
	value hh_soapwater___1_ 0='Unchecked' 1='Checked';
	value hh_soapwater___2_ 0='Unchecked' 1='Checked';
	value hh_soapwater___3_ 0='Unchecked' 1='Checked';
	value hh_soapwater___4_ 0='Unchecked' 1='Checked';
	value hh_soapwater___5_ 0='Unchecked' 1='Checked';
	value hh_soapwater___6_ 0='Unchecked' 1='Checked';
	value hh_throughout___1_ 0='Unchecked' 1='Checked';
	value hh_throughout___2_ 0='Unchecked' 1='Checked';
	value hh_throughout___3_ 0='Unchecked' 1='Checked';
	value hh_pocket___1_ 0='Unchecked' 1='Checked';
	value hh_pocket___2_ 0='Unchecked' 1='Checked';
	value hh_pocket___3_ 0='Unchecked' 1='Checked';
	value hh_pocket___4_ 0='Unchecked' 1='Checked';
	value hh_only___1_ 0='Unchecked' 1='Checked';
	value hh_only___2_ 0='Unchecked' 1='Checked';
	value hh_only___3_ 0='Unchecked' 1='Checked';
	value hh_only___4_ 0='Unchecked' 1='Checked';
	value hh_supplies___1_ 0='Unchecked' 1='Checked';
	value hh_supplies___2_ 0='Unchecked' 1='Checked';
	value hh_supplies___3_ 0='Unchecked' 1='Checked';
	value hh_lotion___1_ 0='Unchecked' 1='Checked';
	value hh_lotion___2_ 0='Unchecked' 1='Checked';
	value hh_lotion___3_ 0='Unchecked' 1='Checked';
	value hh_lotion___4_ 0='Unchecked' 1='Checked';
	value hh_lotion___5_ 0='Unchecked' 1='Checked';
	value hh_nails___1_ 0='Unchecked' 1='Checked';
	value hh_nails___2_ 0='Unchecked' 1='Checked';
	value hh_nails___3_ 0='Unchecked' 1='Checked';
	value hh_nails___4_ 0='Unchecked' 1='Checked';
	value patienthh___1_ 0='Unchecked' 1='Checked';
	value patienthh___2_ 0='Unchecked' 1='Checked';
	value patienthh___3_ 0='Unchecked' 1='Checked';
	value patienthh___4_ 0='Unchecked' 1='Checked';
	value patienthh___5_ 0='Unchecked' 1='Checked';
	value hand_hygiene_complete_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value hh_1_ 1='Performed' 2='Not Performed';
	value hh_2_ 1='Performed' 2='Not Performed';
	value hh_3_ 1='Performed' 2='Not Performed';
	value hh_4_ 1='Performed' 2='Not Performed';
	value hh_5_ 1='Performed' 2='Not Performed';
	value hh_6_ 1='Performed' 2='Not Performed';
	value hh_7_ 1='Performed' 2='Not Performed';
	value hh_8_ 1='Performed' 2='Not Performed';
	value hh_9_ 1='Performed' 2='Not Performed';
	value hh_10_ 1='Performed' 2='Not Performed';
	value hand_hygiene_observa_v_1_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value transmission_policy___1_ 0='Unchecked' 1='Checked';
	value transmission_policy___2_ 0='Unchecked' 1='Checked';
	value transmission_policy___3_ 0='Unchecked' 1='Checked';
	value transmission_policy___4_ 0='Unchecked' 1='Checked';
	value trans_signage___1_ 0='Unchecked' 1='Checked';
	value trans_signage___2_ 0='Unchecked' 1='Checked';
	value trans_signage___3_ 0='Unchecked' 1='Checked';
	value trans_signage___4_ 0='Unchecked' 1='Checked';
	value trans_signage___5_ 0='Unchecked' 1='Checked';
	value trans_signage___6_ 0='Unchecked' 1='Checked';
	value trans_signage___7_ 0='Unchecked' 1='Checked';
	value trans_signage___8_ 0='Unchecked' 1='Checked';
	value trans_signage___9_ 0='Unchecked' 1='Checked';
	value ppe_supplies___1_ 0='Unchecked' 1='Checked';
	value ppe_supplies___2_ 0='Unchecked' 1='Checked';
	value ppe_supplies___3_ 0='Unchecked' 1='Checked';
	value semipriv___1_ 0='Unchecked' 1='Checked';
	value semipriv___2_ 0='Unchecked' 1='Checked';
	value semipriv___3_ 0='Unchecked' 1='Checked';
	value semipriv___4_ 0='Unchecked' 1='Checked';
	value tbp_admit___1_ 0='Unchecked' 1='Checked';
	value tbp_admit___2_ 0='Unchecked' 1='Checked';
	value tbp_admit___3_ 0='Unchecked' 1='Checked';
	value tbp_admit___4_ 0='Unchecked' 1='Checked';
	value tbp_transfer___1_ 0='Unchecked' 1='Checked';
	value tbp_transfer___2_ 0='Unchecked' 1='Checked';
	value tbp_transfer___3_ 0='Unchecked' 1='Checked';
	value tbp_transfer___4_ 0='Unchecked' 1='Checked';
	value tbp_change___1_ 0='Unchecked' 1='Checked';
	value tbp_change___2_ 0='Unchecked' 1='Checked';
	value tbp_change___3_ 0='Unchecked' 1='Checked';
	value tbp_change___4_ 0='Unchecked' 1='Checked';
	value ebp_identify___1_ 0='Unchecked' 1='Checked';
	value ebp_identify___2_ 0='Unchecked' 1='Checked';
	value ebp_identify___3_ 0='Unchecked' 1='Checked';
	value ebp_identify___4_ 0='Unchecked' 1='Checked';
	value trans_signforclean___1_ 0='Unchecked' 1='Checked';
	value trans_signforclean___2_ 0='Unchecked' 1='Checked';
	value trans_signforclean___3_ 0='Unchecked' 1='Checked';
	value trans_signforclean___4_ 0='Unchecked' 1='Checked';
	value resp_entrance___1_ 0='Unchecked' 1='Checked';
	value resp_entrance___2_ 0='Unchecked' 1='Checked';
	value resp_entrance___3_ 0='Unchecked' 1='Checked';
	value resp_station___1_ 0='Unchecked' 1='Checked';
	value resp_station___2_ 0='Unchecked' 1='Checked';
	value resp_station___3_ 0='Unchecked' 1='Checked';
	value resp_visitors___1_ 0='Unchecked' 1='Checked';
	value resp_visitors___2_ 0='Unchecked' 1='Checked';
	value resp_visitors___3_ 0='Unchecked' 1='Checked';
	value resp_visitors___4_ 0='Unchecked' 1='Checked';
	value fit_testing___1_ 0='Unchecked' 1='Checked';
	value fit_testing___2_ 0='Unchecked' 1='Checked';
	value fit_testing___3_ 0='Unchecked' 1='Checked';
	value fit_testing___4_ 0='Unchecked' 1='Checked';
	value standard_and_transmi_v_2_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value prec_obs___1_ 0='Unchecked' 1='Checked';
	value prec_obs___2_ 0='Unchecked' 1='Checked';
	value prec_obs___3_ 0='Unchecked' 1='Checked';
	value don_obs___1_ 0='Unchecked' 1='Checked';
	value don_obs___2_ 0='Unchecked' 1='Checked';
	value don_obs___3_ 0='Unchecked' 1='Checked';
	value doff_obs___1_ 0='Unchecked' 1='Checked';
	value doff_obs___2_ 0='Unchecked' 1='Checked';
	value doff_obs___3_ 0='Unchecked' 1='Checked';
	value aiir_obs___1_ 0='Unchecked' 1='Checked';
	value aiir_obs___2_ 0='Unchecked' 1='Checked';
	value aiir_obs___3_ 0='Unchecked' 1='Checked';
	value aiir_obs___4_ 0='Unchecked' 1='Checked';
	value aiir_obs___5_ 0='Unchecked' 1='Checked';
	value aiir_obs___6_ 0='Unchecked' 1='Checked';
	value priv_obs___1_ 0='Unchecked' 1='Checked';
	value priv_obs___2_ 0='Unchecked' 1='Checked';
	value priv_obs___3_ 0='Unchecked' 1='Checked';
	value priv_obs___4_ 0='Unchecked' 1='Checked';
	value standard_and_transmi_v_3_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value policy_disinf___1_ 0='Unchecked' 1='Checked';
	value policy_disinf___2_ 0='Unchecked' 1='Checked';
	value policy_disinf___3_ 0='Unchecked' 1='Checked';
	value policy_disinf___4_ 0='Unchecked' 1='Checked';
	value contact_disinf___1_ 0='Unchecked' 1='Checked';
	value contact_disinf___2_ 0='Unchecked' 1='Checked';
	value contact_disinf___3_ 0='Unchecked' 1='Checked';
	value contact_disinf___4_ 0='Unchecked' 1='Checked';
	value hightouch_disinf___1_ 0='Unchecked' 1='Checked';
	value hightouch_disinf___2_ 0='Unchecked' 1='Checked';
	value hightouch_disinf___3_ 0='Unchecked' 1='Checked';
	value hightouch_disinf___4_ 0='Unchecked' 1='Checked';
	value room_disinf___1_ 0='Unchecked' 1='Checked';
	value room_disinf___2_ 0='Unchecked' 1='Checked';
	value room_disinf___3_ 0='Unchecked' 1='Checked';
	value room_disinf___4_ 0='Unchecked' 1='Checked';
	value epa_disinf___1_ 0='Unchecked' 1='Checked';
	value epa_disinf___2_ 0='Unchecked' 1='Checked';
	value epa_disinf___3_ 0='Unchecked' 1='Checked';
	value epa_disinf___4_ 0='Unchecked' 1='Checked';
	value equip_disinf___1_ 0='Unchecked' 1='Checked';
	value equip_disinf___2_ 0='Unchecked' 1='Checked';
	value equip_disinf___3_ 0='Unchecked' 1='Checked';
	value equip_disinf___4_ 0='Unchecked' 1='Checked';
	value gluc_disinf___1_ 0='Unchecked' 1='Checked';
	value gluc_disinf___2_ 0='Unchecked' 1='Checked';
	value gluc_disinf___3_ 0='Unchecked' 1='Checked';
	value gluc_disinf___4_ 0='Unchecked' 1='Checked';
	value disinf_glucavail___1_ 0='Unchecked' 1='Checked';
	value disinf_glucavail___2_ 0='Unchecked' 1='Checked';
	value disinf_glucavail___3_ 0='Unchecked' 1='Checked';
	value gluc_disinfection_2___1_ 0='Unchecked' 1='Checked';
	value gluc_disinfection_2___2_ 0='Unchecked' 1='Checked';
	value gluc_disinfection_2___3_ 0='Unchecked' 1='Checked';
	value gluc_disinfection_2___4_ 0='Unchecked' 1='Checked';
	value shower_disinf___1_ 0='Unchecked' 1='Checked';
	value shower_disinf___2_ 0='Unchecked' 1='Checked';
	value shower_disinf___3_ 0='Unchecked' 1='Checked';
	value shower_disinf___4_ 0='Unchecked' 1='Checked';
	value shower_disinf___5_ 0='Unchecked' 1='Checked';
	value showindicate_disinf___1_ 0='Unchecked' 1='Checked';
	value showindicate_disinf___2_ 0='Unchecked' 1='Checked';
	value showindicate_disinf___3_ 0='Unchecked' 1='Checked';
	value showindicate_disinf___4_ 0='Unchecked' 1='Checked';
	value showindicate_disinf___5_ 0='Unchecked' 1='Checked';
	value supp_disinf___1_ 0='Unchecked' 1='Checked';
	value supp_disinf___2_ 0='Unchecked' 1='Checked';
	value supp_disinf___3_ 0='Unchecked' 1='Checked';
	value devices_disinf_ 1='All medical devices are single use only or dedicated to individual residents' 2='No procedures involving medical devices are performed in the facility by staff or external consultants' 
		3='External consultants providing services which involve medical devices have adequate supplies that no devices are shared on-site and all reprocessing is performed off-site.' 4='Facility is unsure' 
		5='Unable to assess';
	value environmental_cleani_v_4_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value hhprod_obs___1_ 0='Unchecked' 1='Checked';
	value hhprod_obs___2_ 0='Unchecked' 1='Checked';
	value hhprod_obs___3_ 0='Unchecked' 1='Checked';
	value resp_signage_obs___1_ 0='Unchecked' 1='Checked';
	value resp_signage_obs___2_ 0='Unchecked' 1='Checked';
	value resp_signage_obs___3_ 0='Unchecked' 1='Checked';
	value gen_obs___1_ 0='Unchecked' 1='Checked';
	value gen_obs___2_ 0='Unchecked' 1='Checked';
	value gen_obs___3_ 0='Unchecked' 1='Checked';
	value sink_obs___1_ 0='Unchecked' 1='Checked';
	value sink_obs___2_ 0='Unchecked' 1='Checked';
	value sink_obs___3_ 0='Unchecked' 1='Checked';
	value undersink_obs___1_ 0='Unchecked' 1='Checked';
	value undersink_obs___2_ 0='Unchecked' 1='Checked';
	value undersink_obs___3_ 0='Unchecked' 1='Checked';
	value cleansupp_obs___1_ 0='Unchecked' 1='Checked';
	value cleansupp_obs___2_ 0='Unchecked' 1='Checked';
	value cleansupp_obs___3_ 0='Unchecked' 1='Checked';
	value sharpstor_obs_ 1='True' 2='False' 
		3='Unable to assess' 4='Facility does not have sharps containers';
	value cleandirty_obs___1_ 0='Unchecked' 1='Checked';
	value cleandirty_obs___2_ 0='Unchecked' 1='Checked';
	value cleandirty_obs___3_ 0='Unchecked' 1='Checked';
	value disinfectequip_obs___1_ 0='Unchecked' 1='Checked';
	value disinfectequip_obs___2_ 0='Unchecked' 1='Checked';
	value disinfectequip_obs___3_ 0='Unchecked' 1='Checked';
	value eqip_obs___1_ 0='Unchecked' 1='Checked';
	value eqip_obs___2_ 0='Unchecked' 1='Checked';
	value eqip_obs___3_ 0='Unchecked' 1='Checked';
	value coverlinen_obs___1_ 0='Unchecked' 1='Checked';
	value coverlinen_obs___2_ 0='Unchecked' 1='Checked';
	value coverlinen_obs___3_ 0='Unchecked' 1='Checked';
	value soiled_obs___1_ 0='Unchecked' 1='Checked';
	value soiled_obs___2_ 0='Unchecked' 1='Checked';
	value soiled_obs___3_ 0='Unchecked' 1='Checked';
	value sharps_obs___1_ 0='Unchecked' 1='Checked';
	value sharps_obs___2_ 0='Unchecked' 1='Checked';
	value sharps_obs___3_ 0='Unchecked' 1='Checked';
	value medprep_obs___1_ 0='Unchecked' 1='Checked';
	value medprep_obs___2_ 0='Unchecked' 1='Checked';
	value medprep_obs___3_ 0='Unchecked' 1='Checked';
	value expir_obs___1_ 0='Unchecked' 1='Checked';
	value expir_obs___2_ 0='Unchecked' 1='Checked';
	value expir_obs___3_ 0='Unchecked' 1='Checked';
	value environmental_observ_v_5_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value gluc_disinf_2___1_ 0='Unchecked' 1='Checked';
	value gluc_disinf_2___2_ 0='Unchecked' 1='Checked';
	value gluc_disinf_2___3_ 0='Unchecked' 1='Checked';
	value gluc_disinf_2___4_ 0='Unchecked' 1='Checked';
	value disinf_glucavail_2___1_ 0='Unchecked' 1='Checked';
	value disinf_glucavail_2___2_ 0='Unchecked' 1='Checked';
	value disinf_glucavail_2___3_ 0='Unchecked' 1='Checked';
	value gluc_disinfection___1_ 0='Unchecked' 1='Checked';
	value gluc_disinfection___2_ 0='Unchecked' 1='Checked';
	value gluc_disinfection___3_ 0='Unchecked' 1='Checked';
	value gluc_disinfection___4_ 0='Unchecked' 1='Checked';
	value gluc_supplies___1_ 0='Unchecked' 1='Checked';
	value gluc_supplies___2_ 0='Unchecked' 1='Checked';
	value gluc_supplies___3_ 0='Unchecked' 1='Checked';
	value gluc_supplies___4_ 0='Unchecked' 1='Checked';
	value stor_gluc___1_ 0='Unchecked' 1='Checked';
	value stor_gluc___2_ 0='Unchecked' 1='Checked';
	value stor_gluc___3_ 0='Unchecked' 1='Checked';
	value insulin_pens___1_ 0='Unchecked' 1='Checked';
	value insulin_pens___2_ 0='Unchecked' 1='Checked';
	value insulin_pens___3_ 0='Unchecked' 1='Checked';
	value insulin_storage___1_ 0='Unchecked' 1='Checked';
	value insulin_storage___2_ 0='Unchecked' 1='Checked';
	value insulin_storage___3_ 0='Unchecked' 1='Checked';
	value inject_policy___1_ 0='Unchecked' 1='Checked';
	value inject_policy___2_ 0='Unchecked' 1='Checked';
	value inject_policy___3_ 0='Unchecked' 1='Checked';
	value inject_policy___4_ 0='Unchecked' 1='Checked';
	value one_time_syringe___1_ 0='Unchecked' 1='Checked';
	value one_time_syringe___2_ 0='Unchecked' 1='Checked';
	value one_time_syringe___3_ 0='Unchecked' 1='Checked';
	value one_time_syringe___4_ 0='Unchecked' 1='Checked';
	value single_dose___1_ 0='Unchecked' 1='Checked';
	value single_dose___2_ 0='Unchecked' 1='Checked';
	value single_dose___3_ 0='Unchecked' 1='Checked';
	value single_dose___4_ 0='Unchecked' 1='Checked';
	value multi_dose___1_ 0='Unchecked' 1='Checked';
	value multi_dose___2_ 0='Unchecked' 1='Checked';
	value multi_dose___3_ 0='Unchecked' 1='Checked';
	value multi_dose___4_ 0='Unchecked' 1='Checked';
	value gloves_inject___1_ 0='Unchecked' 1='Checked';
	value gloves_inject___2_ 0='Unchecked' 1='Checked';
	value gloves_inject___3_ 0='Unchecked' 1='Checked';
	value gloves_inject___4_ 0='Unchecked' 1='Checked';
	value diversion_policy___1_ 0='Unchecked' 1='Checked';
	value diversion_policy___2_ 0='Unchecked' 1='Checked';
	value diversion_policy___3_ 0='Unchecked' 1='Checked';
	value diversion_policy___4_ 0='Unchecked' 1='Checked';
	value infectionmedication__v_6_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value glu_1___1_ 0='Unchecked' 1='Checked';
	value glu_1___2_ 0='Unchecked' 1='Checked';
	value glu_1___3_ 0='Unchecked' 1='Checked';
	value glu_1___4_ 0='Unchecked' 1='Checked';
	value glu_1___5_ 0='Unchecked' 1='Checked';
	value glu_1___6_ 0='Unchecked' 1='Checked';
	value glu_1___7_ 0='Unchecked' 1='Checked';
	value glu_2___1_ 0='Unchecked' 1='Checked';
	value glu_2___2_ 0='Unchecked' 1='Checked';
	value glu_2___3_ 0='Unchecked' 1='Checked';
	value glu_2___4_ 0='Unchecked' 1='Checked';
	value glu_2___5_ 0='Unchecked' 1='Checked';
	value glu_2___6_ 0='Unchecked' 1='Checked';
	value glu_2___7_ 0='Unchecked' 1='Checked';
	value glu_3___1_ 0='Unchecked' 1='Checked';
	value glu_3___2_ 0='Unchecked' 1='Checked';
	value glu_3___3_ 0='Unchecked' 1='Checked';
	value glu_3___4_ 0='Unchecked' 1='Checked';
	value glu_3___5_ 0='Unchecked' 1='Checked';
	value glu_3___6_ 0='Unchecked' 1='Checked';
	value glu_3___7_ 0='Unchecked' 1='Checked';
	value glu_4___1_ 0='Unchecked' 1='Checked';
	value glu_4___2_ 0='Unchecked' 1='Checked';
	value glu_4___3_ 0='Unchecked' 1='Checked';
	value glu_4___4_ 0='Unchecked' 1='Checked';
	value glu_4___5_ 0='Unchecked' 1='Checked';
	value glu_4___6_ 0='Unchecked' 1='Checked';
	value glu_4___7_ 0='Unchecked' 1='Checked';
	value glu_5___1_ 0='Unchecked' 1='Checked';
	value glu_5___2_ 0='Unchecked' 1='Checked';
	value glu_5___3_ 0='Unchecked' 1='Checked';
	value glu_5___4_ 0='Unchecked' 1='Checked';
	value glu_5___5_ 0='Unchecked' 1='Checked';
	value glu_5___6_ 0='Unchecked' 1='Checked';
	value glu_5___7_ 0='Unchecked' 1='Checked';
	value assisted_blood_gluco_v_7_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value sterilization_loc___1_ 0='Unchecked' 1='Checked';
	value sterilization_loc___2_ 0='Unchecked' 1='Checked';
	value sterilization_loc___3_ 0='Unchecked' 1='Checked';
	value sterilization_loc___4_ 0='Unchecked' 1='Checked';
	value sterilization_loc___5_ 0='Unchecked' 1='Checked';
	value iuss___1_ 0='Unchecked' 1='Checked';
	value iuss___2_ 0='Unchecked' 1='Checked';
	value iuss___3_ 0='Unchecked' 1='Checked';
	value iuss___4_ 0='Unchecked' 1='Checked';
	value hld_loc___1_ 0='Unchecked' 1='Checked';
	value hld_loc___2_ 0='Unchecked' 1='Checked';
	value hld_loc___3_ 0='Unchecked' 1='Checked';
	value hld_loc___4_ 0='Unchecked' 1='Checked';
	value hld_loc___5_ 0='Unchecked' 1='Checked';
	value critical_item___1_ 0='Unchecked' 1='Checked';
	value critical_item___2_ 0='Unchecked' 1='Checked';
	value critical_item___3_ 0='Unchecked' 1='Checked';
	value critical_item___4_ 0='Unchecked' 1='Checked';
	value hld_items___1_ 0='Unchecked' 1='Checked';
	value hld_items___2_ 0='Unchecked' 1='Checked';
	value hld_items___3_ 0='Unchecked' 1='Checked';
	value hld_items___4_ 0='Unchecked' 1='Checked';
	value single_items___1_ 0='Unchecked' 1='Checked';
	value single_items___2_ 0='Unchecked' 1='Checked';
	value single_items___3_ 0='Unchecked' 1='Checked';
	value single_items___4_ 0='Unchecked' 1='Checked';
	value sterilizationdisinfe_v_8_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value laundry___1_ 0='Unchecked' 1='Checked';
	value laundry___2_ 0='Unchecked' 1='Checked';
	value laundry___3_ 0='Unchecked' 1='Checked';
	value laundry___4_ 0='Unchecked' 1='Checked';
	value bag_laund___1_ 0='Unchecked' 1='Checked';
	value bag_laund___2_ 0='Unchecked' 1='Checked';
	value bag_laund___3_ 0='Unchecked' 1='Checked';
	value bag_laund___4_ 0='Unchecked' 1='Checked';
	value trans_laund___1_ 0='Unchecked' 1='Checked';
	value trans_laund___2_ 0='Unchecked' 1='Checked';
	value trans_laund___3_ 0='Unchecked' 1='Checked';
	value trans_laund___4_ 0='Unchecked' 1='Checked';
	value store_laund___1_ 0='Unchecked' 1='Checked';
	value store_laund___2_ 0='Unchecked' 1='Checked';
	value store_laund___3_ 0='Unchecked' 1='Checked';
	value store_laund___4_ 0='Unchecked' 1='Checked';
	value supp_laund___1_ 0='Unchecked' 1='Checked';
	value supp_laund___2_ 0='Unchecked' 1='Checked';
	value supp_laund___3_ 0='Unchecked' 1='Checked';
	value clean_laund___1_ 0='Unchecked' 1='Checked';
	value clean_laund___2_ 0='Unchecked' 1='Checked';
	value clean_laund___3_ 0='Unchecked' 1='Checked';
	value healthcare_laundry_complete_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value ob_type___1_ 0='Unchecked' 1='Checked';
	value ob_type___2_ 0='Unchecked' 1='Checked';
	value ob_type___3_ 0='Unchecked' 1='Checked';
	value ob_type___4_ 0='Unchecked' 1='Checked';
	value ob_type___5_ 0='Unchecked' 1='Checked';
	value ob_type___6_ 0='Unchecked' 1='Checked';
	value aware_covid___1_ 0='Unchecked' 1='Checked';
	value aware_covid___2_ 0='Unchecked' 1='Checked';
	value aware_covid___3_ 0='Unchecked' 1='Checked';
	value aware_covid___4_ 0='Unchecked' 1='Checked';
	value signs_covid___1_ 0='Unchecked' 1='Checked';
	value signs_covid___2_ 0='Unchecked' 1='Checked';
	value signs_covid___4_ 0='Unchecked' 1='Checked';
	value resp_entrance_covid___1_ 0='Unchecked' 1='Checked';
	value resp_entrance_covid___2_ 0='Unchecked' 1='Checked';
	value resp_entrance_covid___4_ 0='Unchecked' 1='Checked';
	value resp_visitors_covid___1_ 0='Unchecked' 1='Checked';
	value resp_visitors_covid___2_ 0='Unchecked' 1='Checked';
	value resp_visitors_covid___3_ 0='Unchecked' 1='Checked';
	value resp_visitors_covid___4_ 0='Unchecked' 1='Checked';
	value visitors_hh_covid___1_ 0='Unchecked' 1='Checked';
	value visitors_hh_covid___2_ 0='Unchecked' 1='Checked';
	value visitors_hh_covid___3_ 0='Unchecked' 1='Checked';
	value visitors_hh_covid___4_ 0='Unchecked' 1='Checked';
	value resp_station_covid___1_ 0='Unchecked' 1='Checked';
	value resp_station_covid___2_ 0='Unchecked' 1='Checked';
	value resp_station_covid___4_ 0='Unchecked' 1='Checked';
	value signage_covid___1_ 0='Unchecked' 1='Checked';
	value signage_covid___2_ 0='Unchecked' 1='Checked';
	value signage_covid___4_ 0='Unchecked' 1='Checked';
	value sick_leave_covid___1_ 0='Unchecked' 1='Checked';
	value sick_leave_covid___2_ 0='Unchecked' 1='Checked';
	value sick_leave_covid___3_ 0='Unchecked' 1='Checked';
	value sick_leave_covid___4_ 0='Unchecked' 1='Checked';
	value return_work_covid___1_ 0='Unchecked' 1='Checked';
	value return_work_covid___2_ 0='Unchecked' 1='Checked';
	value return_work_covid___3_ 0='Unchecked' 1='Checked';
	value return_work_covid___4_ 0='Unchecked' 1='Checked';
	value ppe_covid___1_ 0='Unchecked' 1='Checked';
	value ppe_covid___2_ 0='Unchecked' 1='Checked';
	value ppe_covid___3_ 0='Unchecked' 1='Checked';
	value ppe_covid___4_ 0='Unchecked' 1='Checked';
	value tbp_signage_covid___1_ 0='Unchecked' 1='Checked';
	value tbp_signage_covid___2_ 0='Unchecked' 1='Checked';
	value tbp_signage_covid___4_ 0='Unchecked' 1='Checked';
	value fit_testing_covid___1_ 0='Unchecked' 1='Checked';
	value fit_testing_covid___2_ 0='Unchecked' 1='Checked';
	value fit_testing_covid___3_ 0='Unchecked' 1='Checked';
	value fit_testing_covid___4_ 0='Unchecked' 1='Checked';
	value ppe_pou_covid___1_ 0='Unchecked' 1='Checked';
	value ppe_pou_covid___2_ 0='Unchecked' 1='Checked';
	value ppe_pou_covid___4_ 0='Unchecked' 1='Checked';
	value disposable_masks_covid___1_ 0='Unchecked' 1='Checked';
	value disposable_masks_covid___2_ 0='Unchecked' 1='Checked';
	value disposable_masks_covid___3_ 0='Unchecked' 1='Checked';
	value disposable_masks_covid___4_ 0='Unchecked' 1='Checked';
	value staff_tbp_covid___1_ 0='Unchecked' 1='Checked';
	value staff_tbp_covid___2_ 0='Unchecked' 1='Checked';
	value staff_tbp_covid___4_ 0='Unchecked' 1='Checked';
	value residents_tbp_covid___1_ 0='Unchecked' 1='Checked';
	value residents_tbp_covid___2_ 0='Unchecked' 1='Checked';
	value residents_tbp_covid___3_ 0='Unchecked' 1='Checked';
	value residents_tbp_covid___4_ 0='Unchecked' 1='Checked';
	value private_rooms_covid___1_ 0='Unchecked' 1='Checked';
	value private_rooms_covid___2_ 0='Unchecked' 1='Checked';
	value private_rooms_covid___3_ 0='Unchecked' 1='Checked';
	value private_rooms_covid___4_ 0='Unchecked' 1='Checked';
	value hh_audits_covid___1_ 0='Unchecked' 1='Checked';
	value hh_audits_covid___2_ 0='Unchecked' 1='Checked';
	value hh_audits_covid___3_ 0='Unchecked' 1='Checked';
	value hh_audits_covid___4_ 0='Unchecked' 1='Checked';
	value ppe_audits_covid___1_ 0='Unchecked' 1='Checked';
	value ppe_audits_covid___2_ 0='Unchecked' 1='Checked';
	value ppe_audits_covid___3_ 0='Unchecked' 1='Checked';
	value ppe_audits_covid___4_ 0='Unchecked' 1='Checked';
	value precautions_covid___1_ 0='Unchecked' 1='Checked';
	value precautions_covid___2_ 0='Unchecked' 1='Checked';
	value precautions_covid___3_ 0='Unchecked' 1='Checked';
	value precautions_covid___4_ 0='Unchecked' 1='Checked';
	value high_touch_covid___1_ 0='Unchecked' 1='Checked';
	value high_touch_covid___2_ 0='Unchecked' 1='Checked';
	value high_touch_covid___3_ 0='Unchecked' 1='Checked';
	value high_touch_covid___4_ 0='Unchecked' 1='Checked';
	value disinfect_covid___1_ 0='Unchecked' 1='Checked';
	value disinfect_covid___2_ 0='Unchecked' 1='Checked';
	value disinfect_covid___4_ 0='Unchecked' 1='Checked';
	value disinfect_pou_covid___1_ 0='Unchecked' 1='Checked';
	value disinfect_pou_covid___2_ 0='Unchecked' 1='Checked';
	value disinfect_pou_covid___4_ 0='Unchecked' 1='Checked';
	value equip_dedicated_covid___1_ 0='Unchecked' 1='Checked';
	value equip_dedicated_covid___2_ 0='Unchecked' 1='Checked';
	value equip_dedicated_covid___3_ 0='Unchecked' 1='Checked';
	value equip_dedicated_covid___4_ 0='Unchecked' 1='Checked';
	value ppe_supply_covid___1_ 0='Unchecked' 1='Checked';
	value ppe_supply_covid___2_ 0='Unchecked' 1='Checked';
	value ppe_supply_covid___3_ 0='Unchecked' 1='Checked';
	value ppe_supply_covid___4_ 0='Unchecked' 1='Checked';
	value universal_mask_covid___1_ 0='Unchecked' 1='Checked';
	value universal_mask_covid___2_ 0='Unchecked' 1='Checked';
	value universal_mask_covid___3_ 0='Unchecked' 1='Checked';
	value universal_mask_covid___4_ 0='Unchecked' 1='Checked';
	value hh_throughout_covid___1_ 0='Unchecked' 1='Checked';
	value hh_throughout_covid___2_ 0='Unchecked' 1='Checked';
	value hh_throughout_covid___4_ 0='Unchecked' 1='Checked';
	value hh_inout_covid___1_ 0='Unchecked' 1='Checked';
	value hh_inout_covid___2_ 0='Unchecked' 1='Checked';
	value hh_inout_covid___4_ 0='Unchecked' 1='Checked';
	value hh_semi_private_covid___1_ 0='Unchecked' 1='Checked';
	value hh_semi_private_covid___2_ 0='Unchecked' 1='Checked';
	value hh_semi_private_covid___4_ 0='Unchecked' 1='Checked';
	value aware_flu___1_ 0='Unchecked' 1='Checked';
	value aware_flu___2_ 0='Unchecked' 1='Checked';
	value aware_flu___3_ 0='Unchecked' 1='Checked';
	value aware_flu___4_ 0='Unchecked' 1='Checked';
	value signs_flu___1_ 0='Unchecked' 1='Checked';
	value signs_flu___2_ 0='Unchecked' 1='Checked';
	value signs_flu___4_ 0='Unchecked' 1='Checked';
	value resp_entrance_flu___1_ 0='Unchecked' 1='Checked';
	value resp_entrance_flu___2_ 0='Unchecked' 1='Checked';
	value resp_entrance_flu___4_ 0='Unchecked' 1='Checked';
	value resp_visitors_flu___1_ 0='Unchecked' 1='Checked';
	value resp_visitors_flu___2_ 0='Unchecked' 1='Checked';
	value resp_visitors_flu___3_ 0='Unchecked' 1='Checked';
	value resp_visitors_flu___4_ 0='Unchecked' 1='Checked';
	value visitors_hh_flu___1_ 0='Unchecked' 1='Checked';
	value visitors_hh_flu___2_ 0='Unchecked' 1='Checked';
	value visitors_hh_flu___3_ 0='Unchecked' 1='Checked';
	value visitors_hh_flu___4_ 0='Unchecked' 1='Checked';
	value resp_station_flu___1_ 0='Unchecked' 1='Checked';
	value resp_station_flu___2_ 0='Unchecked' 1='Checked';
	value resp_station_flu___4_ 0='Unchecked' 1='Checked';
	value signage_flu___1_ 0='Unchecked' 1='Checked';
	value signage_flu___2_ 0='Unchecked' 1='Checked';
	value signage_flu___4_ 0='Unchecked' 1='Checked';
	value sick_leave_flu___1_ 0='Unchecked' 1='Checked';
	value sick_leave_flu___2_ 0='Unchecked' 1='Checked';
	value sick_leave_flu___3_ 0='Unchecked' 1='Checked';
	value sick_leave_flu___4_ 0='Unchecked' 1='Checked';
	value return_work_flu___1_ 0='Unchecked' 1='Checked';
	value return_work_flu___2_ 0='Unchecked' 1='Checked';
	value return_work_flu___3_ 0='Unchecked' 1='Checked';
	value return_work_flu___4_ 0='Unchecked' 1='Checked';
	value ppe_flu___1_ 0='Unchecked' 1='Checked';
	value ppe_flu___2_ 0='Unchecked' 1='Checked';
	value ppe_flu___3_ 0='Unchecked' 1='Checked';
	value ppe_flu___4_ 0='Unchecked' 1='Checked';
	value tbp_signage_flu___1_ 0='Unchecked' 1='Checked';
	value tbp_signage_flu___2_ 0='Unchecked' 1='Checked';
	value tbp_signage_flu___4_ 0='Unchecked' 1='Checked';
	value ppe_pou_flu___1_ 0='Unchecked' 1='Checked';
	value ppe_pou_flu___2_ 0='Unchecked' 1='Checked';
	value ppe_pou_flu___4_ 0='Unchecked' 1='Checked';
	value disposable_masks_flu___1_ 0='Unchecked' 1='Checked';
	value disposable_masks_flu___2_ 0='Unchecked' 1='Checked';
	value disposable_masks_flu___3_ 0='Unchecked' 1='Checked';
	value disposable_masks_flu___4_ 0='Unchecked' 1='Checked';
	value staff_tbp_flu___1_ 0='Unchecked' 1='Checked';
	value staff_tbp_flu___2_ 0='Unchecked' 1='Checked';
	value staff_tbp_flu___4_ 0='Unchecked' 1='Checked';
	value residents_tbp_flu___1_ 0='Unchecked' 1='Checked';
	value residents_tbp_flu___2_ 0='Unchecked' 1='Checked';
	value residents_tbp_flu___3_ 0='Unchecked' 1='Checked';
	value residents_tbp_flu___4_ 0='Unchecked' 1='Checked';
	value private_rooms_flu___1_ 0='Unchecked' 1='Checked';
	value private_rooms_flu___2_ 0='Unchecked' 1='Checked';
	value private_rooms_flu___3_ 0='Unchecked' 1='Checked';
	value private_rooms_flu___4_ 0='Unchecked' 1='Checked';
	value hh_audits_flu___1_ 0='Unchecked' 1='Checked';
	value hh_audits_flu___2_ 0='Unchecked' 1='Checked';
	value hh_audits_flu___3_ 0='Unchecked' 1='Checked';
	value hh_audits_flu___4_ 0='Unchecked' 1='Checked';
	value ppe_audits_flu___1_ 0='Unchecked' 1='Checked';
	value ppe_audits_flu___2_ 0='Unchecked' 1='Checked';
	value ppe_audits_flu___3_ 0='Unchecked' 1='Checked';
	value ppe_audits_flu___4_ 0='Unchecked' 1='Checked';
	value precautions_flu___1_ 0='Unchecked' 1='Checked';
	value precautions_flu___2_ 0='Unchecked' 1='Checked';
	value precautions_flu___3_ 0='Unchecked' 1='Checked';
	value precautions_flu___4_ 0='Unchecked' 1='Checked';
	value high_touch_flu___1_ 0='Unchecked' 1='Checked';
	value high_touch_flu___2_ 0='Unchecked' 1='Checked';
	value high_touch_flu___3_ 0='Unchecked' 1='Checked';
	value high_touch_flu___4_ 0='Unchecked' 1='Checked';
	value disinfect_flu___1_ 0='Unchecked' 1='Checked';
	value disinfect_flu___2_ 0='Unchecked' 1='Checked';
	value disinfect_flu___4_ 0='Unchecked' 1='Checked';
	value disinfect_pou_flu___1_ 0='Unchecked' 1='Checked';
	value disinfect_pou_flu___2_ 0='Unchecked' 1='Checked';
	value disinfect_pou_flu___3_ 0='Unchecked' 1='Checked';
	value disinfect_pou_flu___4_ 0='Unchecked' 1='Checked';
	value ppe_supply_flu___1_ 0='Unchecked' 1='Checked';
	value ppe_supply_flu___2_ 0='Unchecked' 1='Checked';
	value ppe_supply_flu___3_ 0='Unchecked' 1='Checked';
	value ppe_supply_flu___4_ 0='Unchecked' 1='Checked';
	value hh_throughout_flu___1_ 0='Unchecked' 1='Checked';
	value hh_throughout_flu___2_ 0='Unchecked' 1='Checked';
	value hh_throughout_flu___4_ 0='Unchecked' 1='Checked';
	value hh_inout_flu___1_ 0='Unchecked' 1='Checked';
	value hh_inout_flu___2_ 0='Unchecked' 1='Checked';
	value hh_inout_flu___4_ 0='Unchecked' 1='Checked';
	value hh_semi_private_flu___1_ 0='Unchecked' 1='Checked';
	value hh_semi_private_flu___2_ 0='Unchecked' 1='Checked';
	value hh_semi_private_flu___4_ 0='Unchecked' 1='Checked';
	value aware_rsv___1_ 0='Unchecked' 1='Checked';
	value aware_rsv___2_ 0='Unchecked' 1='Checked';
	value aware_rsv___3_ 0='Unchecked' 1='Checked';
	value aware_rsv___4_ 0='Unchecked' 1='Checked';
	value signs_rsv___1_ 0='Unchecked' 1='Checked';
	value signs_rsv___2_ 0='Unchecked' 1='Checked';
	value signs_rsv___4_ 0='Unchecked' 1='Checked';
	value resp_entrance_rsv___1_ 0='Unchecked' 1='Checked';
	value resp_entrance_rsv___2_ 0='Unchecked' 1='Checked';
	value resp_entrance_rsv___4_ 0='Unchecked' 1='Checked';
	value resp_visitors_rsv___1_ 0='Unchecked' 1='Checked';
	value resp_visitors_rsv___2_ 0='Unchecked' 1='Checked';
	value resp_visitors_rsv___3_ 0='Unchecked' 1='Checked';
	value resp_visitors_rsv___4_ 0='Unchecked' 1='Checked';
	value visitors_hh_rsv___1_ 0='Unchecked' 1='Checked';
	value visitors_hh_rsv___2_ 0='Unchecked' 1='Checked';
	value visitors_hh_rsv___3_ 0='Unchecked' 1='Checked';
	value visitors_hh_rsv___4_ 0='Unchecked' 1='Checked';
	value resp_station_rsv___1_ 0='Unchecked' 1='Checked';
	value resp_station_rsv___2_ 0='Unchecked' 1='Checked';
	value resp_station_rsv___4_ 0='Unchecked' 1='Checked';
	value signage_rsv___1_ 0='Unchecked' 1='Checked';
	value signage_rsv___2_ 0='Unchecked' 1='Checked';
	value signage_rsv___4_ 0='Unchecked' 1='Checked';
	value sick_leave_rsv___1_ 0='Unchecked' 1='Checked';
	value sick_leave_rsv___2_ 0='Unchecked' 1='Checked';
	value sick_leave_rsv___3_ 0='Unchecked' 1='Checked';
	value sick_leave_rsv___4_ 0='Unchecked' 1='Checked';
	value return_work_rsv___1_ 0='Unchecked' 1='Checked';
	value return_work_rsv___2_ 0='Unchecked' 1='Checked';
	value return_work_rsv___3_ 0='Unchecked' 1='Checked';
	value return_work_rsv___4_ 0='Unchecked' 1='Checked';
	value ppe_rsv___1_ 0='Unchecked' 1='Checked';
	value ppe_rsv___2_ 0='Unchecked' 1='Checked';
	value ppe_rsv___3_ 0='Unchecked' 1='Checked';
	value ppe_rsv___4_ 0='Unchecked' 1='Checked';
	value tbp_signage_rsv___1_ 0='Unchecked' 1='Checked';
	value tbp_signage_rsv___2_ 0='Unchecked' 1='Checked';
	value tbp_signage_rsv___4_ 0='Unchecked' 1='Checked';
	value stand_precaut_rsv___1_ 0='Unchecked' 1='Checked';
	value stand_precaut_rsv___2_ 0='Unchecked' 1='Checked';
	value stand_precaut_rsv___3_ 0='Unchecked' 1='Checked';
	value stand_precaut_rsv___4_ 0='Unchecked' 1='Checked';
	value ppe_pou_rsv___1_ 0='Unchecked' 1='Checked';
	value ppe_pou_rsv___2_ 0='Unchecked' 1='Checked';
	value ppe_pou_rsv___4_ 0='Unchecked' 1='Checked';
	value disposable_masks_rsv___1_ 0='Unchecked' 1='Checked';
	value disposable_masks_rsv___2_ 0='Unchecked' 1='Checked';
	value disposable_masks_rsv___3_ 0='Unchecked' 1='Checked';
	value disposable_masks_rsv___4_ 0='Unchecked' 1='Checked';
	value staff_tbp_rsv___1_ 0='Unchecked' 1='Checked';
	value staff_tbp_rsv___2_ 0='Unchecked' 1='Checked';
	value staff_tbp_rsv___4_ 0='Unchecked' 1='Checked';
	value residents_tbp_rsv___1_ 0='Unchecked' 1='Checked';
	value residents_tbp_rsv___2_ 0='Unchecked' 1='Checked';
	value residents_tbp_rsv___3_ 0='Unchecked' 1='Checked';
	value residents_tbp_rsv___4_ 0='Unchecked' 1='Checked';
	value private_rooms_rsv___1_ 0='Unchecked' 1='Checked';
	value private_rooms_rsv___2_ 0='Unchecked' 1='Checked';
	value private_rooms_rsv___3_ 0='Unchecked' 1='Checked';
	value private_rooms_rsv___4_ 0='Unchecked' 1='Checked';
	value hh_audits_rsv___1_ 0='Unchecked' 1='Checked';
	value hh_audits_rsv___2_ 0='Unchecked' 1='Checked';
	value hh_audits_rsv___3_ 0='Unchecked' 1='Checked';
	value hh_audits_rsv___4_ 0='Unchecked' 1='Checked';
	value ppe_audits_rsv___1_ 0='Unchecked' 1='Checked';
	value ppe_audits_rsv___2_ 0='Unchecked' 1='Checked';
	value ppe_audits_rsv___3_ 0='Unchecked' 1='Checked';
	value ppe_audits_rsv___4_ 0='Unchecked' 1='Checked';
	value precautions_rsv___1_ 0='Unchecked' 1='Checked';
	value precautions_rsv___2_ 0='Unchecked' 1='Checked';
	value precautions_rsv___3_ 0='Unchecked' 1='Checked';
	value precautions_rsv___4_ 0='Unchecked' 1='Checked';
	value high_touch_rsv___1_ 0='Unchecked' 1='Checked';
	value high_touch_rsv___2_ 0='Unchecked' 1='Checked';
	value high_touch_rsv___3_ 0='Unchecked' 1='Checked';
	value high_touch_rsv___4_ 0='Unchecked' 1='Checked';
	value disinfect_rsv___1_ 0='Unchecked' 1='Checked';
	value disinfect_rsv___2_ 0='Unchecked' 1='Checked';
	value disinfect_rsv___4_ 0='Unchecked' 1='Checked';
	value disinfect_pou_rsv___1_ 0='Unchecked' 1='Checked';
	value disinfect_pou_rsv___2_ 0='Unchecked' 1='Checked';
	value disinfect_pou_rsv___4_ 0='Unchecked' 1='Checked';
	value equipment_dedicated_rsv___1_ 0='Unchecked' 1='Checked';
	value equipment_dedicated_rsv___2_ 0='Unchecked' 1='Checked';
	value equipment_dedicated_rsv___3_ 0='Unchecked' 1='Checked';
	value equipment_dedicated_rsv___4_ 0='Unchecked' 1='Checked';
	value ppe_supply_rsv___1_ 0='Unchecked' 1='Checked';
	value ppe_supply_rsv___2_ 0='Unchecked' 1='Checked';
	value ppe_supply_rsv___3_ 0='Unchecked' 1='Checked';
	value ppe_supply_rsv___4_ 0='Unchecked' 1='Checked';
	value hh_throughout_rsv___1_ 0='Unchecked' 1='Checked';
	value hh_throughout_rsv___2_ 0='Unchecked' 1='Checked';
	value hh_throughout_rsv___4_ 0='Unchecked' 1='Checked';
	value hh_inout_rsv___1_ 0='Unchecked' 1='Checked';
	value hh_inout_rsv___2_ 0='Unchecked' 1='Checked';
	value hh_inout_rsv___4_ 0='Unchecked' 1='Checked';
	value hh_semi_private_rsv___1_ 0='Unchecked' 1='Checked';
	value hh_semi_private_rsv___2_ 0='Unchecked' 1='Checked';
	value hh_semi_private_rsv___4_ 0='Unchecked' 1='Checked';
	value aware_noro___1_ 0='Unchecked' 1='Checked';
	value aware_noro___2_ 0='Unchecked' 1='Checked';
	value aware_noro___3_ 0='Unchecked' 1='Checked';
	value aware_noro___4_ 0='Unchecked' 1='Checked';
	value signs_noro___1_ 0='Unchecked' 1='Checked';
	value signs_noro___2_ 0='Unchecked' 1='Checked';
	value signs_noro___4_ 0='Unchecked' 1='Checked';
	value resp_entrance_noro___1_ 0='Unchecked' 1='Checked';
	value resp_entrance_noro___2_ 0='Unchecked' 1='Checked';
	value resp_entrance_noro___4_ 0='Unchecked' 1='Checked';
	value resp_visitors_noro___1_ 0='Unchecked' 1='Checked';
	value resp_visitors_noro___2_ 0='Unchecked' 1='Checked';
	value resp_visitors_noro___3_ 0='Unchecked' 1='Checked';
	value resp_visitors_noro___4_ 0='Unchecked' 1='Checked';
	value visitors_hh_noro___1_ 0='Unchecked' 1='Checked';
	value visitors_hh_noro___2_ 0='Unchecked' 1='Checked';
	value visitors_hh_noro___3_ 0='Unchecked' 1='Checked';
	value visitors_hh_noro___4_ 0='Unchecked' 1='Checked';
	value sick_leave_noro___1_ 0='Unchecked' 1='Checked';
	value sick_leave_noro___2_ 0='Unchecked' 1='Checked';
	value sick_leave_noro___3_ 0='Unchecked' 1='Checked';
	value sick_leave_noro___4_ 0='Unchecked' 1='Checked';
	value return_work_noro___1_ 0='Unchecked' 1='Checked';
	value return_work_noro___2_ 0='Unchecked' 1='Checked';
	value return_work_noro___3_ 0='Unchecked' 1='Checked';
	value return_work_noro___4_ 0='Unchecked' 1='Checked';
	value ppe_noro___1_ 0='Unchecked' 1='Checked';
	value ppe_noro___2_ 0='Unchecked' 1='Checked';
	value ppe_noro___3_ 0='Unchecked' 1='Checked';
	value ppe_noro___4_ 0='Unchecked' 1='Checked';
	value bp_signage_noro___1_ 0='Unchecked' 1='Checked';
	value bp_signage_noro___2_ 0='Unchecked' 1='Checked';
	value bp_signage_noro___3_ 0='Unchecked' 1='Checked';
	value bp_signage_noro___4_ 0='Unchecked' 1='Checked';
	value ppe_pou_noro___1_ 0='Unchecked' 1='Checked';
	value ppe_pou_noro___2_ 0='Unchecked' 1='Checked';
	value ppe_pou_noro___4_ 0='Unchecked' 1='Checked';
	value staff_tbp_noro___1_ 0='Unchecked' 1='Checked';
	value staff_tbp_noro___2_ 0='Unchecked' 1='Checked';
	value staff_tbp_noro___4_ 0='Unchecked' 1='Checked';
	value residents_tbp_noro___1_ 0='Unchecked' 1='Checked';
	value residents_tbp_noro___2_ 0='Unchecked' 1='Checked';
	value residents_tbp_noro___3_ 0='Unchecked' 1='Checked';
	value residents_tbp_noro___4_ 0='Unchecked' 1='Checked';
	value private_rooms_noro___1_ 0='Unchecked' 1='Checked';
	value private_rooms_noro___2_ 0='Unchecked' 1='Checked';
	value private_rooms_noro___3_ 0='Unchecked' 1='Checked';
	value private_rooms_noro___4_ 0='Unchecked' 1='Checked';
	value wash_hands_noro___1_ 0='Unchecked' 1='Checked';
	value wash_hands_noro___2_ 0='Unchecked' 1='Checked';
	value wash_hands_noro___3_ 0='Unchecked' 1='Checked';
	value wash_hands_noro___4_ 0='Unchecked' 1='Checked';
	value hh_audits_noro___1_ 0='Unchecked' 1='Checked';
	value hh_audits_noro___2_ 0='Unchecked' 1='Checked';
	value hh_audits_noro___3_ 0='Unchecked' 1='Checked';
	value hh_audits_noro___4_ 0='Unchecked' 1='Checked';
	value ppe_audits_noro___1_ 0='Unchecked' 1='Checked';
	value ppe_audits_noro___2_ 0='Unchecked' 1='Checked';
	value ppe_audits_noro___3_ 0='Unchecked' 1='Checked';
	value ppe_audits_noro___4_ 0='Unchecked' 1='Checked';
	value precautions_noro___1_ 0='Unchecked' 1='Checked';
	value precautions_noro___2_ 0='Unchecked' 1='Checked';
	value precautions_noro___3_ 0='Unchecked' 1='Checked';
	value precautions_noro___4_ 0='Unchecked' 1='Checked';
	value high_touch_noro___1_ 0='Unchecked' 1='Checked';
	value high_touch_noro___2_ 0='Unchecked' 1='Checked';
	value high_touch_noro___3_ 0='Unchecked' 1='Checked';
	value high_touch_noro___4_ 0='Unchecked' 1='Checked';
	value disinfect_noro___1_ 0='Unchecked' 1='Checked';
	value disinfect_noro___2_ 0='Unchecked' 1='Checked';
	value disinfect_noro___4_ 0='Unchecked' 1='Checked';
	value disinfect_pou_noro___1_ 0='Unchecked' 1='Checked';
	value disinfect_pou_noro___2_ 0='Unchecked' 1='Checked';
	value disinfect_pou_noro___4_ 0='Unchecked' 1='Checked';
	value equipment_dedicated_noro___1_ 0='Unchecked' 1='Checked';
	value equipment_dedicated_noro___2_ 0='Unchecked' 1='Checked';
	value equipment_dedicated_noro___3_ 0='Unchecked' 1='Checked';
	value equipment_dedicated_noro___4_ 0='Unchecked' 1='Checked';
	value ppe_supply___1_ 0='Unchecked' 1='Checked';
	value ppe_supply___2_ 0='Unchecked' 1='Checked';
	value ppe_supply___3_ 0='Unchecked' 1='Checked';
	value ppe_supply___4_ 0='Unchecked' 1='Checked';
	value hh_throughout_noro___1_ 0='Unchecked' 1='Checked';
	value hh_throughout_noro___2_ 0='Unchecked' 1='Checked';
	value hh_throughout_noro___4_ 0='Unchecked' 1='Checked';
	value hh_inout_noro___1_ 0='Unchecked' 1='Checked';
	value hh_inout_noro___2_ 0='Unchecked' 1='Checked';
	value hh_inout_noro___4_ 0='Unchecked' 1='Checked';
	value sinks_noro___1_ 0='Unchecked' 1='Checked';
	value sinks_noro___2_ 0='Unchecked' 1='Checked';
	value sinks_noro___4_ 0='Unchecked' 1='Checked';
	value hh_semi_private_noro___1_ 0='Unchecked' 1='Checked';
	value hh_semi_private_noro___2_ 0='Unchecked' 1='Checked';
	value hh_semi_private_noro___4_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___1_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___2_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___3_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___4_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___5_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___6_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___7_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___8_ 0='Unchecked' 1='Checked';
	value contr_ob_mdro___9_ 0='Unchecked' 1='Checked';
	value screen_ob_mdro___1_ 0='Unchecked' 1='Checked';
	value screen_ob_mdro___2_ 0='Unchecked' 1='Checked';
	value screen_ob_mdro___3_ 0='Unchecked' 1='Checked';
	value screen_ob_mdro___4_ 0='Unchecked' 1='Checked';
	value rec_ob_mdro___1_ 0='Unchecked' 1='Checked';
	value rec_ob_mdro___2_ 0='Unchecked' 1='Checked';
	value rec_ob_mdro___3_ 0='Unchecked' 1='Checked';
	value rec_ob_mdro___4_ 0='Unchecked' 1='Checked';
	value iso_ob_mdro___1_ 0='Unchecked' 1='Checked';
	value iso_ob_mdro___2_ 0='Unchecked' 1='Checked';
	value iso_ob_mdro___3_ 0='Unchecked' 1='Checked';
	value iso_ob_mdro___4_ 0='Unchecked' 1='Checked';
	value contacts_ob_mdro___1_ 0='Unchecked' 1='Checked';
	value contacts_ob_mdro___2_ 0='Unchecked' 1='Checked';
	value contacts_ob_mdro___3_ 0='Unchecked' 1='Checked';
	value contacts_ob_mdro___4_ 0='Unchecked' 1='Checked';
	value precaut_ob_mdro___1_ 0='Unchecked' 1='Checked';
	value precaut_ob_mdro___2_ 0='Unchecked' 1='Checked';
	value precaut_ob_mdro___4_ 0='Unchecked' 1='Checked';
	value staff_ob_mdro___1_ 0='Unchecked' 1='Checked';
	value staff_ob_mdro___2_ 0='Unchecked' 1='Checked';
	value staff_ob_mdro___4_ 0='Unchecked' 1='Checked';
	value edu_ob_mdro___1_ 0='Unchecked' 1='Checked';
	value edu_ob_mdro___2_ 0='Unchecked' 1='Checked';
	value edu_ob_mdro___3_ 0='Unchecked' 1='Checked';
	value edu_ob_mdro___4_ 0='Unchecked' 1='Checked';
	value report_list_mdro___1_ 0='Unchecked' 1='Checked';
	value report_list_mdro___2_ 0='Unchecked' 1='Checked';
	value report_list_mdro___3_ 0='Unchecked' 1='Checked';
	value report_list_mdro___4_ 0='Unchecked' 1='Checked';
	value ph_contact_mdro___1_ 0='Unchecked' 1='Checked';
	value ph_contact_mdro___2_ 0='Unchecked' 1='Checked';
	value ph_contact_mdro___3_ 0='Unchecked' 1='Checked';
	value ph_contact_mdro___4_ 0='Unchecked' 1='Checked';
	value comm_infect_mdro___1_ 0='Unchecked' 1='Checked';
	value comm_infect_mdro___2_ 0='Unchecked' 1='Checked';
	value comm_infect_mdro___3_ 0='Unchecked' 1='Checked';
	value comm_infect_mdro___4_ 0='Unchecked' 1='Checked';
	value infect_intake_mdro___1_ 0='Unchecked' 1='Checked';
	value infect_intake_mdro___2_ 0='Unchecked' 1='Checked';
	value infect_intake_mdro___3_ 0='Unchecked' 1='Checked';
	value infect_intake_mdro___4_ 0='Unchecked' 1='Checked';
	value lab_notif_mdro___1_ 0='Unchecked' 1='Checked';
	value lab_notif_mdro___2_ 0='Unchecked' 1='Checked';
	value lab_notif_mdro___3_ 0='Unchecked' 1='Checked';
	value lab_notif_mdro___4_ 0='Unchecked' 1='Checked';
	value indiv_antistew_mdro___1_ 0='Unchecked' 1='Checked';
	value indiv_antistew_mdro___2_ 0='Unchecked' 1='Checked';
	value indiv_antistew_mdro___3_ 0='Unchecked' 1='Checked';
	value indiv_antistew_mdro___4_ 0='Unchecked' 1='Checked';
	value indiv_antistew_mdro___5_ 0='Unchecked' 1='Checked';
	value indiv_antistew_mdro___6_ 0='Unchecked' 1='Checked';
	value hh_policies_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_policies_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_policies_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_policies_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___5_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___6_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___7_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___8_ 0='Unchecked' 1='Checked';
	value hh_expectations_mdro___9_ 0='Unchecked' 1='Checked';
	value hh_inout_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_inout_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_inout_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_sinkavail_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_sinkavail_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_sinkavail_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_sinkavail_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_soapwater_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_soapwater_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_soapwater_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_soapwater_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_soapwater_mdro___5_ 0='Unchecked' 1='Checked';
	value hh_soapwater_mdro___6_ 0='Unchecked' 1='Checked';
	value hh_throughout_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_throughout_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_throughout_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_pocket_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_pocket_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_pocket_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_pocket_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_only_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_only_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_only_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_only_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_supplies_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_supplies_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_supplies_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_lotion_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_lotion_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_lotion_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_lotion_mdro___4_ 0='Unchecked' 1='Checked';
	value hh_lotion_mdro___5_ 0='Unchecked' 1='Checked';
	value hh_nails_mdro___1_ 0='Unchecked' 1='Checked';
	value hh_nails_mdro___2_ 0='Unchecked' 1='Checked';
	value hh_nails_mdro___3_ 0='Unchecked' 1='Checked';
	value hh_nails_mdro___4_ 0='Unchecked' 1='Checked';
	value patienthh_mdro___1_ 0='Unchecked' 1='Checked';
	value patienthh_mdro___2_ 0='Unchecked' 1='Checked';
	value patienthh_mdro___3_ 0='Unchecked' 1='Checked';
	value patienthh_mdro___4_ 0='Unchecked' 1='Checked';
	value patienthh_mdro___5_ 0='Unchecked' 1='Checked';
	value transmission_policy_mdro___1_ 0='Unchecked' 1='Checked';
	value transmission_policy_mdro___2_ 0='Unchecked' 1='Checked';
	value transmission_policy_mdro___3_ 0='Unchecked' 1='Checked';
	value transmission_policy_mdro___4_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___1_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___2_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___3_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___4_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___5_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___6_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___7_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___8_ 0='Unchecked' 1='Checked';
	value trans_signage_mdro___9_ 0='Unchecked' 1='Checked';
	value ppe_supplies_mdro___1_ 0='Unchecked' 1='Checked';
	value ppe_supplies_mdro___2_ 0='Unchecked' 1='Checked';
	value ppe_supplies_mdro___4_ 0='Unchecked' 1='Checked';
	value semipriv_mdro___1_ 0='Unchecked' 1='Checked';
	value semipriv_mdro___2_ 0='Unchecked' 1='Checked';
	value semipriv_mdro___3_ 0='Unchecked' 1='Checked';
	value semipriv_mdro___4_ 0='Unchecked' 1='Checked';
	value tbp_admit_mdro___1_ 0='Unchecked' 1='Checked';
	value tbp_admit_mdro___2_ 0='Unchecked' 1='Checked';
	value tbp_admit_mdro___3_ 0='Unchecked' 1='Checked';
	value tbp_admit_mdro___4_ 0='Unchecked' 1='Checked';
	value tbp_transfer_mdro___1_ 0='Unchecked' 1='Checked';
	value tbp_transfer_mdro___2_ 0='Unchecked' 1='Checked';
	value tbp_transfer_mdro___3_ 0='Unchecked' 1='Checked';
	value tbp_transfer_mdro___4_ 0='Unchecked' 1='Checked';
	value tbp_change_mdro___1_ 0='Unchecked' 1='Checked';
	value tbp_change_mdro___2_ 0='Unchecked' 1='Checked';
	value tbp_change_mdro___3_ 0='Unchecked' 1='Checked';
	value tbp_change_mdro___4_ 0='Unchecked' 1='Checked';
	value ebp_identify_mdro___1_ 0='Unchecked' 1='Checked';
	value ebp_identify_mdro___2_ 0='Unchecked' 1='Checked';
	value ebp_identify_mdro___3_ 0='Unchecked' 1='Checked';
	value ebp_identify_mdro___4_ 0='Unchecked' 1='Checked';
	value trans_signforclean_mdro___1_ 0='Unchecked' 1='Checked';
	value trans_signforclean_mdro___2_ 0='Unchecked' 1='Checked';
	value trans_signforclean_mdro___3_ 0='Unchecked' 1='Checked';
	value trans_signforclean_mdro___4_ 0='Unchecked' 1='Checked';
	value one_time_syringe_mdro___1_ 0='Unchecked' 1='Checked';
	value one_time_syringe_mdro___2_ 0='Unchecked' 1='Checked';
	value one_time_syringe_mdro___3_ 0='Unchecked' 1='Checked';
	value one_time_syringe_mdro___4_ 0='Unchecked' 1='Checked';
	value watermang_mdro___1_ 0='Unchecked' 1='Checked';
	value watermang_mdro___2_ 0='Unchecked' 1='Checked';
	value watermang_mdro___3_ 0='Unchecked' 1='Checked';
	value watermang_mdro___4_ 0='Unchecked' 1='Checked';
	value splash_mdro___1_ 0='Unchecked' 1='Checked';
	value splash_mdro___2_ 0='Unchecked' 1='Checked';
	value splash_mdro___3_ 0='Unchecked' 1='Checked';
	value splash_mdro___5_ 0='Unchecked' 1='Checked';
	value splash_mdro___6_ 0='Unchecked' 1='Checked';
	value splash_mdro___7_ 0='Unchecked' 1='Checked';
	value splash_mdro___8_ 0='Unchecked' 1='Checked';
	value splash_mdro___9_ 0='Unchecked' 1='Checked';
	value splash_mdro___10_ 0='Unchecked' 1='Checked';
	value splash_mdro___11_ 0='Unchecked' 1='Checked';
	value splash_mdro___12_ 0='Unchecked' 1='Checked';
	value biofilm_measures_mdro___1_ 0='Unchecked' 1='Checked';
	value biofilm_measures_mdro___2_ 0='Unchecked' 1='Checked';
	value biofilm_measures_mdro___3_ 0='Unchecked' 1='Checked';
	value biofilm_measures_mdro___4_ 0='Unchecked' 1='Checked';
	value biofilm_measures_mdro___5_ 0='Unchecked' 1='Checked';
	value biofilm_measures_mdro___6_ 0='Unchecked' 1='Checked';
	value biofilm_measures_mdro___7_ 0='Unchecked' 1='Checked';
	value toiletdoor_mdro___1_ 0='Unchecked' 1='Checked';
	value toiletdoor_mdro___2_ 0='Unchecked' 1='Checked';
	value toiletdoor_mdro___3_ 0='Unchecked' 1='Checked';
	value toiletdoor_mdro___4_ 0='Unchecked' 1='Checked';
	value toiletdoor_no_mdro___1_ 0='Unchecked' 1='Checked';
	value toiletdoor_no_mdro___2_ 0='Unchecked' 1='Checked';
	value toiletdoor_no_mdro___3_ 0='Unchecked' 1='Checked';
	value toiletdoor_no_mdro___4_ 0='Unchecked' 1='Checked';
	value hooperdoor_mdro___1_ 0='Unchecked' 1='Checked';
	value hooperdoor_mdro___2_ 0='Unchecked' 1='Checked';
	value hooperdoor_mdro___3_ 0='Unchecked' 1='Checked';
	value hooperdoor_mdro___4_ 0='Unchecked' 1='Checked';
	value hopperdoor_no_mdro___1_ 0='Unchecked' 1='Checked';
	value hopperdoor_no_mdro___2_ 0='Unchecked' 1='Checked';
	value hopperdoor_no_mdro___3_ 0='Unchecked' 1='Checked';
	value hopperdoor_no_mdro___4_ 0='Unchecked' 1='Checked';
	value iceobs_mdro___1_ 0='Unchecked' 1='Checked';
	value iceobs_mdro___2_ 0='Unchecked' 1='Checked';
	value iceobs_mdro___4_ 0='Unchecked' 1='Checked';
	value icemaint_mdro___1_ 0='Unchecked' 1='Checked';
	value icemaint_mdro___2_ 0='Unchecked' 1='Checked';
	value icemaint_mdro___3_ 0='Unchecked' 1='Checked';
	value icemaint_mdro___4_ 0='Unchecked' 1='Checked';
	value showerchair_mdro___1_ 0='Unchecked' 1='Checked';
	value showerchair_mdro___2_ 0='Unchecked' 1='Checked';
	value showerchair_mdro___3_ 0='Unchecked' 1='Checked';
	value showerchair_mdro___4_ 0='Unchecked' 1='Checked';
	value ptcarewater_mdro___1_ 0='Unchecked' 1='Checked';
	value ptcarewater_mdro___2_ 0='Unchecked' 1='Checked';
	value ptcarewater_mdro___3_ 0='Unchecked' 1='Checked';
	value ptcarewater_mdro___4_ 0='Unchecked' 1='Checked';
	value woundmask_gas___1_ 0='Unchecked' 1='Checked';
	value woundmask_gas___2_ 0='Unchecked' 1='Checked';
	value woundmask_gas___3_ 0='Unchecked' 1='Checked';
	value reusable_gas___1_ 0='Unchecked' 1='Checked';
	value reusable_gas___2_ 0='Unchecked' 1='Checked';
	value reusable_gas___3_ 0='Unchecked' 1='Checked';
	value devices_disinf_gas___1_ 0='Unchecked' 1='Checked';
	value devices_disinf_gas___2_ 0='Unchecked' 1='Checked';
	value devices_disinf_gas___3_ 0='Unchecked' 1='Checked';
	value devices_disinf_gas___4_ 0='Unchecked' 1='Checked';
	value aware_gas___1_ 0='Unchecked' 1='Checked';
	value aware_gas___2_ 0='Unchecked' 1='Checked';
	value aware_gas___3_ 0='Unchecked' 1='Checked';
	value aware_gas___4_ 0='Unchecked' 1='Checked';
	value precautions_gas___1_ 0='Unchecked' 1='Checked';
	value precautions_gas___2_ 0='Unchecked' 1='Checked';
	value precautions_gas___3_ 0='Unchecked' 1='Checked';
	value precautions_gas___4_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___1_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___2_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___3_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___4_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___5_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___6_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___7_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___8_ 0='Unchecked' 1='Checked';
	value trans_signage_gas___9_ 0='Unchecked' 1='Checked';
	value ppe_supplies_gas___1_ 0='Unchecked' 1='Checked';
	value ppe_supplies_gas___2_ 0='Unchecked' 1='Checked';
	value ppe_supplies_gas___3_ 0='Unchecked' 1='Checked';
	value ppe_supplies_gas___4_ 0='Unchecked' 1='Checked';
	value semipriv_gas___1_ 0='Unchecked' 1='Checked';
	value semipriv_gas___2_ 0='Unchecked' 1='Checked';
	value semipriv_gas___3_ 0='Unchecked' 1='Checked';
	value semipriv_gas___4_ 0='Unchecked' 1='Checked';
	value tbp_change_gas___1_ 0='Unchecked' 1='Checked';
	value tbp_change_gas___2_ 0='Unchecked' 1='Checked';
	value tbp_change_gas___3_ 0='Unchecked' 1='Checked';
	value tbp_change_gas___4_ 0='Unchecked' 1='Checked';
	value resp_entrance_gas___1_ 0='Unchecked' 1='Checked';
	value resp_entrance_gas___2_ 0='Unchecked' 1='Checked';
	value resp_entrance_gas___3_ 0='Unchecked' 1='Checked';
	value resp_station_gas___1_ 0='Unchecked' 1='Checked';
	value resp_station_gas___2_ 0='Unchecked' 1='Checked';
	value resp_station_gas___3_ 0='Unchecked' 1='Checked';
	value resp_visitors_gas___1_ 0='Unchecked' 1='Checked';
	value resp_visitors_gas___2_ 0='Unchecked' 1='Checked';
	value resp_visitors_gas___3_ 0='Unchecked' 1='Checked';
	value resp_visitors_gas___4_ 0='Unchecked' 1='Checked';
	value sick_leave_gas___1_ 0='Unchecked' 1='Checked';
	value sick_leave_gas___2_ 0='Unchecked' 1='Checked';
	value sick_leave_gas___3_ 0='Unchecked' 1='Checked';
	value sick_leave_gas___4_ 0='Unchecked' 1='Checked';
	value resptreat_gas___1_ 0='Unchecked' 1='Checked';
	value resptreat_gas___2_ 0='Unchecked' 1='Checked';
	value resptreat_gas___3_ 0='Unchecked' 1='Checked';
	value resptreat_gas___4_ 0='Unchecked' 1='Checked';
	value resp_aseptic_gas___1_ 0='Unchecked' 1='Checked';
	value resp_aseptic_gas___2_ 0='Unchecked' 1='Checked';
	value resp_aseptic_gas___3_ 0='Unchecked' 1='Checked';
	value resp_aseptic_gas___4_ 0='Unchecked' 1='Checked';
	value trachcare_gas___1_ 0='Unchecked' 1='Checked';
	value trachcare_gas___2_ 0='Unchecked' 1='Checked';
	value trachcare_gas___3_ 0='Unchecked' 1='Checked';
	value trachcare_gas___4_ 0='Unchecked' 1='Checked';
	value trachcare_gas___5_ 0='Unchecked' 1='Checked';
	value resp_supplies_gas___1_ 0='Unchecked' 1='Checked';
	value resp_supplies_gas___2_ 0='Unchecked' 1='Checked';
	value resp_supplies_gas___3_ 0='Unchecked' 1='Checked';
	value resp_supplies_gas___4_ 0='Unchecked' 1='Checked';
	value disinfectequip_obs_gas___1_ 0='Unchecked' 1='Checked';
	value disinfectequip_obs_gas___2_ 0='Unchecked' 1='Checked';
	value disinfectequip_obs_gas___3_ 0='Unchecked' 1='Checked';
	value eqip_obs_gas___1_ 0='Unchecked' 1='Checked';
	value eqip_obs_gas___2_ 0='Unchecked' 1='Checked';
	value eqip_obs_gas___3_ 0='Unchecked' 1='Checked';
	value policy_disinf_gas___1_ 0='Unchecked' 1='Checked';
	value policy_disinf_gas___2_ 0='Unchecked' 1='Checked';
	value policy_disinf_gas___3_ 0='Unchecked' 1='Checked';
	value policy_disinf_gas___4_ 0='Unchecked' 1='Checked';
	value contact_disinf_gas___1_ 0='Unchecked' 1='Checked';
	value contact_disinf_gas___2_ 0='Unchecked' 1='Checked';
	value contact_disinf_gas___3_ 0='Unchecked' 1='Checked';
	value contact_disinf_gas___4_ 0='Unchecked' 1='Checked';
	value hightouch_disinf_gas___1_ 0='Unchecked' 1='Checked';
	value hightouch_disinf_gas___2_ 0='Unchecked' 1='Checked';
	value hightouch_disinf_gas___3_ 0='Unchecked' 1='Checked';
	value hightouch_disinf_gas___4_ 0='Unchecked' 1='Checked';
	value epa_disinf_gas___1_ 0='Unchecked' 1='Checked';
	value epa_disinf_gas___2_ 0='Unchecked' 1='Checked';
	value epa_disinf_gas___3_ 0='Unchecked' 1='Checked';
	value epa_disinf_gas___4_ 0='Unchecked' 1='Checked';
	value shower_disinf_gas___1_ 0='Unchecked' 1='Checked';
	value shower_disinf_gas___2_ 0='Unchecked' 1='Checked';
	value shower_disinf_gas___3_ 0='Unchecked' 1='Checked';
	value shower_disinf_gas___4_ 0='Unchecked' 1='Checked';
	value shower_disinf_gas___5_ 0='Unchecked' 1='Checked';
	value showindicate_disinf_gas___1_ 0='Unchecked' 1='Checked';
	value showindicate_disinf_gas___2_ 0='Unchecked' 1='Checked';
	value showindicate_disinf_gas___3_ 0='Unchecked' 1='Checked';
	value showindicate_disinf_gas___4_ 0='Unchecked' 1='Checked';
	value showindicate_disinf_gas___5_ 0='Unchecked' 1='Checked';
	value supp_disinf_gas___1_ 0='Unchecked' 1='Checked';
	value supp_disinf_gas___2_ 0='Unchecked' 1='Checked';
	value supp_disinf_gas___3_ 0='Unchecked' 1='Checked';
	value outbreak_management__v_9_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value disease_ob___1_ 0='Unchecked' 1='Checked';
	value disease_ob___2_ 0='Unchecked' 1='Checked';
	value disease_ob___3_ 0='Unchecked' 1='Checked';
	value disease_ob___4_ 0='Unchecked' 1='Checked';
	value disease_ob___5_ 0='Unchecked' 1='Checked';
	value disease_ob___6_ 0='Unchecked' 1='Checked';
	value disease_ob___7_ 0='Unchecked' 1='Checked';
	value disease_ob___8_ 0='Unchecked' 1='Checked';
	value disease_ob___9_ 0='Unchecked' 1='Checked';
	value contr_ob___1_ 0='Unchecked' 1='Checked';
	value contr_ob___2_ 0='Unchecked' 1='Checked';
	value contr_ob___3_ 0='Unchecked' 1='Checked';
	value contr_ob___4_ 0='Unchecked' 1='Checked';
	value contr_ob___5_ 0='Unchecked' 1='Checked';
	value contr_ob___6_ 0='Unchecked' 1='Checked';
	value contr_ob___7_ 0='Unchecked' 1='Checked';
	value contr_ob___8_ 0='Unchecked' 1='Checked';
	value contr_ob___9_ 0='Unchecked' 1='Checked';
	value contr_ob___10_ 0='Unchecked' 1='Checked';
	value contr_ob___11_ 0='Unchecked' 1='Checked';
	value lhd_ob___1_ 0='Unchecked' 1='Checked';
	value lhd_ob___2_ 0='Unchecked' 1='Checked';
	value lhd_ob___3_ 0='Unchecked' 1='Checked';
	value screen_ob___1_ 0='Unchecked' 1='Checked';
	value screen_ob___2_ 0='Unchecked' 1='Checked';
	value screen_ob___3_ 0='Unchecked' 1='Checked';
	value rec_ob___1_ 0='Unchecked' 1='Checked';
	value rec_ob___2_ 0='Unchecked' 1='Checked';
	value rec_ob___3_ 0='Unchecked' 1='Checked';
	value iso_ob___1_ 0='Unchecked' 1='Checked';
	value iso_ob___2_ 0='Unchecked' 1='Checked';
	value iso_ob___3_ 0='Unchecked' 1='Checked';
	value contacts_ob___1_ 0='Unchecked' 1='Checked';
	value contacts_ob___2_ 0='Unchecked' 1='Checked';
	value contacts_ob___3_ 0='Unchecked' 1='Checked';
	value precaut_ob___1_ 0='Unchecked' 1='Checked';
	value precaut_ob___2_ 0='Unchecked' 1='Checked';
	value precaut_ob___3_ 0='Unchecked' 1='Checked';
	value staff_ob___1_ 0='Unchecked' 1='Checked';
	value staff_ob___2_ 0='Unchecked' 1='Checked';
	value staff_ob___3_ 0='Unchecked' 1='Checked';
	value edu_ob___1_ 0='Unchecked' 1='Checked';
	value edu_ob___2_ 0='Unchecked' 1='Checked';
	value edu_ob___3_ 0='Unchecked' 1='Checked';
	value edu_ob___4_ 0='Unchecked' 1='Checked';
	value outbreak_management_complete_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value urincath_1___1_ 0='Unchecked' 1='Checked';
	value urincath_1___2_ 0='Unchecked' 1='Checked';
	value urincath_1___3_ 0='Unchecked' 1='Checked';
	value urincath_1___4_ 0='Unchecked' 1='Checked';
	value urincath_1___5_ 0='Unchecked' 1='Checked';
	value urincath_1___6_ 0='Unchecked' 1='Checked';
	value urincath_2___1_ 0='Unchecked' 1='Checked';
	value urincath_2___2_ 0='Unchecked' 1='Checked';
	value urincath_2___3_ 0='Unchecked' 1='Checked';
	value urincath_2___4_ 0='Unchecked' 1='Checked';
	value urincath_2___5_ 0='Unchecked' 1='Checked';
	value urincath_2___6_ 0='Unchecked' 1='Checked';
	value urincath_3___1_ 0='Unchecked' 1='Checked';
	value urincath_3___2_ 0='Unchecked' 1='Checked';
	value urincath_3___3_ 0='Unchecked' 1='Checked';
	value urincath_3___4_ 0='Unchecked' 1='Checked';
	value urincath_3___5_ 0='Unchecked' 1='Checked';
	value urincath_3___6_ 0='Unchecked' 1='Checked';
	value urincath_4___1_ 0='Unchecked' 1='Checked';
	value urincath_4___2_ 0='Unchecked' 1='Checked';
	value urincath_4___3_ 0='Unchecked' 1='Checked';
	value urincath_4___4_ 0='Unchecked' 1='Checked';
	value urincath_4___5_ 0='Unchecked' 1='Checked';
	value urincath_4___6_ 0='Unchecked' 1='Checked';
	value urincath_5___1_ 0='Unchecked' 1='Checked';
	value urincath_5___2_ 0='Unchecked' 1='Checked';
	value urincath_5___3_ 0='Unchecked' 1='Checked';
	value urincath_5___4_ 0='Unchecked' 1='Checked';
	value urincath_5___5_ 0='Unchecked' 1='Checked';
	value urincath_5___6_ 0='Unchecked' 1='Checked';
	value cl_1___1_ 0='Unchecked' 1='Checked';
	value cl_1___2_ 0='Unchecked' 1='Checked';
	value cl_1___3_ 0='Unchecked' 1='Checked';
	value cl_1___4_ 0='Unchecked' 1='Checked';
	value cl_1___5_ 0='Unchecked' 1='Checked';
	value cl_1___6_ 0='Unchecked' 1='Checked';
	value cl_1___7_ 0='Unchecked' 1='Checked';
	value cl_1___8_ 0='Unchecked' 1='Checked';
	value cl_2___1_ 0='Unchecked' 1='Checked';
	value cl_2___2_ 0='Unchecked' 1='Checked';
	value cl_2___3_ 0='Unchecked' 1='Checked';
	value cl_2___4_ 0='Unchecked' 1='Checked';
	value cl_2___5_ 0='Unchecked' 1='Checked';
	value cl_2___6_ 0='Unchecked' 1='Checked';
	value cl_2___7_ 0='Unchecked' 1='Checked';
	value cl_2___8_ 0='Unchecked' 1='Checked';
	value cl_3___1_ 0='Unchecked' 1='Checked';
	value cl_3___2_ 0='Unchecked' 1='Checked';
	value cl_3___3_ 0='Unchecked' 1='Checked';
	value cl_3___4_ 0='Unchecked' 1='Checked';
	value cl_3___5_ 0='Unchecked' 1='Checked';
	value cl_3___6_ 0='Unchecked' 1='Checked';
	value cl_3___7_ 0='Unchecked' 1='Checked';
	value cl_3___8_ 0='Unchecked' 1='Checked';
	value cl_4___1_ 0='Unchecked' 1='Checked';
	value cl_4___2_ 0='Unchecked' 1='Checked';
	value cl_4___3_ 0='Unchecked' 1='Checked';
	value cl_4___4_ 0='Unchecked' 1='Checked';
	value cl_4___5_ 0='Unchecked' 1='Checked';
	value cl_4___6_ 0='Unchecked' 1='Checked';
	value cl_4___7_ 0='Unchecked' 1='Checked';
	value cl_4___8_ 0='Unchecked' 1='Checked';
	value cl_5___1_ 0='Unchecked' 1='Checked';
	value cl_5___2_ 0='Unchecked' 1='Checked';
	value cl_5___3_ 0='Unchecked' 1='Checked';
	value cl_5___4_ 0='Unchecked' 1='Checked';
	value cl_5___5_ 0='Unchecked' 1='Checked';
	value cl_5___6_ 0='Unchecked' 1='Checked';
	value cl_5___7_ 0='Unchecked' 1='Checked';
	value cl_5___8_ 0='Unchecked' 1='Checked';
	value cld_1___1_ 0='Unchecked' 1='Checked';
	value cld_1___2_ 0='Unchecked' 1='Checked';
	value cld_1___3_ 0='Unchecked' 1='Checked';
	value cld_1___4_ 0='Unchecked' 1='Checked';
	value cld_1___5_ 0='Unchecked' 1='Checked';
	value cld_1___6_ 0='Unchecked' 1='Checked';
	value cld_1___7_ 0='Unchecked' 1='Checked';
	value cld_1___8_ 0='Unchecked' 1='Checked';
	value cld_1___9_ 0='Unchecked' 1='Checked';
	value cld_2___1_ 0='Unchecked' 1='Checked';
	value cld_2___2_ 0='Unchecked' 1='Checked';
	value cld_2___3_ 0='Unchecked' 1='Checked';
	value cld_2___4_ 0='Unchecked' 1='Checked';
	value cld_2___5_ 0='Unchecked' 1='Checked';
	value cld_2___6_ 0='Unchecked' 1='Checked';
	value cld_2___7_ 0='Unchecked' 1='Checked';
	value cld_2___8_ 0='Unchecked' 1='Checked';
	value cld_2___9_ 0='Unchecked' 1='Checked';
	value cld_3___1_ 0='Unchecked' 1='Checked';
	value cld_3___2_ 0='Unchecked' 1='Checked';
	value cld_3___3_ 0='Unchecked' 1='Checked';
	value cld_3___4_ 0='Unchecked' 1='Checked';
	value cld_3___5_ 0='Unchecked' 1='Checked';
	value cld_3___6_ 0='Unchecked' 1='Checked';
	value cld_3___7_ 0='Unchecked' 1='Checked';
	value cld_3___8_ 0='Unchecked' 1='Checked';
	value cld_3___9_ 0='Unchecked' 1='Checked';
	value tra_1___1_ 0='Unchecked' 1='Checked';
	value tra_1___2_ 0='Unchecked' 1='Checked';
	value tra_1___3_ 0='Unchecked' 1='Checked';
	value tra_1___4_ 0='Unchecked' 1='Checked';
	value tra_1___5_ 0='Unchecked' 1='Checked';
	value tra_1___6_ 0='Unchecked' 1='Checked';
	value tra_1___7_ 0='Unchecked' 1='Checked';
	value tra_1___8_ 0='Unchecked' 1='Checked';
	value tra_1___9_ 0='Unchecked' 1='Checked';
	value tra_2___1_ 0='Unchecked' 1='Checked';
	value tra_2___2_ 0='Unchecked' 1='Checked';
	value tra_2___3_ 0='Unchecked' 1='Checked';
	value tra_2___4_ 0='Unchecked' 1='Checked';
	value tra_2___5_ 0='Unchecked' 1='Checked';
	value tra_2___6_ 0='Unchecked' 1='Checked';
	value tra_2___7_ 0='Unchecked' 1='Checked';
	value tra_2___8_ 0='Unchecked' 1='Checked';
	value tra_2___9_ 0='Unchecked' 1='Checked';
	value tra_3___1_ 0='Unchecked' 1='Checked';
	value tra_3___2_ 0='Unchecked' 1='Checked';
	value tra_3___3_ 0='Unchecked' 1='Checked';
	value tra_3___4_ 0='Unchecked' 1='Checked';
	value tra_3___5_ 0='Unchecked' 1='Checked';
	value tra_3___6_ 0='Unchecked' 1='Checked';
	value tra_3___7_ 0='Unchecked' 1='Checked';
	value tra_3___8_ 0='Unchecked' 1='Checked';
	value tra_3___9_ 0='Unchecked' 1='Checked';
	value suc_1___1_ 0='Unchecked' 1='Checked';
	value suc_1___2_ 0='Unchecked' 1='Checked';
	value suc_1___3_ 0='Unchecked' 1='Checked';
	value suc_1___4_ 0='Unchecked' 1='Checked';
	value suc_1___5_ 0='Unchecked' 1='Checked';
	value suc_1___6_ 0='Unchecked' 1='Checked';
	value suc_1___7_ 0='Unchecked' 1='Checked';
	value suc_2___1_ 0='Unchecked' 1='Checked';
	value suc_2___2_ 0='Unchecked' 1='Checked';
	value suc_2___3_ 0='Unchecked' 1='Checked';
	value suc_2___4_ 0='Unchecked' 1='Checked';
	value suc_2___5_ 0='Unchecked' 1='Checked';
	value suc_2___6_ 0='Unchecked' 1='Checked';
	value suc_2___7_ 0='Unchecked' 1='Checked';
	value suc_3___1_ 0='Unchecked' 1='Checked';
	value suc_3___2_ 0='Unchecked' 1='Checked';
	value suc_3___3_ 0='Unchecked' 1='Checked';
	value suc_3___4_ 0='Unchecked' 1='Checked';
	value suc_3___5_ 0='Unchecked' 1='Checked';
	value suc_3___6_ 0='Unchecked' 1='Checked';
	value suc_3___7_ 0='Unchecked' 1='Checked';
	value device_care_observat_v_10_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value wound_obs1___1_ 0='Unchecked' 1='Checked';
	value wound_obs1___2_ 0='Unchecked' 1='Checked';
	value wound_obs1___3_ 0='Unchecked' 1='Checked';
	value wound_obs1___4_ 0='Unchecked' 1='Checked';
	value wound_obs1___5_ 0='Unchecked' 1='Checked';
	value wound_obs1___6_ 0='Unchecked' 1='Checked';
	value wound_obs1___7_ 0='Unchecked' 1='Checked';
	value wound_obs1___8_ 0='Unchecked' 1='Checked';
	value wound_obs1___9_ 0='Unchecked' 1='Checked';
	value wound_obs1___10_ 0='Unchecked' 1='Checked';
	value wound_obs1___11_ 0='Unchecked' 1='Checked';
	value wound_obs1___12_ 0='Unchecked' 1='Checked';
	value wound_obs1___13_ 0='Unchecked' 1='Checked';
	value wound_obs1___14_ 0='Unchecked' 1='Checked';
	value wound_obs2___1_ 0='Unchecked' 1='Checked';
	value wound_obs2___2_ 0='Unchecked' 1='Checked';
	value wound_obs2___3_ 0='Unchecked' 1='Checked';
	value wound_obs2___4_ 0='Unchecked' 1='Checked';
	value wound_obs2___5_ 0='Unchecked' 1='Checked';
	value wound_obs2___6_ 0='Unchecked' 1='Checked';
	value wound_obs2___7_ 0='Unchecked' 1='Checked';
	value wound_obs2___8_ 0='Unchecked' 1='Checked';
	value wound_obs2___9_ 0='Unchecked' 1='Checked';
	value wound_obs2___10_ 0='Unchecked' 1='Checked';
	value wound_obs2___11_ 0='Unchecked' 1='Checked';
	value wound_obs2___12_ 0='Unchecked' 1='Checked';
	value wound_obs2___13_ 0='Unchecked' 1='Checked';
	value wound_obs2___14_ 0='Unchecked' 1='Checked';
	value wound_obs3___1_ 0='Unchecked' 1='Checked';
	value wound_obs3___2_ 0='Unchecked' 1='Checked';
	value wound_obs3___3_ 0='Unchecked' 1='Checked';
	value wound_obs3___4_ 0='Unchecked' 1='Checked';
	value wound_obs3___5_ 0='Unchecked' 1='Checked';
	value wound_obs3___6_ 0='Unchecked' 1='Checked';
	value wound_obs3___7_ 0='Unchecked' 1='Checked';
	value wound_obs3___8_ 0='Unchecked' 1='Checked';
	value wound_obs3___9_ 0='Unchecked' 1='Checked';
	value wound_obs3___10_ 0='Unchecked' 1='Checked';
	value wound_obs3___11_ 0='Unchecked' 1='Checked';
	value wound_obs3___12_ 0='Unchecked' 1='Checked';
	value wound_obs3___13_ 0='Unchecked' 1='Checked';
	value wound_obs3___14_ 0='Unchecked' 1='Checked';
	value wound_care_observati_v_11_ 0='Incomplete' 1='Unverified' 
		2='Complete';

	run;

data work.redcap; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat record_id $500. ;
	informat assessor___1 best32. ;
	informat assessor___2 best32. ;
	informat assessor___3 best32. ;
	informat assessor___4 best32. ;
	informat assessor___5 best32. ;
	informat assessor___6 best32. ;
	informat assessor___7 best32. ;
	informat assessor___8 best32. ;
	informat assessor___9 best32. ;
	informat assessor___10 best32. ;
	informat date yymmdd10. ;
	informat time time5. ;
	informat visit_remote best32. ;
	informat reason___1 best32. ;
	informat reason___2 best32. ;
	informat reason___3 best32. ;
	informat reason___4 best32. ;
	informat reason___5 best32. ;
	informat reason___6 best32. ;
	informat reason___7 best32. ;
	informat outbreak_type___1 best32. ;
	informat outbreak_type___2 best32. ;
	informat outbreak_type___3 best32. ;
	informat outbreak_type___4 best32. ;
	informat outbreak_type___5 best32. ;
	informat outbreak_type___6 best32. ;
	informat outbreak_type___7 best32. ;
	informat outbreak_mdro___1 best32. ;
	informat outbreak_mdro___2 best32. ;
	informat outbreak_mdro___3 best32. ;
	informat outbreak_mdro___4 best32. ;
	informat outbreak_mdro___5 best32. ;
	informat outbreak_mdro_number $500. ;
	informat reason_expand $5000. ;
	informat facility_name $500. ;
	informat facility_county best32. ;
	informat facility_zip $500. ;
	informat ripsvisit best32. ;
	informat facility_type___1 best32. ;
	informat facility_type___2 best32. ;
	informat facility_type___3 best32. ;
	informat facility_type___4 best32. ;
	informat facility_type___5 best32. ;
	informat facility_type___6 best32. ;
	informat facility_type___7 best32. ;
	informat facility_type___8 best32. ;
	informat facility_type___9 best32. ;
	informat facility_type___10 best32. ;
	informat facility_type___11 best32. ;
	informat facility_type___12 best32. ;
	informat facility_type___13 best32. ;
	informat facility_type___14 best32. ;
	informat facility_type___15 best32. ;
	informat facility_type___16 best32. ;
	informat facility_type___17 best32. ;
	informat facility_type___18 best32. ;
	informat facility_type___19 best32. ;
	informat facility_type___20 best32. ;
	informat contact_facility $500. ;
	informat contact_title_facility $500. ;
	informat email_facility $500. ;
	informat phone_facility $500. ;
	informat beds_facility $500. ;
	informat license_number $500. ;
	informat ccn $500. ;
	informat nshn_number $500. ;
	informat system_facility best32. ;
	informat system $500. ;
	informat full_ip best32. ;
	informat ip_hours best32. ;
	informat ip best32. ;
	informat ip_name $500. ;
	informat ip_phone $500. ;
	informat ip_email $500. ;
	informat ip_training___1 best32. ;
	informat ip_training___2 best32. ;
	informat ip_training___3 best32. ;
	informat ip_training___4 best32. ;
	informat facility_information_complete best32. ;
	informat report_list___1 best32. ;
	informat report_list___2 best32. ;
	informat report_list___3 best32. ;
	informat report_list___4 best32. ;
	informat ph_contact___1 best32. ;
	informat ph_contact___2 best32. ;
	informat ph_contact___3 best32. ;
	informat ph_contact___4 best32. ;
	informat comm_infect___1 best32. ;
	informat comm_infect___2 best32. ;
	informat comm_infect___3 best32. ;
	informat comm_infect___4 best32. ;
	informat infect_intake___1 best32. ;
	informat infect_intake___2 best32. ;
	informat infect_intake___3 best32. ;
	informat infect_intake___4 best32. ;
	informat ip_policies___1 best32. ;
	informat ip_policies___2 best32. ;
	informat ip_policies___3 best32. ;
	informat ip_policies___4 best32. ;
	informat ip_policies___5 best32. ;
	informat policies_reviewed___1 best32. ;
	informat policies_reviewed___2 best32. ;
	informat policies_reviewed___3 best32. ;
	informat policies_reviewed___4 best32. ;
	informat lab_notif___1 best32. ;
	informat lab_notif___2 best32. ;
	informat lab_notif___3 best32. ;
	informat lab_notif___4 best32. ;
	informat infect_monitoring___1 best32. ;
	informat infect_monitoring___2 best32. ;
	informat infect_monitoring___3 best32. ;
	informat infect_monitoring___4 best32. ;
	informat ip_process___1 best32. ;
	informat ip_process___2 best32. ;
	informat ip_process___3 best32. ;
	informat ip_process___4 best32. ;
	informat outbreak_response___1 best32. ;
	informat outbreak_response___2 best32. ;
	informat outbreak_response___3 best32. ;
	informat outbreak_response___4 best32. ;
	informat resp_program___1 best32. ;
	informat resp_program___2 best32. ;
	informat resp_program___3 best32. ;
	informat resp_program___4 best32. ;
	informat emergency_plan___1 best32. ;
	informat emergency_plan___2 best32. ;
	informat emergency_plan___3 best32. ;
	informat emergency_plan___4 best32. ;
	informat riskassess___1 best32. ;
	informat riskassess___2 best32. ;
	informat riskassess___3 best32. ;
	informat riskassess___4 best32. ;
	informat respetc_site___1 best32. ;
	informat respetc_site___2 best32. ;
	informat respetc_site___3 best32. ;
	informat prepare_strategies $5000. ;
	informat expand_safety $5000. ;
	informat work_exclusions___1 best32. ;
	informat work_exclusions___2 best32. ;
	informat work_exclusions___3 best32. ;
	informat work_exclusions___4 best32. ;
	informat tb_hire___1 best32. ;
	informat tb_hire___2 best32. ;
	informat tb_hire___3 best32. ;
	informat tb_hire___4 best32. ;
	informat tb_risk___1 best32. ;
	informat tb_risk___2 best32. ;
	informat tb_risk___3 best32. ;
	informat tb_risk___4 best32. ;
	informat bloodborne_plan___1 best32. ;
	informat bloodborne_plan___2 best32. ;
	informat bloodborne_plan___3 best32. ;
	informat bloodborne_plan___4 best32. ;
	informat hepb_vac___1 best32. ;
	informat hepb_vac___2 best32. ;
	informat hepb_vac___3 best32. ;
	informat hepb_vac___4 best32. ;
	informat annual_flu___1 best32. ;
	informat annual_flu___2 best32. ;
	informat annual_flu___3 best32. ;
	informat annual_flu___4 best32. ;
	informat annual_covid___1 best32. ;
	informat annual_covid___2 best32. ;
	informat annual_covid___3 best32. ;
	informat annual_covid___4 best32. ;
	informat vac_record___1 best32. ;
	informat vac_record___2 best32. ;
	informat vac_record___3 best32. ;
	informat vac_record___4 best32. ;
	informat tb_patient___1 best32. ;
	informat tb_patient___2 best32. ;
	informat tb_patient___3 best32. ;
	informat tb_patient___4 best32. ;
	informat tb_patient___5 best32. ;
	informat offer_vac___1 best32. ;
	informat offer_vac___2 best32. ;
	informat offer_vac___3 best32. ;
	informat offer_vac___4 best32. ;
	informat vac_edu___1 best32. ;
	informat vac_edu___2 best32. ;
	informat vac_edu___3 best32. ;
	informat vac_edu___4 best32. ;
	informat indiv_antistew___1 best32. ;
	informat indiv_antistew___2 best32. ;
	informat indiv_antistew___3 best32. ;
	informat indiv_antistew___4 best32. ;
	informat indiv_antistew___5 best32. ;
	informat indiv_antistew___6 best32. ;
	informat other_antistew $500. ;
	informat spice_referral best32. ;
	informat operations_notes $5000. ;
	informat employee_and_patient_v_0 best32. ;
	informat ip_education___1 best32. ;
	informat ip_education___2 best32. ;
	informat ip_education___3 best32. ;
	informat ip_education___4 best32. ;
	informat ip_education___5 best32. ;
	informat ip_education___6 best32. ;
	informat ip_education___7 best32. ;
	informat ip_education___8 best32. ;
	informat ip_education___9 best32. ;
	informat ip_education___10 best32. ;
	informat competency___1 best32. ;
	informat competency___2 best32. ;
	informat competency___3 best32. ;
	informat competency___4 best32. ;
	informat competency___5 best32. ;
	informat demonstrateskills___1 best32. ;
	informat demonstrateskills___2 best32. ;
	informat demonstrateskills___3 best32. ;
	informat demonstrateskills___4 best32. ;
	informat demonstrateskills___5 best32. ;
	informat demonstrateskills___6 best32. ;
	informat demonstrateskills___7 best32. ;
	informat demonstrateskills___8 best32. ;
	informat testtopics___1 best32. ;
	informat testtopics___2 best32. ;
	informat testtopics___3 best32. ;
	informat testtopics___4 best32. ;
	informat testtopics___5 best32. ;
	informat testtopics___6 best32. ;
	informat testtopics___7 best32. ;
	informat testtopics___8 best32. ;
	informat annualskills___1 best32. ;
	informat annualskills___2 best32. ;
	informat annualskills___3 best32. ;
	informat annualskills___4 best32. ;
	informat annualskills___5 best32. ;
	informat annualskills___6 best32. ;
	informat annualskills___7 best32. ;
	informat annualskills___8 best32. ;
	informat audits___1 best32. ;
	informat audits___2 best32. ;
	informat audits___3 best32. ;
	informat audits___4 best32. ;
	informat audits___5 best32. ;
	informat audits___6 best32. ;
	informat audits___7 best32. ;
	informat audits___8 best32. ;
	informat audits___9 best32. ;
	informat hh_audits best32. ;
	informat audit_ppe best32. ;
	informat audit_cleandisinf best32. ;
	informat audit_injectsafety best32. ;
	informat audit_poc best32. ;
	informat audit_repro best32. ;
	informat audits_feedback___1 best32. ;
	informat audits_feedback___2 best32. ;
	informat audits_feedback___3 best32. ;
	informat audits_feedback___4 best32. ;
	informat audits_feedback___5 best32. ;
	informat audits_feedback___6 best32. ;
	informat traningaudits_notes $5000. ;
	informat trainingaudits_complete best32. ;
	informat hh_policies___1 best32. ;
	informat hh_policies___2 best32. ;
	informat hh_policies___3 best32. ;
	informat hh_policies___4 best32. ;
	informat hh_expectations___1 best32. ;
	informat hh_expectations___2 best32. ;
	informat hh_expectations___3 best32. ;
	informat hh_expectations___4 best32. ;
	informat hh_expectations___5 best32. ;
	informat hh_expectations___6 best32. ;
	informat hh_expectations___7 best32. ;
	informat hh_expectations___8 best32. ;
	informat hh_expectations___9 best32. ;
	informat hh_inout___1 best32. ;
	informat hh_inout___2 best32. ;
	informat hh_inout___3 best32. ;
	informat hh_sinkavail___1 best32. ;
	informat hh_sinkavail___2 best32. ;
	informat hh_sinkavail___3 best32. ;
	informat hh_sinkavail___4 best32. ;
	informat hh_soapwater___1 best32. ;
	informat hh_soapwater___2 best32. ;
	informat hh_soapwater___3 best32. ;
	informat hh_soapwater___4 best32. ;
	informat hh_soapwater___5 best32. ;
	informat hh_soapwater___6 best32. ;
	informat hh_throughout___1 best32. ;
	informat hh_throughout___2 best32. ;
	informat hh_throughout___3 best32. ;
	informat hh_pocket___1 best32. ;
	informat hh_pocket___2 best32. ;
	informat hh_pocket___3 best32. ;
	informat hh_pocket___4 best32. ;
	informat hh_only___1 best32. ;
	informat hh_only___2 best32. ;
	informat hh_only___3 best32. ;
	informat hh_only___4 best32. ;
	informat hh_supplies___1 best32. ;
	informat hh_supplies___2 best32. ;
	informat hh_supplies___3 best32. ;
	informat hh_lotion___1 best32. ;
	informat hh_lotion___2 best32. ;
	informat hh_lotion___3 best32. ;
	informat hh_lotion___4 best32. ;
	informat hh_lotion___5 best32. ;
	informat hh_nails___1 best32. ;
	informat hh_nails___2 best32. ;
	informat hh_nails___3 best32. ;
	informat hh_nails___4 best32. ;
	informat patienthh___1 best32. ;
	informat patienthh___2 best32. ;
	informat patienthh___3 best32. ;
	informat patienthh___4 best32. ;
	informat patienthh___5 best32. ;
	informat expand_hh $5000. ;
	informat hand_hygiene_complete best32. ;
	informat hh_1 best32. ;
	informat hh_2 best32. ;
	informat hh_3 best32. ;
	informat hh_4 best32. ;
	informat hh_5 best32. ;
	informat hh_6 best32. ;
	informat hh_7 best32. ;
	informat hh_8 best32. ;
	informat hh_9 best32. ;
	informat hh_10 best32. ;
	informat expand_hhobs $5000. ;
	informat hand_hygiene_observa_v_1 best32. ;
	informat transmission_policy___1 best32. ;
	informat transmission_policy___2 best32. ;
	informat transmission_policy___3 best32. ;
	informat transmission_policy___4 best32. ;
	informat trans_signage___1 best32. ;
	informat trans_signage___2 best32. ;
	informat trans_signage___3 best32. ;
	informat trans_signage___4 best32. ;
	informat trans_signage___5 best32. ;
	informat trans_signage___6 best32. ;
	informat trans_signage___7 best32. ;
	informat trans_signage___8 best32. ;
	informat trans_signage___9 best32. ;
	informat ppe_supplies___1 best32. ;
	informat ppe_supplies___2 best32. ;
	informat ppe_supplies___3 best32. ;
	informat semipriv___1 best32. ;
	informat semipriv___2 best32. ;
	informat semipriv___3 best32. ;
	informat semipriv___4 best32. ;
	informat tbp_admit___1 best32. ;
	informat tbp_admit___2 best32. ;
	informat tbp_admit___3 best32. ;
	informat tbp_admit___4 best32. ;
	informat tbp_transfer___1 best32. ;
	informat tbp_transfer___2 best32. ;
	informat tbp_transfer___3 best32. ;
	informat tbp_transfer___4 best32. ;
	informat tbp_change___1 best32. ;
	informat tbp_change___2 best32. ;
	informat tbp_change___3 best32. ;
	informat tbp_change___4 best32. ;
	informat ebp_identify___1 best32. ;
	informat ebp_identify___2 best32. ;
	informat ebp_identify___3 best32. ;
	informat ebp_identify___4 best32. ;
	informat trans_signforclean___1 best32. ;
	informat trans_signforclean___2 best32. ;
	informat trans_signforclean___3 best32. ;
	informat trans_signforclean___4 best32. ;
	informat resp_entrance___1 best32. ;
	informat resp_entrance___2 best32. ;
	informat resp_entrance___3 best32. ;
	informat resp_station___1 best32. ;
	informat resp_station___2 best32. ;
	informat resp_station___3 best32. ;
	informat resp_visitors___1 best32. ;
	informat resp_visitors___2 best32. ;
	informat resp_visitors___3 best32. ;
	informat resp_visitors___4 best32. ;
	informat fit_testing___1 best32. ;
	informat fit_testing___2 best32. ;
	informat fit_testing___3 best32. ;
	informat fit_testing___4 best32. ;
	informat expand_transmissionbased $5000. ;
	informat standard_and_transmi_v_2 best32. ;
	informat prec_obs___1 best32. ;
	informat prec_obs___2 best32. ;
	informat prec_obs___3 best32. ;
	informat expand_prec_obs $5000. ;
	informat don_obs___1 best32. ;
	informat don_obs___2 best32. ;
	informat don_obs___3 best32. ;
	informat expand_don_obs $5000. ;
	informat doff_obs___1 best32. ;
	informat doff_obs___2 best32. ;
	informat doff_obs___3 best32. ;
	informat expand_doff_obs $5000. ;
	informat aiir_obs___1 best32. ;
	informat aiir_obs___2 best32. ;
	informat aiir_obs___3 best32. ;
	informat aiir_obs___4 best32. ;
	informat aiir_obs___5 best32. ;
	informat aiir_obs___6 best32. ;
	informat expand_aiir_obs $5000. ;
	informat priv_obs___1 best32. ;
	informat priv_obs___2 best32. ;
	informat priv_obs___3 best32. ;
	informat priv_obs___4 best32. ;
	informat expand_priv_obs $5000. ;
	informat stand_obs $5000. ;
	informat expand_precobs $5000. ;
	informat standard_and_transmi_v_3 best32. ;
	informat policy_disinf___1 best32. ;
	informat policy_disinf___2 best32. ;
	informat policy_disinf___3 best32. ;
	informat policy_disinf___4 best32. ;
	informat contact_disinf___1 best32. ;
	informat contact_disinf___2 best32. ;
	informat contact_disinf___3 best32. ;
	informat contact_disinf___4 best32. ;
	informat hightouch_disinf___1 best32. ;
	informat hightouch_disinf___2 best32. ;
	informat hightouch_disinf___3 best32. ;
	informat hightouch_disinf___4 best32. ;
	informat room_disinf___1 best32. ;
	informat room_disinf___2 best32. ;
	informat room_disinf___3 best32. ;
	informat room_disinf___4 best32. ;
	informat epa_disinf___1 best32. ;
	informat epa_disinf___2 best32. ;
	informat epa_disinf___3 best32. ;
	informat epa_disinf___4 best32. ;
	informat equip_disinf___1 best32. ;
	informat equip_disinf___2 best32. ;
	informat equip_disinf___3 best32. ;
	informat equip_disinf___4 best32. ;
	informat gluc_disinf___1 best32. ;
	informat gluc_disinf___2 best32. ;
	informat gluc_disinf___3 best32. ;
	informat gluc_disinf___4 best32. ;
	informat disinf_glucavail___1 best32. ;
	informat disinf_glucavail___2 best32. ;
	informat disinf_glucavail___3 best32. ;
	informat gluc_disinfection_2___1 best32. ;
	informat gluc_disinfection_2___2 best32. ;
	informat gluc_disinfection_2___3 best32. ;
	informat gluc_disinfection_2___4 best32. ;
	informat shower_disinf___1 best32. ;
	informat shower_disinf___2 best32. ;
	informat shower_disinf___3 best32. ;
	informat shower_disinf___4 best32. ;
	informat shower_disinf___5 best32. ;
	informat showindicate_disinf___1 best32. ;
	informat showindicate_disinf___2 best32. ;
	informat showindicate_disinf___3 best32. ;
	informat showindicate_disinf___4 best32. ;
	informat showindicate_disinf___5 best32. ;
	informat supp_disinf___1 best32. ;
	informat supp_disinf___2 best32. ;
	informat supp_disinf___3 best32. ;
	informat devices_disinf best32. ;
	informat expand_envircleaning $5000. ;
	informat environmental_cleani_v_4 best32. ;
	informat hhprod_obs___1 best32. ;
	informat hhprod_obs___2 best32. ;
	informat hhprod_obs___3 best32. ;
	informat resp_signage_obs___1 best32. ;
	informat resp_signage_obs___2 best32. ;
	informat resp_signage_obs___3 best32. ;
	informat gen_obs___1 best32. ;
	informat gen_obs___2 best32. ;
	informat gen_obs___3 best32. ;
	informat expand_gen_obs $5000. ;
	informat sink_obs___1 best32. ;
	informat sink_obs___2 best32. ;
	informat sink_obs___3 best32. ;
	informat expand_sink_obs $5000. ;
	informat undersink_obs___1 best32. ;
	informat undersink_obs___2 best32. ;
	informat undersink_obs___3 best32. ;
	informat expand_undersink_obs $5000. ;
	informat cleansupp_obs___1 best32. ;
	informat cleansupp_obs___2 best32. ;
	informat cleansupp_obs___3 best32. ;
	informat expand_cleansupp_obs $5000. ;
	informat sharpstor_obs best32. ;
	informat expand_sharpstor_obs $5000. ;
	informat cleandirty_obs___1 best32. ;
	informat cleandirty_obs___2 best32. ;
	informat cleandirty_obs___3 best32. ;
	informat expand_cleandirty_obs $5000. ;
	informat disinfectequip_obs___1 best32. ;
	informat disinfectequip_obs___2 best32. ;
	informat disinfectequip_obs___3 best32. ;
	informat eqip_obs___1 best32. ;
	informat eqip_obs___2 best32. ;
	informat eqip_obs___3 best32. ;
	informat expand_eqip_obs $5000. ;
	informat coverlinen_obs___1 best32. ;
	informat coverlinen_obs___2 best32. ;
	informat coverlinen_obs___3 best32. ;
	informat expand_coverlinen_obs $5000. ;
	informat soiled_obs___1 best32. ;
	informat soiled_obs___2 best32. ;
	informat soiled_obs___3 best32. ;
	informat expand_soiled_obs $5000. ;
	informat sharps_obs___1 best32. ;
	informat sharps_obs___2 best32. ;
	informat sharps_obs___3 best32. ;
	informat medprep_obs___1 best32. ;
	informat medprep_obs___2 best32. ;
	informat medprep_obs___3 best32. ;
	informat expand_medprep_obs $5000. ;
	informat expir_obs___1 best32. ;
	informat expir_obs___2 best32. ;
	informat expir_obs___3 best32. ;
	informat expand_expir_obs $5000. ;
	informat expand_envirobs $5000. ;
	informat environmental_observ_v_5 best32. ;
	informat gluc_disinf_2___1 best32. ;
	informat gluc_disinf_2___2 best32. ;
	informat gluc_disinf_2___3 best32. ;
	informat gluc_disinf_2___4 best32. ;
	informat disinf_glucavail_2___1 best32. ;
	informat disinf_glucavail_2___2 best32. ;
	informat disinf_glucavail_2___3 best32. ;
	informat gluc_disinfection___1 best32. ;
	informat gluc_disinfection___2 best32. ;
	informat gluc_disinfection___3 best32. ;
	informat gluc_disinfection___4 best32. ;
	informat gluc_supplies___1 best32. ;
	informat gluc_supplies___2 best32. ;
	informat gluc_supplies___3 best32. ;
	informat gluc_supplies___4 best32. ;
	informat stor_gluc___1 best32. ;
	informat stor_gluc___2 best32. ;
	informat stor_gluc___3 best32. ;
	informat insulin_pens___1 best32. ;
	informat insulin_pens___2 best32. ;
	informat insulin_pens___3 best32. ;
	informat insulin_storage___1 best32. ;
	informat insulin_storage___2 best32. ;
	informat insulin_storage___3 best32. ;
	informat inject_policy___1 best32. ;
	informat inject_policy___2 best32. ;
	informat inject_policy___3 best32. ;
	informat inject_policy___4 best32. ;
	informat one_time_syringe___1 best32. ;
	informat one_time_syringe___2 best32. ;
	informat one_time_syringe___3 best32. ;
	informat one_time_syringe___4 best32. ;
	informat single_dose___1 best32. ;
	informat single_dose___2 best32. ;
	informat single_dose___3 best32. ;
	informat single_dose___4 best32. ;
	informat multi_dose___1 best32. ;
	informat multi_dose___2 best32. ;
	informat multi_dose___3 best32. ;
	informat multi_dose___4 best32. ;
	informat gloves_inject___1 best32. ;
	informat gloves_inject___2 best32. ;
	informat gloves_inject___3 best32. ;
	informat gloves_inject___4 best32. ;
	informat diversion_policy___1 best32. ;
	informat diversion_policy___2 best32. ;
	informat diversion_policy___3 best32. ;
	informat diversion_policy___4 best32. ;
	informat expand_injectmed $5000. ;
	informat infectionmedication__v_6 best32. ;
	informat glu_1___1 best32. ;
	informat glu_1___2 best32. ;
	informat glu_1___3 best32. ;
	informat glu_1___4 best32. ;
	informat glu_1___5 best32. ;
	informat glu_1___6 best32. ;
	informat glu_1___7 best32. ;
	informat glu_2___1 best32. ;
	informat glu_2___2 best32. ;
	informat glu_2___3 best32. ;
	informat glu_2___4 best32. ;
	informat glu_2___5 best32. ;
	informat glu_2___6 best32. ;
	informat glu_2___7 best32. ;
	informat glu_3___1 best32. ;
	informat glu_3___2 best32. ;
	informat glu_3___3 best32. ;
	informat glu_3___4 best32. ;
	informat glu_3___5 best32. ;
	informat glu_3___6 best32. ;
	informat glu_3___7 best32. ;
	informat glu_4___1 best32. ;
	informat glu_4___2 best32. ;
	informat glu_4___3 best32. ;
	informat glu_4___4 best32. ;
	informat glu_4___5 best32. ;
	informat glu_4___6 best32. ;
	informat glu_4___7 best32. ;
	informat glu_5___1 best32. ;
	informat glu_5___2 best32. ;
	informat glu_5___3 best32. ;
	informat glu_5___4 best32. ;
	informat glu_5___5 best32. ;
	informat glu_5___6 best32. ;
	informat glu_5___7 best32. ;
	informat notes_glu_obs $5000. ;
	informat assisted_blood_gluco_v_7 best32. ;
	informat sterilization_loc___1 best32. ;
	informat sterilization_loc___2 best32. ;
	informat sterilization_loc___3 best32. ;
	informat sterilization_loc___4 best32. ;
	informat sterilization_loc___5 best32. ;
	informat iuss___1 best32. ;
	informat iuss___2 best32. ;
	informat iuss___3 best32. ;
	informat iuss___4 best32. ;
	informat hld_loc___1 best32. ;
	informat hld_loc___2 best32. ;
	informat hld_loc___3 best32. ;
	informat hld_loc___4 best32. ;
	informat hld_loc___5 best32. ;
	informat critical_item___1 best32. ;
	informat critical_item___2 best32. ;
	informat critical_item___3 best32. ;
	informat critical_item___4 best32. ;
	informat hld_items___1 best32. ;
	informat hld_items___2 best32. ;
	informat hld_items___3 best32. ;
	informat hld_items___4 best32. ;
	informat single_items___1 best32. ;
	informat single_items___2 best32. ;
	informat single_items___3 best32. ;
	informat single_items___4 best32. ;
	informat expand_sterildisinf $5000. ;
	informat sterilizationdisinfe_v_8 best32. ;
	informat laundry___1 best32. ;
	informat laundry___2 best32. ;
	informat laundry___3 best32. ;
	informat laundry___4 best32. ;
	informat bag_laund___1 best32. ;
	informat bag_laund___2 best32. ;
	informat bag_laund___3 best32. ;
	informat bag_laund___4 best32. ;
	informat trans_laund___1 best32. ;
	informat trans_laund___2 best32. ;
	informat trans_laund___3 best32. ;
	informat trans_laund___4 best32. ;
	informat store_laund___1 best32. ;
	informat store_laund___2 best32. ;
	informat store_laund___3 best32. ;
	informat store_laund___4 best32. ;
	informat supp_laund___1 best32. ;
	informat supp_laund___2 best32. ;
	informat supp_laund___3 best32. ;
	informat clean_laund___1 best32. ;
	informat clean_laund___2 best32. ;
	informat clean_laund___3 best32. ;
	informat expand_healthlaund $5000. ;
	informat healthcare_laundry_complete best32. ;
	informat ob_type___1 best32. ;
	informat ob_type___2 best32. ;
	informat ob_type___3 best32. ;
	informat ob_type___4 best32. ;
	informat ob_type___5 best32. ;
	informat ob_type___6 best32. ;
	informat aware_covid___1 best32. ;
	informat aware_covid___2 best32. ;
	informat aware_covid___3 best32. ;
	informat aware_covid___4 best32. ;
	informat signs_covid___1 best32. ;
	informat signs_covid___2 best32. ;
	informat signs_covid___4 best32. ;
	informat resp_entrance_covid___1 best32. ;
	informat resp_entrance_covid___2 best32. ;
	informat resp_entrance_covid___4 best32. ;
	informat resp_visitors_covid___1 best32. ;
	informat resp_visitors_covid___2 best32. ;
	informat resp_visitors_covid___3 best32. ;
	informat resp_visitors_covid___4 best32. ;
	informat visitors_hh_covid___1 best32. ;
	informat visitors_hh_covid___2 best32. ;
	informat visitors_hh_covid___3 best32. ;
	informat visitors_hh_covid___4 best32. ;
	informat resp_station_covid___1 best32. ;
	informat resp_station_covid___2 best32. ;
	informat resp_station_covid___4 best32. ;
	informat signage_covid___1 best32. ;
	informat signage_covid___2 best32. ;
	informat signage_covid___4 best32. ;
	informat sick_leave_covid___1 best32. ;
	informat sick_leave_covid___2 best32. ;
	informat sick_leave_covid___3 best32. ;
	informat sick_leave_covid___4 best32. ;
	informat return_work_covid___1 best32. ;
	informat return_work_covid___2 best32. ;
	informat return_work_covid___3 best32. ;
	informat return_work_covid___4 best32. ;
	informat ppe_covid___1 best32. ;
	informat ppe_covid___2 best32. ;
	informat ppe_covid___3 best32. ;
	informat ppe_covid___4 best32. ;
	informat tbp_signage_covid___1 best32. ;
	informat tbp_signage_covid___2 best32. ;
	informat tbp_signage_covid___4 best32. ;
	informat fit_testing_covid___1 best32. ;
	informat fit_testing_covid___2 best32. ;
	informat fit_testing_covid___3 best32. ;
	informat fit_testing_covid___4 best32. ;
	informat ppe_pou_covid___1 best32. ;
	informat ppe_pou_covid___2 best32. ;
	informat ppe_pou_covid___4 best32. ;
	informat disposable_masks_covid___1 best32. ;
	informat disposable_masks_covid___2 best32. ;
	informat disposable_masks_covid___3 best32. ;
	informat disposable_masks_covid___4 best32. ;
	informat staff_tbp_covid___1 best32. ;
	informat staff_tbp_covid___2 best32. ;
	informat staff_tbp_covid___4 best32. ;
	informat residents_tbp_covid___1 best32. ;
	informat residents_tbp_covid___2 best32. ;
	informat residents_tbp_covid___3 best32. ;
	informat residents_tbp_covid___4 best32. ;
	informat private_rooms_covid___1 best32. ;
	informat private_rooms_covid___2 best32. ;
	informat private_rooms_covid___3 best32. ;
	informat private_rooms_covid___4 best32. ;
	informat hh_audits_covid___1 best32. ;
	informat hh_audits_covid___2 best32. ;
	informat hh_audits_covid___3 best32. ;
	informat hh_audits_covid___4 best32. ;
	informat ppe_audits_covid___1 best32. ;
	informat ppe_audits_covid___2 best32. ;
	informat ppe_audits_covid___3 best32. ;
	informat ppe_audits_covid___4 best32. ;
	informat precautions_covid___1 best32. ;
	informat precautions_covid___2 best32. ;
	informat precautions_covid___3 best32. ;
	informat precautions_covid___4 best32. ;
	informat high_touch_covid___1 best32. ;
	informat high_touch_covid___2 best32. ;
	informat high_touch_covid___3 best32. ;
	informat high_touch_covid___4 best32. ;
	informat disinfect_covid___1 best32. ;
	informat disinfect_covid___2 best32. ;
	informat disinfect_covid___4 best32. ;
	informat disinfect_pou_covid___1 best32. ;
	informat disinfect_pou_covid___2 best32. ;
	informat disinfect_pou_covid___4 best32. ;
	informat equip_dedicated_covid___1 best32. ;
	informat equip_dedicated_covid___2 best32. ;
	informat equip_dedicated_covid___3 best32. ;
	informat equip_dedicated_covid___4 best32. ;
	informat ppe_supply_covid___1 best32. ;
	informat ppe_supply_covid___2 best32. ;
	informat ppe_supply_covid___3 best32. ;
	informat ppe_supply_covid___4 best32. ;
	informat universal_mask_covid___1 best32. ;
	informat universal_mask_covid___2 best32. ;
	informat universal_mask_covid___3 best32. ;
	informat universal_mask_covid___4 best32. ;
	informat hh_throughout_covid___1 best32. ;
	informat hh_throughout_covid___2 best32. ;
	informat hh_throughout_covid___4 best32. ;
	informat hh_inout_covid___1 best32. ;
	informat hh_inout_covid___2 best32. ;
	informat hh_inout_covid___4 best32. ;
	informat hh_semi_private_covid___1 best32. ;
	informat hh_semi_private_covid___2 best32. ;
	informat hh_semi_private_covid___4 best32. ;
	informat aware_flu___1 best32. ;
	informat aware_flu___2 best32. ;
	informat aware_flu___3 best32. ;
	informat aware_flu___4 best32. ;
	informat signs_flu___1 best32. ;
	informat signs_flu___2 best32. ;
	informat signs_flu___4 best32. ;
	informat resp_entrance_flu___1 best32. ;
	informat resp_entrance_flu___2 best32. ;
	informat resp_entrance_flu___4 best32. ;
	informat resp_visitors_flu___1 best32. ;
	informat resp_visitors_flu___2 best32. ;
	informat resp_visitors_flu___3 best32. ;
	informat resp_visitors_flu___4 best32. ;
	informat visitors_hh_flu___1 best32. ;
	informat visitors_hh_flu___2 best32. ;
	informat visitors_hh_flu___3 best32. ;
	informat visitors_hh_flu___4 best32. ;
	informat resp_station_flu___1 best32. ;
	informat resp_station_flu___2 best32. ;
	informat resp_station_flu___4 best32. ;
	informat signage_flu___1 best32. ;
	informat signage_flu___2 best32. ;
	informat signage_flu___4 best32. ;
	informat sick_leave_flu___1 best32. ;
	informat sick_leave_flu___2 best32. ;
	informat sick_leave_flu___3 best32. ;
	informat sick_leave_flu___4 best32. ;
	informat return_work_flu___1 best32. ;
	informat return_work_flu___2 best32. ;
	informat return_work_flu___3 best32. ;
	informat return_work_flu___4 best32. ;
	informat ppe_flu___1 best32. ;
	informat ppe_flu___2 best32. ;
	informat ppe_flu___3 best32. ;
	informat ppe_flu___4 best32. ;
	informat tbp_signage_flu___1 best32. ;
	informat tbp_signage_flu___2 best32. ;
	informat tbp_signage_flu___4 best32. ;
	informat ppe_pou_flu___1 best32. ;
	informat ppe_pou_flu___2 best32. ;
	informat ppe_pou_flu___4 best32. ;
	informat disposable_masks_flu___1 best32. ;
	informat disposable_masks_flu___2 best32. ;
	informat disposable_masks_flu___3 best32. ;
	informat disposable_masks_flu___4 best32. ;
	informat staff_tbp_flu___1 best32. ;
	informat staff_tbp_flu___2 best32. ;
	informat staff_tbp_flu___4 best32. ;
	informat residents_tbp_flu___1 best32. ;
	informat residents_tbp_flu___2 best32. ;
	informat residents_tbp_flu___3 best32. ;
	informat residents_tbp_flu___4 best32. ;
	informat private_rooms_flu___1 best32. ;
	informat private_rooms_flu___2 best32. ;
	informat private_rooms_flu___3 best32. ;
	informat private_rooms_flu___4 best32. ;
	informat hh_audits_flu___1 best32. ;
	informat hh_audits_flu___2 best32. ;
	informat hh_audits_flu___3 best32. ;
	informat hh_audits_flu___4 best32. ;
	informat ppe_audits_flu___1 best32. ;
	informat ppe_audits_flu___2 best32. ;
	informat ppe_audits_flu___3 best32. ;
	informat ppe_audits_flu___4 best32. ;
	informat precautions_flu___1 best32. ;
	informat precautions_flu___2 best32. ;
	informat precautions_flu___3 best32. ;
	informat precautions_flu___4 best32. ;
	informat high_touch_flu___1 best32. ;
	informat high_touch_flu___2 best32. ;
	informat high_touch_flu___3 best32. ;
	informat high_touch_flu___4 best32. ;
	informat disinfect_flu___1 best32. ;
	informat disinfect_flu___2 best32. ;
	informat disinfect_flu___4 best32. ;
	informat disinfect_pou_flu___1 best32. ;
	informat disinfect_pou_flu___2 best32. ;
	informat disinfect_pou_flu___3 best32. ;
	informat disinfect_pou_flu___4 best32. ;
	informat ppe_supply_flu___1 best32. ;
	informat ppe_supply_flu___2 best32. ;
	informat ppe_supply_flu___3 best32. ;
	informat ppe_supply_flu___4 best32. ;
	informat hh_throughout_flu___1 best32. ;
	informat hh_throughout_flu___2 best32. ;
	informat hh_throughout_flu___4 best32. ;
	informat hh_inout_flu___1 best32. ;
	informat hh_inout_flu___2 best32. ;
	informat hh_inout_flu___4 best32. ;
	informat hh_semi_private_flu___1 best32. ;
	informat hh_semi_private_flu___2 best32. ;
	informat hh_semi_private_flu___4 best32. ;
	informat aware_rsv___1 best32. ;
	informat aware_rsv___2 best32. ;
	informat aware_rsv___3 best32. ;
	informat aware_rsv___4 best32. ;
	informat signs_rsv___1 best32. ;
	informat signs_rsv___2 best32. ;
	informat signs_rsv___4 best32. ;
	informat resp_entrance_rsv___1 best32. ;
	informat resp_entrance_rsv___2 best32. ;
	informat resp_entrance_rsv___4 best32. ;
	informat resp_visitors_rsv___1 best32. ;
	informat resp_visitors_rsv___2 best32. ;
	informat resp_visitors_rsv___3 best32. ;
	informat resp_visitors_rsv___4 best32. ;
	informat visitors_hh_rsv___1 best32. ;
	informat visitors_hh_rsv___2 best32. ;
	informat visitors_hh_rsv___3 best32. ;
	informat visitors_hh_rsv___4 best32. ;
	informat resp_station_rsv___1 best32. ;
	informat resp_station_rsv___2 best32. ;
	informat resp_station_rsv___4 best32. ;
	informat signage_rsv___1 best32. ;
	informat signage_rsv___2 best32. ;
	informat signage_rsv___4 best32. ;
	informat sick_leave_rsv___1 best32. ;
	informat sick_leave_rsv___2 best32. ;
	informat sick_leave_rsv___3 best32. ;
	informat sick_leave_rsv___4 best32. ;
	informat return_work_rsv___1 best32. ;
	informat return_work_rsv___2 best32. ;
	informat return_work_rsv___3 best32. ;
	informat return_work_rsv___4 best32. ;
	informat ppe_rsv___1 best32. ;
	informat ppe_rsv___2 best32. ;
	informat ppe_rsv___3 best32. ;
	informat ppe_rsv___4 best32. ;
	informat tbp_signage_rsv___1 best32. ;
	informat tbp_signage_rsv___2 best32. ;
	informat tbp_signage_rsv___4 best32. ;
	informat stand_precaut_rsv___1 best32. ;
	informat stand_precaut_rsv___2 best32. ;
	informat stand_precaut_rsv___3 best32. ;
	informat stand_precaut_rsv___4 best32. ;
	informat ppe_pou_rsv___1 best32. ;
	informat ppe_pou_rsv___2 best32. ;
	informat ppe_pou_rsv___4 best32. ;
	informat disposable_masks_rsv___1 best32. ;
	informat disposable_masks_rsv___2 best32. ;
	informat disposable_masks_rsv___3 best32. ;
	informat disposable_masks_rsv___4 best32. ;
	informat staff_tbp_rsv___1 best32. ;
	informat staff_tbp_rsv___2 best32. ;
	informat staff_tbp_rsv___4 best32. ;
	informat residents_tbp_rsv___1 best32. ;
	informat residents_tbp_rsv___2 best32. ;
	informat residents_tbp_rsv___3 best32. ;
	informat residents_tbp_rsv___4 best32. ;
	informat private_rooms_rsv___1 best32. ;
	informat private_rooms_rsv___2 best32. ;
	informat private_rooms_rsv___3 best32. ;
	informat private_rooms_rsv___4 best32. ;
	informat hh_audits_rsv___1 best32. ;
	informat hh_audits_rsv___2 best32. ;
	informat hh_audits_rsv___3 best32. ;
	informat hh_audits_rsv___4 best32. ;
	informat ppe_audits_rsv___1 best32. ;
	informat ppe_audits_rsv___2 best32. ;
	informat ppe_audits_rsv___3 best32. ;
	informat ppe_audits_rsv___4 best32. ;
	informat precautions_rsv___1 best32. ;
	informat precautions_rsv___2 best32. ;
	informat precautions_rsv___3 best32. ;
	informat precautions_rsv___4 best32. ;
	informat high_touch_rsv___1 best32. ;
	informat high_touch_rsv___2 best32. ;
	informat high_touch_rsv___3 best32. ;
	informat high_touch_rsv___4 best32. ;
	informat disinfect_rsv___1 best32. ;
	informat disinfect_rsv___2 best32. ;
	informat disinfect_rsv___4 best32. ;
	informat disinfect_pou_rsv___1 best32. ;
	informat disinfect_pou_rsv___2 best32. ;
	informat disinfect_pou_rsv___4 best32. ;
	informat equipment_dedicated_rsv___1 best32. ;
	informat equipment_dedicated_rsv___2 best32. ;
	informat equipment_dedicated_rsv___3 best32. ;
	informat equipment_dedicated_rsv___4 best32. ;
	informat ppe_supply_rsv___1 best32. ;
	informat ppe_supply_rsv___2 best32. ;
	informat ppe_supply_rsv___3 best32. ;
	informat ppe_supply_rsv___4 best32. ;
	informat hh_throughout_rsv___1 best32. ;
	informat hh_throughout_rsv___2 best32. ;
	informat hh_throughout_rsv___4 best32. ;
	informat hh_inout_rsv___1 best32. ;
	informat hh_inout_rsv___2 best32. ;
	informat hh_inout_rsv___4 best32. ;
	informat hh_semi_private_rsv___1 best32. ;
	informat hh_semi_private_rsv___2 best32. ;
	informat hh_semi_private_rsv___4 best32. ;
	informat aware_noro___1 best32. ;
	informat aware_noro___2 best32. ;
	informat aware_noro___3 best32. ;
	informat aware_noro___4 best32. ;
	informat signs_noro___1 best32. ;
	informat signs_noro___2 best32. ;
	informat signs_noro___4 best32. ;
	informat resp_entrance_noro___1 best32. ;
	informat resp_entrance_noro___2 best32. ;
	informat resp_entrance_noro___4 best32. ;
	informat resp_visitors_noro___1 best32. ;
	informat resp_visitors_noro___2 best32. ;
	informat resp_visitors_noro___3 best32. ;
	informat resp_visitors_noro___4 best32. ;
	informat visitors_hh_noro___1 best32. ;
	informat visitors_hh_noro___2 best32. ;
	informat visitors_hh_noro___3 best32. ;
	informat visitors_hh_noro___4 best32. ;
	informat sick_leave_noro___1 best32. ;
	informat sick_leave_noro___2 best32. ;
	informat sick_leave_noro___3 best32. ;
	informat sick_leave_noro___4 best32. ;
	informat return_work_noro___1 best32. ;
	informat return_work_noro___2 best32. ;
	informat return_work_noro___3 best32. ;
	informat return_work_noro___4 best32. ;
	informat ppe_noro___1 best32. ;
	informat ppe_noro___2 best32. ;
	informat ppe_noro___3 best32. ;
	informat ppe_noro___4 best32. ;
	informat bp_signage_noro___1 best32. ;
	informat bp_signage_noro___2 best32. ;
	informat bp_signage_noro___3 best32. ;
	informat bp_signage_noro___4 best32. ;
	informat ppe_pou_noro___1 best32. ;
	informat ppe_pou_noro___2 best32. ;
	informat ppe_pou_noro___4 best32. ;
	informat staff_tbp_noro___1 best32. ;
	informat staff_tbp_noro___2 best32. ;
	informat staff_tbp_noro___4 best32. ;
	informat residents_tbp_noro___1 best32. ;
	informat residents_tbp_noro___2 best32. ;
	informat residents_tbp_noro___3 best32. ;
	informat residents_tbp_noro___4 best32. ;
	informat private_rooms_noro___1 best32. ;
	informat private_rooms_noro___2 best32. ;
	informat private_rooms_noro___3 best32. ;
	informat private_rooms_noro___4 best32. ;
	informat wash_hands_noro___1 best32. ;
	informat wash_hands_noro___2 best32. ;
	informat wash_hands_noro___3 best32. ;
	informat wash_hands_noro___4 best32. ;
	informat hh_audits_noro___1 best32. ;
	informat hh_audits_noro___2 best32. ;
	informat hh_audits_noro___3 best32. ;
	informat hh_audits_noro___4 best32. ;
	informat ppe_audits_noro___1 best32. ;
	informat ppe_audits_noro___2 best32. ;
	informat ppe_audits_noro___3 best32. ;
	informat ppe_audits_noro___4 best32. ;
	informat precautions_noro___1 best32. ;
	informat precautions_noro___2 best32. ;
	informat precautions_noro___3 best32. ;
	informat precautions_noro___4 best32. ;
	informat high_touch_noro___1 best32. ;
	informat high_touch_noro___2 best32. ;
	informat high_touch_noro___3 best32. ;
	informat high_touch_noro___4 best32. ;
	informat disinfect_noro___1 best32. ;
	informat disinfect_noro___2 best32. ;
	informat disinfect_noro___4 best32. ;
	informat disinfect_pou_noro___1 best32. ;
	informat disinfect_pou_noro___2 best32. ;
	informat disinfect_pou_noro___4 best32. ;
	informat equipment_dedicated_noro___1 best32. ;
	informat equipment_dedicated_noro___2 best32. ;
	informat equipment_dedicated_noro___3 best32. ;
	informat equipment_dedicated_noro___4 best32. ;
	informat ppe_supply___1 best32. ;
	informat ppe_supply___2 best32. ;
	informat ppe_supply___3 best32. ;
	informat ppe_supply___4 best32. ;
	informat hh_throughout_noro___1 best32. ;
	informat hh_throughout_noro___2 best32. ;
	informat hh_throughout_noro___4 best32. ;
	informat hh_inout_noro___1 best32. ;
	informat hh_inout_noro___2 best32. ;
	informat hh_inout_noro___4 best32. ;
	informat sinks_noro___1 best32. ;
	informat sinks_noro___2 best32. ;
	informat sinks_noro___4 best32. ;
	informat hh_semi_private_noro___1 best32. ;
	informat hh_semi_private_noro___2 best32. ;
	informat hh_semi_private_noro___4 best32. ;
	informat pathresist_mdro $5000. ;
	informat contr_ob_mdro___1 best32. ;
	informat contr_ob_mdro___2 best32. ;
	informat contr_ob_mdro___3 best32. ;
	informat contr_ob_mdro___4 best32. ;
	informat contr_ob_mdro___5 best32. ;
	informat contr_ob_mdro___6 best32. ;
	informat contr_ob_mdro___7 best32. ;
	informat contr_ob_mdro___8 best32. ;
	informat contr_ob_mdro___9 best32. ;
	informat cont_other_ob_mdro $5000. ;
	informat screen_ob_mdro___1 best32. ;
	informat screen_ob_mdro___2 best32. ;
	informat screen_ob_mdro___3 best32. ;
	informat screen_ob_mdro___4 best32. ;
	informat rec_ob_mdro___1 best32. ;
	informat rec_ob_mdro___2 best32. ;
	informat rec_ob_mdro___3 best32. ;
	informat rec_ob_mdro___4 best32. ;
	informat iso_ob_mdro___1 best32. ;
	informat iso_ob_mdro___2 best32. ;
	informat iso_ob_mdro___3 best32. ;
	informat iso_ob_mdro___4 best32. ;
	informat contacts_ob_mdro___1 best32. ;
	informat contacts_ob_mdro___2 best32. ;
	informat contacts_ob_mdro___3 best32. ;
	informat contacts_ob_mdro___4 best32. ;
	informat precaut_ob_mdro___1 best32. ;
	informat precaut_ob_mdro___2 best32. ;
	informat precaut_ob_mdro___4 best32. ;
	informat staff_ob_mdro___1 best32. ;
	informat staff_ob_mdro___2 best32. ;
	informat staff_ob_mdro___4 best32. ;
	informat edu_ob_mdro___1 best32. ;
	informat edu_ob_mdro___2 best32. ;
	informat edu_ob_mdro___3 best32. ;
	informat edu_ob_mdro___4 best32. ;
	informat report_list_mdro___1 best32. ;
	informat report_list_mdro___2 best32. ;
	informat report_list_mdro___3 best32. ;
	informat report_list_mdro___4 best32. ;
	informat ph_contact_mdro___1 best32. ;
	informat ph_contact_mdro___2 best32. ;
	informat ph_contact_mdro___3 best32. ;
	informat ph_contact_mdro___4 best32. ;
	informat comm_infect_mdro___1 best32. ;
	informat comm_infect_mdro___2 best32. ;
	informat comm_infect_mdro___3 best32. ;
	informat comm_infect_mdro___4 best32. ;
	informat infect_intake_mdro___1 best32. ;
	informat infect_intake_mdro___2 best32. ;
	informat infect_intake_mdro___3 best32. ;
	informat infect_intake_mdro___4 best32. ;
	informat lab_notif_mdro___1 best32. ;
	informat lab_notif_mdro___2 best32. ;
	informat lab_notif_mdro___3 best32. ;
	informat lab_notif_mdro___4 best32. ;
	informat indiv_antistew_mdro___1 best32. ;
	informat indiv_antistew_mdro___2 best32. ;
	informat indiv_antistew_mdro___3 best32. ;
	informat indiv_antistew_mdro___4 best32. ;
	informat indiv_antistew_mdro___5 best32. ;
	informat indiv_antistew_mdro___6 best32. ;
	informat other_antistew_mdro $500. ;
	informat hh_policies_mdro___1 best32. ;
	informat hh_policies_mdro___2 best32. ;
	informat hh_policies_mdro___3 best32. ;
	informat hh_policies_mdro___4 best32. ;
	informat hh_expectations_mdro___1 best32. ;
	informat hh_expectations_mdro___2 best32. ;
	informat hh_expectations_mdro___3 best32. ;
	informat hh_expectations_mdro___4 best32. ;
	informat hh_expectations_mdro___5 best32. ;
	informat hh_expectations_mdro___6 best32. ;
	informat hh_expectations_mdro___7 best32. ;
	informat hh_expectations_mdro___8 best32. ;
	informat hh_expectations_mdro___9 best32. ;
	informat hh_inout_mdro___1 best32. ;
	informat hh_inout_mdro___2 best32. ;
	informat hh_inout_mdro___4 best32. ;
	informat hh_sinkavail_mdro___1 best32. ;
	informat hh_sinkavail_mdro___2 best32. ;
	informat hh_sinkavail_mdro___3 best32. ;
	informat hh_sinkavail_mdro___4 best32. ;
	informat hh_soapwater_mdro___1 best32. ;
	informat hh_soapwater_mdro___2 best32. ;
	informat hh_soapwater_mdro___3 best32. ;
	informat hh_soapwater_mdro___4 best32. ;
	informat hh_soapwater_mdro___5 best32. ;
	informat hh_soapwater_mdro___6 best32. ;
	informat hh_throughout_mdro___1 best32. ;
	informat hh_throughout_mdro___2 best32. ;
	informat hh_throughout_mdro___3 best32. ;
	informat hh_pocket_mdro___1 best32. ;
	informat hh_pocket_mdro___2 best32. ;
	informat hh_pocket_mdro___3 best32. ;
	informat hh_pocket_mdro___4 best32. ;
	informat hh_only_mdro___1 best32. ;
	informat hh_only_mdro___2 best32. ;
	informat hh_only_mdro___3 best32. ;
	informat hh_only_mdro___4 best32. ;
	informat hh_supplies_mdro___1 best32. ;
	informat hh_supplies_mdro___2 best32. ;
	informat hh_supplies_mdro___4 best32. ;
	informat hh_lotion_mdro___1 best32. ;
	informat hh_lotion_mdro___2 best32. ;
	informat hh_lotion_mdro___3 best32. ;
	informat hh_lotion_mdro___4 best32. ;
	informat hh_lotion_mdro___5 best32. ;
	informat hh_nails_mdro___1 best32. ;
	informat hh_nails_mdro___2 best32. ;
	informat hh_nails_mdro___3 best32. ;
	informat hh_nails_mdro___4 best32. ;
	informat patienthh_mdro___1 best32. ;
	informat patienthh_mdro___2 best32. ;
	informat patienthh_mdro___3 best32. ;
	informat patienthh_mdro___4 best32. ;
	informat patienthh_mdro___5 best32. ;
	informat transmission_policy_mdro___1 best32. ;
	informat transmission_policy_mdro___2 best32. ;
	informat transmission_policy_mdro___3 best32. ;
	informat transmission_policy_mdro___4 best32. ;
	informat trans_signage_mdro___1 best32. ;
	informat trans_signage_mdro___2 best32. ;
	informat trans_signage_mdro___3 best32. ;
	informat trans_signage_mdro___4 best32. ;
	informat trans_signage_mdro___5 best32. ;
	informat trans_signage_mdro___6 best32. ;
	informat trans_signage_mdro___7 best32. ;
	informat trans_signage_mdro___8 best32. ;
	informat trans_signage_mdro___9 best32. ;
	informat ppe_supplies_mdro___1 best32. ;
	informat ppe_supplies_mdro___2 best32. ;
	informat ppe_supplies_mdro___4 best32. ;
	informat semipriv_mdro___1 best32. ;
	informat semipriv_mdro___2 best32. ;
	informat semipriv_mdro___3 best32. ;
	informat semipriv_mdro___4 best32. ;
	informat tbp_admit_mdro___1 best32. ;
	informat tbp_admit_mdro___2 best32. ;
	informat tbp_admit_mdro___3 best32. ;
	informat tbp_admit_mdro___4 best32. ;
	informat tbp_transfer_mdro___1 best32. ;
	informat tbp_transfer_mdro___2 best32. ;
	informat tbp_transfer_mdro___3 best32. ;
	informat tbp_transfer_mdro___4 best32. ;
	informat tbp_change_mdro___1 best32. ;
	informat tbp_change_mdro___2 best32. ;
	informat tbp_change_mdro___3 best32. ;
	informat tbp_change_mdro___4 best32. ;
	informat ebp_identify_mdro___1 best32. ;
	informat ebp_identify_mdro___2 best32. ;
	informat ebp_identify_mdro___3 best32. ;
	informat ebp_identify_mdro___4 best32. ;
	informat trans_signforclean_mdro___1 best32. ;
	informat trans_signforclean_mdro___2 best32. ;
	informat trans_signforclean_mdro___3 best32. ;
	informat trans_signforclean_mdro___4 best32. ;
	informat one_time_syringe_mdro___1 best32. ;
	informat one_time_syringe_mdro___2 best32. ;
	informat one_time_syringe_mdro___3 best32. ;
	informat one_time_syringe_mdro___4 best32. ;
	informat watermang_mdro___1 best32. ;
	informat watermang_mdro___2 best32. ;
	informat watermang_mdro___3 best32. ;
	informat watermang_mdro___4 best32. ;
	informat splash_mdro___1 best32. ;
	informat splash_mdro___2 best32. ;
	informat splash_mdro___3 best32. ;
	informat splash_mdro___5 best32. ;
	informat splash_mdro___6 best32. ;
	informat splash_mdro___7 best32. ;
	informat splash_mdro___8 best32. ;
	informat splash_mdro___9 best32. ;
	informat splash_mdro___10 best32. ;
	informat splash_mdro___11 best32. ;
	informat splash_mdro___12 best32. ;
	informat splash_other_mdro $5000. ;
	informat biofilm_measures_mdro___1 best32. ;
	informat biofilm_measures_mdro___2 best32. ;
	informat biofilm_measures_mdro___3 best32. ;
	informat biofilm_measures_mdro___4 best32. ;
	informat biofilm_measures_mdro___5 best32. ;
	informat biofilm_measures_mdro___6 best32. ;
	informat biofilm_measures_mdro___7 best32. ;
	informat biofilm_meas_other_mdro $5000. ;
	informat toiletdoor_mdro___1 best32. ;
	informat toiletdoor_mdro___2 best32. ;
	informat toiletdoor_mdro___3 best32. ;
	informat toiletdoor_mdro___4 best32. ;
	informat toiletdoor_no_mdro___1 best32. ;
	informat toiletdoor_no_mdro___2 best32. ;
	informat toiletdoor_no_mdro___3 best32. ;
	informat toiletdoor_no_mdro___4 best32. ;
	informat hooperdoor_mdro___1 best32. ;
	informat hooperdoor_mdro___2 best32. ;
	informat hooperdoor_mdro___3 best32. ;
	informat hooperdoor_mdro___4 best32. ;
	informat hopperdoor_no_mdro___1 best32. ;
	informat hopperdoor_no_mdro___2 best32. ;
	informat hopperdoor_no_mdro___3 best32. ;
	informat hopperdoor_no_mdro___4 best32. ;
	informat iceobs_mdro___1 best32. ;
	informat iceobs_mdro___2 best32. ;
	informat iceobs_mdro___4 best32. ;
	informat icemaint_mdro___1 best32. ;
	informat icemaint_mdro___2 best32. ;
	informat icemaint_mdro___3 best32. ;
	informat icemaint_mdro___4 best32. ;
	informat showerchair_mdro___1 best32. ;
	informat showerchair_mdro___2 best32. ;
	informat showerchair_mdro___3 best32. ;
	informat showerchair_mdro___4 best32. ;
	informat ptcarewater_mdro___1 best32. ;
	informat ptcarewater_mdro___2 best32. ;
	informat ptcarewater_mdro___3 best32. ;
	informat ptcarewater_mdro___4 best32. ;
	informat woundmask_gas___1 best32. ;
	informat woundmask_gas___2 best32. ;
	informat woundmask_gas___3 best32. ;
	informat reusable_gas___1 best32. ;
	informat reusable_gas___2 best32. ;
	informat reusable_gas___3 best32. ;
	informat devices_disinf_gas___1 best32. ;
	informat devices_disinf_gas___2 best32. ;
	informat devices_disinf_gas___3 best32. ;
	informat devices_disinf_gas___4 best32. ;
	informat aware_gas___1 best32. ;
	informat aware_gas___2 best32. ;
	informat aware_gas___3 best32. ;
	informat aware_gas___4 best32. ;
	informat wound_notes_gas $5000. ;
	informat precautions_gas___1 best32. ;
	informat precautions_gas___2 best32. ;
	informat precautions_gas___3 best32. ;
	informat precautions_gas___4 best32. ;
	informat trans_signage_gas___1 best32. ;
	informat trans_signage_gas___2 best32. ;
	informat trans_signage_gas___3 best32. ;
	informat trans_signage_gas___4 best32. ;
	informat trans_signage_gas___5 best32. ;
	informat trans_signage_gas___6 best32. ;
	informat trans_signage_gas___7 best32. ;
	informat trans_signage_gas___8 best32. ;
	informat trans_signage_gas___9 best32. ;
	informat ppe_supplies_gas___1 best32. ;
	informat ppe_supplies_gas___2 best32. ;
	informat ppe_supplies_gas___3 best32. ;
	informat ppe_supplies_gas___4 best32. ;
	informat semipriv_gas___1 best32. ;
	informat semipriv_gas___2 best32. ;
	informat semipriv_gas___3 best32. ;
	informat semipriv_gas___4 best32. ;
	informat tbp_change_gas___1 best32. ;
	informat tbp_change_gas___2 best32. ;
	informat tbp_change_gas___3 best32. ;
	informat tbp_change_gas___4 best32. ;
	informat resp_entrance_gas___1 best32. ;
	informat resp_entrance_gas___2 best32. ;
	informat resp_entrance_gas___3 best32. ;
	informat resp_station_gas___1 best32. ;
	informat resp_station_gas___2 best32. ;
	informat resp_station_gas___3 best32. ;
	informat resp_visitors_gas___1 best32. ;
	informat resp_visitors_gas___2 best32. ;
	informat resp_visitors_gas___3 best32. ;
	informat resp_visitors_gas___4 best32. ;
	informat sick_leave_gas___1 best32. ;
	informat sick_leave_gas___2 best32. ;
	informat sick_leave_gas___3 best32. ;
	informat sick_leave_gas___4 best32. ;
	informat resptreat_gas___1 best32. ;
	informat resptreat_gas___2 best32. ;
	informat resptreat_gas___3 best32. ;
	informat resptreat_gas___4 best32. ;
	informat resptreat_notes_gas $5000. ;
	informat resp_aseptic_gas___1 best32. ;
	informat resp_aseptic_gas___2 best32. ;
	informat resp_aseptic_gas___3 best32. ;
	informat resp_aseptic_gas___4 best32. ;
	informat trachcare_gas___1 best32. ;
	informat trachcare_gas___2 best32. ;
	informat trachcare_gas___3 best32. ;
	informat trachcare_gas___4 best32. ;
	informat trachcare_gas___5 best32. ;
	informat resp_supplies_gas___1 best32. ;
	informat resp_supplies_gas___2 best32. ;
	informat resp_supplies_gas___3 best32. ;
	informat resp_supplies_gas___4 best32. ;
	informat resp_notes_gas $5000. ;
	informat disinfectequip_obs_gas___1 best32. ;
	informat disinfectequip_obs_gas___2 best32. ;
	informat disinfectequip_obs_gas___3 best32. ;
	informat eqip_obs_gas___1 best32. ;
	informat eqip_obs_gas___2 best32. ;
	informat eqip_obs_gas___3 best32. ;
	informat eqip_process_gas $5000. ;
	informat policy_disinf_gas___1 best32. ;
	informat policy_disinf_gas___2 best32. ;
	informat policy_disinf_gas___3 best32. ;
	informat policy_disinf_gas___4 best32. ;
	informat contact_disinf_gas___1 best32. ;
	informat contact_disinf_gas___2 best32. ;
	informat contact_disinf_gas___3 best32. ;
	informat contact_disinf_gas___4 best32. ;
	informat hightouch_disinf_gas___1 best32. ;
	informat hightouch_disinf_gas___2 best32. ;
	informat hightouch_disinf_gas___3 best32. ;
	informat hightouch_disinf_gas___4 best32. ;
	informat epa_disinf_gas___1 best32. ;
	informat epa_disinf_gas___2 best32. ;
	informat epa_disinf_gas___3 best32. ;
	informat epa_disinf_gas___4 best32. ;
	informat shower_disinf_gas___1 best32. ;
	informat shower_disinf_gas___2 best32. ;
	informat shower_disinf_gas___3 best32. ;
	informat shower_disinf_gas___4 best32. ;
	informat shower_disinf_gas___5 best32. ;
	informat showindicate_disinf_gas___1 best32. ;
	informat showindicate_disinf_gas___2 best32. ;
	informat showindicate_disinf_gas___3 best32. ;
	informat showindicate_disinf_gas___4 best32. ;
	informat showindicate_disinf_gas___5 best32. ;
	informat supp_disinf_gas___1 best32. ;
	informat supp_disinf_gas___2 best32. ;
	informat supp_disinf_gas___3 best32. ;
	informat enviro_notes_gas $5000. ;
	informat trainaudit_notes_gas $5000. ;
	informat outbreak_management__v_9 best32. ;
	informat disease_ob___1 best32. ;
	informat disease_ob___2 best32. ;
	informat disease_ob___3 best32. ;
	informat disease_ob___4 best32. ;
	informat disease_ob___5 best32. ;
	informat disease_ob___6 best32. ;
	informat disease_ob___7 best32. ;
	informat disease_ob___8 best32. ;
	informat disease_ob___9 best32. ;
	informat patho_ob $5000. ;
	informat contr_ob___1 best32. ;
	informat contr_ob___2 best32. ;
	informat contr_ob___3 best32. ;
	informat contr_ob___4 best32. ;
	informat contr_ob___5 best32. ;
	informat contr_ob___6 best32. ;
	informat contr_ob___7 best32. ;
	informat contr_ob___8 best32. ;
	informat contr_ob___9 best32. ;
	informat contr_ob___10 best32. ;
	informat contr_ob___11 best32. ;
	informat cont_other_ob $5000. ;
	informat lhd_ob___1 best32. ;
	informat lhd_ob___2 best32. ;
	informat lhd_ob___3 best32. ;
	informat screen_ob___1 best32. ;
	informat screen_ob___2 best32. ;
	informat screen_ob___3 best32. ;
	informat rec_ob___1 best32. ;
	informat rec_ob___2 best32. ;
	informat rec_ob___3 best32. ;
	informat iso_ob___1 best32. ;
	informat iso_ob___2 best32. ;
	informat iso_ob___3 best32. ;
	informat contacts_ob___1 best32. ;
	informat contacts_ob___2 best32. ;
	informat contacts_ob___3 best32. ;
	informat precaut_ob___1 best32. ;
	informat precaut_ob___2 best32. ;
	informat precaut_ob___3 best32. ;
	informat staff_ob___1 best32. ;
	informat staff_ob___2 best32. ;
	informat staff_ob___3 best32. ;
	informat edu_ob___1 best32. ;
	informat edu_ob___2 best32. ;
	informat edu_ob___3 best32. ;
	informat edu_ob___4 best32. ;
	informat expand_outbreak $5000. ;
	informat outbreak_management_complete best32. ;
	informat urincath_1___1 best32. ;
	informat urincath_1___2 best32. ;
	informat urincath_1___3 best32. ;
	informat urincath_1___4 best32. ;
	informat urincath_1___5 best32. ;
	informat urincath_1___6 best32. ;
	informat urincath_2___1 best32. ;
	informat urincath_2___2 best32. ;
	informat urincath_2___3 best32. ;
	informat urincath_2___4 best32. ;
	informat urincath_2___5 best32. ;
	informat urincath_2___6 best32. ;
	informat urincath_3___1 best32. ;
	informat urincath_3___2 best32. ;
	informat urincath_3___3 best32. ;
	informat urincath_3___4 best32. ;
	informat urincath_3___5 best32. ;
	informat urincath_3___6 best32. ;
	informat urincath_4___1 best32. ;
	informat urincath_4___2 best32. ;
	informat urincath_4___3 best32. ;
	informat urincath_4___4 best32. ;
	informat urincath_4___5 best32. ;
	informat urincath_4___6 best32. ;
	informat urincath_5___1 best32. ;
	informat urincath_5___2 best32. ;
	informat urincath_5___3 best32. ;
	informat urincath_5___4 best32. ;
	informat urincath_5___5 best32. ;
	informat urincath_5___6 best32. ;
	informat urincath_notes_obs $5000. ;
	informat cl_1___1 best32. ;
	informat cl_1___2 best32. ;
	informat cl_1___3 best32. ;
	informat cl_1___4 best32. ;
	informat cl_1___5 best32. ;
	informat cl_1___6 best32. ;
	informat cl_1___7 best32. ;
	informat cl_1___8 best32. ;
	informat cl_2___1 best32. ;
	informat cl_2___2 best32. ;
	informat cl_2___3 best32. ;
	informat cl_2___4 best32. ;
	informat cl_2___5 best32. ;
	informat cl_2___6 best32. ;
	informat cl_2___7 best32. ;
	informat cl_2___8 best32. ;
	informat cl_3___1 best32. ;
	informat cl_3___2 best32. ;
	informat cl_3___3 best32. ;
	informat cl_3___4 best32. ;
	informat cl_3___5 best32. ;
	informat cl_3___6 best32. ;
	informat cl_3___7 best32. ;
	informat cl_3___8 best32. ;
	informat cl_4___1 best32. ;
	informat cl_4___2 best32. ;
	informat cl_4___3 best32. ;
	informat cl_4___4 best32. ;
	informat cl_4___5 best32. ;
	informat cl_4___6 best32. ;
	informat cl_4___7 best32. ;
	informat cl_4___8 best32. ;
	informat cl_5___1 best32. ;
	informat cl_5___2 best32. ;
	informat cl_5___3 best32. ;
	informat cl_5___4 best32. ;
	informat cl_5___5 best32. ;
	informat cl_5___6 best32. ;
	informat cl_5___7 best32. ;
	informat cl_5___8 best32. ;
	informat cld_1___1 best32. ;
	informat cld_1___2 best32. ;
	informat cld_1___3 best32. ;
	informat cld_1___4 best32. ;
	informat cld_1___5 best32. ;
	informat cld_1___6 best32. ;
	informat cld_1___7 best32. ;
	informat cld_1___8 best32. ;
	informat cld_1___9 best32. ;
	informat cld_2___1 best32. ;
	informat cld_2___2 best32. ;
	informat cld_2___3 best32. ;
	informat cld_2___4 best32. ;
	informat cld_2___5 best32. ;
	informat cld_2___6 best32. ;
	informat cld_2___7 best32. ;
	informat cld_2___8 best32. ;
	informat cld_2___9 best32. ;
	informat cld_3___1 best32. ;
	informat cld_3___2 best32. ;
	informat cld_3___3 best32. ;
	informat cld_3___4 best32. ;
	informat cld_3___5 best32. ;
	informat cld_3___6 best32. ;
	informat cld_3___7 best32. ;
	informat cld_3___8 best32. ;
	informat cld_3___9 best32. ;
	informat cl_notes_obs $5000. ;
	informat tra_1___1 best32. ;
	informat tra_1___2 best32. ;
	informat tra_1___3 best32. ;
	informat tra_1___4 best32. ;
	informat tra_1___5 best32. ;
	informat tra_1___6 best32. ;
	informat tra_1___7 best32. ;
	informat tra_1___8 best32. ;
	informat tra_1___9 best32. ;
	informat tra_2___1 best32. ;
	informat tra_2___2 best32. ;
	informat tra_2___3 best32. ;
	informat tra_2___4 best32. ;
	informat tra_2___5 best32. ;
	informat tra_2___6 best32. ;
	informat tra_2___7 best32. ;
	informat tra_2___8 best32. ;
	informat tra_2___9 best32. ;
	informat tra_3___1 best32. ;
	informat tra_3___2 best32. ;
	informat tra_3___3 best32. ;
	informat tra_3___4 best32. ;
	informat tra_3___5 best32. ;
	informat tra_3___6 best32. ;
	informat tra_3___7 best32. ;
	informat tra_3___8 best32. ;
	informat tra_3___9 best32. ;
	informat suc_1___1 best32. ;
	informat suc_1___2 best32. ;
	informat suc_1___3 best32. ;
	informat suc_1___4 best32. ;
	informat suc_1___5 best32. ;
	informat suc_1___6 best32. ;
	informat suc_1___7 best32. ;
	informat suc_2___1 best32. ;
	informat suc_2___2 best32. ;
	informat suc_2___3 best32. ;
	informat suc_2___4 best32. ;
	informat suc_2___5 best32. ;
	informat suc_2___6 best32. ;
	informat suc_2___7 best32. ;
	informat suc_3___1 best32. ;
	informat suc_3___2 best32. ;
	informat suc_3___3 best32. ;
	informat suc_3___4 best32. ;
	informat suc_3___5 best32. ;
	informat suc_3___6 best32. ;
	informat suc_3___7 best32. ;
	informat device_obs $5000. ;
	informat expand_devicareobs $5000. ;
	informat device_care_observat_v_10 best32. ;
	informat wound_obs1___1 best32. ;
	informat wound_obs1___2 best32. ;
	informat wound_obs1___3 best32. ;
	informat wound_obs1___4 best32. ;
	informat wound_obs1___5 best32. ;
	informat wound_obs1___6 best32. ;
	informat wound_obs1___7 best32. ;
	informat wound_obs1___8 best32. ;
	informat wound_obs1___9 best32. ;
	informat wound_obs1___10 best32. ;
	informat wound_obs1___11 best32. ;
	informat wound_obs1___12 best32. ;
	informat wound_obs1___13 best32. ;
	informat wound_obs1___14 best32. ;
	informat wound_obs2___1 best32. ;
	informat wound_obs2___2 best32. ;
	informat wound_obs2___3 best32. ;
	informat wound_obs2___4 best32. ;
	informat wound_obs2___5 best32. ;
	informat wound_obs2___6 best32. ;
	informat wound_obs2___7 best32. ;
	informat wound_obs2___8 best32. ;
	informat wound_obs2___9 best32. ;
	informat wound_obs2___10 best32. ;
	informat wound_obs2___11 best32. ;
	informat wound_obs2___12 best32. ;
	informat wound_obs2___13 best32. ;
	informat wound_obs2___14 best32. ;
	informat wound_obs3___1 best32. ;
	informat wound_obs3___2 best32. ;
	informat wound_obs3___3 best32. ;
	informat wound_obs3___4 best32. ;
	informat wound_obs3___5 best32. ;
	informat wound_obs3___6 best32. ;
	informat wound_obs3___7 best32. ;
	informat wound_obs3___8 best32. ;
	informat wound_obs3___9 best32. ;
	informat wound_obs3___10 best32. ;
	informat wound_obs3___11 best32. ;
	informat wound_obs3___12 best32. ;
	informat wound_obs3___13 best32. ;
	informat wound_obs3___14 best32. ;
	informat wound_notes_obs $5000. ;
	informat wound_care_observati_v_11 best32. ;

	format record_id $500. ;
	format assessor___1 best12. ;
	format assessor___2 best12. ;
	format assessor___3 best12. ;
	format assessor___4 best12. ;
	format assessor___5 best12. ;
	format assessor___6 best12. ;
	format assessor___7 best12. ;
	format assessor___8 best12. ;
	format assessor___9 best12. ;
	format assessor___10 best12. ;
	format date yymmdd10. ;
	format time time5. ;
	format visit_remote best12. ;
	format reason___1 best12. ;
	format reason___2 best12. ;
	format reason___3 best12. ;
	format reason___4 best12. ;
	format reason___5 best12. ;
	format reason___6 best12. ;
	format reason___7 best12. ;
	format outbreak_type___1 best12. ;
	format outbreak_type___2 best12. ;
	format outbreak_type___3 best12. ;
	format outbreak_type___4 best12. ;
	format outbreak_type___5 best12. ;
	format outbreak_type___6 best12. ;
	format outbreak_type___7 best12. ;
	format outbreak_mdro___1 best12. ;
	format outbreak_mdro___2 best12. ;
	format outbreak_mdro___3 best12. ;
	format outbreak_mdro___4 best12. ;
	format outbreak_mdro___5 best12. ;
	format outbreak_mdro_number $500. ;
	format reason_expand $5000. ;
	format facility_name $500. ;
	format facility_county best12. ;
	format facility_zip $500. ;
	format ripsvisit best12. ;
	format facility_type___1 best12. ;
	format facility_type___2 best12. ;
	format facility_type___3 best12. ;
	format facility_type___4 best12. ;
	format facility_type___5 best12. ;
	format facility_type___6 best12. ;
	format facility_type___7 best12. ;
	format facility_type___8 best12. ;
	format facility_type___9 best12. ;
	format facility_type___10 best12. ;
	format facility_type___11 best12. ;
	format facility_type___12 best12. ;
	format facility_type___13 best12. ;
	format facility_type___14 best12. ;
	format facility_type___15 best12. ;
	format facility_type___16 best12. ;
	format facility_type___17 best12. ;
	format facility_type___18 best12. ;
	format facility_type___19 best12. ;
	format facility_type___20 best12. ;
	format contact_facility $500. ;
	format contact_title_facility $500. ;
	format email_facility $500. ;
	format phone_facility $500. ;
	format beds_facility $500. ;
	format license_number $500. ;
	format ccn $500. ;
	format nshn_number $500. ;
	format system_facility best12. ;
	format system $500. ;
	format full_ip best12. ;
	format ip_hours best12. ;
	format ip best12. ;
	format ip_name $500. ;
	format ip_phone $500. ;
	format ip_email $500. ;
	format ip_training___1 best12. ;
	format ip_training___2 best12. ;
	format ip_training___3 best12. ;
	format ip_training___4 best12. ;
	format facility_information_complete best12. ;
	format report_list___1 best12. ;
	format report_list___2 best12. ;
	format report_list___3 best12. ;
	format report_list___4 best12. ;
	format ph_contact___1 best12. ;
	format ph_contact___2 best12. ;
	format ph_contact___3 best12. ;
	format ph_contact___4 best12. ;
	format comm_infect___1 best12. ;
	format comm_infect___2 best12. ;
	format comm_infect___3 best12. ;
	format comm_infect___4 best12. ;
	format infect_intake___1 best12. ;
	format infect_intake___2 best12. ;
	format infect_intake___3 best12. ;
	format infect_intake___4 best12. ;
	format ip_policies___1 best12. ;
	format ip_policies___2 best12. ;
	format ip_policies___3 best12. ;
	format ip_policies___4 best12. ;
	format ip_policies___5 best12. ;
	format policies_reviewed___1 best12. ;
	format policies_reviewed___2 best12. ;
	format policies_reviewed___3 best12. ;
	format policies_reviewed___4 best12. ;
	format lab_notif___1 best12. ;
	format lab_notif___2 best12. ;
	format lab_notif___3 best12. ;
	format lab_notif___4 best12. ;
	format infect_monitoring___1 best12. ;
	format infect_monitoring___2 best12. ;
	format infect_monitoring___3 best12. ;
	format infect_monitoring___4 best12. ;
	format ip_process___1 best12. ;
	format ip_process___2 best12. ;
	format ip_process___3 best12. ;
	format ip_process___4 best12. ;
	format outbreak_response___1 best12. ;
	format outbreak_response___2 best12. ;
	format outbreak_response___3 best12. ;
	format outbreak_response___4 best12. ;
	format resp_program___1 best12. ;
	format resp_program___2 best12. ;
	format resp_program___3 best12. ;
	format resp_program___4 best12. ;
	format emergency_plan___1 best12. ;
	format emergency_plan___2 best12. ;
	format emergency_plan___3 best12. ;
	format emergency_plan___4 best12. ;
	format riskassess___1 best12. ;
	format riskassess___2 best12. ;
	format riskassess___3 best12. ;
	format riskassess___4 best12. ;
	format respetc_site___1 best12. ;
	format respetc_site___2 best12. ;
	format respetc_site___3 best12. ;
	format prepare_strategies $5000. ;
	format expand_safety $5000. ;
	format work_exclusions___1 best12. ;
	format work_exclusions___2 best12. ;
	format work_exclusions___3 best12. ;
	format work_exclusions___4 best12. ;
	format tb_hire___1 best12. ;
	format tb_hire___2 best12. ;
	format tb_hire___3 best12. ;
	format tb_hire___4 best12. ;
	format tb_risk___1 best12. ;
	format tb_risk___2 best12. ;
	format tb_risk___3 best12. ;
	format tb_risk___4 best12. ;
	format bloodborne_plan___1 best12. ;
	format bloodborne_plan___2 best12. ;
	format bloodborne_plan___3 best12. ;
	format bloodborne_plan___4 best12. ;
	format hepb_vac___1 best12. ;
	format hepb_vac___2 best12. ;
	format hepb_vac___3 best12. ;
	format hepb_vac___4 best12. ;
	format annual_flu___1 best12. ;
	format annual_flu___2 best12. ;
	format annual_flu___3 best12. ;
	format annual_flu___4 best12. ;
	format annual_covid___1 best12. ;
	format annual_covid___2 best12. ;
	format annual_covid___3 best12. ;
	format annual_covid___4 best12. ;
	format vac_record___1 best12. ;
	format vac_record___2 best12. ;
	format vac_record___3 best12. ;
	format vac_record___4 best12. ;
	format tb_patient___1 best12. ;
	format tb_patient___2 best12. ;
	format tb_patient___3 best12. ;
	format tb_patient___4 best12. ;
	format tb_patient___5 best12. ;
	format offer_vac___1 best12. ;
	format offer_vac___2 best12. ;
	format offer_vac___3 best12. ;
	format offer_vac___4 best12. ;
	format vac_edu___1 best12. ;
	format vac_edu___2 best12. ;
	format vac_edu___3 best12. ;
	format vac_edu___4 best12. ;
	format indiv_antistew___1 best12. ;
	format indiv_antistew___2 best12. ;
	format indiv_antistew___3 best12. ;
	format indiv_antistew___4 best12. ;
	format indiv_antistew___5 best12. ;
	format indiv_antistew___6 best12. ;
	format other_antistew $500. ;
	format spice_referral best12. ;
	format operations_notes $5000. ;
	format employee_and_patient_v_0 best12. ;
	format ip_education___1 best12. ;
	format ip_education___2 best12. ;
	format ip_education___3 best12. ;
	format ip_education___4 best12. ;
	format ip_education___5 best12. ;
	format ip_education___6 best12. ;
	format ip_education___7 best12. ;
	format ip_education___8 best12. ;
	format ip_education___9 best12. ;
	format ip_education___10 best12. ;
	format competency___1 best12. ;
	format competency___2 best12. ;
	format competency___3 best12. ;
	format competency___4 best12. ;
	format competency___5 best12. ;
	format demonstrateskills___1 best12. ;
	format demonstrateskills___2 best12. ;
	format demonstrateskills___3 best12. ;
	format demonstrateskills___4 best12. ;
	format demonstrateskills___5 best12. ;
	format demonstrateskills___6 best12. ;
	format demonstrateskills___7 best12. ;
	format demonstrateskills___8 best12. ;
	format testtopics___1 best12. ;
	format testtopics___2 best12. ;
	format testtopics___3 best12. ;
	format testtopics___4 best12. ;
	format testtopics___5 best12. ;
	format testtopics___6 best12. ;
	format testtopics___7 best12. ;
	format testtopics___8 best12. ;
	format annualskills___1 best12. ;
	format annualskills___2 best12. ;
	format annualskills___3 best12. ;
	format annualskills___4 best12. ;
	format annualskills___5 best12. ;
	format annualskills___6 best12. ;
	format annualskills___7 best12. ;
	format annualskills___8 best12. ;
	format audits___1 best12. ;
	format audits___2 best12. ;
	format audits___3 best12. ;
	format audits___4 best12. ;
	format audits___5 best12. ;
	format audits___6 best12. ;
	format audits___7 best12. ;
	format audits___8 best12. ;
	format audits___9 best12. ;
	format hh_audits best12. ;
	format audit_ppe best12. ;
	format audit_cleandisinf best12. ;
	format audit_injectsafety best12. ;
	format audit_poc best12. ;
	format audit_repro best12. ;
	format audits_feedback___1 best12. ;
	format audits_feedback___2 best12. ;
	format audits_feedback___3 best12. ;
	format audits_feedback___4 best12. ;
	format audits_feedback___5 best12. ;
	format audits_feedback___6 best12. ;
	format traningaudits_notes $5000. ;
	format trainingaudits_complete best12. ;
	format hh_policies___1 best12. ;
	format hh_policies___2 best12. ;
	format hh_policies___3 best12. ;
	format hh_policies___4 best12. ;
	format hh_expectations___1 best12. ;
	format hh_expectations___2 best12. ;
	format hh_expectations___3 best12. ;
	format hh_expectations___4 best12. ;
	format hh_expectations___5 best12. ;
	format hh_expectations___6 best12. ;
	format hh_expectations___7 best12. ;
	format hh_expectations___8 best12. ;
	format hh_expectations___9 best12. ;
	format hh_inout___1 best12. ;
	format hh_inout___2 best12. ;
	format hh_inout___3 best12. ;
	format hh_sinkavail___1 best12. ;
	format hh_sinkavail___2 best12. ;
	format hh_sinkavail___3 best12. ;
	format hh_sinkavail___4 best12. ;
	format hh_soapwater___1 best12. ;
	format hh_soapwater___2 best12. ;
	format hh_soapwater___3 best12. ;
	format hh_soapwater___4 best12. ;
	format hh_soapwater___5 best12. ;
	format hh_soapwater___6 best12. ;
	format hh_throughout___1 best12. ;
	format hh_throughout___2 best12. ;
	format hh_throughout___3 best12. ;
	format hh_pocket___1 best12. ;
	format hh_pocket___2 best12. ;
	format hh_pocket___3 best12. ;
	format hh_pocket___4 best12. ;
	format hh_only___1 best12. ;
	format hh_only___2 best12. ;
	format hh_only___3 best12. ;
	format hh_only___4 best12. ;
	format hh_supplies___1 best12. ;
	format hh_supplies___2 best12. ;
	format hh_supplies___3 best12. ;
	format hh_lotion___1 best12. ;
	format hh_lotion___2 best12. ;
	format hh_lotion___3 best12. ;
	format hh_lotion___4 best12. ;
	format hh_lotion___5 best12. ;
	format hh_nails___1 best12. ;
	format hh_nails___2 best12. ;
	format hh_nails___3 best12. ;
	format hh_nails___4 best12. ;
	format patienthh___1 best12. ;
	format patienthh___2 best12. ;
	format patienthh___3 best12. ;
	format patienthh___4 best12. ;
	format patienthh___5 best12. ;
	format expand_hh $5000. ;
	format hand_hygiene_complete best12. ;
	format hh_1 best12. ;
	format hh_2 best12. ;
	format hh_3 best12. ;
	format hh_4 best12. ;
	format hh_5 best12. ;
	format hh_6 best12. ;
	format hh_7 best12. ;
	format hh_8 best12. ;
	format hh_9 best12. ;
	format hh_10 best12. ;
	format expand_hhobs $5000. ;
	format hand_hygiene_observa_v_1 best12. ;
	format transmission_policy___1 best12. ;
	format transmission_policy___2 best12. ;
	format transmission_policy___3 best12. ;
	format transmission_policy___4 best12. ;
	format trans_signage___1 best12. ;
	format trans_signage___2 best12. ;
	format trans_signage___3 best12. ;
	format trans_signage___4 best12. ;
	format trans_signage___5 best12. ;
	format trans_signage___6 best12. ;
	format trans_signage___7 best12. ;
	format trans_signage___8 best12. ;
	format trans_signage___9 best12. ;
	format ppe_supplies___1 best12. ;
	format ppe_supplies___2 best12. ;
	format ppe_supplies___3 best12. ;
	format semipriv___1 best12. ;
	format semipriv___2 best12. ;
	format semipriv___3 best12. ;
	format semipriv___4 best12. ;
	format tbp_admit___1 best12. ;
	format tbp_admit___2 best12. ;
	format tbp_admit___3 best12. ;
	format tbp_admit___4 best12. ;
	format tbp_transfer___1 best12. ;
	format tbp_transfer___2 best12. ;
	format tbp_transfer___3 best12. ;
	format tbp_transfer___4 best12. ;
	format tbp_change___1 best12. ;
	format tbp_change___2 best12. ;
	format tbp_change___3 best12. ;
	format tbp_change___4 best12. ;
	format ebp_identify___1 best12. ;
	format ebp_identify___2 best12. ;
	format ebp_identify___3 best12. ;
	format ebp_identify___4 best12. ;
	format trans_signforclean___1 best12. ;
	format trans_signforclean___2 best12. ;
	format trans_signforclean___3 best12. ;
	format trans_signforclean___4 best12. ;
	format resp_entrance___1 best12. ;
	format resp_entrance___2 best12. ;
	format resp_entrance___3 best12. ;
	format resp_station___1 best12. ;
	format resp_station___2 best12. ;
	format resp_station___3 best12. ;
	format resp_visitors___1 best12. ;
	format resp_visitors___2 best12. ;
	format resp_visitors___3 best12. ;
	format resp_visitors___4 best12. ;
	format fit_testing___1 best12. ;
	format fit_testing___2 best12. ;
	format fit_testing___3 best12. ;
	format fit_testing___4 best12. ;
	format expand_transmissionbased $5000. ;
	format standard_and_transmi_v_2 best12. ;
	format prec_obs___1 best12. ;
	format prec_obs___2 best12. ;
	format prec_obs___3 best12. ;
	format expand_prec_obs $5000. ;
	format don_obs___1 best12. ;
	format don_obs___2 best12. ;
	format don_obs___3 best12. ;
	format expand_don_obs $5000. ;
	format doff_obs___1 best12. ;
	format doff_obs___2 best12. ;
	format doff_obs___3 best12. ;
	format expand_doff_obs $5000. ;
	format aiir_obs___1 best12. ;
	format aiir_obs___2 best12. ;
	format aiir_obs___3 best12. ;
	format aiir_obs___4 best12. ;
	format aiir_obs___5 best12. ;
	format aiir_obs___6 best12. ;
	format expand_aiir_obs $5000. ;
	format priv_obs___1 best12. ;
	format priv_obs___2 best12. ;
	format priv_obs___3 best12. ;
	format priv_obs___4 best12. ;
	format expand_priv_obs $5000. ;
	format stand_obs $5000. ;
	format expand_precobs $5000. ;
	format standard_and_transmi_v_3 best12. ;
	format policy_disinf___1 best12. ;
	format policy_disinf___2 best12. ;
	format policy_disinf___3 best12. ;
	format policy_disinf___4 best12. ;
	format contact_disinf___1 best12. ;
	format contact_disinf___2 best12. ;
	format contact_disinf___3 best12. ;
	format contact_disinf___4 best12. ;
	format hightouch_disinf___1 best12. ;
	format hightouch_disinf___2 best12. ;
	format hightouch_disinf___3 best12. ;
	format hightouch_disinf___4 best12. ;
	format room_disinf___1 best12. ;
	format room_disinf___2 best12. ;
	format room_disinf___3 best12. ;
	format room_disinf___4 best12. ;
	format epa_disinf___1 best12. ;
	format epa_disinf___2 best12. ;
	format epa_disinf___3 best12. ;
	format epa_disinf___4 best12. ;
	format equip_disinf___1 best12. ;
	format equip_disinf___2 best12. ;
	format equip_disinf___3 best12. ;
	format equip_disinf___4 best12. ;
	format gluc_disinf___1 best12. ;
	format gluc_disinf___2 best12. ;
	format gluc_disinf___3 best12. ;
	format gluc_disinf___4 best12. ;
	format disinf_glucavail___1 best12. ;
	format disinf_glucavail___2 best12. ;
	format disinf_glucavail___3 best12. ;
	format gluc_disinfection_2___1 best12. ;
	format gluc_disinfection_2___2 best12. ;
	format gluc_disinfection_2___3 best12. ;
	format gluc_disinfection_2___4 best12. ;
	format shower_disinf___1 best12. ;
	format shower_disinf___2 best12. ;
	format shower_disinf___3 best12. ;
	format shower_disinf___4 best12. ;
	format shower_disinf___5 best12. ;
	format showindicate_disinf___1 best12. ;
	format showindicate_disinf___2 best12. ;
	format showindicate_disinf___3 best12. ;
	format showindicate_disinf___4 best12. ;
	format showindicate_disinf___5 best12. ;
	format supp_disinf___1 best12. ;
	format supp_disinf___2 best12. ;
	format supp_disinf___3 best12. ;
	format devices_disinf best12. ;
	format expand_envircleaning $5000. ;
	format environmental_cleani_v_4 best12. ;
	format hhprod_obs___1 best12. ;
	format hhprod_obs___2 best12. ;
	format hhprod_obs___3 best12. ;
	format resp_signage_obs___1 best12. ;
	format resp_signage_obs___2 best12. ;
	format resp_signage_obs___3 best12. ;
	format gen_obs___1 best12. ;
	format gen_obs___2 best12. ;
	format gen_obs___3 best12. ;
	format expand_gen_obs $5000. ;
	format sink_obs___1 best12. ;
	format sink_obs___2 best12. ;
	format sink_obs___3 best12. ;
	format expand_sink_obs $5000. ;
	format undersink_obs___1 best12. ;
	format undersink_obs___2 best12. ;
	format undersink_obs___3 best12. ;
	format expand_undersink_obs $5000. ;
	format cleansupp_obs___1 best12. ;
	format cleansupp_obs___2 best12. ;
	format cleansupp_obs___3 best12. ;
	format expand_cleansupp_obs $5000. ;
	format sharpstor_obs best12. ;
	format expand_sharpstor_obs $5000. ;
	format cleandirty_obs___1 best12. ;
	format cleandirty_obs___2 best12. ;
	format cleandirty_obs___3 best12. ;
	format expand_cleandirty_obs $5000. ;
	format disinfectequip_obs___1 best12. ;
	format disinfectequip_obs___2 best12. ;
	format disinfectequip_obs___3 best12. ;
	format eqip_obs___1 best12. ;
	format eqip_obs___2 best12. ;
	format eqip_obs___3 best12. ;
	format expand_eqip_obs $5000. ;
	format coverlinen_obs___1 best12. ;
	format coverlinen_obs___2 best12. ;
	format coverlinen_obs___3 best12. ;
	format expand_coverlinen_obs $5000. ;
	format soiled_obs___1 best12. ;
	format soiled_obs___2 best12. ;
	format soiled_obs___3 best12. ;
	format expand_soiled_obs $5000. ;
	format sharps_obs___1 best12. ;
	format sharps_obs___2 best12. ;
	format sharps_obs___3 best12. ;
	format medprep_obs___1 best12. ;
	format medprep_obs___2 best12. ;
	format medprep_obs___3 best12. ;
	format expand_medprep_obs $5000. ;
	format expir_obs___1 best12. ;
	format expir_obs___2 best12. ;
	format expir_obs___3 best12. ;
	format expand_expir_obs $5000. ;
	format expand_envirobs $5000. ;
	format environmental_observ_v_5 best12. ;
	format gluc_disinf_2___1 best12. ;
	format gluc_disinf_2___2 best12. ;
	format gluc_disinf_2___3 best12. ;
	format gluc_disinf_2___4 best12. ;
	format disinf_glucavail_2___1 best12. ;
	format disinf_glucavail_2___2 best12. ;
	format disinf_glucavail_2___3 best12. ;
	format gluc_disinfection___1 best12. ;
	format gluc_disinfection___2 best12. ;
	format gluc_disinfection___3 best12. ;
	format gluc_disinfection___4 best12. ;
	format gluc_supplies___1 best12. ;
	format gluc_supplies___2 best12. ;
	format gluc_supplies___3 best12. ;
	format gluc_supplies___4 best12. ;
	format stor_gluc___1 best12. ;
	format stor_gluc___2 best12. ;
	format stor_gluc___3 best12. ;
	format insulin_pens___1 best12. ;
	format insulin_pens___2 best12. ;
	format insulin_pens___3 best12. ;
	format insulin_storage___1 best12. ;
	format insulin_storage___2 best12. ;
	format insulin_storage___3 best12. ;
	format inject_policy___1 best12. ;
	format inject_policy___2 best12. ;
	format inject_policy___3 best12. ;
	format inject_policy___4 best12. ;
	format one_time_syringe___1 best12. ;
	format one_time_syringe___2 best12. ;
	format one_time_syringe___3 best12. ;
	format one_time_syringe___4 best12. ;
	format single_dose___1 best12. ;
	format single_dose___2 best12. ;
	format single_dose___3 best12. ;
	format single_dose___4 best12. ;
	format multi_dose___1 best12. ;
	format multi_dose___2 best12. ;
	format multi_dose___3 best12. ;
	format multi_dose___4 best12. ;
	format gloves_inject___1 best12. ;
	format gloves_inject___2 best12. ;
	format gloves_inject___3 best12. ;
	format gloves_inject___4 best12. ;
	format diversion_policy___1 best12. ;
	format diversion_policy___2 best12. ;
	format diversion_policy___3 best12. ;
	format diversion_policy___4 best12. ;
	format expand_injectmed $5000. ;
	format infectionmedication__v_6 best12. ;
	format glu_1___1 best12. ;
	format glu_1___2 best12. ;
	format glu_1___3 best12. ;
	format glu_1___4 best12. ;
	format glu_1___5 best12. ;
	format glu_1___6 best12. ;
	format glu_1___7 best12. ;
	format glu_2___1 best12. ;
	format glu_2___2 best12. ;
	format glu_2___3 best12. ;
	format glu_2___4 best12. ;
	format glu_2___5 best12. ;
	format glu_2___6 best12. ;
	format glu_2___7 best12. ;
	format glu_3___1 best12. ;
	format glu_3___2 best12. ;
	format glu_3___3 best12. ;
	format glu_3___4 best12. ;
	format glu_3___5 best12. ;
	format glu_3___6 best12. ;
	format glu_3___7 best12. ;
	format glu_4___1 best12. ;
	format glu_4___2 best12. ;
	format glu_4___3 best12. ;
	format glu_4___4 best12. ;
	format glu_4___5 best12. ;
	format glu_4___6 best12. ;
	format glu_4___7 best12. ;
	format glu_5___1 best12. ;
	format glu_5___2 best12. ;
	format glu_5___3 best12. ;
	format glu_5___4 best12. ;
	format glu_5___5 best12. ;
	format glu_5___6 best12. ;
	format glu_5___7 best12. ;
	format notes_glu_obs $5000. ;
	format assisted_blood_gluco_v_7 best12. ;
	format sterilization_loc___1 best12. ;
	format sterilization_loc___2 best12. ;
	format sterilization_loc___3 best12. ;
	format sterilization_loc___4 best12. ;
	format sterilization_loc___5 best12. ;
	format iuss___1 best12. ;
	format iuss___2 best12. ;
	format iuss___3 best12. ;
	format iuss___4 best12. ;
	format hld_loc___1 best12. ;
	format hld_loc___2 best12. ;
	format hld_loc___3 best12. ;
	format hld_loc___4 best12. ;
	format hld_loc___5 best12. ;
	format critical_item___1 best12. ;
	format critical_item___2 best12. ;
	format critical_item___3 best12. ;
	format critical_item___4 best12. ;
	format hld_items___1 best12. ;
	format hld_items___2 best12. ;
	format hld_items___3 best12. ;
	format hld_items___4 best12. ;
	format single_items___1 best12. ;
	format single_items___2 best12. ;
	format single_items___3 best12. ;
	format single_items___4 best12. ;
	format expand_sterildisinf $5000. ;
	format sterilizationdisinfe_v_8 best12. ;
	format laundry___1 best12. ;
	format laundry___2 best12. ;
	format laundry___3 best12. ;
	format laundry___4 best12. ;
	format bag_laund___1 best12. ;
	format bag_laund___2 best12. ;
	format bag_laund___3 best12. ;
	format bag_laund___4 best12. ;
	format trans_laund___1 best12. ;
	format trans_laund___2 best12. ;
	format trans_laund___3 best12. ;
	format trans_laund___4 best12. ;
	format store_laund___1 best12. ;
	format store_laund___2 best12. ;
	format store_laund___3 best12. ;
	format store_laund___4 best12. ;
	format supp_laund___1 best12. ;
	format supp_laund___2 best12. ;
	format supp_laund___3 best12. ;
	format clean_laund___1 best12. ;
	format clean_laund___2 best12. ;
	format clean_laund___3 best12. ;
	format expand_healthlaund $5000. ;
	format healthcare_laundry_complete best12. ;
	format ob_type___1 best12. ;
	format ob_type___2 best12. ;
	format ob_type___3 best12. ;
	format ob_type___4 best12. ;
	format ob_type___5 best12. ;
	format ob_type___6 best12. ;
	format aware_covid___1 best12. ;
	format aware_covid___2 best12. ;
	format aware_covid___3 best12. ;
	format aware_covid___4 best12. ;
	format signs_covid___1 best12. ;
	format signs_covid___2 best12. ;
	format signs_covid___4 best12. ;
	format resp_entrance_covid___1 best12. ;
	format resp_entrance_covid___2 best12. ;
	format resp_entrance_covid___4 best12. ;
	format resp_visitors_covid___1 best12. ;
	format resp_visitors_covid___2 best12. ;
	format resp_visitors_covid___3 best12. ;
	format resp_visitors_covid___4 best12. ;
	format visitors_hh_covid___1 best12. ;
	format visitors_hh_covid___2 best12. ;
	format visitors_hh_covid___3 best12. ;
	format visitors_hh_covid___4 best12. ;
	format resp_station_covid___1 best12. ;
	format resp_station_covid___2 best12. ;
	format resp_station_covid___4 best12. ;
	format signage_covid___1 best12. ;
	format signage_covid___2 best12. ;
	format signage_covid___4 best12. ;
	format sick_leave_covid___1 best12. ;
	format sick_leave_covid___2 best12. ;
	format sick_leave_covid___3 best12. ;
	format sick_leave_covid___4 best12. ;
	format return_work_covid___1 best12. ;
	format return_work_covid___2 best12. ;
	format return_work_covid___3 best12. ;
	format return_work_covid___4 best12. ;
	format ppe_covid___1 best12. ;
	format ppe_covid___2 best12. ;
	format ppe_covid___3 best12. ;
	format ppe_covid___4 best12. ;
	format tbp_signage_covid___1 best12. ;
	format tbp_signage_covid___2 best12. ;
	format tbp_signage_covid___4 best12. ;
	format fit_testing_covid___1 best12. ;
	format fit_testing_covid___2 best12. ;
	format fit_testing_covid___3 best12. ;
	format fit_testing_covid___4 best12. ;
	format ppe_pou_covid___1 best12. ;
	format ppe_pou_covid___2 best12. ;
	format ppe_pou_covid___4 best12. ;
	format disposable_masks_covid___1 best12. ;
	format disposable_masks_covid___2 best12. ;
	format disposable_masks_covid___3 best12. ;
	format disposable_masks_covid___4 best12. ;
	format staff_tbp_covid___1 best12. ;
	format staff_tbp_covid___2 best12. ;
	format staff_tbp_covid___4 best12. ;
	format residents_tbp_covid___1 best12. ;
	format residents_tbp_covid___2 best12. ;
	format residents_tbp_covid___3 best12. ;
	format residents_tbp_covid___4 best12. ;
	format private_rooms_covid___1 best12. ;
	format private_rooms_covid___2 best12. ;
	format private_rooms_covid___3 best12. ;
	format private_rooms_covid___4 best12. ;
	format hh_audits_covid___1 best12. ;
	format hh_audits_covid___2 best12. ;
	format hh_audits_covid___3 best12. ;
	format hh_audits_covid___4 best12. ;
	format ppe_audits_covid___1 best12. ;
	format ppe_audits_covid___2 best12. ;
	format ppe_audits_covid___3 best12. ;
	format ppe_audits_covid___4 best12. ;
	format precautions_covid___1 best12. ;
	format precautions_covid___2 best12. ;
	format precautions_covid___3 best12. ;
	format precautions_covid___4 best12. ;
	format high_touch_covid___1 best12. ;
	format high_touch_covid___2 best12. ;
	format high_touch_covid___3 best12. ;
	format high_touch_covid___4 best12. ;
	format disinfect_covid___1 best12. ;
	format disinfect_covid___2 best12. ;
	format disinfect_covid___4 best12. ;
	format disinfect_pou_covid___1 best12. ;
	format disinfect_pou_covid___2 best12. ;
	format disinfect_pou_covid___4 best12. ;
	format equip_dedicated_covid___1 best12. ;
	format equip_dedicated_covid___2 best12. ;
	format equip_dedicated_covid___3 best12. ;
	format equip_dedicated_covid___4 best12. ;
	format ppe_supply_covid___1 best12. ;
	format ppe_supply_covid___2 best12. ;
	format ppe_supply_covid___3 best12. ;
	format ppe_supply_covid___4 best12. ;
	format universal_mask_covid___1 best12. ;
	format universal_mask_covid___2 best12. ;
	format universal_mask_covid___3 best12. ;
	format universal_mask_covid___4 best12. ;
	format hh_throughout_covid___1 best12. ;
	format hh_throughout_covid___2 best12. ;
	format hh_throughout_covid___4 best12. ;
	format hh_inout_covid___1 best12. ;
	format hh_inout_covid___2 best12. ;
	format hh_inout_covid___4 best12. ;
	format hh_semi_private_covid___1 best12. ;
	format hh_semi_private_covid___2 best12. ;
	format hh_semi_private_covid___4 best12. ;
	format aware_flu___1 best12. ;
	format aware_flu___2 best12. ;
	format aware_flu___3 best12. ;
	format aware_flu___4 best12. ;
	format signs_flu___1 best12. ;
	format signs_flu___2 best12. ;
	format signs_flu___4 best12. ;
	format resp_entrance_flu___1 best12. ;
	format resp_entrance_flu___2 best12. ;
	format resp_entrance_flu___4 best12. ;
	format resp_visitors_flu___1 best12. ;
	format resp_visitors_flu___2 best12. ;
	format resp_visitors_flu___3 best12. ;
	format resp_visitors_flu___4 best12. ;
	format visitors_hh_flu___1 best12. ;
	format visitors_hh_flu___2 best12. ;
	format visitors_hh_flu___3 best12. ;
	format visitors_hh_flu___4 best12. ;
	format resp_station_flu___1 best12. ;
	format resp_station_flu___2 best12. ;
	format resp_station_flu___4 best12. ;
	format signage_flu___1 best12. ;
	format signage_flu___2 best12. ;
	format signage_flu___4 best12. ;
	format sick_leave_flu___1 best12. ;
	format sick_leave_flu___2 best12. ;
	format sick_leave_flu___3 best12. ;
	format sick_leave_flu___4 best12. ;
	format return_work_flu___1 best12. ;
	format return_work_flu___2 best12. ;
	format return_work_flu___3 best12. ;
	format return_work_flu___4 best12. ;
	format ppe_flu___1 best12. ;
	format ppe_flu___2 best12. ;
	format ppe_flu___3 best12. ;
	format ppe_flu___4 best12. ;
	format tbp_signage_flu___1 best12. ;
	format tbp_signage_flu___2 best12. ;
	format tbp_signage_flu___4 best12. ;
	format ppe_pou_flu___1 best12. ;
	format ppe_pou_flu___2 best12. ;
	format ppe_pou_flu___4 best12. ;
	format disposable_masks_flu___1 best12. ;
	format disposable_masks_flu___2 best12. ;
	format disposable_masks_flu___3 best12. ;
	format disposable_masks_flu___4 best12. ;
	format staff_tbp_flu___1 best12. ;
	format staff_tbp_flu___2 best12. ;
	format staff_tbp_flu___4 best12. ;
	format residents_tbp_flu___1 best12. ;
	format residents_tbp_flu___2 best12. ;
	format residents_tbp_flu___3 best12. ;
	format residents_tbp_flu___4 best12. ;
	format private_rooms_flu___1 best12. ;
	format private_rooms_flu___2 best12. ;
	format private_rooms_flu___3 best12. ;
	format private_rooms_flu___4 best12. ;
	format hh_audits_flu___1 best12. ;
	format hh_audits_flu___2 best12. ;
	format hh_audits_flu___3 best12. ;
	format hh_audits_flu___4 best12. ;
	format ppe_audits_flu___1 best12. ;
	format ppe_audits_flu___2 best12. ;
	format ppe_audits_flu___3 best12. ;
	format ppe_audits_flu___4 best12. ;
	format precautions_flu___1 best12. ;
	format precautions_flu___2 best12. ;
	format precautions_flu___3 best12. ;
	format precautions_flu___4 best12. ;
	format high_touch_flu___1 best12. ;
	format high_touch_flu___2 best12. ;
	format high_touch_flu___3 best12. ;
	format high_touch_flu___4 best12. ;
	format disinfect_flu___1 best12. ;
	format disinfect_flu___2 best12. ;
	format disinfect_flu___4 best12. ;
	format disinfect_pou_flu___1 best12. ;
	format disinfect_pou_flu___2 best12. ;
	format disinfect_pou_flu___3 best12. ;
	format disinfect_pou_flu___4 best12. ;
	format ppe_supply_flu___1 best12. ;
	format ppe_supply_flu___2 best12. ;
	format ppe_supply_flu___3 best12. ;
	format ppe_supply_flu___4 best12. ;
	format hh_throughout_flu___1 best12. ;
	format hh_throughout_flu___2 best12. ;
	format hh_throughout_flu___4 best12. ;
	format hh_inout_flu___1 best12. ;
	format hh_inout_flu___2 best12. ;
	format hh_inout_flu___4 best12. ;
	format hh_semi_private_flu___1 best12. ;
	format hh_semi_private_flu___2 best12. ;
	format hh_semi_private_flu___4 best12. ;
	format aware_rsv___1 best12. ;
	format aware_rsv___2 best12. ;
	format aware_rsv___3 best12. ;
	format aware_rsv___4 best12. ;
	format signs_rsv___1 best12. ;
	format signs_rsv___2 best12. ;
	format signs_rsv___4 best12. ;
	format resp_entrance_rsv___1 best12. ;
	format resp_entrance_rsv___2 best12. ;
	format resp_entrance_rsv___4 best12. ;
	format resp_visitors_rsv___1 best12. ;
	format resp_visitors_rsv___2 best12. ;
	format resp_visitors_rsv___3 best12. ;
	format resp_visitors_rsv___4 best12. ;
	format visitors_hh_rsv___1 best12. ;
	format visitors_hh_rsv___2 best12. ;
	format visitors_hh_rsv___3 best12. ;
	format visitors_hh_rsv___4 best12. ;
	format resp_station_rsv___1 best12. ;
	format resp_station_rsv___2 best12. ;
	format resp_station_rsv___4 best12. ;
	format signage_rsv___1 best12. ;
	format signage_rsv___2 best12. ;
	format signage_rsv___4 best12. ;
	format sick_leave_rsv___1 best12. ;
	format sick_leave_rsv___2 best12. ;
	format sick_leave_rsv___3 best12. ;
	format sick_leave_rsv___4 best12. ;
	format return_work_rsv___1 best12. ;
	format return_work_rsv___2 best12. ;
	format return_work_rsv___3 best12. ;
	format return_work_rsv___4 best12. ;
	format ppe_rsv___1 best12. ;
	format ppe_rsv___2 best12. ;
	format ppe_rsv___3 best12. ;
	format ppe_rsv___4 best12. ;
	format tbp_signage_rsv___1 best12. ;
	format tbp_signage_rsv___2 best12. ;
	format tbp_signage_rsv___4 best12. ;
	format stand_precaut_rsv___1 best12. ;
	format stand_precaut_rsv___2 best12. ;
	format stand_precaut_rsv___3 best12. ;
	format stand_precaut_rsv___4 best12. ;
	format ppe_pou_rsv___1 best12. ;
	format ppe_pou_rsv___2 best12. ;
	format ppe_pou_rsv___4 best12. ;
	format disposable_masks_rsv___1 best12. ;
	format disposable_masks_rsv___2 best12. ;
	format disposable_masks_rsv___3 best12. ;
	format disposable_masks_rsv___4 best12. ;
	format staff_tbp_rsv___1 best12. ;
	format staff_tbp_rsv___2 best12. ;
	format staff_tbp_rsv___4 best12. ;
	format residents_tbp_rsv___1 best12. ;
	format residents_tbp_rsv___2 best12. ;
	format residents_tbp_rsv___3 best12. ;
	format residents_tbp_rsv___4 best12. ;
	format private_rooms_rsv___1 best12. ;
	format private_rooms_rsv___2 best12. ;
	format private_rooms_rsv___3 best12. ;
	format private_rooms_rsv___4 best12. ;
	format hh_audits_rsv___1 best12. ;
	format hh_audits_rsv___2 best12. ;
	format hh_audits_rsv___3 best12. ;
	format hh_audits_rsv___4 best12. ;
	format ppe_audits_rsv___1 best12. ;
	format ppe_audits_rsv___2 best12. ;
	format ppe_audits_rsv___3 best12. ;
	format ppe_audits_rsv___4 best12. ;
	format precautions_rsv___1 best12. ;
	format precautions_rsv___2 best12. ;
	format precautions_rsv___3 best12. ;
	format precautions_rsv___4 best12. ;
	format high_touch_rsv___1 best12. ;
	format high_touch_rsv___2 best12. ;
	format high_touch_rsv___3 best12. ;
	format high_touch_rsv___4 best12. ;
	format disinfect_rsv___1 best12. ;
	format disinfect_rsv___2 best12. ;
	format disinfect_rsv___4 best12. ;
	format disinfect_pou_rsv___1 best12. ;
	format disinfect_pou_rsv___2 best12. ;
	format disinfect_pou_rsv___4 best12. ;
	format equipment_dedicated_rsv___1 best12. ;
	format equipment_dedicated_rsv___2 best12. ;
	format equipment_dedicated_rsv___3 best12. ;
	format equipment_dedicated_rsv___4 best12. ;
	format ppe_supply_rsv___1 best12. ;
	format ppe_supply_rsv___2 best12. ;
	format ppe_supply_rsv___3 best12. ;
	format ppe_supply_rsv___4 best12. ;
	format hh_throughout_rsv___1 best12. ;
	format hh_throughout_rsv___2 best12. ;
	format hh_throughout_rsv___4 best12. ;
	format hh_inout_rsv___1 best12. ;
	format hh_inout_rsv___2 best12. ;
	format hh_inout_rsv___4 best12. ;
	format hh_semi_private_rsv___1 best12. ;
	format hh_semi_private_rsv___2 best12. ;
	format hh_semi_private_rsv___4 best12. ;
	format aware_noro___1 best12. ;
	format aware_noro___2 best12. ;
	format aware_noro___3 best12. ;
	format aware_noro___4 best12. ;
	format signs_noro___1 best12. ;
	format signs_noro___2 best12. ;
	format signs_noro___4 best12. ;
	format resp_entrance_noro___1 best12. ;
	format resp_entrance_noro___2 best12. ;
	format resp_entrance_noro___4 best12. ;
	format resp_visitors_noro___1 best12. ;
	format resp_visitors_noro___2 best12. ;
	format resp_visitors_noro___3 best12. ;
	format resp_visitors_noro___4 best12. ;
	format visitors_hh_noro___1 best12. ;
	format visitors_hh_noro___2 best12. ;
	format visitors_hh_noro___3 best12. ;
	format visitors_hh_noro___4 best12. ;
	format sick_leave_noro___1 best12. ;
	format sick_leave_noro___2 best12. ;
	format sick_leave_noro___3 best12. ;
	format sick_leave_noro___4 best12. ;
	format return_work_noro___1 best12. ;
	format return_work_noro___2 best12. ;
	format return_work_noro___3 best12. ;
	format return_work_noro___4 best12. ;
	format ppe_noro___1 best12. ;
	format ppe_noro___2 best12. ;
	format ppe_noro___3 best12. ;
	format ppe_noro___4 best12. ;
	format bp_signage_noro___1 best12. ;
	format bp_signage_noro___2 best12. ;
	format bp_signage_noro___3 best12. ;
	format bp_signage_noro___4 best12. ;
	format ppe_pou_noro___1 best12. ;
	format ppe_pou_noro___2 best12. ;
	format ppe_pou_noro___4 best12. ;
	format staff_tbp_noro___1 best12. ;
	format staff_tbp_noro___2 best12. ;
	format staff_tbp_noro___4 best12. ;
	format residents_tbp_noro___1 best12. ;
	format residents_tbp_noro___2 best12. ;
	format residents_tbp_noro___3 best12. ;
	format residents_tbp_noro___4 best12. ;
	format private_rooms_noro___1 best12. ;
	format private_rooms_noro___2 best12. ;
	format private_rooms_noro___3 best12. ;
	format private_rooms_noro___4 best12. ;
	format wash_hands_noro___1 best12. ;
	format wash_hands_noro___2 best12. ;
	format wash_hands_noro___3 best12. ;
	format wash_hands_noro___4 best12. ;
	format hh_audits_noro___1 best12. ;
	format hh_audits_noro___2 best12. ;
	format hh_audits_noro___3 best12. ;
	format hh_audits_noro___4 best12. ;
	format ppe_audits_noro___1 best12. ;
	format ppe_audits_noro___2 best12. ;
	format ppe_audits_noro___3 best12. ;
	format ppe_audits_noro___4 best12. ;
	format precautions_noro___1 best12. ;
	format precautions_noro___2 best12. ;
	format precautions_noro___3 best12. ;
	format precautions_noro___4 best12. ;
	format high_touch_noro___1 best12. ;
	format high_touch_noro___2 best12. ;
	format high_touch_noro___3 best12. ;
	format high_touch_noro___4 best12. ;
	format disinfect_noro___1 best12. ;
	format disinfect_noro___2 best12. ;
	format disinfect_noro___4 best12. ;
	format disinfect_pou_noro___1 best12. ;
	format disinfect_pou_noro___2 best12. ;
	format disinfect_pou_noro___4 best12. ;
	format equipment_dedicated_noro___1 best12. ;
	format equipment_dedicated_noro___2 best12. ;
	format equipment_dedicated_noro___3 best12. ;
	format equipment_dedicated_noro___4 best12. ;
	format ppe_supply___1 best12. ;
	format ppe_supply___2 best12. ;
	format ppe_supply___3 best12. ;
	format ppe_supply___4 best12. ;
	format hh_throughout_noro___1 best12. ;
	format hh_throughout_noro___2 best12. ;
	format hh_throughout_noro___4 best12. ;
	format hh_inout_noro___1 best12. ;
	format hh_inout_noro___2 best12. ;
	format hh_inout_noro___4 best12. ;
	format sinks_noro___1 best12. ;
	format sinks_noro___2 best12. ;
	format sinks_noro___4 best12. ;
	format hh_semi_private_noro___1 best12. ;
	format hh_semi_private_noro___2 best12. ;
	format hh_semi_private_noro___4 best12. ;
	format pathresist_mdro $5000. ;
	format contr_ob_mdro___1 best12. ;
	format contr_ob_mdro___2 best12. ;
	format contr_ob_mdro___3 best12. ;
	format contr_ob_mdro___4 best12. ;
	format contr_ob_mdro___5 best12. ;
	format contr_ob_mdro___6 best12. ;
	format contr_ob_mdro___7 best12. ;
	format contr_ob_mdro___8 best12. ;
	format contr_ob_mdro___9 best12. ;
	format cont_other_ob_mdro $5000. ;
	format screen_ob_mdro___1 best12. ;
	format screen_ob_mdro___2 best12. ;
	format screen_ob_mdro___3 best12. ;
	format screen_ob_mdro___4 best12. ;
	format rec_ob_mdro___1 best12. ;
	format rec_ob_mdro___2 best12. ;
	format rec_ob_mdro___3 best12. ;
	format rec_ob_mdro___4 best12. ;
	format iso_ob_mdro___1 best12. ;
	format iso_ob_mdro___2 best12. ;
	format iso_ob_mdro___3 best12. ;
	format iso_ob_mdro___4 best12. ;
	format contacts_ob_mdro___1 best12. ;
	format contacts_ob_mdro___2 best12. ;
	format contacts_ob_mdro___3 best12. ;
	format contacts_ob_mdro___4 best12. ;
	format precaut_ob_mdro___1 best12. ;
	format precaut_ob_mdro___2 best12. ;
	format precaut_ob_mdro___4 best12. ;
	format staff_ob_mdro___1 best12. ;
	format staff_ob_mdro___2 best12. ;
	format staff_ob_mdro___4 best12. ;
	format edu_ob_mdro___1 best12. ;
	format edu_ob_mdro___2 best12. ;
	format edu_ob_mdro___3 best12. ;
	format edu_ob_mdro___4 best12. ;
	format report_list_mdro___1 best12. ;
	format report_list_mdro___2 best12. ;
	format report_list_mdro___3 best12. ;
	format report_list_mdro___4 best12. ;
	format ph_contact_mdro___1 best12. ;
	format ph_contact_mdro___2 best12. ;
	format ph_contact_mdro___3 best12. ;
	format ph_contact_mdro___4 best12. ;
	format comm_infect_mdro___1 best12. ;
	format comm_infect_mdro___2 best12. ;
	format comm_infect_mdro___3 best12. ;
	format comm_infect_mdro___4 best12. ;
	format infect_intake_mdro___1 best12. ;
	format infect_intake_mdro___2 best12. ;
	format infect_intake_mdro___3 best12. ;
	format infect_intake_mdro___4 best12. ;
	format lab_notif_mdro___1 best12. ;
	format lab_notif_mdro___2 best12. ;
	format lab_notif_mdro___3 best12. ;
	format lab_notif_mdro___4 best12. ;
	format indiv_antistew_mdro___1 best12. ;
	format indiv_antistew_mdro___2 best12. ;
	format indiv_antistew_mdro___3 best12. ;
	format indiv_antistew_mdro___4 best12. ;
	format indiv_antistew_mdro___5 best12. ;
	format indiv_antistew_mdro___6 best12. ;
	format other_antistew_mdro $500. ;
	format hh_policies_mdro___1 best12. ;
	format hh_policies_mdro___2 best12. ;
	format hh_policies_mdro___3 best12. ;
	format hh_policies_mdro___4 best12. ;
	format hh_expectations_mdro___1 best12. ;
	format hh_expectations_mdro___2 best12. ;
	format hh_expectations_mdro___3 best12. ;
	format hh_expectations_mdro___4 best12. ;
	format hh_expectations_mdro___5 best12. ;
	format hh_expectations_mdro___6 best12. ;
	format hh_expectations_mdro___7 best12. ;
	format hh_expectations_mdro___8 best12. ;
	format hh_expectations_mdro___9 best12. ;
	format hh_inout_mdro___1 best12. ;
	format hh_inout_mdro___2 best12. ;
	format hh_inout_mdro___4 best12. ;
	format hh_sinkavail_mdro___1 best12. ;
	format hh_sinkavail_mdro___2 best12. ;
	format hh_sinkavail_mdro___3 best12. ;
	format hh_sinkavail_mdro___4 best12. ;
	format hh_soapwater_mdro___1 best12. ;
	format hh_soapwater_mdro___2 best12. ;
	format hh_soapwater_mdro___3 best12. ;
	format hh_soapwater_mdro___4 best12. ;
	format hh_soapwater_mdro___5 best12. ;
	format hh_soapwater_mdro___6 best12. ;
	format hh_throughout_mdro___1 best12. ;
	format hh_throughout_mdro___2 best12. ;
	format hh_throughout_mdro___3 best12. ;
	format hh_pocket_mdro___1 best12. ;
	format hh_pocket_mdro___2 best12. ;
	format hh_pocket_mdro___3 best12. ;
	format hh_pocket_mdro___4 best12. ;
	format hh_only_mdro___1 best12. ;
	format hh_only_mdro___2 best12. ;
	format hh_only_mdro___3 best12. ;
	format hh_only_mdro___4 best12. ;
	format hh_supplies_mdro___1 best12. ;
	format hh_supplies_mdro___2 best12. ;
	format hh_supplies_mdro___4 best12. ;
	format hh_lotion_mdro___1 best12. ;
	format hh_lotion_mdro___2 best12. ;
	format hh_lotion_mdro___3 best12. ;
	format hh_lotion_mdro___4 best12. ;
	format hh_lotion_mdro___5 best12. ;
	format hh_nails_mdro___1 best12. ;
	format hh_nails_mdro___2 best12. ;
	format hh_nails_mdro___3 best12. ;
	format hh_nails_mdro___4 best12. ;
	format patienthh_mdro___1 best12. ;
	format patienthh_mdro___2 best12. ;
	format patienthh_mdro___3 best12. ;
	format patienthh_mdro___4 best12. ;
	format patienthh_mdro___5 best12. ;
	format transmission_policy_mdro___1 best12. ;
	format transmission_policy_mdro___2 best12. ;
	format transmission_policy_mdro___3 best12. ;
	format transmission_policy_mdro___4 best12. ;
	format trans_signage_mdro___1 best12. ;
	format trans_signage_mdro___2 best12. ;
	format trans_signage_mdro___3 best12. ;
	format trans_signage_mdro___4 best12. ;
	format trans_signage_mdro___5 best12. ;
	format trans_signage_mdro___6 best12. ;
	format trans_signage_mdro___7 best12. ;
	format trans_signage_mdro___8 best12. ;
	format trans_signage_mdro___9 best12. ;
	format ppe_supplies_mdro___1 best12. ;
	format ppe_supplies_mdro___2 best12. ;
	format ppe_supplies_mdro___4 best12. ;
	format semipriv_mdro___1 best12. ;
	format semipriv_mdro___2 best12. ;
	format semipriv_mdro___3 best12. ;
	format semipriv_mdro___4 best12. ;
	format tbp_admit_mdro___1 best12. ;
	format tbp_admit_mdro___2 best12. ;
	format tbp_admit_mdro___3 best12. ;
	format tbp_admit_mdro___4 best12. ;
	format tbp_transfer_mdro___1 best12. ;
	format tbp_transfer_mdro___2 best12. ;
	format tbp_transfer_mdro___3 best12. ;
	format tbp_transfer_mdro___4 best12. ;
	format tbp_change_mdro___1 best12. ;
	format tbp_change_mdro___2 best12. ;
	format tbp_change_mdro___3 best12. ;
	format tbp_change_mdro___4 best12. ;
	format ebp_identify_mdro___1 best12. ;
	format ebp_identify_mdro___2 best12. ;
	format ebp_identify_mdro___3 best12. ;
	format ebp_identify_mdro___4 best12. ;
	format trans_signforclean_mdro___1 best12. ;
	format trans_signforclean_mdro___2 best12. ;
	format trans_signforclean_mdro___3 best12. ;
	format trans_signforclean_mdro___4 best12. ;
	format one_time_syringe_mdro___1 best12. ;
	format one_time_syringe_mdro___2 best12. ;
	format one_time_syringe_mdro___3 best12. ;
	format one_time_syringe_mdro___4 best12. ;
	format watermang_mdro___1 best12. ;
	format watermang_mdro___2 best12. ;
	format watermang_mdro___3 best12. ;
	format watermang_mdro___4 best12. ;
	format splash_mdro___1 best12. ;
	format splash_mdro___2 best12. ;
	format splash_mdro___3 best12. ;
	format splash_mdro___5 best12. ;
	format splash_mdro___6 best12. ;
	format splash_mdro___7 best12. ;
	format splash_mdro___8 best12. ;
	format splash_mdro___9 best12. ;
	format splash_mdro___10 best12. ;
	format splash_mdro___11 best12. ;
	format splash_mdro___12 best12. ;
	format splash_other_mdro $5000. ;
	format biofilm_measures_mdro___1 best12. ;
	format biofilm_measures_mdro___2 best12. ;
	format biofilm_measures_mdro___3 best12. ;
	format biofilm_measures_mdro___4 best12. ;
	format biofilm_measures_mdro___5 best12. ;
	format biofilm_measures_mdro___6 best12. ;
	format biofilm_measures_mdro___7 best12. ;
	format biofilm_meas_other_mdro $5000. ;
	format toiletdoor_mdro___1 best12. ;
	format toiletdoor_mdro___2 best12. ;
	format toiletdoor_mdro___3 best12. ;
	format toiletdoor_mdro___4 best12. ;
	format toiletdoor_no_mdro___1 best12. ;
	format toiletdoor_no_mdro___2 best12. ;
	format toiletdoor_no_mdro___3 best12. ;
	format toiletdoor_no_mdro___4 best12. ;
	format hooperdoor_mdro___1 best12. ;
	format hooperdoor_mdro___2 best12. ;
	format hooperdoor_mdro___3 best12. ;
	format hooperdoor_mdro___4 best12. ;
	format hopperdoor_no_mdro___1 best12. ;
	format hopperdoor_no_mdro___2 best12. ;
	format hopperdoor_no_mdro___3 best12. ;
	format hopperdoor_no_mdro___4 best12. ;
	format iceobs_mdro___1 best12. ;
	format iceobs_mdro___2 best12. ;
	format iceobs_mdro___4 best12. ;
	format icemaint_mdro___1 best12. ;
	format icemaint_mdro___2 best12. ;
	format icemaint_mdro___3 best12. ;
	format icemaint_mdro___4 best12. ;
	format showerchair_mdro___1 best12. ;
	format showerchair_mdro___2 best12. ;
	format showerchair_mdro___3 best12. ;
	format showerchair_mdro___4 best12. ;
	format ptcarewater_mdro___1 best12. ;
	format ptcarewater_mdro___2 best12. ;
	format ptcarewater_mdro___3 best12. ;
	format ptcarewater_mdro___4 best12. ;
	format woundmask_gas___1 best12. ;
	format woundmask_gas___2 best12. ;
	format woundmask_gas___3 best12. ;
	format reusable_gas___1 best12. ;
	format reusable_gas___2 best12. ;
	format reusable_gas___3 best12. ;
	format devices_disinf_gas___1 best12. ;
	format devices_disinf_gas___2 best12. ;
	format devices_disinf_gas___3 best12. ;
	format devices_disinf_gas___4 best12. ;
	format aware_gas___1 best12. ;
	format aware_gas___2 best12. ;
	format aware_gas___3 best12. ;
	format aware_gas___4 best12. ;
	format wound_notes_gas $5000. ;
	format precautions_gas___1 best12. ;
	format precautions_gas___2 best12. ;
	format precautions_gas___3 best12. ;
	format precautions_gas___4 best12. ;
	format trans_signage_gas___1 best12. ;
	format trans_signage_gas___2 best12. ;
	format trans_signage_gas___3 best12. ;
	format trans_signage_gas___4 best12. ;
	format trans_signage_gas___5 best12. ;
	format trans_signage_gas___6 best12. ;
	format trans_signage_gas___7 best12. ;
	format trans_signage_gas___8 best12. ;
	format trans_signage_gas___9 best12. ;
	format ppe_supplies_gas___1 best12. ;
	format ppe_supplies_gas___2 best12. ;
	format ppe_supplies_gas___3 best12. ;
	format ppe_supplies_gas___4 best12. ;
	format semipriv_gas___1 best12. ;
	format semipriv_gas___2 best12. ;
	format semipriv_gas___3 best12. ;
	format semipriv_gas___4 best12. ;
	format tbp_change_gas___1 best12. ;
	format tbp_change_gas___2 best12. ;
	format tbp_change_gas___3 best12. ;
	format tbp_change_gas___4 best12. ;
	format resp_entrance_gas___1 best12. ;
	format resp_entrance_gas___2 best12. ;
	format resp_entrance_gas___3 best12. ;
	format resp_station_gas___1 best12. ;
	format resp_station_gas___2 best12. ;
	format resp_station_gas___3 best12. ;
	format resp_visitors_gas___1 best12. ;
	format resp_visitors_gas___2 best12. ;
	format resp_visitors_gas___3 best12. ;
	format resp_visitors_gas___4 best12. ;
	format sick_leave_gas___1 best12. ;
	format sick_leave_gas___2 best12. ;
	format sick_leave_gas___3 best12. ;
	format sick_leave_gas___4 best12. ;
	format resptreat_gas___1 best12. ;
	format resptreat_gas___2 best12. ;
	format resptreat_gas___3 best12. ;
	format resptreat_gas___4 best12. ;
	format resptreat_notes_gas $5000. ;
	format resp_aseptic_gas___1 best12. ;
	format resp_aseptic_gas___2 best12. ;
	format resp_aseptic_gas___3 best12. ;
	format resp_aseptic_gas___4 best12. ;
	format trachcare_gas___1 best12. ;
	format trachcare_gas___2 best12. ;
	format trachcare_gas___3 best12. ;
	format trachcare_gas___4 best12. ;
	format trachcare_gas___5 best12. ;
	format resp_supplies_gas___1 best12. ;
	format resp_supplies_gas___2 best12. ;
	format resp_supplies_gas___3 best12. ;
	format resp_supplies_gas___4 best12. ;
	format resp_notes_gas $5000. ;
	format disinfectequip_obs_gas___1 best12. ;
	format disinfectequip_obs_gas___2 best12. ;
	format disinfectequip_obs_gas___3 best12. ;
	format eqip_obs_gas___1 best12. ;
	format eqip_obs_gas___2 best12. ;
	format eqip_obs_gas___3 best12. ;
	format eqip_process_gas $5000. ;
	format policy_disinf_gas___1 best12. ;
	format policy_disinf_gas___2 best12. ;
	format policy_disinf_gas___3 best12. ;
	format policy_disinf_gas___4 best12. ;
	format contact_disinf_gas___1 best12. ;
	format contact_disinf_gas___2 best12. ;
	format contact_disinf_gas___3 best12. ;
	format contact_disinf_gas___4 best12. ;
	format hightouch_disinf_gas___1 best12. ;
	format hightouch_disinf_gas___2 best12. ;
	format hightouch_disinf_gas___3 best12. ;
	format hightouch_disinf_gas___4 best12. ;
	format epa_disinf_gas___1 best12. ;
	format epa_disinf_gas___2 best12. ;
	format epa_disinf_gas___3 best12. ;
	format epa_disinf_gas___4 best12. ;
	format shower_disinf_gas___1 best12. ;
	format shower_disinf_gas___2 best12. ;
	format shower_disinf_gas___3 best12. ;
	format shower_disinf_gas___4 best12. ;
	format shower_disinf_gas___5 best12. ;
	format showindicate_disinf_gas___1 best12. ;
	format showindicate_disinf_gas___2 best12. ;
	format showindicate_disinf_gas___3 best12. ;
	format showindicate_disinf_gas___4 best12. ;
	format showindicate_disinf_gas___5 best12. ;
	format supp_disinf_gas___1 best12. ;
	format supp_disinf_gas___2 best12. ;
	format supp_disinf_gas___3 best12. ;
	format enviro_notes_gas $5000. ;
	format trainaudit_notes_gas $5000. ;
	format outbreak_management__v_9 best12. ;
	format disease_ob___1 best12. ;
	format disease_ob___2 best12. ;
	format disease_ob___3 best12. ;
	format disease_ob___4 best12. ;
	format disease_ob___5 best12. ;
	format disease_ob___6 best12. ;
	format disease_ob___7 best12. ;
	format disease_ob___8 best12. ;
	format disease_ob___9 best12. ;
	format patho_ob $5000. ;
	format contr_ob___1 best12. ;
	format contr_ob___2 best12. ;
	format contr_ob___3 best12. ;
	format contr_ob___4 best12. ;
	format contr_ob___5 best12. ;
	format contr_ob___6 best12. ;
	format contr_ob___7 best12. ;
	format contr_ob___8 best12. ;
	format contr_ob___9 best12. ;
	format contr_ob___10 best12. ;
	format contr_ob___11 best12. ;
	format cont_other_ob $5000. ;
	format lhd_ob___1 best12. ;
	format lhd_ob___2 best12. ;
	format lhd_ob___3 best12. ;
	format screen_ob___1 best12. ;
	format screen_ob___2 best12. ;
	format screen_ob___3 best12. ;
	format rec_ob___1 best12. ;
	format rec_ob___2 best12. ;
	format rec_ob___3 best12. ;
	format iso_ob___1 best12. ;
	format iso_ob___2 best12. ;
	format iso_ob___3 best12. ;
	format contacts_ob___1 best12. ;
	format contacts_ob___2 best12. ;
	format contacts_ob___3 best12. ;
	format precaut_ob___1 best12. ;
	format precaut_ob___2 best12. ;
	format precaut_ob___3 best12. ;
	format staff_ob___1 best12. ;
	format staff_ob___2 best12. ;
	format staff_ob___3 best12. ;
	format edu_ob___1 best12. ;
	format edu_ob___2 best12. ;
	format edu_ob___3 best12. ;
	format edu_ob___4 best12. ;
	format expand_outbreak $5000. ;
	format outbreak_management_complete best12. ;
	format urincath_1___1 best12. ;
	format urincath_1___2 best12. ;
	format urincath_1___3 best12. ;
	format urincath_1___4 best12. ;
	format urincath_1___5 best12. ;
	format urincath_1___6 best12. ;
	format urincath_2___1 best12. ;
	format urincath_2___2 best12. ;
	format urincath_2___3 best12. ;
	format urincath_2___4 best12. ;
	format urincath_2___5 best12. ;
	format urincath_2___6 best12. ;
	format urincath_3___1 best12. ;
	format urincath_3___2 best12. ;
	format urincath_3___3 best12. ;
	format urincath_3___4 best12. ;
	format urincath_3___5 best12. ;
	format urincath_3___6 best12. ;
	format urincath_4___1 best12. ;
	format urincath_4___2 best12. ;
	format urincath_4___3 best12. ;
	format urincath_4___4 best12. ;
	format urincath_4___5 best12. ;
	format urincath_4___6 best12. ;
	format urincath_5___1 best12. ;
	format urincath_5___2 best12. ;
	format urincath_5___3 best12. ;
	format urincath_5___4 best12. ;
	format urincath_5___5 best12. ;
	format urincath_5___6 best12. ;
	format urincath_notes_obs $5000. ;
	format cl_1___1 best12. ;
	format cl_1___2 best12. ;
	format cl_1___3 best12. ;
	format cl_1___4 best12. ;
	format cl_1___5 best12. ;
	format cl_1___6 best12. ;
	format cl_1___7 best12. ;
	format cl_1___8 best12. ;
	format cl_2___1 best12. ;
	format cl_2___2 best12. ;
	format cl_2___3 best12. ;
	format cl_2___4 best12. ;
	format cl_2___5 best12. ;
	format cl_2___6 best12. ;
	format cl_2___7 best12. ;
	format cl_2___8 best12. ;
	format cl_3___1 best12. ;
	format cl_3___2 best12. ;
	format cl_3___3 best12. ;
	format cl_3___4 best12. ;
	format cl_3___5 best12. ;
	format cl_3___6 best12. ;
	format cl_3___7 best12. ;
	format cl_3___8 best12. ;
	format cl_4___1 best12. ;
	format cl_4___2 best12. ;
	format cl_4___3 best12. ;
	format cl_4___4 best12. ;
	format cl_4___5 best12. ;
	format cl_4___6 best12. ;
	format cl_4___7 best12. ;
	format cl_4___8 best12. ;
	format cl_5___1 best12. ;
	format cl_5___2 best12. ;
	format cl_5___3 best12. ;
	format cl_5___4 best12. ;
	format cl_5___5 best12. ;
	format cl_5___6 best12. ;
	format cl_5___7 best12. ;
	format cl_5___8 best12. ;
	format cld_1___1 best12. ;
	format cld_1___2 best12. ;
	format cld_1___3 best12. ;
	format cld_1___4 best12. ;
	format cld_1___5 best12. ;
	format cld_1___6 best12. ;
	format cld_1___7 best12. ;
	format cld_1___8 best12. ;
	format cld_1___9 best12. ;
	format cld_2___1 best12. ;
	format cld_2___2 best12. ;
	format cld_2___3 best12. ;
	format cld_2___4 best12. ;
	format cld_2___5 best12. ;
	format cld_2___6 best12. ;
	format cld_2___7 best12. ;
	format cld_2___8 best12. ;
	format cld_2___9 best12. ;
	format cld_3___1 best12. ;
	format cld_3___2 best12. ;
	format cld_3___3 best12. ;
	format cld_3___4 best12. ;
	format cld_3___5 best12. ;
	format cld_3___6 best12. ;
	format cld_3___7 best12. ;
	format cld_3___8 best12. ;
	format cld_3___9 best12. ;
	format cl_notes_obs $5000. ;
	format tra_1___1 best12. ;
	format tra_1___2 best12. ;
	format tra_1___3 best12. ;
	format tra_1___4 best12. ;
	format tra_1___5 best12. ;
	format tra_1___6 best12. ;
	format tra_1___7 best12. ;
	format tra_1___8 best12. ;
	format tra_1___9 best12. ;
	format tra_2___1 best12. ;
	format tra_2___2 best12. ;
	format tra_2___3 best12. ;
	format tra_2___4 best12. ;
	format tra_2___5 best12. ;
	format tra_2___6 best12. ;
	format tra_2___7 best12. ;
	format tra_2___8 best12. ;
	format tra_2___9 best12. ;
	format tra_3___1 best12. ;
	format tra_3___2 best12. ;
	format tra_3___3 best12. ;
	format tra_3___4 best12. ;
	format tra_3___5 best12. ;
	format tra_3___6 best12. ;
	format tra_3___7 best12. ;
	format tra_3___8 best12. ;
	format tra_3___9 best12. ;
	format suc_1___1 best12. ;
	format suc_1___2 best12. ;
	format suc_1___3 best12. ;
	format suc_1___4 best12. ;
	format suc_1___5 best12. ;
	format suc_1___6 best12. ;
	format suc_1___7 best12. ;
	format suc_2___1 best12. ;
	format suc_2___2 best12. ;
	format suc_2___3 best12. ;
	format suc_2___4 best12. ;
	format suc_2___5 best12. ;
	format suc_2___6 best12. ;
	format suc_2___7 best12. ;
	format suc_3___1 best12. ;
	format suc_3___2 best12. ;
	format suc_3___3 best12. ;
	format suc_3___4 best12. ;
	format suc_3___5 best12. ;
	format suc_3___6 best12. ;
	format suc_3___7 best12. ;
	format device_obs $5000. ;
	format expand_devicareobs $5000. ;
	format device_care_observat_v_10 best12. ;
	format wound_obs1___1 best12. ;
	format wound_obs1___2 best12. ;
	format wound_obs1___3 best12. ;
	format wound_obs1___4 best12. ;
	format wound_obs1___5 best12. ;
	format wound_obs1___6 best12. ;
	format wound_obs1___7 best12. ;
	format wound_obs1___8 best12. ;
	format wound_obs1___9 best12. ;
	format wound_obs1___10 best12. ;
	format wound_obs1___11 best12. ;
	format wound_obs1___12 best12. ;
	format wound_obs1___13 best12. ;
	format wound_obs1___14 best12. ;
	format wound_obs2___1 best12. ;
	format wound_obs2___2 best12. ;
	format wound_obs2___3 best12. ;
	format wound_obs2___4 best12. ;
	format wound_obs2___5 best12. ;
	format wound_obs2___6 best12. ;
	format wound_obs2___7 best12. ;
	format wound_obs2___8 best12. ;
	format wound_obs2___9 best12. ;
	format wound_obs2___10 best12. ;
	format wound_obs2___11 best12. ;
	format wound_obs2___12 best12. ;
	format wound_obs2___13 best12. ;
	format wound_obs2___14 best12. ;
	format wound_obs3___1 best12. ;
	format wound_obs3___2 best12. ;
	format wound_obs3___3 best12. ;
	format wound_obs3___4 best12. ;
	format wound_obs3___5 best12. ;
	format wound_obs3___6 best12. ;
	format wound_obs3___7 best12. ;
	format wound_obs3___8 best12. ;
	format wound_obs3___9 best12. ;
	format wound_obs3___10 best12. ;
	format wound_obs3___11 best12. ;
	format wound_obs3___12 best12. ;
	format wound_obs3___13 best12. ;
	format wound_obs3___14 best12. ;
	format wound_notes_obs $5000. ;
	format wound_care_observati_v_11 best12. ;

input
	record_id $
	assessor___1
	assessor___2
	assessor___3
	assessor___4
	assessor___5
	assessor___6
	assessor___7
	assessor___8
	assessor___9
	assessor___10
	date
	time
	visit_remote
	reason___1
	reason___2
	reason___3
	reason___4
	reason___5
	reason___6
	reason___7
	outbreak_type___1
	outbreak_type___2
	outbreak_type___3
	outbreak_type___4
	outbreak_type___5
	outbreak_type___6
	outbreak_type___7
	outbreak_mdro___1
	outbreak_mdro___2
	outbreak_mdro___3
	outbreak_mdro___4
	outbreak_mdro___5
	outbreak_mdro_number $
	reason_expand $
	facility_name $
	facility_county
	facility_zip $
	ripsvisit
	facility_type___1
	facility_type___2
	facility_type___3
	facility_type___4
	facility_type___5
	facility_type___6
	facility_type___7
	facility_type___8
	facility_type___9
	facility_type___10
	facility_type___11
	facility_type___12
	facility_type___13
	facility_type___14
	facility_type___15
	facility_type___16
	facility_type___17
	facility_type___18
	facility_type___19
	facility_type___20
	contact_facility $
	contact_title_facility $
	email_facility $
	phone_facility $
	beds_facility $
	license_number $
	ccn $
	nshn_number $
	system_facility
	system $
	full_ip
	ip_hours
	ip
	ip_name $
	ip_phone $
	ip_email $
	ip_training___1
	ip_training___2
	ip_training___3
	ip_training___4
	facility_information_complete
	report_list___1
	report_list___2
	report_list___3
	report_list___4
	ph_contact___1
	ph_contact___2
	ph_contact___3
	ph_contact___4
	comm_infect___1
	comm_infect___2
	comm_infect___3
	comm_infect___4
	infect_intake___1
	infect_intake___2
	infect_intake___3
	infect_intake___4
	ip_policies___1
	ip_policies___2
	ip_policies___3
	ip_policies___4
	ip_policies___5
	policies_reviewed___1
	policies_reviewed___2
	policies_reviewed___3
	policies_reviewed___4
	lab_notif___1
	lab_notif___2
	lab_notif___3
	lab_notif___4
	infect_monitoring___1
	infect_monitoring___2
	infect_monitoring___3
	infect_monitoring___4
	ip_process___1
	ip_process___2
	ip_process___3
	ip_process___4
	outbreak_response___1
	outbreak_response___2
	outbreak_response___3
	outbreak_response___4
	resp_program___1
	resp_program___2
	resp_program___3
	resp_program___4
	emergency_plan___1
	emergency_plan___2
	emergency_plan___3
	emergency_plan___4
	riskassess___1
	riskassess___2
	riskassess___3
	riskassess___4
	respetc_site___1
	respetc_site___2
	respetc_site___3
	prepare_strategies $
	expand_safety $
	work_exclusions___1
	work_exclusions___2
	work_exclusions___3
	work_exclusions___4
	tb_hire___1
	tb_hire___2
	tb_hire___3
	tb_hire___4
	tb_risk___1
	tb_risk___2
	tb_risk___3
	tb_risk___4
	bloodborne_plan___1
	bloodborne_plan___2
	bloodborne_plan___3
	bloodborne_plan___4
	hepb_vac___1
	hepb_vac___2
	hepb_vac___3
	hepb_vac___4
	annual_flu___1
	annual_flu___2
	annual_flu___3
	annual_flu___4
	annual_covid___1
	annual_covid___2
	annual_covid___3
	annual_covid___4
	vac_record___1
	vac_record___2
	vac_record___3
	vac_record___4
	tb_patient___1
	tb_patient___2
	tb_patient___3
	tb_patient___4
	tb_patient___5
	offer_vac___1
	offer_vac___2
	offer_vac___3
	offer_vac___4
	vac_edu___1
	vac_edu___2
	vac_edu___3
	vac_edu___4
	indiv_antistew___1
	indiv_antistew___2
	indiv_antistew___3
	indiv_antistew___4
	indiv_antistew___5
	indiv_antistew___6
	other_antistew $
	spice_referral
	operations_notes $
	employee_and_patient_v_0
	ip_education___1
	ip_education___2
	ip_education___3
	ip_education___4
	ip_education___5
	ip_education___6
	ip_education___7
	ip_education___8
	ip_education___9
	ip_education___10
	competency___1
	competency___2
	competency___3
	competency___4
	competency___5
	demonstrateskills___1
	demonstrateskills___2
	demonstrateskills___3
	demonstrateskills___4
	demonstrateskills___5
	demonstrateskills___6
	demonstrateskills___7
	demonstrateskills___8
	testtopics___1
	testtopics___2
	testtopics___3
	testtopics___4
	testtopics___5
	testtopics___6
	testtopics___7
	testtopics___8
	annualskills___1
	annualskills___2
	annualskills___3
	annualskills___4
	annualskills___5
	annualskills___6
	annualskills___7
	annualskills___8
	audits___1
	audits___2
	audits___3
	audits___4
	audits___5
	audits___6
	audits___7
	audits___8
	audits___9
	hh_audits
	audit_ppe
	audit_cleandisinf
	audit_injectsafety
	audit_poc
	audit_repro
	audits_feedback___1
	audits_feedback___2
	audits_feedback___3
	audits_feedback___4
	audits_feedback___5
	audits_feedback___6
	traningaudits_notes $
	trainingaudits_complete
	hh_policies___1
	hh_policies___2
	hh_policies___3
	hh_policies___4
	hh_expectations___1
	hh_expectations___2
	hh_expectations___3
	hh_expectations___4
	hh_expectations___5
	hh_expectations___6
	hh_expectations___7
	hh_expectations___8
	hh_expectations___9
	hh_inout___1
	hh_inout___2
	hh_inout___3
	hh_sinkavail___1
	hh_sinkavail___2
	hh_sinkavail___3
	hh_sinkavail___4
	hh_soapwater___1
	hh_soapwater___2
	hh_soapwater___3
	hh_soapwater___4
	hh_soapwater___5
	hh_soapwater___6
	hh_throughout___1
	hh_throughout___2
	hh_throughout___3
	hh_pocket___1
	hh_pocket___2
	hh_pocket___3
	hh_pocket___4
	hh_only___1
	hh_only___2
	hh_only___3
	hh_only___4
	hh_supplies___1
	hh_supplies___2
	hh_supplies___3
	hh_lotion___1
	hh_lotion___2
	hh_lotion___3
	hh_lotion___4
	hh_lotion___5
	hh_nails___1
	hh_nails___2
	hh_nails___3
	hh_nails___4
	patienthh___1
	patienthh___2
	patienthh___3
	patienthh___4
	patienthh___5
	expand_hh $
	hand_hygiene_complete
	hh_1
	hh_2
	hh_3
	hh_4
	hh_5
	hh_6
	hh_7
	hh_8
	hh_9
	hh_10
	expand_hhobs $
	hand_hygiene_observa_v_1
	transmission_policy___1
	transmission_policy___2
	transmission_policy___3
	transmission_policy___4
	trans_signage___1
	trans_signage___2
	trans_signage___3
	trans_signage___4
	trans_signage___5
	trans_signage___6
	trans_signage___7
	trans_signage___8
	trans_signage___9
	ppe_supplies___1
	ppe_supplies___2
	ppe_supplies___3
	semipriv___1
	semipriv___2
	semipriv___3
	semipriv___4
	tbp_admit___1
	tbp_admit___2
	tbp_admit___3
	tbp_admit___4
	tbp_transfer___1
	tbp_transfer___2
	tbp_transfer___3
	tbp_transfer___4
	tbp_change___1
	tbp_change___2
	tbp_change___3
	tbp_change___4
	ebp_identify___1
	ebp_identify___2
	ebp_identify___3
	ebp_identify___4
	trans_signforclean___1
	trans_signforclean___2
	trans_signforclean___3
	trans_signforclean___4
	resp_entrance___1
	resp_entrance___2
	resp_entrance___3
	resp_station___1
	resp_station___2
	resp_station___3
	resp_visitors___1
	resp_visitors___2
	resp_visitors___3
	resp_visitors___4
	fit_testing___1
	fit_testing___2
	fit_testing___3
	fit_testing___4
	expand_transmissionbased $
	standard_and_transmi_v_2
	prec_obs___1
	prec_obs___2
	prec_obs___3
	expand_prec_obs $
	don_obs___1
	don_obs___2
	don_obs___3
	expand_don_obs $
	doff_obs___1
	doff_obs___2
	doff_obs___3
	expand_doff_obs $
	aiir_obs___1
	aiir_obs___2
	aiir_obs___3
	aiir_obs___4
	aiir_obs___5
	aiir_obs___6
	expand_aiir_obs $
	priv_obs___1
	priv_obs___2
	priv_obs___3
	priv_obs___4
	expand_priv_obs $
	stand_obs $
	expand_precobs $
	standard_and_transmi_v_3
	policy_disinf___1
	policy_disinf___2
	policy_disinf___3
	policy_disinf___4
	contact_disinf___1
	contact_disinf___2
	contact_disinf___3
	contact_disinf___4
	hightouch_disinf___1
	hightouch_disinf___2
	hightouch_disinf___3
	hightouch_disinf___4
	room_disinf___1
	room_disinf___2
	room_disinf___3
	room_disinf___4
	epa_disinf___1
	epa_disinf___2
	epa_disinf___3
	epa_disinf___4
	equip_disinf___1
	equip_disinf___2
	equip_disinf___3
	equip_disinf___4
	gluc_disinf___1
	gluc_disinf___2
	gluc_disinf___3
	gluc_disinf___4
	disinf_glucavail___1
	disinf_glucavail___2
	disinf_glucavail___3
	gluc_disinfection_2___1
	gluc_disinfection_2___2
	gluc_disinfection_2___3
	gluc_disinfection_2___4
	shower_disinf___1
	shower_disinf___2
	shower_disinf___3
	shower_disinf___4
	shower_disinf___5
	showindicate_disinf___1
	showindicate_disinf___2
	showindicate_disinf___3
	showindicate_disinf___4
	showindicate_disinf___5
	supp_disinf___1
	supp_disinf___2
	supp_disinf___3
	devices_disinf
	expand_envircleaning $
	environmental_cleani_v_4
	hhprod_obs___1
	hhprod_obs___2
	hhprod_obs___3
	resp_signage_obs___1
	resp_signage_obs___2
	resp_signage_obs___3
	gen_obs___1
	gen_obs___2
	gen_obs___3
	expand_gen_obs $
	sink_obs___1
	sink_obs___2
	sink_obs___3
	expand_sink_obs $
	undersink_obs___1
	undersink_obs___2
	undersink_obs___3
	expand_undersink_obs $
	cleansupp_obs___1
	cleansupp_obs___2
	cleansupp_obs___3
	expand_cleansupp_obs $
	sharpstor_obs
	expand_sharpstor_obs $
	cleandirty_obs___1
	cleandirty_obs___2
	cleandirty_obs___3
	expand_cleandirty_obs $
	disinfectequip_obs___1
	disinfectequip_obs___2
	disinfectequip_obs___3
	eqip_obs___1
	eqip_obs___2
	eqip_obs___3
	expand_eqip_obs $
	coverlinen_obs___1
	coverlinen_obs___2
	coverlinen_obs___3
	expand_coverlinen_obs $
	soiled_obs___1
	soiled_obs___2
	soiled_obs___3
	expand_soiled_obs $
	sharps_obs___1
	sharps_obs___2
	sharps_obs___3
	medprep_obs___1
	medprep_obs___2
	medprep_obs___3
	expand_medprep_obs $
	expir_obs___1
	expir_obs___2
	expir_obs___3
	expand_expir_obs $
	expand_envirobs $
	environmental_observ_v_5
	gluc_disinf_2___1
	gluc_disinf_2___2
	gluc_disinf_2___3
	gluc_disinf_2___4
	disinf_glucavail_2___1
	disinf_glucavail_2___2
	disinf_glucavail_2___3
	gluc_disinfection___1
	gluc_disinfection___2
	gluc_disinfection___3
	gluc_disinfection___4
	gluc_supplies___1
	gluc_supplies___2
	gluc_supplies___3
	gluc_supplies___4
	stor_gluc___1
	stor_gluc___2
	stor_gluc___3
	insulin_pens___1
	insulin_pens___2
	insulin_pens___3
	insulin_storage___1
	insulin_storage___2
	insulin_storage___3
	inject_policy___1
	inject_policy___2
	inject_policy___3
	inject_policy___4
	one_time_syringe___1
	one_time_syringe___2
	one_time_syringe___3
	one_time_syringe___4
	single_dose___1
	single_dose___2
	single_dose___3
	single_dose___4
	multi_dose___1
	multi_dose___2
	multi_dose___3
	multi_dose___4
	gloves_inject___1
	gloves_inject___2
	gloves_inject___3
	gloves_inject___4
	diversion_policy___1
	diversion_policy___2
	diversion_policy___3
	diversion_policy___4
	expand_injectmed $
	infectionmedication__v_6
	glu_1___1
	glu_1___2
	glu_1___3
	glu_1___4
	glu_1___5
	glu_1___6
	glu_1___7
	glu_2___1
	glu_2___2
	glu_2___3
	glu_2___4
	glu_2___5
	glu_2___6
	glu_2___7
	glu_3___1
	glu_3___2
	glu_3___3
	glu_3___4
	glu_3___5
	glu_3___6
	glu_3___7
	glu_4___1
	glu_4___2
	glu_4___3
	glu_4___4
	glu_4___5
	glu_4___6
	glu_4___7
	glu_5___1
	glu_5___2
	glu_5___3
	glu_5___4
	glu_5___5
	glu_5___6
	glu_5___7
	notes_glu_obs $
	assisted_blood_gluco_v_7
	sterilization_loc___1
	sterilization_loc___2
	sterilization_loc___3
	sterilization_loc___4
	sterilization_loc___5
	iuss___1
	iuss___2
	iuss___3
	iuss___4
	hld_loc___1
	hld_loc___2
	hld_loc___3
	hld_loc___4
	hld_loc___5
	critical_item___1
	critical_item___2
	critical_item___3
	critical_item___4
	hld_items___1
	hld_items___2
	hld_items___3
	hld_items___4
	single_items___1
	single_items___2
	single_items___3
	single_items___4
	expand_sterildisinf $
	sterilizationdisinfe_v_8
	laundry___1
	laundry___2
	laundry___3
	laundry___4
	bag_laund___1
	bag_laund___2
	bag_laund___3
	bag_laund___4
	trans_laund___1
	trans_laund___2
	trans_laund___3
	trans_laund___4
	store_laund___1
	store_laund___2
	store_laund___3
	store_laund___4
	supp_laund___1
	supp_laund___2
	supp_laund___3
	clean_laund___1
	clean_laund___2
	clean_laund___3
	expand_healthlaund $
	healthcare_laundry_complete
	ob_type___1
	ob_type___2
	ob_type___3
	ob_type___4
	ob_type___5
	ob_type___6
	aware_covid___1
	aware_covid___2
	aware_covid___3
	aware_covid___4
	signs_covid___1
	signs_covid___2
	signs_covid___4
	resp_entrance_covid___1
	resp_entrance_covid___2
	resp_entrance_covid___4
	resp_visitors_covid___1
	resp_visitors_covid___2
	resp_visitors_covid___3
	resp_visitors_covid___4
	visitors_hh_covid___1
	visitors_hh_covid___2
	visitors_hh_covid___3
	visitors_hh_covid___4
	resp_station_covid___1
	resp_station_covid___2
	resp_station_covid___4
	signage_covid___1
	signage_covid___2
	signage_covid___4
	sick_leave_covid___1
	sick_leave_covid___2
	sick_leave_covid___3
	sick_leave_covid___4
	return_work_covid___1
	return_work_covid___2
	return_work_covid___3
	return_work_covid___4
	ppe_covid___1
	ppe_covid___2
	ppe_covid___3
	ppe_covid___4
	tbp_signage_covid___1
	tbp_signage_covid___2
	tbp_signage_covid___4
	fit_testing_covid___1
	fit_testing_covid___2
	fit_testing_covid___3
	fit_testing_covid___4
	ppe_pou_covid___1
	ppe_pou_covid___2
	ppe_pou_covid___4
	disposable_masks_covid___1
	disposable_masks_covid___2
	disposable_masks_covid___3
	disposable_masks_covid___4
	staff_tbp_covid___1
	staff_tbp_covid___2
	staff_tbp_covid___4
	residents_tbp_covid___1
	residents_tbp_covid___2
	residents_tbp_covid___3
	residents_tbp_covid___4
	private_rooms_covid___1
	private_rooms_covid___2
	private_rooms_covid___3
	private_rooms_covid___4
	hh_audits_covid___1
	hh_audits_covid___2
	hh_audits_covid___3
	hh_audits_covid___4
	ppe_audits_covid___1
	ppe_audits_covid___2
	ppe_audits_covid___3
	ppe_audits_covid___4
	precautions_covid___1
	precautions_covid___2
	precautions_covid___3
	precautions_covid___4
	high_touch_covid___1
	high_touch_covid___2
	high_touch_covid___3
	high_touch_covid___4
	disinfect_covid___1
	disinfect_covid___2
	disinfect_covid___4
	disinfect_pou_covid___1
	disinfect_pou_covid___2
	disinfect_pou_covid___4
	equip_dedicated_covid___1
	equip_dedicated_covid___2
	equip_dedicated_covid___3
	equip_dedicated_covid___4
	ppe_supply_covid___1
	ppe_supply_covid___2
	ppe_supply_covid___3
	ppe_supply_covid___4
	universal_mask_covid___1
	universal_mask_covid___2
	universal_mask_covid___3
	universal_mask_covid___4
	hh_throughout_covid___1
	hh_throughout_covid___2
	hh_throughout_covid___4
	hh_inout_covid___1
	hh_inout_covid___2
	hh_inout_covid___4
	hh_semi_private_covid___1
	hh_semi_private_covid___2
	hh_semi_private_covid___4
	aware_flu___1
	aware_flu___2
	aware_flu___3
	aware_flu___4
	signs_flu___1
	signs_flu___2
	signs_flu___4
	resp_entrance_flu___1
	resp_entrance_flu___2
	resp_entrance_flu___4
	resp_visitors_flu___1
	resp_visitors_flu___2
	resp_visitors_flu___3
	resp_visitors_flu___4
	visitors_hh_flu___1
	visitors_hh_flu___2
	visitors_hh_flu___3
	visitors_hh_flu___4
	resp_station_flu___1
	resp_station_flu___2
	resp_station_flu___4
	signage_flu___1
	signage_flu___2
	signage_flu___4
	sick_leave_flu___1
	sick_leave_flu___2
	sick_leave_flu___3
	sick_leave_flu___4
	return_work_flu___1
	return_work_flu___2
	return_work_flu___3
	return_work_flu___4
	ppe_flu___1
	ppe_flu___2
	ppe_flu___3
	ppe_flu___4
	tbp_signage_flu___1
	tbp_signage_flu___2
	tbp_signage_flu___4
	ppe_pou_flu___1
	ppe_pou_flu___2
	ppe_pou_flu___4
	disposable_masks_flu___1
	disposable_masks_flu___2
	disposable_masks_flu___3
	disposable_masks_flu___4
	staff_tbp_flu___1
	staff_tbp_flu___2
	staff_tbp_flu___4
	residents_tbp_flu___1
	residents_tbp_flu___2
	residents_tbp_flu___3
	residents_tbp_flu___4
	private_rooms_flu___1
	private_rooms_flu___2
	private_rooms_flu___3
	private_rooms_flu___4
	hh_audits_flu___1
	hh_audits_flu___2
	hh_audits_flu___3
	hh_audits_flu___4
	ppe_audits_flu___1
	ppe_audits_flu___2
	ppe_audits_flu___3
	ppe_audits_flu___4
	precautions_flu___1
	precautions_flu___2
	precautions_flu___3
	precautions_flu___4
	high_touch_flu___1
	high_touch_flu___2
	high_touch_flu___3
	high_touch_flu___4
	disinfect_flu___1
	disinfect_flu___2
	disinfect_flu___4
	disinfect_pou_flu___1
	disinfect_pou_flu___2
	disinfect_pou_flu___3
	disinfect_pou_flu___4
	ppe_supply_flu___1
	ppe_supply_flu___2
	ppe_supply_flu___3
	ppe_supply_flu___4
	hh_throughout_flu___1
	hh_throughout_flu___2
	hh_throughout_flu___4
	hh_inout_flu___1
	hh_inout_flu___2
	hh_inout_flu___4
	hh_semi_private_flu___1
	hh_semi_private_flu___2
	hh_semi_private_flu___4
	aware_rsv___1
	aware_rsv___2
	aware_rsv___3
	aware_rsv___4
	signs_rsv___1
	signs_rsv___2
	signs_rsv___4
	resp_entrance_rsv___1
	resp_entrance_rsv___2
	resp_entrance_rsv___4
	resp_visitors_rsv___1
	resp_visitors_rsv___2
	resp_visitors_rsv___3
	resp_visitors_rsv___4
	visitors_hh_rsv___1
	visitors_hh_rsv___2
	visitors_hh_rsv___3
	visitors_hh_rsv___4
	resp_station_rsv___1
	resp_station_rsv___2
	resp_station_rsv___4
	signage_rsv___1
	signage_rsv___2
	signage_rsv___4
	sick_leave_rsv___1
	sick_leave_rsv___2
	sick_leave_rsv___3
	sick_leave_rsv___4
	return_work_rsv___1
	return_work_rsv___2
	return_work_rsv___3
	return_work_rsv___4
	ppe_rsv___1
	ppe_rsv___2
	ppe_rsv___3
	ppe_rsv___4
	tbp_signage_rsv___1
	tbp_signage_rsv___2
	tbp_signage_rsv___4
	stand_precaut_rsv___1
	stand_precaut_rsv___2
	stand_precaut_rsv___3
	stand_precaut_rsv___4
	ppe_pou_rsv___1
	ppe_pou_rsv___2
	ppe_pou_rsv___4
	disposable_masks_rsv___1
	disposable_masks_rsv___2
	disposable_masks_rsv___3
	disposable_masks_rsv___4
	staff_tbp_rsv___1
	staff_tbp_rsv___2
	staff_tbp_rsv___4
	residents_tbp_rsv___1
	residents_tbp_rsv___2
	residents_tbp_rsv___3
	residents_tbp_rsv___4
	private_rooms_rsv___1
	private_rooms_rsv___2
	private_rooms_rsv___3
	private_rooms_rsv___4
	hh_audits_rsv___1
	hh_audits_rsv___2
	hh_audits_rsv___3
	hh_audits_rsv___4
	ppe_audits_rsv___1
	ppe_audits_rsv___2
	ppe_audits_rsv___3
	ppe_audits_rsv___4
	precautions_rsv___1
	precautions_rsv___2
	precautions_rsv___3
	precautions_rsv___4
	high_touch_rsv___1
	high_touch_rsv___2
	high_touch_rsv___3
	high_touch_rsv___4
	disinfect_rsv___1
	disinfect_rsv___2
	disinfect_rsv___4
	disinfect_pou_rsv___1
	disinfect_pou_rsv___2
	disinfect_pou_rsv___4
	equipment_dedicated_rsv___1
	equipment_dedicated_rsv___2
	equipment_dedicated_rsv___3
	equipment_dedicated_rsv___4
	ppe_supply_rsv___1
	ppe_supply_rsv___2
	ppe_supply_rsv___3
	ppe_supply_rsv___4
	hh_throughout_rsv___1
	hh_throughout_rsv___2
	hh_throughout_rsv___4
	hh_inout_rsv___1
	hh_inout_rsv___2
	hh_inout_rsv___4
	hh_semi_private_rsv___1
	hh_semi_private_rsv___2
	hh_semi_private_rsv___4
	aware_noro___1
	aware_noro___2
	aware_noro___3
	aware_noro___4
	signs_noro___1
	signs_noro___2
	signs_noro___4
	resp_entrance_noro___1
	resp_entrance_noro___2
	resp_entrance_noro___4
	resp_visitors_noro___1
	resp_visitors_noro___2
	resp_visitors_noro___3
	resp_visitors_noro___4
	visitors_hh_noro___1
	visitors_hh_noro___2
	visitors_hh_noro___3
	visitors_hh_noro___4
	sick_leave_noro___1
	sick_leave_noro___2
	sick_leave_noro___3
	sick_leave_noro___4
	return_work_noro___1
	return_work_noro___2
	return_work_noro___3
	return_work_noro___4
	ppe_noro___1
	ppe_noro___2
	ppe_noro___3
	ppe_noro___4
	bp_signage_noro___1
	bp_signage_noro___2
	bp_signage_noro___3
	bp_signage_noro___4
	ppe_pou_noro___1
	ppe_pou_noro___2
	ppe_pou_noro___4
	staff_tbp_noro___1
	staff_tbp_noro___2
	staff_tbp_noro___4
	residents_tbp_noro___1
	residents_tbp_noro___2
	residents_tbp_noro___3
	residents_tbp_noro___4
	private_rooms_noro___1
	private_rooms_noro___2
	private_rooms_noro___3
	private_rooms_noro___4
	wash_hands_noro___1
	wash_hands_noro___2
	wash_hands_noro___3
	wash_hands_noro___4
	hh_audits_noro___1
	hh_audits_noro___2
	hh_audits_noro___3
	hh_audits_noro___4
	ppe_audits_noro___1
	ppe_audits_noro___2
	ppe_audits_noro___3
	ppe_audits_noro___4
	precautions_noro___1
	precautions_noro___2
	precautions_noro___3
	precautions_noro___4
	high_touch_noro___1
	high_touch_noro___2
	high_touch_noro___3
	high_touch_noro___4
	disinfect_noro___1
	disinfect_noro___2
	disinfect_noro___4
	disinfect_pou_noro___1
	disinfect_pou_noro___2
	disinfect_pou_noro___4
	equipment_dedicated_noro___1
	equipment_dedicated_noro___2
	equipment_dedicated_noro___3
	equipment_dedicated_noro___4
	ppe_supply___1
	ppe_supply___2
	ppe_supply___3
	ppe_supply___4
	hh_throughout_noro___1
	hh_throughout_noro___2
	hh_throughout_noro___4
	hh_inout_noro___1
	hh_inout_noro___2
	hh_inout_noro___4
	sinks_noro___1
	sinks_noro___2
	sinks_noro___4
	hh_semi_private_noro___1
	hh_semi_private_noro___2
	hh_semi_private_noro___4
	pathresist_mdro $
	contr_ob_mdro___1
	contr_ob_mdro___2
	contr_ob_mdro___3
	contr_ob_mdro___4
	contr_ob_mdro___5
	contr_ob_mdro___6
	contr_ob_mdro___7
	contr_ob_mdro___8
	contr_ob_mdro___9
	cont_other_ob_mdro $
	screen_ob_mdro___1
	screen_ob_mdro___2
	screen_ob_mdro___3
	screen_ob_mdro___4
	rec_ob_mdro___1
	rec_ob_mdro___2
	rec_ob_mdro___3
	rec_ob_mdro___4
	iso_ob_mdro___1
	iso_ob_mdro___2
	iso_ob_mdro___3
	iso_ob_mdro___4
	contacts_ob_mdro___1
	contacts_ob_mdro___2
	contacts_ob_mdro___3
	contacts_ob_mdro___4
	precaut_ob_mdro___1
	precaut_ob_mdro___2
	precaut_ob_mdro___4
	staff_ob_mdro___1
	staff_ob_mdro___2
	staff_ob_mdro___4
	edu_ob_mdro___1
	edu_ob_mdro___2
	edu_ob_mdro___3
	edu_ob_mdro___4
	report_list_mdro___1
	report_list_mdro___2
	report_list_mdro___3
	report_list_mdro___4
	ph_contact_mdro___1
	ph_contact_mdro___2
	ph_contact_mdro___3
	ph_contact_mdro___4
	comm_infect_mdro___1
	comm_infect_mdro___2
	comm_infect_mdro___3
	comm_infect_mdro___4
	infect_intake_mdro___1
	infect_intake_mdro___2
	infect_intake_mdro___3
	infect_intake_mdro___4
	lab_notif_mdro___1
	lab_notif_mdro___2
	lab_notif_mdro___3
	lab_notif_mdro___4
	indiv_antistew_mdro___1
	indiv_antistew_mdro___2
	indiv_antistew_mdro___3
	indiv_antistew_mdro___4
	indiv_antistew_mdro___5
	indiv_antistew_mdro___6
	other_antistew_mdro $
	hh_policies_mdro___1
	hh_policies_mdro___2
	hh_policies_mdro___3
	hh_policies_mdro___4
	hh_expectations_mdro___1
	hh_expectations_mdro___2
	hh_expectations_mdro___3
	hh_expectations_mdro___4
	hh_expectations_mdro___5
	hh_expectations_mdro___6
	hh_expectations_mdro___7
	hh_expectations_mdro___8
	hh_expectations_mdro___9
	hh_inout_mdro___1
	hh_inout_mdro___2
	hh_inout_mdro___4
	hh_sinkavail_mdro___1
	hh_sinkavail_mdro___2
	hh_sinkavail_mdro___3
	hh_sinkavail_mdro___4
	hh_soapwater_mdro___1
	hh_soapwater_mdro___2
	hh_soapwater_mdro___3
	hh_soapwater_mdro___4
	hh_soapwater_mdro___5
	hh_soapwater_mdro___6
	hh_throughout_mdro___1
	hh_throughout_mdro___2
	hh_throughout_mdro___3
	hh_pocket_mdro___1
	hh_pocket_mdro___2
	hh_pocket_mdro___3
	hh_pocket_mdro___4
	hh_only_mdro___1
	hh_only_mdro___2
	hh_only_mdro___3
	hh_only_mdro___4
	hh_supplies_mdro___1
	hh_supplies_mdro___2
	hh_supplies_mdro___4
	hh_lotion_mdro___1
	hh_lotion_mdro___2
	hh_lotion_mdro___3
	hh_lotion_mdro___4
	hh_lotion_mdro___5
	hh_nails_mdro___1
	hh_nails_mdro___2
	hh_nails_mdro___3
	hh_nails_mdro___4
	patienthh_mdro___1
	patienthh_mdro___2
	patienthh_mdro___3
	patienthh_mdro___4
	patienthh_mdro___5
	transmission_policy_mdro___1
	transmission_policy_mdro___2
	transmission_policy_mdro___3
	transmission_policy_mdro___4
	trans_signage_mdro___1
	trans_signage_mdro___2
	trans_signage_mdro___3
	trans_signage_mdro___4
	trans_signage_mdro___5
	trans_signage_mdro___6
	trans_signage_mdro___7
	trans_signage_mdro___8
	trans_signage_mdro___9
	ppe_supplies_mdro___1
	ppe_supplies_mdro___2
	ppe_supplies_mdro___4
	semipriv_mdro___1
	semipriv_mdro___2
	semipriv_mdro___3
	semipriv_mdro___4
	tbp_admit_mdro___1
	tbp_admit_mdro___2
	tbp_admit_mdro___3
	tbp_admit_mdro___4
	tbp_transfer_mdro___1
	tbp_transfer_mdro___2
	tbp_transfer_mdro___3
	tbp_transfer_mdro___4
	tbp_change_mdro___1
	tbp_change_mdro___2
	tbp_change_mdro___3
	tbp_change_mdro___4
	ebp_identify_mdro___1
	ebp_identify_mdro___2
	ebp_identify_mdro___3
	ebp_identify_mdro___4
	trans_signforclean_mdro___1
	trans_signforclean_mdro___2
	trans_signforclean_mdro___3
	trans_signforclean_mdro___4
	one_time_syringe_mdro___1
	one_time_syringe_mdro___2
	one_time_syringe_mdro___3
	one_time_syringe_mdro___4
	watermang_mdro___1
	watermang_mdro___2
	watermang_mdro___3
	watermang_mdro___4
	splash_mdro___1
	splash_mdro___2
	splash_mdro___3
	splash_mdro___5
	splash_mdro___6
	splash_mdro___7
	splash_mdro___8
	splash_mdro___9
	splash_mdro___10
	splash_mdro___11
	splash_mdro___12
	splash_other_mdro $
	biofilm_measures_mdro___1
	biofilm_measures_mdro___2
	biofilm_measures_mdro___3
	biofilm_measures_mdro___4
	biofilm_measures_mdro___5
	biofilm_measures_mdro___6
	biofilm_measures_mdro___7
	biofilm_meas_other_mdro $
	toiletdoor_mdro___1
	toiletdoor_mdro___2
	toiletdoor_mdro___3
	toiletdoor_mdro___4
	toiletdoor_no_mdro___1
	toiletdoor_no_mdro___2
	toiletdoor_no_mdro___3
	toiletdoor_no_mdro___4
	hooperdoor_mdro___1
	hooperdoor_mdro___2
	hooperdoor_mdro___3
	hooperdoor_mdro___4
	hopperdoor_no_mdro___1
	hopperdoor_no_mdro___2
	hopperdoor_no_mdro___3
	hopperdoor_no_mdro___4
	iceobs_mdro___1
	iceobs_mdro___2
	iceobs_mdro___4
	icemaint_mdro___1
	icemaint_mdro___2
	icemaint_mdro___3
	icemaint_mdro___4
	showerchair_mdro___1
	showerchair_mdro___2
	showerchair_mdro___3
	showerchair_mdro___4
	ptcarewater_mdro___1
	ptcarewater_mdro___2
	ptcarewater_mdro___3
	ptcarewater_mdro___4
	woundmask_gas___1
	woundmask_gas___2
	woundmask_gas___3
	reusable_gas___1
	reusable_gas___2
	reusable_gas___3
	devices_disinf_gas___1
	devices_disinf_gas___2
	devices_disinf_gas___3
	devices_disinf_gas___4
	aware_gas___1
	aware_gas___2
	aware_gas___3
	aware_gas___4
	wound_notes_gas $
	precautions_gas___1
	precautions_gas___2
	precautions_gas___3
	precautions_gas___4
	trans_signage_gas___1
	trans_signage_gas___2
	trans_signage_gas___3
	trans_signage_gas___4
	trans_signage_gas___5
	trans_signage_gas___6
	trans_signage_gas___7
	trans_signage_gas___8
	trans_signage_gas___9
	ppe_supplies_gas___1
	ppe_supplies_gas___2
	ppe_supplies_gas___3
	ppe_supplies_gas___4
	semipriv_gas___1
	semipriv_gas___2
	semipriv_gas___3
	semipriv_gas___4
	tbp_change_gas___1
	tbp_change_gas___2
	tbp_change_gas___3
	tbp_change_gas___4
	resp_entrance_gas___1
	resp_entrance_gas___2
	resp_entrance_gas___3
	resp_station_gas___1
	resp_station_gas___2
	resp_station_gas___3
	resp_visitors_gas___1
	resp_visitors_gas___2
	resp_visitors_gas___3
	resp_visitors_gas___4
	sick_leave_gas___1
	sick_leave_gas___2
	sick_leave_gas___3
	sick_leave_gas___4
	resptreat_gas___1
	resptreat_gas___2
	resptreat_gas___3
	resptreat_gas___4
	resptreat_notes_gas $
	resp_aseptic_gas___1
	resp_aseptic_gas___2
	resp_aseptic_gas___3
	resp_aseptic_gas___4
	trachcare_gas___1
	trachcare_gas___2
	trachcare_gas___3
	trachcare_gas___4
	trachcare_gas___5
	resp_supplies_gas___1
	resp_supplies_gas___2
	resp_supplies_gas___3
	resp_supplies_gas___4
	resp_notes_gas $
	disinfectequip_obs_gas___1
	disinfectequip_obs_gas___2
	disinfectequip_obs_gas___3
	eqip_obs_gas___1
	eqip_obs_gas___2
	eqip_obs_gas___3
	eqip_process_gas $
	policy_disinf_gas___1
	policy_disinf_gas___2
	policy_disinf_gas___3
	policy_disinf_gas___4
	contact_disinf_gas___1
	contact_disinf_gas___2
	contact_disinf_gas___3
	contact_disinf_gas___4
	hightouch_disinf_gas___1
	hightouch_disinf_gas___2
	hightouch_disinf_gas___3
	hightouch_disinf_gas___4
	epa_disinf_gas___1
	epa_disinf_gas___2
	epa_disinf_gas___3
	epa_disinf_gas___4
	shower_disinf_gas___1
	shower_disinf_gas___2
	shower_disinf_gas___3
	shower_disinf_gas___4
	shower_disinf_gas___5
	showindicate_disinf_gas___1
	showindicate_disinf_gas___2
	showindicate_disinf_gas___3
	showindicate_disinf_gas___4
	showindicate_disinf_gas___5
	supp_disinf_gas___1
	supp_disinf_gas___2
	supp_disinf_gas___3
	enviro_notes_gas $
	trainaudit_notes_gas $
	outbreak_management__v_9
	disease_ob___1
	disease_ob___2
	disease_ob___3
	disease_ob___4
	disease_ob___5
	disease_ob___6
	disease_ob___7
	disease_ob___8
	disease_ob___9
	patho_ob $
	contr_ob___1
	contr_ob___2
	contr_ob___3
	contr_ob___4
	contr_ob___5
	contr_ob___6
	contr_ob___7
	contr_ob___8
	contr_ob___9
	contr_ob___10
	contr_ob___11
	cont_other_ob $
	lhd_ob___1
	lhd_ob___2
	lhd_ob___3
	screen_ob___1
	screen_ob___2
	screen_ob___3
	rec_ob___1
	rec_ob___2
	rec_ob___3
	iso_ob___1
	iso_ob___2
	iso_ob___3
	contacts_ob___1
	contacts_ob___2
	contacts_ob___3
	precaut_ob___1
	precaut_ob___2
	precaut_ob___3
	staff_ob___1
	staff_ob___2
	staff_ob___3
	edu_ob___1
	edu_ob___2
	edu_ob___3
	edu_ob___4
	expand_outbreak $
	outbreak_management_complete
	urincath_1___1
	urincath_1___2
	urincath_1___3
	urincath_1___4
	urincath_1___5
	urincath_1___6
	urincath_2___1
	urincath_2___2
	urincath_2___3
	urincath_2___4
	urincath_2___5
	urincath_2___6
	urincath_3___1
	urincath_3___2
	urincath_3___3
	urincath_3___4
	urincath_3___5
	urincath_3___6
	urincath_4___1
	urincath_4___2
	urincath_4___3
	urincath_4___4
	urincath_4___5
	urincath_4___6
	urincath_5___1
	urincath_5___2
	urincath_5___3
	urincath_5___4
	urincath_5___5
	urincath_5___6
	urincath_notes_obs $
	cl_1___1
	cl_1___2
	cl_1___3
	cl_1___4
	cl_1___5
	cl_1___6
	cl_1___7
	cl_1___8
	cl_2___1
	cl_2___2
	cl_2___3
	cl_2___4
	cl_2___5
	cl_2___6
	cl_2___7
	cl_2___8
	cl_3___1
	cl_3___2
	cl_3___3
	cl_3___4
	cl_3___5
	cl_3___6
	cl_3___7
	cl_3___8
	cl_4___1
	cl_4___2
	cl_4___3
	cl_4___4
	cl_4___5
	cl_4___6
	cl_4___7
	cl_4___8
	cl_5___1
	cl_5___2
	cl_5___3
	cl_5___4
	cl_5___5
	cl_5___6
	cl_5___7
	cl_5___8
	cld_1___1
	cld_1___2
	cld_1___3
	cld_1___4
	cld_1___5
	cld_1___6
	cld_1___7
	cld_1___8
	cld_1___9
	cld_2___1
	cld_2___2
	cld_2___3
	cld_2___4
	cld_2___5
	cld_2___6
	cld_2___7
	cld_2___8
	cld_2___9
	cld_3___1
	cld_3___2
	cld_3___3
	cld_3___4
	cld_3___5
	cld_3___6
	cld_3___7
	cld_3___8
	cld_3___9
	cl_notes_obs $
	tra_1___1
	tra_1___2
	tra_1___3
	tra_1___4
	tra_1___5
	tra_1___6
	tra_1___7
	tra_1___8
	tra_1___9
	tra_2___1
	tra_2___2
	tra_2___3
	tra_2___4
	tra_2___5
	tra_2___6
	tra_2___7
	tra_2___8
	tra_2___9
	tra_3___1
	tra_3___2
	tra_3___3
	tra_3___4
	tra_3___5
	tra_3___6
	tra_3___7
	tra_3___8
	tra_3___9
	suc_1___1
	suc_1___2
	suc_1___3
	suc_1___4
	suc_1___5
	suc_1___6
	suc_1___7
	suc_2___1
	suc_2___2
	suc_2___3
	suc_2___4
	suc_2___5
	suc_2___6
	suc_2___7
	suc_3___1
	suc_3___2
	suc_3___3
	suc_3___4
	suc_3___5
	suc_3___6
	suc_3___7
	device_obs $
	expand_devicareobs $
	device_care_observat_v_10
	wound_obs1___1
	wound_obs1___2
	wound_obs1___3
	wound_obs1___4
	wound_obs1___5
	wound_obs1___6
	wound_obs1___7
	wound_obs1___8
	wound_obs1___9
	wound_obs1___10
	wound_obs1___11
	wound_obs1___12
	wound_obs1___13
	wound_obs1___14
	wound_obs2___1
	wound_obs2___2
	wound_obs2___3
	wound_obs2___4
	wound_obs2___5
	wound_obs2___6
	wound_obs2___7
	wound_obs2___8
	wound_obs2___9
	wound_obs2___10
	wound_obs2___11
	wound_obs2___12
	wound_obs2___13
	wound_obs2___14
	wound_obs3___1
	wound_obs3___2
	wound_obs3___3
	wound_obs3___4
	wound_obs3___5
	wound_obs3___6
	wound_obs3___7
	wound_obs3___8
	wound_obs3___9
	wound_obs3___10
	wound_obs3___11
	wound_obs3___12
	wound_obs3___13
	wound_obs3___14
	wound_notes_obs $
	wound_care_observati_v_11
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

proc contents;run;

data redcap;
	set redcap;
	label record_id='Record ID';
	label assessor___1='Assessment completed by  (choice=Taylor Breeyear)';
	label assessor___2='Assessment completed by  (choice=Catherine Bryan)';
	label assessor___3='Assessment completed by  (choice=Emily Berns)';
	label assessor___4='Assessment completed by  (choice=Caroline Colburn)';
	label assessor___5='Assessment completed by  (choice=Tia Godwin-Akpan)';
	label assessor___6='Assessment completed by  (choice=Tonya Jolly)';
	label assessor___7='Assessment completed by  (choice=Evan Klayman)';
	label assessor___8='Assessment completed by  (choice=Devon Nelson)';
	label assessor___9='Assessment completed by  (choice=Deirdre Patten)';
	label assessor___10='Assessment completed by  (choice=Caroline Soule)';
	label date='Assessment Date ';
	label time='Time of Visit';
	label visit_remote='Is this visit being conducted on-site or remotely?';
	label reason___1='Reason for assessment (choice=Routine/Preventive)';
	label reason___2='Reason for assessment (choice=Outbreak)';
	label reason___3='Reason for assessment (choice=Identified IP Breach)';
	label reason___4='Reason for assessment (choice=Request from LHD)';
	label reason___5='Reason for assessment (choice=Request from facility)';
	label reason___6='Reason for assessment (choice=Request from QIO)';
	label reason___7='Reason for assessment (choice=Request in relation to IJ or regulatory requirement)';
	label outbreak_type___1='Outbreak type (choice=Seasonal respiratory (COVID, influenza, RSV))';
	label outbreak_type___2='Outbreak type (choice=Norovirus/GI-like illness)';
	label outbreak_type___3='Outbreak type (choice=MDRO)';
	label outbreak_type___4='Outbreak type (choice=iGAS)';
	label outbreak_type___5='Outbreak type (choice=Scabies)';
	label outbreak_type___6='Outbreak type (choice=Bedbugs)';
	label outbreak_type___7='Outbreak type (choice=Other)';
	label outbreak_mdro___1='MDRO type (choice=C. auris)';
	label outbreak_mdro___2='MDRO type (choice=CPO)';
	label outbreak_mdro___3='MDRO type (choice=VISA/VRSA)';
	label outbreak_mdro___4='MDRO type (choice=MRSA/VRE)';
	label outbreak_mdro___5='MDRO type (choice=Other (enter comment))';
	label outbreak_mdro_number='MDRO Outbreak NCEDSS Number';
	label reason_expand='Specify reason for assessment';
	label facility_name='Facility Name';
	label facility_county='Facility County';
	label facility_zip='Facility Zip Code';
	label ripsvisit='Is this a RIPS team visit?';
	label facility_type___1='Facility Type (choice=Acute Care Facility)';
	label facility_type___2='Facility Type (choice=Long Term Acute Care Facility (LTAC))';
	label facility_type___3='Facility Type (choice=Outpatient)';
	label facility_type___4='Facility Type (choice=vSNF)';
	label facility_type___5='Facility Type (choice=SNF)';
	label facility_type___6='Facility Type (choice=Adult Care Home)';
	label facility_type___7='Facility Type (choice=Behavioral Health)';
	label facility_type___8='Facility Type (choice=Other)';
	label facility_type___9='Facility Type (choice=Acute Care Hospital (ACH))';
	label facility_type___10='Facility Type (choice=Critical Access Hospital (CAH))';
	label facility_type___11='Facility Type (choice=Inpatient Rehabilitation Facility)';
	label facility_type___12='Facility Type (choice=Long-term Acute Care Hospital (LTACH))';
	label facility_type___13='Facility Type (choice=Ventilator-capable Nursing Home/ Skilled Nursing Facility (vSNF))';
	label facility_type___14='Facility Type (choice=Nursing Home/ Skilled Nursing Facility (SNF))';
	label facility_type___15='Facility Type (choice=Assisted Living Facility)';
	label facility_type___16='Facility Type (choice=Other congregate setting (e.g., group homes, homeless shelter))';
	label facility_type___17='Facility Type (choice=Dental Office)';
	label facility_type___18='Facility Type (choice=Ambulatory Surgical Center)';
	label facility_type___19='Facility Type (choice=Other outpatient settings)';
	label facility_type___20='Facility Type (choice=Other healthcare settings)';
	label contact_facility='Facility Contact Name';
	label contact_title_facility='Facility Contact Title';
	label email_facility='Facility Contact Email';
	label phone_facility='Facility Contact Phone Number';
	label beds_facility='Number of Beds at Facility';
	label license_number='Facility License Number';
	label ccn='CMS Certification Number (CCN)';
	label nshn_number='NHSN Number/Org ID';
	label system_facility='Is the facility associated with a hospital system?';
	label system='Hospital System';
	label full_ip='Does the facility have an on-site Infection Preventionist (IP)?';
	label ip_hours='How many hours per week is the staff member devoted to IP work?';
	label ip='Is the IP staff member different than the facility contact listed above?';
	label ip_name='Facility IP Name';
	label ip_phone='Facility IP Phone Number';
	label ip_email='Facility IP Email';
	label ip_training___1='The person responsible for coordinating the IP program has received specialized training in IP. (choice=True)';
	label ip_training___2='The person responsible for coordinating the IP program has received specialized training in IP. (choice=False)';
	label ip_training___3='The person responsible for coordinating the IP program has received specialized training in IP. (choice=Facility is unsure)';
	label ip_training___4='The person responsible for coordinating the IP program has received specialized training in IP. (choice=Unable to assess)';
	label facility_information_complete='Complete?';
	label report_list___1='The facility has a current list of diseases reportable to public health authorities.  (choice=True)';
	label report_list___2='The facility has a current list of diseases reportable to public health authorities.  (choice=False)';
	label report_list___3='The facility has a current list of diseases reportable to public health authorities.  (choice=Facility is unsure)';
	label report_list___4='The facility has a current list of diseases reportable to public health authorities.  (choice=Unable to assess)';
	label ph_contact___1='The facility knows how to get in contact with the local and/or state health department. (choice=True)';
	label ph_contact___2='The facility knows how to get in contact with the local and/or state health department. (choice=False)';
	label ph_contact___3='The facility knows how to get in contact with the local and/or state health department. (choice=Facility is unsure)';
	label ph_contact___4='The facility knows how to get in contact with the local and/or state health department. (choice=Unable to assess)';
	label comm_infect___1='The facility has a system for communicating communicable diseases/need for TBP when patients are transferred to other facilities.  (choice=True)';
	label comm_infect___2='The facility has a system for communicating communicable diseases/need for TBP when patients are transferred to other facilities.  (choice=False)';
	label comm_infect___3='The facility has a system for communicating communicable diseases/need for TBP when patients are transferred to other facilities.  (choice=Facility is unsure)';
	label comm_infect___4='The facility has a system for communicating communicable diseases/need for TBP when patients are transferred to other facilities.  (choice=Unable to assess)';
	label infect_intake___1='The facility has written intake procedures to identify potentially infectious persons/need for TBP at time of admission. (choice=True)';
	label infect_intake___2='The facility has written intake procedures to identify potentially infectious persons/need for TBP at time of admission. (choice=False)';
	label infect_intake___3='The facility has written intake procedures to identify potentially infectious persons/need for TBP at time of admission. (choice=Facility is unsure)';
	label infect_intake___4='The facility has written intake procedures to identify potentially infectious persons/need for TBP at time of admission. (choice=Unable to assess)';
	label ip_policies___1='Comprehensive, written IP policies and procedures are available to administration and staff. (choice=True)';
	label ip_policies___2='Comprehensive, written IP policies and procedures are available to administration and staff. (choice=False)';
	label ip_policies___3='Comprehensive, written IP policies and procedures are available to administration and staff. (choice=Facility is unsure)';
	label ip_policies___4='Comprehensive, written IP policies and procedures are available to administration and staff. (choice=Unable to assess)';
	label ip_policies___5='Comprehensive, written IP policies and procedures are available to administration and staff. (choice=Facility states they have policies but not immediately available)';
	label policies_reviewed___1='Written IP policies and procedures are reviewed (and updated, if needed) on a routine basis and as needed. (choice=True)';
	label policies_reviewed___2='Written IP policies and procedures are reviewed (and updated, if needed) on a routine basis and as needed. (choice=False)';
	label policies_reviewed___3='Written IP policies and procedures are reviewed (and updated, if needed) on a routine basis and as needed. (choice=Facility is unsure)';
	label policies_reviewed___4='Written IP policies and procedures are reviewed (and updated, if needed) on a routine basis and as needed. (choice=Unable to assess)';
	label lab_notif___1='The facility has system to notify the IP when communicable diseases are reported by a laboratory. (choice=True)';
	label lab_notif___2='The facility has system to notify the IP when communicable diseases are reported by a laboratory. (choice=False)';
	label lab_notif___3='The facility has system to notify the IP when communicable diseases are reported by a laboratory. (choice=Facility is unsure)';
	label lab_notif___4='The facility has system to notify the IP when communicable diseases are reported by a laboratory. (choice=Unable to assess)';
	label infect_monitoring___1='The facility has a process in place for monitoring/tracking infections within facility. (choice=True)';
	label infect_monitoring___2='The facility has a process in place for monitoring/tracking infections within facility. (choice=False)';
	label infect_monitoring___3='The facility has a process in place for monitoring/tracking infections within facility. (choice=Facility is unsure)';
	label infect_monitoring___4='The facility has a process in place for monitoring/tracking infections within facility. (choice=Unable to assess)';
	label ip_process___1='The facility has a process for reviewing infection surveillance data and infection prevention activities (e.g., presentation at QA committee). (choice=True)';
	label ip_process___2='The facility has a process for reviewing infection surveillance data and infection prevention activities (e.g., presentation at QA committee). (choice=False)';
	label ip_process___3='The facility has a process for reviewing infection surveillance data and infection prevention activities (e.g., presentation at QA committee). (choice=Facility is unsure)';
	label ip_process___4='The facility has a process for reviewing infection surveillance data and infection prevention activities (e.g., presentation at QA committee). (choice=Unable to assess)';
	label outbreak_response___1='The facility has a written plan for outbreak response. (choice=True)';
	label outbreak_response___2='The facility has a written plan for outbreak response. (choice=False)';
	label outbreak_response___3='The facility has a written plan for outbreak response. (choice=Facility is unsure)';
	label outbreak_response___4='The facility has a written plan for outbreak response. (choice=Unable to assess)';
	label resp_program___1='The facility has a written respiratory protection program. (choice=True)';
	label resp_program___2='The facility has a written respiratory protection program. (choice=False)';
	label resp_program___3='The facility has a written respiratory protection program. (choice=Facility is unsure)';
	label resp_program___4='The facility has a written respiratory protection program. (choice=Unable to assess)';
	label emergency_plan___1='The facility has a written plan for emergency preparedness. (choice=True)';
	label emergency_plan___2='The facility has a written plan for emergency preparedness. (choice=False)';
	label emergency_plan___3='The facility has a written plan for emergency preparedness. (choice=Facility is unsure)';
	label emergency_plan___4='The facility has a written plan for emergency preparedness. (choice=Unable to assess)';
	label riskassess___1='The facility currently has a written infection control risk assessment to assess risk of communicable disease, such as TB and COVID-19, based on regional and local transmission. (choice=Yes)';
	label riskassess___2='The facility currently has a written infection control risk assessment to assess risk of communicable disease, such as TB and COVID-19, based on regional and local transmission. (choice=No)';
	label riskassess___3='The facility currently has a written infection control risk assessment to assess risk of communicable disease, such as TB and COVID-19, based on regional and local transmission. (choice=Facility is unsure)';
	label riskassess___4='The facility currently has a written infection control risk assessment to assess risk of communicable disease, such as TB and COVID-19, based on regional and local transmission. (choice=Unable to assess)';
	label respetc_site___1='Is the facility a RESPETC assessment site? (Acute Care Only) (choice=Yes)';
	label respetc_site___2='Is the facility a RESPETC assessment site? (Acute Care Only) (choice=No)';
	label respetc_site___3='Is the facility a RESPETC assessment site? (Acute Care Only) (choice=Unable to assess)';
	label prepare_strategies='Elaborate on preparedness strategies ';
	label expand_safety='Please use this space to expand on any topics in this section.';
	label work_exclusions___1='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=True)';
	label work_exclusions___2='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=False)';
	label work_exclusions___3='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=Facility is unsure)';
	label work_exclusions___4='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=Unable to assess)';
	label tb_hire___1='The facility conducts baseline TB screening for personnel at time of hire. (choice=True)';
	label tb_hire___2='The facility conducts baseline TB screening for personnel at time of hire. (choice=False)';
	label tb_hire___3='The facility conducts baseline TB screening for personnel at time of hire. (choice=Facility is unsure)';
	label tb_hire___4='The facility conducts baseline TB screening for personnel at time of hire. (choice=Unable to assess)';
	label tb_risk___1='The facility assesses healthcare personnel for risk of TB (based on regional and community data) and performs periodic (at least annual) TB screening. (choice=True)';
	label tb_risk___2='The facility assesses healthcare personnel for risk of TB (based on regional and community data) and performs periodic (at least annual) TB screening. (choice=False)';
	label tb_risk___3='The facility assesses healthcare personnel for risk of TB (based on regional and community data) and performs periodic (at least annual) TB screening. (choice=Facility is unsure)';
	label tb_risk___4='The facility assesses healthcare personnel for risk of TB (based on regional and community data) and performs periodic (at least annual) TB screening. (choice=Unable to assess)';
	label bloodborne_plan___1='The facility has a bloodborne pathogen exposure control plan which addresses potential hazards posed by specific services provided by the facility.  (choice=True)';
	label bloodborne_plan___2='The facility has a bloodborne pathogen exposure control plan which addresses potential hazards posed by specific services provided by the facility.  (choice=False)';
	label bloodborne_plan___3='The facility has a bloodborne pathogen exposure control plan which addresses potential hazards posed by specific services provided by the facility.  (choice=Facility is unsure)';
	label bloodborne_plan___4='The facility has a bloodborne pathogen exposure control plan which addresses potential hazards posed by specific services provided by the facility.  (choice=Unable to assess)';
	label hepb_vac___1='The facility offers (provides at no charge) Hepatitis B vaccination to all personnel who may be exposed to blood or body fluids as part of their job duties. (choice=True)';
	label hepb_vac___2='The facility offers (provides at no charge) Hepatitis B vaccination to all personnel who may be exposed to blood or body fluids as part of their job duties. (choice=False)';
	label hepb_vac___3='The facility offers (provides at no charge) Hepatitis B vaccination to all personnel who may be exposed to blood or body fluids as part of their job duties. (choice=Facility is unsure)';
	label hepb_vac___4='The facility offers (provides at no charge) Hepatitis B vaccination to all personnel who may be exposed to blood or body fluids as part of their job duties. (choice=Unable to assess)';
	label annual_flu___1='The facility offers all personnel Influenza vaccination annually. (choice=True)';
	label annual_flu___2='The facility offers all personnel Influenza vaccination annually. (choice=False)';
	label annual_flu___3='The facility offers all personnel Influenza vaccination annually. (choice=Facility is unsure)';
	label annual_flu___4='The facility offers all personnel Influenza vaccination annually. (choice=Unable to assess)';
	label annual_covid___1='The facility offers all personnel COVID-19 vaccination. (choice=True)';
	label annual_covid___2='The facility offers all personnel COVID-19 vaccination. (choice=False)';
	label annual_covid___3='The facility offers all personnel COVID-19 vaccination. (choice=Facility is unsure)';
	label annual_covid___4='The facility offers all personnel COVID-19 vaccination. (choice=Unable to assess)';
	label vac_record___1='The facility records the vaccination status of patients upon admission. (choice=True)';
	label vac_record___2='The facility records the vaccination status of patients upon admission. (choice=False)';
	label vac_record___3='The facility records the vaccination status of patients upon admission. (choice=Facility is unsure)';
	label vac_record___4='The facility records the vaccination status of patients upon admission. (choice=Unable to assess)';
	label tb_patient___1='Long-term care only: Residents are screened for TB upon admission and annually. (choice=True)';
	label tb_patient___2='Long-term care only: Residents are screened for TB upon admission and annually. (choice=False)';
	label tb_patient___3='Long-term care only: Residents are screened for TB upon admission and annually. (choice=Facility is unsure)';
	label tb_patient___4='Long-term care only: Residents are screened for TB upon admission and annually. (choice=Unable to assess)';
	label tb_patient___5='Long-term care only: Residents are screened for TB upon admission and annually. (choice=Facility is not a LTCF)';
	label offer_vac___1='The facility offers influenza and COVID-19 vaccination to patients. (choice=True)';
	label offer_vac___2='The facility offers influenza and COVID-19 vaccination to patients. (choice=False)';
	label offer_vac___3='The facility offers influenza and COVID-19 vaccination to patients. (choice=Facility is unsure)';
	label offer_vac___4='The facility offers influenza and COVID-19 vaccination to patients. (choice=Unable to assess)';
	label vac_edu___1='Facility offers education for staff and employees around the importance of vaccines. (choice=True)';
	label vac_edu___2='Facility offers education for staff and employees around the importance of vaccines. (choice=False)';
	label vac_edu___3='Facility offers education for staff and employees around the importance of vaccines. (choice=Facility is unsure)';
	label vac_edu___4='Facility offers education for staff and employees around the importance of vaccines. (choice=Unable to assess)';
	label indiv_antistew___1='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Physician)';
	label indiv_antistew___2='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Pharmacist)';
	label indiv_antistew___3='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Other)';
	label indiv_antistew___4='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Facility does not have an individual responsible for antibiotic stewardship activities)';
	label indiv_antistew___5='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Facility is unsure)';
	label indiv_antistew___6='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Unable to assess)';
	label other_antistew='Please specify other';
	label spice_referral='Was a referral made to SPICE?';
	label operations_notes='Use this text box to expand on any observations for the Operations module.';
	label employee_and_patient_v_0='Complete?';
	label ip_education___1='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Hand Hygiene)';
	label ip_education___2='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=PPE)';
	label ip_education___3='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Cleaning and Disinfection of equipment and surfaces)';
	label ip_education___4='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Safe Injection Practices)';
	label ip_education___5='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Point of care blood testing)';
	label ip_education___6='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Reprocessing of reusable medical equipment (Less common in LTC))';
	label ip_education___7='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Upon hire only)';
	label ip_education___8='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Facility is unsure)';
	label ip_education___9='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Unable to assess)';
	label ip_education___10='The facility provides appropriate infection prevention education to all staff based on their job duties (and potential for exposure to communicable diseases) at time of hire and at least annually. (choice=Facility does not provide infection control training to staff)';
	label competency___1='Following training, is competency assessed? (choice=Staff demonstration of skill)';
	label competency___2='Following training, is competency assessed? (choice=Quiz/test)';
	label competency___3='Following training, is competency assessed? (choice=Other)';
	label competency___4='Following training, is competency assessed? (choice=Facility is unsure)';
	label competency___5='Following training, is competency assessed? (choice=Unable to assess)';
	label demonstrateskills___1='Which skills are demonstrated? (choice=Hand Hygiene)';
	label demonstrateskills___2='Which skills are demonstrated? (choice=PPE)';
	label demonstrateskills___3='Which skills are demonstrated? (choice=Cleaning and Disinfection of equipment and surfaces)';
	label demonstrateskills___4='Which skills are demonstrated? (choice=Safe Injection Practices)';
	label demonstrateskills___5='Which skills are demonstrated? (choice=Point of care blood testing)';
	label demonstrateskills___6='Which skills are demonstrated? (choice=Reprocessing of reusable medical equipment (Less common in LTC))';
	label demonstrateskills___7='Which skills are demonstrated? (choice=Facility is unsure)';
	label demonstrateskills___8='Which skills are demonstrated? (choice=Unable to assess)';
	label testtopics___1='Which topics are tested? (choice=Hand Hygiene)';
	label testtopics___2='Which topics are tested? (choice=PPE)';
	label testtopics___3='Which topics are tested? (choice=Cleaning and Disinfection of equipment and surfaces)';
	label testtopics___4='Which topics are tested? (choice=Safe Injection Practices)';
	label testtopics___5='Which topics are tested? (choice=Point of care blood testing)';
	label testtopics___6='Which topics are tested? (choice=Reprocessing of reusable medical equipment (Less common in LTC))';
	label testtopics___7='Which topics are tested? (choice=Facility is unsure)';
	label testtopics___8='Which topics are tested? (choice=Unable to assess)';
	label annualskills___1='Do staff demonstrate annual competencies for skills? (choice=Hand Hygiene)';
	label annualskills___2='Do staff demonstrate annual competencies for skills? (choice=PPE)';
	label annualskills___3='Do staff demonstrate annual competencies for skills? (choice=Cleaning and Disinfection of equipment and surfaces)';
	label annualskills___4='Do staff demonstrate annual competencies for skills? (choice=Safe Injection Practices)';
	label annualskills___5='Do staff demonstrate annual competencies for skills? (choice=Point of care blood testing)';
	label annualskills___6='Do staff demonstrate annual competencies for skills? (choice=Reprocessing of reusable medical equipment (Less common in LTC))';
	label annualskills___7='Do staff demonstrate annual competencies for skills? (choice=Facility is unsure)';
	label annualskills___8='Do staff demonstrate annual competencies for skills? (choice=Unable to assess)';
	label audits___1='Which audits performed by IP, DON or other staff? (choice=Hand Hygiene)';
	label audits___2='Which audits performed by IP, DON or other staff? (choice=PPE)';
	label audits___3='Which audits performed by IP, DON or other staff? (choice=Cleaning and Disinfection of equipment and surfaces)';
	label audits___4='Which audits performed by IP, DON or other staff? (choice=Safe Injection Practices)';
	label audits___5='Which audits performed by IP, DON or other staff? (choice=Point of care blood testing)';
	label audits___6='Which audits performed by IP, DON or other staff? (choice=Reprocessing of reusable medical equipment (Less common in LTC))';
	label audits___7='Which audits performed by IP, DON or other staff? (choice=Facility is unsure)';
	label audits___8='Which audits performed by IP, DON or other staff? (choice=Unable to assess)';
	label audits___9='Which audits performed by IP, DON or other staff? (choice=Facility does not perform audits of infection control practices)';
	label hh_audits='How many hand hygiene audits are performed each month?';
	label audit_ppe='How many PPE audits are performed each month?';
	label audit_cleandisinf='How many cleaning/disinfection audits are performed each month?';
	label audit_injectsafety='How many safe injection audits are performed each month?';
	label audit_poc='How many POC audits are performed each month?';
	label audit_repro='How many reprocessing audits are performed each month?';
	label audits_feedback___1='How is feedback from audits provided to staff? (choice=In the moment feedback to staff)';
	label audits_feedback___2='How is feedback from audits provided to staff? (choice=Summary data provided to staff)';
	label audits_feedback___3='How is feedback from audits provided to staff? (choice=Summary data provided to administration/committees)';
	label audits_feedback___4='How is feedback from audits provided to staff? (choice=Facility is unsure)';
	label audits_feedback___5='How is feedback from audits provided to staff? (choice=Unable to assess)';
	label audits_feedback___6='How is feedback from audits provided to staff? (choice=Facility does not provide feedback from audits)';
	label traningaudits_notes='Use this text box to expand on any observations for the Training and Audits module.';
	label trainingaudits_complete='Complete?';
	label hh_policies___1='Facility promotes preferential use of alcohol-based hand sanitizer (ABHS) over soap and water in most clinical situations. (choice=True)';
	label hh_policies___2='Facility promotes preferential use of alcohol-based hand sanitizer (ABHS) over soap and water in most clinical situations. (choice=False)';
	label hh_policies___3='Facility promotes preferential use of alcohol-based hand sanitizer (ABHS) over soap and water in most clinical situations. (choice=Facility is unsure)';
	label hh_policies___4='Facility promotes preferential use of alcohol-based hand sanitizer (ABHS) over soap and water in most clinical situations. (choice=Unable to assess)';
	label hh_expectations___1='When are employees expected to perform hand hygiene? (choice=At room entry and exit)';
	label hh_expectations___2='When are employees expected to perform hand hygiene? (choice=Immediately before touching a patient)';
	label hh_expectations___3='When are employees expected to perform hand hygiene? (choice=Before performing an aseptic task)';
	label hh_expectations___4='When are employees expected to perform hand hygiene? (choice=Before moving from work on a soiled body site to a clean site on the same patient)';
	label hh_expectations___5='When are employees expected to perform hand hygiene? (choice=After touching patient or the patients immediate surroundings)';
	label hh_expectations___6='When are employees expected to perform hand hygiene? (choice=After contact with blood, body fluids, or contaminated surfaces)';
	label hh_expectations___7='When are employees expected to perform hand hygiene? (choice=Immediately after glove removal)';
	label hh_expectations___8='When are employees expected to perform hand hygiene? (choice=Facility is unsure)';
	label hh_expectations___9='When are employees expected to perform hand hygiene? (choice=Unable to assess)';
	label hh_inout___1='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=True)';
	label hh_inout___2='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=False)';
	label hh_inout___3='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=Unable to assess)';
	label hh_sinkavail___1='Observe: A hand hygiene sink can be identified for any given room that could house a patient with norovirus or C. diff. (choice=True)';
	label hh_sinkavail___2='Observe: A hand hygiene sink can be identified for any given room that could house a patient with norovirus or C. diff. (choice=False)';
	label hh_sinkavail___3='Observe: A hand hygiene sink can be identified for any given room that could house a patient with norovirus or C. diff. (choice=Facility is unsure)';
	label hh_sinkavail___4='Observe: A hand hygiene sink can be identified for any given room that could house a patient with norovirus or C. diff. (choice=Unable to be assess)';
	label hh_soapwater___1='When are employees expected to use soap and water vs. ABHS? (choice=When hands are visibly soiled)';
	label hh_soapwater___2='When are employees expected to use soap and water vs. ABHS? (choice=During the care of patients with suspected or confirmed infection during outbreaks of C. difficile and norovirus)';
	label hh_soapwater___3='When are employees expected to use soap and water vs. ABHS? (choice=Before eating)';
	label hh_soapwater___4='When are employees expected to use soap and water vs. ABHS? (choice=After using the restroom)';
	label hh_soapwater___5='When are employees expected to use soap and water vs. ABHS? (choice=Facility is unsure)';
	label hh_soapwater___6='When are employees expected to use soap and water vs. ABHS? (choice=Unable to assess)';
	label hh_throughout___1='Observe: Hand hygiene is available throughout the facility. (choice=True)';
	label hh_throughout___2='Observe: Hand hygiene is available throughout the facility. (choice=False)';
	label hh_throughout___3='Observe: Hand hygiene is available throughout the facility. (choice=Unable to assess)';
	label hh_pocket___1='Facility staff use pocket-sized dispensers of ABHS. (choice=True)';
	label hh_pocket___2='Facility staff use pocket-sized dispensers of ABHS. (choice=False)';
	label hh_pocket___3='Facility staff use pocket-sized dispensers of ABHS. (choice=Facility is unsure)';
	label hh_pocket___4='Facility staff use pocket-sized dispensers of ABHS. (choice=Unable to assess)';
	label hh_only___1='Sinks are only used for hand washing (i.e., not used for disposal of body fluids, cleaning equipment, or rinsing linen). (choice=True)';
	label hh_only___2='Sinks are only used for hand washing (i.e., not used for disposal of body fluids, cleaning equipment, or rinsing linen). (choice=False)';
	label hh_only___3='Sinks are only used for hand washing (i.e., not used for disposal of body fluids, cleaning equipment, or rinsing linen). (choice=Facility is unsure)';
	label hh_only___4='Sinks are only used for hand washing (i.e., not used for disposal of body fluids, cleaning equipment, or rinsing linen). (choice=Unable to assess)';
	label hh_supplies___1='Observe: Supplies necessary for adherence to HH (e.g., soap, water, paper towels, alcohol-based hand rub) are readily accessible. (choice=True)';
	label hh_supplies___2='Observe: Supplies necessary for adherence to HH (e.g., soap, water, paper towels, alcohol-based hand rub) are readily accessible. (choice=False)';
	label hh_supplies___3='Observe: Supplies necessary for adherence to HH (e.g., soap, water, paper towels, alcohol-based hand rub) are readily accessible. (choice=Unable to assess)';
	label hh_lotion___1='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=True)';
	label hh_lotion___2='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=False)';
	label hh_lotion___3='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=Facility is unsure)';
	label hh_lotion___4='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=Unable to assess)';
	label hh_lotion___5='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=Facility does not currently supply lotion)';
	label hh_nails___1='Facility addresses employee fingernails, such as nail length and use of artificial nails. (choice=True)';
	label hh_nails___2='Facility addresses employee fingernails, such as nail length and use of artificial nails. (choice=False)';
	label hh_nails___3='Facility addresses employee fingernails, such as nail length and use of artificial nails. (choice=Facility is unsure)';
	label hh_nails___4='Facility addresses employee fingernails, such as nail length and use of artificial nails. (choice=Unable to assess)';
	label patienthh___1='How do patients, residents and visitors clean their hands? (choice=ABHS)';
	label patienthh___2='How do patients, residents and visitors clean their hands? (choice=Antimicrobial-impregnated wipes)';
	label patienthh___3='How do patients, residents and visitors clean their hands? (choice=Handwashing with soap and water)';
	label patienthh___4='How do patients, residents and visitors clean their hands? (choice=Facility is unsure/process not discussed prior)';
	label patienthh___5='How do patients, residents and visitors clean their hands? (choice=Unable to assess)';
	label expand_hh='Please use this space to expand on any topics in the Hand Hygiene module.';
	label hand_hygiene_complete='Complete?';
	label hh_1='Observation 1';
	label hh_2='Observation 2';
	label hh_3='Observation 3';
	label hh_4='Observation 4';
	label hh_5='Observation 5';
	label hh_6='Observation 6';
	label hh_7='Observation 7';
	label hh_8='Observation 8';
	label hh_9='Observation 9';
	label hh_10='Observation 10';
	label expand_hhobs='Please use this space to expand on any topics in the Hand Hygiene Observation module.';
	label hand_hygiene_observa_v_1='Complete?';
	label transmission_policy___1='The facility observes TBP in accordance with CDC recommendations (Appendix A - e.g., MDROs=contact, Seasonal Influenza=droplet, COVID-19=N95/contact/eye protection). (choice=True)';
	label transmission_policy___2='The facility observes TBP in accordance with CDC recommendations (Appendix A - e.g., MDROs=contact, Seasonal Influenza=droplet, COVID-19=N95/contact/eye protection). (choice=False)';
	label transmission_policy___3='The facility observes TBP in accordance with CDC recommendations (Appendix A - e.g., MDROs=contact, Seasonal Influenza=droplet, COVID-19=N95/contact/eye protection). (choice=Facility is unsure)';
	label transmission_policy___4='The facility observes TBP in accordance with CDC recommendations (Appendix A - e.g., MDROs=contact, Seasonal Influenza=droplet, COVID-19=N95/contact/eye protection). (choice=Unable to assess)';
	label trans_signage___1='What actions are taken when a patient is placed on TBP? (choice=Signage placed at room entry)';
	label trans_signage___2='What actions are taken when a patient is placed on TBP? (choice=PPE supplies placed at room entry)';
	label trans_signage___3='What actions are taken when a patient is placed on TBP? (choice=Medical equipment is dedicated to the patient)';
	label trans_signage___4='What actions are taken when a patient is placed on TBP? (choice=Evaluation of need for room placement changes (if necessary))';
	label trans_signage___5='What actions are taken when a patient is placed on TBP? (choice=Patient movement is restricted unless medically necessary)';
	label trans_signage___6='What actions are taken when a patient is placed on TBP? (choice=Patient and family members are educated about TBP (including HH and PPE expectations))';
	label trans_signage___7='What actions are taken when a patient is placed on TBP? (choice=Possible exposures are evaluated (if necessary))';
	label trans_signage___8='What actions are taken when a patient is placed on TBP? (choice=Facility is unsure)';
	label trans_signage___9='What actions are taken when a patient is placed on TBP? (choice=Unable to assess)';
	label ppe_supplies___1='Observe: Supplies necessary for standard precautions and TBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=True)';
	label ppe_supplies___2='Observe: Supplies necessary for standard precautions and TBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=False)';
	label ppe_supplies___3='Observe: Supplies necessary for standard precautions and TBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=Unable to assess)';
	label semipriv___1='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms.  (choice=True)';
	label semipriv___2='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms.  (choice=False)';
	label semipriv___3='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms.  (choice=Facility is unsure)';
	label semipriv___4='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms.  (choice=Unable to assess)';
	label tbp_admit___1='Facility has a process for identifying patients who require TBP upon admission. (choice=True)';
	label tbp_admit___2='Facility has a process for identifying patients who require TBP upon admission. (choice=False)';
	label tbp_admit___3='Facility has a process for identifying patients who require TBP upon admission. (choice=Facility is unsure)';
	label tbp_admit___4='Facility has a process for identifying patients who require TBP upon admission. (choice=Unable to assess)';
	label tbp_transfer___1='Facility has a process for communicating need for TBP upon transfer/discharge to another facility. (choice=True)';
	label tbp_transfer___2='Facility has a process for communicating need for TBP upon transfer/discharge to another facility. (choice=False)';
	label tbp_transfer___3='Facility has a process for communicating need for TBP upon transfer/discharge to another facility. (choice=Facility is unsure)';
	label tbp_transfer___4='Facility has a process for communicating need for TBP upon transfer/discharge to another facility. (choice=Unable to assess)';
	label tbp_change___1='Facility has a process for evaluating changes in TBP as needed. (choice=True)';
	label tbp_change___2='Facility has a process for evaluating changes in TBP as needed. (choice=False)';
	label tbp_change___3='Facility has a process for evaluating changes in TBP as needed. (choice=Facility is unsure)';
	label tbp_change___4='Facility has a process for evaluating changes in TBP as needed. (choice=Unable to assess)';
	label ebp_identify___1='Nursing homes only: Facility has a process for identifying and alerting staff of residents that require enhanced barrier precautions (EBP). (choice=True)';
	label ebp_identify___2='Nursing homes only: Facility has a process for identifying and alerting staff of residents that require enhanced barrier precautions (EBP). (choice=False)';
	label ebp_identify___3='Nursing homes only: Facility has a process for identifying and alerting staff of residents that require enhanced barrier precautions (EBP). (choice=Facility is unsure)';
	label ebp_identify___4='Nursing homes only: Facility has a process for identifying and alerting staff of residents that require enhanced barrier precautions (EBP). (choice=Unable to assess)';
	label trans_signforclean___1='Facility has a process for keeping TBP signage in place after discharge so cleaning staff knows proper cleaning procedures for the room. (choice=True)';
	label trans_signforclean___2='Facility has a process for keeping TBP signage in place after discharge so cleaning staff knows proper cleaning procedures for the room. (choice=False)';
	label trans_signforclean___3='Facility has a process for keeping TBP signage in place after discharge so cleaning staff knows proper cleaning procedures for the room. (choice=Facility is unsure)';
	label trans_signforclean___4='Facility has a process for keeping TBP signage in place after discharge so cleaning staff knows proper cleaning procedures for the room. (choice=Unable to assess)';
	label resp_entrance___1='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved.  (choice=True)';
	label resp_entrance___2='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved.  (choice=False)';
	label resp_entrance___3='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved.  (choice=Unable to assess)';
	label resp_station___1='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas). (choice=True)';
	label resp_station___2='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas). (choice=False)';
	label resp_station___3='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas). (choice=Unable to assess)';
	label resp_visitors___1='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory or GI infection. (choice=True)';
	label resp_visitors___2='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory or GI infection. (choice=False)';
	label resp_visitors___3='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory or GI infection. (choice=Facility is unsure)';
	label resp_visitors___4='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory or GI infection. (choice=Unable to assess)';
	label fit_testing___1='Staff who may need to use N-95 respirators have been properly fit-tested (medical evaluation, annual/prn fit test) and trained on proper use. (choice=True)';
	label fit_testing___2='Staff who may need to use N-95 respirators have been properly fit-tested (medical evaluation, annual/prn fit test) and trained on proper use. (choice=False)';
	label fit_testing___3='Staff who may need to use N-95 respirators have been properly fit-tested (medical evaluation, annual/prn fit test) and trained on proper use. (choice=Facility is unsure)';
	label fit_testing___4='Staff who may need to use N-95 respirators have been properly fit-tested (medical evaluation, annual/prn fit test) and trained on proper use. (choice=Unable to assess)';
	label expand_transmissionbased='Please use this space to expand on any topics in the Standard and Transmission-Based Precautions module.';
	label standard_and_transmi_v_2='Complete?';
	label prec_obs___1='Appropriate transmission-based precaution sign is visible on patient''s door and PPE is readily available. (choice=True)';
	label prec_obs___2='Appropriate transmission-based precaution sign is visible on patient''s door and PPE is readily available. (choice=False)';
	label prec_obs___3='Appropriate transmission-based precaution sign is visible on patient''s door and PPE is readily available. (choice=Unable to assess)';
	label expand_prec_obs='Expand on transmission-based precaution observation.';
	label don_obs___1='PPE donned appropriately.  (choice=True)';
	label don_obs___2='PPE donned appropriately.  (choice=False)';
	label don_obs___3='PPE donned appropriately.  (choice=Unable to assess)';
	label expand_don_obs='Expand on donning observation.';
	label doff_obs___1='PPE doffed appropriately.  (choice=True)';
	label doff_obs___2='PPE doffed appropriately.  (choice=False)';
	label doff_obs___3='PPE doffed appropriately.  (choice=Unable to assess)';
	label expand_doff_obs='Expand on doffing observation.';
	label aiir_obs___1='Airborne patients are located in an AIIR room. (choice=True)';
	label aiir_obs___2='Airborne patients are located in an AIIR room. (choice=False)';
	label aiir_obs___3='Airborne patients are located in an AIIR room. (choice=False, no AIIR available)';
	label aiir_obs___4='Airborne patients are located in an AIIR room. (choice=False, no AIIR in facility)';
	label aiir_obs___5='Airborne patients are located in an AIIR room. (choice=Unable to assess)';
	label aiir_obs___6='Airborne patients are located in an AIIR room. (choice=No patients on currently on airborne isolation)';
	label expand_aiir_obs='Expand on AIIR room observation.';
	label priv_obs___1='If private room is not available for patient, roommate should be appropriate. (choice=True)';
	label priv_obs___2='If private room is not available for patient, roommate should be appropriate. (choice=False)';
	label priv_obs___3='If private room is not available for patient, roommate should be appropriate. (choice=Unable to assess)';
	label priv_obs___4='If private room is not available for patient, roommate should be appropriate. (choice=Not applicable)';
	label expand_priv_obs='Expand on private room observation.';
	label stand_obs='Please note if any observations of Standard Precautions not being followed.';
	label expand_precobs='Please use this space to expand on any topics in the Standard and Transmission-Based Precautions Observation module.';
	label standard_and_transmi_v_3='Complete?';
	label policy_disinf___1='The facility has written processes (accessible to administration and staff) for routine and terminal cleaning and disinfection of patient rooms. (choice=True)';
	label policy_disinf___2='The facility has written processes (accessible to administration and staff) for routine and terminal cleaning and disinfection of patient rooms. (choice=False)';
	label policy_disinf___3='The facility has written processes (accessible to administration and staff) for routine and terminal cleaning and disinfection of patient rooms. (choice=Facility is unsure)';
	label policy_disinf___4='The facility has written processes (accessible to administration and staff) for routine and terminal cleaning and disinfection of patient rooms. (choice=Unable to assess)';
	label contact_disinf___1='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include routine and terminal cleaning and disinfection of rooms of residents on TBP (e.g., C. difficile). (choice=True)';
	label contact_disinf___2='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include routine and terminal cleaning and disinfection of rooms of residents on TBP (e.g., C. difficile). (choice=False)';
	label contact_disinf___3='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include routine and terminal cleaning and disinfection of rooms of residents on TBP (e.g., C. difficile). (choice=Facility is unsure)';
	label contact_disinf___4='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include routine and terminal cleaning and disinfection of rooms of residents on TBP (e.g., C. difficile). (choice=Unable to assess)';
	label hightouch_disinf___1='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include cleaning and disinfection of high-touch surfaces in common areas. (choice=True)';
	label hightouch_disinf___2='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include cleaning and disinfection of high-touch surfaces in common areas. (choice=False)';
	label hightouch_disinf___3='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include cleaning and disinfection of high-touch surfaces in common areas. (choice=Facility is unsure)';
	label hightouch_disinf___4='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include cleaning and disinfection of high-touch surfaces in common areas. (choice=Unable to assess)';
	label room_disinf___1='Facility has a process to indicate when a room/bed space has been cleaned and disinfected. (choice=True)';
	label room_disinf___2='Facility has a process to indicate when a room/bed space has been cleaned and disinfected. (choice=False)';
	label room_disinf___3='Facility has a process to indicate when a room/bed space has been cleaned and disinfected. (choice=Facility is unsure)';
	label room_disinf___4='Facility has a process to indicate when a room/bed space has been cleaned and disinfected. (choice=Unable to assess)';
	label epa_disinf___1='Supplies necessary for cleaning and disinfection procedures are EPA-registered.  EPA-registered products labeled as effective against C. difficile, norovirus and C. auris are also available. (choice=True)';
	label epa_disinf___2='Supplies necessary for cleaning and disinfection procedures are EPA-registered.  EPA-registered products labeled as effective against C. difficile, norovirus and C. auris are also available. (choice=False)';
	label epa_disinf___3='Supplies necessary for cleaning and disinfection procedures are EPA-registered.  EPA-registered products labeled as effective against C. difficile, norovirus and C. auris are also available. (choice=Facility is unsure)';
	label epa_disinf___4='Supplies necessary for cleaning and disinfection procedures are EPA-registered.  EPA-registered products labeled as effective against C. difficile, norovirus and C. auris are also available. (choice=Unable to assess)';
	label equip_disinf___1='The facility has cleaning/disinfection processes which include handling of equipment shared among residents (e.g., blood pressure cuffs, rehab therapy equipment) per manufacturer''s instructions for use. Staff should be able to identify which equipment has been cleaned/disinfected or waiting to be cleaned/disinfected. (choice=True)';
	label equip_disinf___2='The facility has cleaning/disinfection processes which include handling of equipment shared among residents (e.g., blood pressure cuffs, rehab therapy equipment) per manufacturer''s instructions for use. Staff should be able to identify which equipment has been cleaned/disinfected or waiting to be cleaned/disinfected. (choice=False)';
	label equip_disinf___3='The facility has cleaning/disinfection processes which include handling of equipment shared among residents (e.g., blood pressure cuffs, rehab therapy equipment) per manufacturer''s instructions for use. Staff should be able to identify which equipment has been cleaned/disinfected or waiting to be cleaned/disinfected. (choice=Facility is unsure)';
	label equip_disinf___4='The facility has cleaning/disinfection processes which include handling of equipment shared among residents (e.g., blood pressure cuffs, rehab therapy equipment) per manufacturer''s instructions for use. Staff should be able to identify which equipment has been cleaned/disinfected or waiting to be cleaned/disinfected. (choice=Unable to assess)';
	label gluc_disinf___1='Observe: Facility has blood glucose meters dedicated per patient. (choice=True)';
	label gluc_disinf___2='Observe: Facility has blood glucose meters dedicated per patient. (choice=False)';
	label gluc_disinf___3='Observe: Facility has blood glucose meters dedicated per patient. (choice=False, non-LTC facility)';
	label gluc_disinf___4='Observe: Facility has blood glucose meters dedicated per patient. (choice=Unable to assess)';
	label disinf_glucavail___1='Observe: EPA-registered disinfectant compatible with glucose meter manufacturer''s instructions for use is readily available at point of use. (choice=True)';
	label disinf_glucavail___2='Observe: EPA-registered disinfectant compatible with glucose meter manufacturer''s instructions for use is readily available at point of use. (choice=False)';
	label disinf_glucavail___3='Observe: EPA-registered disinfectant compatible with glucose meter manufacturer''s instructions for use is readily available at point of use. (choice=Unable to assess)';
	label gluc_disinfection_2___1='Glucose meters are cleaned and disinfected per manufacturer''s instructions between patients and/or use. (choice=True)';
	label gluc_disinfection_2___2='Glucose meters are cleaned and disinfected per manufacturer''s instructions between patients and/or use. (choice=False)';
	label gluc_disinfection_2___3='Glucose meters are cleaned and disinfected per manufacturer''s instructions between patients and/or use. (choice=Facility is unsure)';
	label gluc_disinfection_2___4='Glucose meters are cleaned and disinfected per manufacturer''s instructions between patients and/or use. (choice=Unable to assess)';
	label shower_disinf___1='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=True)';
	label shower_disinf___2='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=False)';
	label shower_disinf___3='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=Facility is unsure)';
	label shower_disinf___4='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=Unable to assess)';
	label shower_disinf___5='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=Facility does not have shared shower or treatment rooms)';
	label showindicate_disinf___1='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=True)';
	label showindicate_disinf___2='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=False)';
	label showindicate_disinf___3='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=Facility is unsure)';
	label showindicate_disinf___4='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=Unable to assess)';
	label showindicate_disinf___5='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=Facility does not have shared shower or treatment rooms)';
	label supp_disinf___1='Observe: Cleaning and disinfection supplies are readily available in shower rooms, treatment rooms and at point of use of shared equipment. (choice=True)';
	label supp_disinf___2='Observe: Cleaning and disinfection supplies are readily available in shower rooms, treatment rooms and at point of use of shared equipment. (choice=False)';
	label supp_disinf___3='Observe: Cleaning and disinfection supplies are readily available in shower rooms, treatment rooms and at point of use of shared equipment. (choice=Unable to assess)';
	label devices_disinf='Reusable medical devices (e.g., wound care equipment, podiatry equipment, and dental equipment) are cleaned and reprocessed appropriately prior to use on another patient.    ';
	label expand_envircleaning='Please use this space to expand on any topics in the Environmental Cleaning module.';
	label environmental_cleani_v_4='Complete?';
	label hhprod_obs___1='Hand Hygiene products are readily available throughout facility. (choice=True)';
	label hhprod_obs___2='Hand Hygiene products are readily available throughout facility. (choice=False)';
	label hhprod_obs___3='Hand Hygiene products are readily available throughout facility. (choice=Unable to assess)';
	label resp_signage_obs___1='Facility has signage with respiratory hygiene/cough etiquette instructions posted. (choice=True)';
	label resp_signage_obs___2='Facility has signage with respiratory hygiene/cough etiquette instructions posted. (choice=False)';
	label resp_signage_obs___3='Facility has signage with respiratory hygiene/cough etiquette instructions posted. (choice=Unable to assess)';
	label gen_obs___1='Facility is generally clean and free of clutter. (choice=True)';
	label gen_obs___2='Facility is generally clean and free of clutter. (choice=False)';
	label gen_obs___3='Facility is generally clean and free of clutter. (choice=Unable to assess)';
	label expand_gen_obs='Please expand on general cleanliness and clutter of facility.';
	label sink_obs___1='Supplies and other patient equipment are stored at least 3 feet away from sink, or a splash guard is installed. (choice=True)';
	label sink_obs___2='Supplies and other patient equipment are stored at least 3 feet away from sink, or a splash guard is installed. (choice=False)';
	label sink_obs___3='Supplies and other patient equipment are stored at least 3 feet away from sink, or a splash guard is installed. (choice=Unable to assess)';
	label expand_sink_obs='Expand on sink observations.';
	label undersink_obs___1='No patient supplies/equipment are stored under sinks. (choice=True)';
	label undersink_obs___2='No patient supplies/equipment are stored under sinks. (choice=False)';
	label undersink_obs___3='No patient supplies/equipment are stored under sinks. (choice=Unable to assess)';
	label expand_undersink_obs='Expand on items stored under sinks.';
	label cleansupp_obs___1='Supplies are stored in a manner to prevent soiling or contamination. (choice=True)';
	label cleansupp_obs___2='Supplies are stored in a manner to prevent soiling or contamination. (choice=False)';
	label cleansupp_obs___3='Supplies are stored in a manner to prevent soiling or contamination. (choice=Unable to assess)';
	label expand_cleansupp_obs='Expand on supply storage observation.';
	label sharpstor_obs='Sharps (new and used) are stored in areas either locked or under direct staff observation.';
	label expand_sharpstor_obs='Expand on sharps storage observation.';
	label cleandirty_obs___1='Clean and dirty items, supplies and equipment are stored separately and storage is clearly labeled. (choice=True)';
	label cleandirty_obs___2='Clean and dirty items, supplies and equipment are stored separately and storage is clearly labeled. (choice=False)';
	label cleandirty_obs___3='Clean and dirty items, supplies and equipment are stored separately and storage is clearly labeled. (choice=Unable to assess)';
	label expand_cleandirty_obs='Please expand on separation of clean and dirty items/supplies/equipment.';
	label disinfectequip_obs___1='Shared equipment is appropriately disinfected between patients.  (choice=True)';
	label disinfectequip_obs___2='Shared equipment is appropriately disinfected between patients.  (choice=False)';
	label disinfectequip_obs___3='Shared equipment is appropriately disinfected between patients.  (choice=Unable to assess)';
	label eqip_obs___1='Shared equipment is clearly labeled clean or dirty. (choice=True)';
	label eqip_obs___2='Shared equipment is clearly labeled clean or dirty. (choice=False)';
	label eqip_obs___3='Shared equipment is clearly labeled clean or dirty. (choice=Unable to assess)';
	label expand_eqip_obs='Please expand on labeling of clean and dirty shared equipment.';
	label coverlinen_obs___1='Clean linen is kept covered. (choice=True)';
	label coverlinen_obs___2='Clean linen is kept covered. (choice=False)';
	label coverlinen_obs___3='Clean linen is kept covered. (choice=Unable to assess)';
	label expand_coverlinen_obs='Please expand on linen storage.';
	label soiled_obs___1='Soiled utility area is contained (see notes). (choice=True)';
	label soiled_obs___2='Soiled utility area is contained (see notes). (choice=False)';
	label soiled_obs___3='Soiled utility area is contained (see notes). (choice=Unable to assess)';
	label expand_soiled_obs='Please expand on cleanliness of soiled utility area.';
	label sharps_obs___1='Sharps disposal containers are managed appropriately (secured, located at point of use, easily accessible, not past fill line). (choice=True)';
	label sharps_obs___2='Sharps disposal containers are managed appropriately (secured, located at point of use, easily accessible, not past fill line). (choice=False)';
	label sharps_obs___3='Sharps disposal containers are managed appropriately (secured, located at point of use, easily accessible, not past fill line). (choice=Unable to assess)';
	label medprep_obs___1='Medication preparation area is clean and not adjacent to potential sources of contamination. (choice=True)';
	label medprep_obs___2='Medication preparation area is clean and not adjacent to potential sources of contamination. (choice=False)';
	label medprep_obs___3='Medication preparation area is clean and not adjacent to potential sources of contamination. (choice=Unable to assess)';
	label expand_medprep_obs='Please expand on medication prep area observation.';
	label expir_obs___1='Supplies and medications are within expiration date. (choice=True)';
	label expir_obs___2='Supplies and medications are within expiration date. (choice=False)';
	label expir_obs___3='Supplies and medications are within expiration date. (choice=Unable to assess)';
	label expand_expir_obs='Expand on expiration date observation.';
	label expand_envirobs='Please use this space to expand on any topics in the Environmental Observation module.';
	label environmental_observ_v_5='Complete?';
	label gluc_disinf_2___1='Observe: Facility has blood glucose meters dedicated per patient. (choice=True)';
	label gluc_disinf_2___2='Observe: Facility has blood glucose meters dedicated per patient. (choice=False)';
	label gluc_disinf_2___3='Observe: Facility has blood glucose meters dedicated per patient. (choice=False, non-LTC facility)';
	label gluc_disinf_2___4='Observe: Facility has blood glucose meters dedicated per patient. (choice=Unable to assess)';
	label disinf_glucavail_2___1='Observe: EPA-registered disinfectant compatible with glucose meter manufacturer''s instructions for use is readily available at point of use. (choice=True)';
	label disinf_glucavail_2___2='Observe: EPA-registered disinfectant compatible with glucose meter manufacturer''s instructions for use is readily available at point of use. (choice=False)';
	label disinf_glucavail_2___3='Observe: EPA-registered disinfectant compatible with glucose meter manufacturer''s instructions for use is readily available at point of use. (choice=Unable to assess)';
	label gluc_disinfection___1='Glucose meters are cleaned and disinfected per manufacturer''s instructions between patients and/or use. (choice=True)';
	label gluc_disinfection___2='Glucose meters are cleaned and disinfected per manufacturer''s instructions between patients and/or use. (choice=False)';
	label gluc_disinfection___3='Glucose meters are cleaned and disinfected per manufacturer''s instructions between patients and/or use. (choice=Facility is unsure)';
	label gluc_disinfection___4='Glucose meters are cleaned and disinfected per manufacturer''s instructions between patients and/or use. (choice=Unable to assess)';
	label gluc_supplies___1='Only the supplies needed for glucose monitoring are taken into patient''s rooms at a time. (choice=True)';
	label gluc_supplies___2='Only the supplies needed for glucose monitoring are taken into patient''s rooms at a time. (choice=False)';
	label gluc_supplies___3='Only the supplies needed for glucose monitoring are taken into patient''s rooms at a time. (choice=Facility is unsure)';
	label gluc_supplies___4='Only the supplies needed for glucose monitoring are taken into patient''s rooms at a time. (choice=Unable to assess)';
	label stor_gluc___1='Observe: Glucose meters are stored in a way that prevents cross contamination (and clearly labeled). (choice=True)';
	label stor_gluc___2='Observe: Glucose meters are stored in a way that prevents cross contamination (and clearly labeled). (choice=False)';
	label stor_gluc___3='Observe: Glucose meters are stored in a way that prevents cross contamination (and clearly labeled). (choice=Unable to assess)';
	label insulin_pens___1='Observe: Insulin pens are dedicated to one patient and not shared (should be clearly labeled). (choice=True)';
	label insulin_pens___2='Observe: Insulin pens are dedicated to one patient and not shared (should be clearly labeled). (choice=False)';
	label insulin_pens___3='Observe: Insulin pens are dedicated to one patient and not shared (should be clearly labeled). (choice=Unable to assess)';
	label insulin_storage___1='Observe: Insulin pens are stored in a way that prevents cross contamination. (choice=True)';
	label insulin_storage___2='Observe: Insulin pens are stored in a way that prevents cross contamination. (choice=False)';
	label insulin_storage___3='Observe: Insulin pens are stored in a way that prevents cross contamination. (choice=Unable to assess)';
	label inject_policy___1='Injections are prepared using aseptic technique in a clean area that is not adjacent to potential sources of contamination. (choice=True)';
	label inject_policy___2='Injections are prepared using aseptic technique in a clean area that is not adjacent to potential sources of contamination. (choice=False)';
	label inject_policy___3='Injections are prepared using aseptic technique in a clean area that is not adjacent to potential sources of contamination. (choice=Facility is unsure)';
	label inject_policy___4='Injections are prepared using aseptic technique in a clean area that is not adjacent to potential sources of contamination. (choice=Unable to assess)';
	label one_time_syringe___1='Needles and syringes are used for only one patient, one time and then discarded. (choice=True)';
	label one_time_syringe___2='Needles and syringes are used for only one patient, one time and then discarded. (choice=False)';
	label one_time_syringe___3='Needles and syringes are used for only one patient, one time and then discarded. (choice=Facility is unsure)';
	label one_time_syringe___4='Needles and syringes are used for only one patient, one time and then discarded. (choice=Unable to assess)';
	label single_dose___1='Single dose medication vials are used for one resident, one time only and remaining contents are discarded. (choice=True)';
	label single_dose___2='Single dose medication vials are used for one resident, one time only and remaining contents are discarded. (choice=False)';
	label single_dose___3='Single dose medication vials are used for one resident, one time only and remaining contents are discarded. (choice=Facility is unsure)';
	label single_dose___4='Single dose medication vials are used for one resident, one time only and remaining contents are discarded. (choice=Unable to assess)';
	label multi_dose___1='Multi-dose vials are dated when opened and discarded within 28 days (unless otherwise stated by manufacturer).  (choice=True)';
	label multi_dose___2='Multi-dose vials are dated when opened and discarded within 28 days (unless otherwise stated by manufacturer).  (choice=False)';
	label multi_dose___3='Multi-dose vials are dated when opened and discarded within 28 days (unless otherwise stated by manufacturer).  (choice=Facility is unsure)';
	label multi_dose___4='Multi-dose vials are dated when opened and discarded within 28 days (unless otherwise stated by manufacturer).  (choice=Unable to assess)';
	label gloves_inject___1='Staff use gloves when giving injections, using sharps or possibly coming in contact with blood or bodily fluids. (choice=True)';
	label gloves_inject___2='Staff use gloves when giving injections, using sharps or possibly coming in contact with blood or bodily fluids. (choice=False)';
	label gloves_inject___3='Staff use gloves when giving injections, using sharps or possibly coming in contact with blood or bodily fluids. (choice=Facility is unsure)';
	label gloves_inject___4='Staff use gloves when giving injections, using sharps or possibly coming in contact with blood or bodily fluids. (choice=Unable to assess)';
	label diversion_policy___1='The facility has procedures to track personnel access to controlled substances to prevent narcotics theft/drug diversion. (choice=True)';
	label diversion_policy___2='The facility has procedures to track personnel access to controlled substances to prevent narcotics theft/drug diversion. (choice=False)';
	label diversion_policy___3='The facility has procedures to track personnel access to controlled substances to prevent narcotics theft/drug diversion. (choice=Facility is unsure)';
	label diversion_policy___4='The facility has procedures to track personnel access to controlled substances to prevent narcotics theft/drug diversion. (choice=Unable to assess)';
	label expand_injectmed='Please use this space to expand on any topics in the POC, Injection and Medication Safety module.';
	label infectionmedication__v_6='Complete?';
	label glu_1___1='Observation 1 (choice=Supplies gathered)';
	label glu_1___2='Observation 1 (choice=HH performed)';
	label glu_1___3='Observation 1 (choice=Don clean gloves)';
	label glu_1___4='Observation 1 (choice=Single-use lancet used)';
	label glu_1___5='Observation 1 (choice=HH performed)';
	label glu_1___6='Observation 1 (choice=Meter cleaned and disinfected per MIFU)';
	label glu_1___7='Observation 1 (choice=HH performed)';
	label glu_2___1='Observation 2 (choice=Supplies gathered)';
	label glu_2___2='Observation 2 (choice=HH performed)';
	label glu_2___3='Observation 2 (choice=Don clean gloves)';
	label glu_2___4='Observation 2 (choice=Single-use lancet used)';
	label glu_2___5='Observation 2 (choice=HH performed)';
	label glu_2___6='Observation 2 (choice=Meter cleaned and disinfected per MIFU)';
	label glu_2___7='Observation 2 (choice=HH performed)';
	label glu_3___1='Observation 3 (choice=Supplies gathered)';
	label glu_3___2='Observation 3 (choice=HH performed)';
	label glu_3___3='Observation 3 (choice=Don clean gloves)';
	label glu_3___4='Observation 3 (choice=Single-use lancet used)';
	label glu_3___5='Observation 3 (choice=HH performed)';
	label glu_3___6='Observation 3 (choice=Meter cleaned and disinfected per MIFU)';
	label glu_3___7='Observation 3 (choice=HH performed)';
	label glu_4___1='Observation 4 (choice=Supplies gathered)';
	label glu_4___2='Observation 4 (choice=HH performed)';
	label glu_4___3='Observation 4 (choice=Don clean gloves)';
	label glu_4___4='Observation 4 (choice=Single-use lancet used)';
	label glu_4___5='Observation 4 (choice=HH performed)';
	label glu_4___6='Observation 4 (choice=Meter cleaned and disinfected per MIFU)';
	label glu_4___7='Observation 4 (choice=HH performed)';
	label glu_5___1='Observation 5 (choice=Supplies gathered)';
	label glu_5___2='Observation 5 (choice=HH performed)';
	label glu_5___3='Observation 5 (choice=Don clean gloves)';
	label glu_5___4='Observation 5 (choice=Single-use lancet used)';
	label glu_5___5='Observation 5 (choice=HH performed)';
	label glu_5___6='Observation 5 (choice=Meter cleaned and disinfected per MIFU)';
	label glu_5___7='Observation 5 (choice=HH performed)';
	label notes_glu_obs='Glucose Monitoring Observation Notes ';
	label assisted_blood_gluco_v_7='Complete?';
	label sterilization_loc___1='Sterilization (choice=Onsite)';
	label sterilization_loc___2='Sterilization (choice=Offsite)';
	label sterilization_loc___3='Sterilization (choice=Facility is unsure)';
	label sterilization_loc___4='Sterilization (choice=Unable to assess)';
	label sterilization_loc___5='Sterilization (choice=Not Performed)';
	label iuss___1='IUSS (immediate-use steam sterilization or flash sterilization) is monitored on a regular basis. (choice=True)';
	label iuss___2='IUSS (immediate-use steam sterilization or flash sterilization) is monitored on a regular basis. (choice=False)';
	label iuss___3='IUSS (immediate-use steam sterilization or flash sterilization) is monitored on a regular basis. (choice=Facility is unsure)';
	label iuss___4='IUSS (immediate-use steam sterilization or flash sterilization) is monitored on a regular basis. (choice=Unable to assess)';
	label hld_loc___1='High-Level Disinfection (choice=Onsite)';
	label hld_loc___2='High-Level Disinfection (choice=Offsite)';
	label hld_loc___3='High-Level Disinfection (choice=Facility is unsure)';
	label hld_loc___4='High-Level Disinfection (choice=Unable to assess)';
	label hld_loc___5='High-Level Disinfection (choice=Not Performed)';
	label critical_item___1='Critical items are sterilized prior to use. (choice=True)';
	label critical_item___2='Critical items are sterilized prior to use. (choice=False)';
	label critical_item___3='Critical items are sterilized prior to use. (choice=Facility is unsure)';
	label critical_item___4='Critical items are sterilized prior to use. (choice=Unable to assess)';
	label hld_items___1='Semi-critical items are, at a minimum, high-level disinfected prior to reuse. (choice=True)';
	label hld_items___2='Semi-critical items are, at a minimum, high-level disinfected prior to reuse. (choice=False)';
	label hld_items___3='Semi-critical items are, at a minimum, high-level disinfected prior to reuse. (choice=Facility is unsure)';
	label hld_items___4='Semi-critical items are, at a minimum, high-level disinfected prior to reuse. (choice=Unable to assess)';
	label single_items___1='Single-use devices are not reprocessed for repeat use (unless otherwise approved by FDA). (choice=True)';
	label single_items___2='Single-use devices are not reprocessed for repeat use (unless otherwise approved by FDA). (choice=False)';
	label single_items___3='Single-use devices are not reprocessed for repeat use (unless otherwise approved by FDA). (choice=Facility is unsure)';
	label single_items___4='Single-use devices are not reprocessed for repeat use (unless otherwise approved by FDA). (choice=Unable to assess)';
	label expand_sterildisinf='Please use this space to expand on any topics in the Sterilization and Disinfection module.';
	label sterilizationdisinfe_v_8='Complete?';
	label laundry___1='Laundry (choice=Onsite)';
	label laundry___2='Laundry (choice=Offsite)';
	label laundry___3='Laundry (choice=Facility is unsure)';
	label laundry___4='Laundry (choice=Unable to assess)';
	label bag_laund___1='Soiled laundry is clearly label and bagged at point of use.  (choice=True)';
	label bag_laund___2='Soiled laundry is clearly label and bagged at point of use.  (choice=False)';
	label bag_laund___3='Soiled laundry is clearly label and bagged at point of use.  (choice=Facility is unsure)';
	label bag_laund___4='Soiled laundry is clearly label and bagged at point of use.  (choice=Unable to assess)';
	label trans_laund___1='A soiled laundry cart is used to transport laundry from collect area.  (choice=True)';
	label trans_laund___2='A soiled laundry cart is used to transport laundry from collect area.  (choice=False)';
	label trans_laund___3='A soiled laundry cart is used to transport laundry from collect area.  (choice=Facility is unsure)';
	label trans_laund___4='A soiled laundry cart is used to transport laundry from collect area.  (choice=Unable to assess)';
	label store_laund___1='Soiled laundry is stored separately from clean supplies/linen. (choice=True)';
	label store_laund___2='Soiled laundry is stored separately from clean supplies/linen. (choice=False)';
	label store_laund___3='Soiled laundry is stored separately from clean supplies/linen. (choice=Facility is unsure)';
	label store_laund___4='Soiled laundry is stored separately from clean supplies/linen. (choice=Unable to assess)';
	label supp_laund___1='Observe: Hand hygiene and PPE supplies available in the soiled laundry area. (choice=True)';
	label supp_laund___2='Observe: Hand hygiene and PPE supplies available in the soiled laundry area. (choice=False)';
	label supp_laund___3='Observe: Hand hygiene and PPE supplies available in the soiled laundry area. (choice=Unable to assess)';
	label clean_laund___1='Observe: Clean linen/laundry is covered while being stored. (choice=True)';
	label clean_laund___2='Observe: Clean linen/laundry is covered while being stored. (choice=False)';
	label clean_laund___3='Observe: Clean linen/laundry is covered while being stored. (choice=Unable to assess)';
	label expand_healthlaund='Please use this space to expand on any topics in the Healthcare Laundry module.';
	label healthcare_laundry_complete='Complete?';
	label ob_type___1='What type of outbreak is this visit addressing? (choice=COVID)';
	label ob_type___2='What type of outbreak is this visit addressing? (choice=Influenza)';
	label ob_type___3='What type of outbreak is this visit addressing? (choice=RSV)';
	label ob_type___4='What type of outbreak is this visit addressing? (choice=Norovirus)';
	label ob_type___5='What type of outbreak is this visit addressing? (choice=MDRO)';
	label ob_type___6='What type of outbreak is this visit addressing? (choice=iGAS)';
	label aware_covid___1='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=True)';
	label aware_covid___2='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=False)';
	label aware_covid___3='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=Facility is unsure)';
	label aware_covid___4='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=Unable to assess)';
	label signs_covid___1='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures.   (choice=True)';
	label signs_covid___2='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures.   (choice=False)';
	label signs_covid___4='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures.   (choice=Unable to assess)';
	label resp_entrance_covid___1='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=True)';
	label resp_entrance_covid___2='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=False)';
	label resp_entrance_covid___4='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=Unable to assess)';
	label resp_visitors_covid___1='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=True)';
	label resp_visitors_covid___2='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=False)';
	label resp_visitors_covid___3='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=Facility is unsure)';
	label resp_visitors_covid___4='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=Unable to assess)';
	label visitors_hh_covid___1='Facility educates visitors on hand hygiene.   (choice=True)';
	label visitors_hh_covid___2='Facility educates visitors on hand hygiene.   (choice=False)';
	label visitors_hh_covid___3='Facility educates visitors on hand hygiene.   (choice=Facility is unsure)';
	label visitors_hh_covid___4='Facility educates visitors on hand hygiene.   (choice=Unable to assess)';
	label resp_station_covid___1='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=True)';
	label resp_station_covid___2='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=False)';
	label resp_station_covid___4='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=Unable to assess)';
	label signage_covid___1='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered.  (choice=True)';
	label signage_covid___2='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered.  (choice=False)';
	label signage_covid___4='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered.  (choice=Unable to assess)';
	label sick_leave_covid___1='The facility encourages employees to stay home when sick and sick leave policies reflect this.   (choice=True)';
	label sick_leave_covid___2='The facility encourages employees to stay home when sick and sick leave policies reflect this.   (choice=False)';
	label sick_leave_covid___3='The facility encourages employees to stay home when sick and sick leave policies reflect this.   (choice=Facility is unsure)';
	label sick_leave_covid___4='The facility encourages employees to stay home when sick and sick leave policies reflect this.   (choice=Unable to assess)';
	label return_work_covid___1='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=True)';
	label return_work_covid___2='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=False)';
	label return_work_covid___3='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=Facility is unsure)';
	label return_work_covid___4='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=Unable to assess)';
	label ppe_covid___1='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak. COVID= Standard Precautions, NIOSH Approved particulate respirator with N95 filters or higher, gown, gloves, and eye protection (i.e., goggles or a face shield that covers the front and sides of the face) (https://www.cdc.gov/covid/hcp/infection-control/index.html) (choice=True)';
	label ppe_covid___2='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak. COVID= Standard Precautions, NIOSH Approved particulate respirator with N95 filters or higher, gown, gloves, and eye protection (i.e., goggles or a face shield that covers the front and sides of the face) (https://www.cdc.gov/covid/hcp/infection-control/index.html) (choice=False)';
	label ppe_covid___3='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak. COVID= Standard Precautions, NIOSH Approved particulate respirator with N95 filters or higher, gown, gloves, and eye protection (i.e., goggles or a face shield that covers the front and sides of the face) (https://www.cdc.gov/covid/hcp/infection-control/index.html) (choice=Facility is unsure)';
	label ppe_covid___4='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak. COVID= Standard Precautions, NIOSH Approved particulate respirator with N95 filters or higher, gown, gloves, and eye protection (i.e., goggles or a face shield that covers the front and sides of the face) (https://www.cdc.gov/covid/hcp/infection-control/index.html) (choice=Unable to assess)';
	label tbp_signage_covid___1='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. See PPE requirements above, signage may vary across facilities. (choice=True)';
	label tbp_signage_covid___2='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. See PPE requirements above, signage may vary across facilities. (choice=False)';
	label tbp_signage_covid___4='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. See PPE requirements above, signage may vary across facilities. (choice=Unable to assess)';
	label fit_testing_covid___1='Staff who may need to use N-95 respirators have been properly fit-tested (medical evaluation, annual/prn fit test) and trained on proper use.  (choice=True)';
	label fit_testing_covid___2='Staff who may need to use N-95 respirators have been properly fit-tested (medical evaluation, annual/prn fit test) and trained on proper use.  (choice=False)';
	label fit_testing_covid___3='Staff who may need to use N-95 respirators have been properly fit-tested (medical evaluation, annual/prn fit test) and trained on proper use.  (choice=Facility is unsure)';
	label fit_testing_covid___4='Staff who may need to use N-95 respirators have been properly fit-tested (medical evaluation, annual/prn fit test) and trained on proper use.  (choice=Unable to assess)';
	label ppe_pou_covid___1='Observe: PPE is available at point-of-use (outside of resident rooms).  (choice=True)';
	label ppe_pou_covid___2='Observe: PPE is available at point-of-use (outside of resident rooms).  (choice=False)';
	label ppe_pou_covid___4='Observe: PPE is available at point-of-use (outside of resident rooms).  (choice=Unable to assess)';
	label disposable_masks_covid___1='Disposable masks used for transmission-based precautions are used once and then discarded.  (choice=True)';
	label disposable_masks_covid___2='Disposable masks used for transmission-based precautions are used once and then discarded.  (choice=False)';
	label disposable_masks_covid___3='Disposable masks used for transmission-based precautions are used once and then discarded.  (choice=Facility is unsure)';
	label disposable_masks_covid___4='Disposable masks used for transmission-based precautions are used once and then discarded.  (choice=Unable to assess)';
	label staff_tbp_covid___1='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room.  (choice=True)';
	label staff_tbp_covid___2='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room.  (choice=False)';
	label staff_tbp_covid___4='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room.  (choice=Unable to assess)';
	label residents_tbp_covid___1='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask, perform hand hygiene and limit movement in the facility. (choice=True)';
	label residents_tbp_covid___2='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask, perform hand hygiene and limit movement in the facility. (choice=False)';
	label residents_tbp_covid___3='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask, perform hand hygiene and limit movement in the facility. (choice=Facility is unsure)';
	label residents_tbp_covid___4='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask, perform hand hygiene and limit movement in the facility. (choice=Unable to assess)';
	label private_rooms_covid___1='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=True)';
	label private_rooms_covid___2='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=False)';
	label private_rooms_covid___3='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=Facility is unsure)';
	label private_rooms_covid___4='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=Unable to assess)';
	label hh_audits_covid___1='Facility performs hand hygiene audits.  (choice=True)';
	label hh_audits_covid___2='Facility performs hand hygiene audits.  (choice=False)';
	label hh_audits_covid___3='Facility performs hand hygiene audits.  (choice=Facility is unsure)';
	label hh_audits_covid___4='Facility performs hand hygiene audits.  (choice=Unable to assess)';
	label ppe_audits_covid___1='Facility performs PPE donning and doffing audits on a routine basis during outbreaks.  (choice=True)';
	label ppe_audits_covid___2='Facility performs PPE donning and doffing audits on a routine basis during outbreaks.  (choice=False)';
	label ppe_audits_covid___3='Facility performs PPE donning and doffing audits on a routine basis during outbreaks.  (choice=Facility is unsure)';
	label ppe_audits_covid___4='Facility performs PPE donning and doffing audits on a routine basis during outbreaks.  (choice=Unable to assess)';
	label precautions_covid___1='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/covid/hcp/infection-control/index.html) (choice=True)';
	label precautions_covid___2='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/covid/hcp/infection-control/index.html) (choice=False)';
	label precautions_covid___3='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/covid/hcp/infection-control/index.html) (choice=Facility is unsure)';
	label precautions_covid___4='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/covid/hcp/infection-control/index.html) (choice=Unable to assess)';
	label high_touch_covid___1='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks.  (choice=True)';
	label high_touch_covid___2='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks.  (choice=False)';
	label high_touch_covid___3='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks.  (choice=Facility is unsure)';
	label high_touch_covid___4='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks.  (choice=Unable to assess)';
	label disinfect_covid___1='Observe: Disinfectants being used are effective against the pathogen.  (choice=True)';
	label disinfect_covid___2='Observe: Disinfectants being used are effective against the pathogen.  (choice=False)';
	label disinfect_covid___4='Observe: Disinfectants being used are effective against the pathogen.  (choice=Unable to assess)';
	label disinfect_pou_covid___1='Observe: Disinfectants are readily available at point-of-use.  (choice=True)';
	label disinfect_pou_covid___2='Observe: Disinfectants are readily available at point-of-use.  (choice=False)';
	label disinfect_pou_covid___4='Observe: Disinfectants are readily available at point-of-use.  (choice=Unable to assess)';
	label equip_dedicated_covid___1='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another resident. (choice=True)';
	label equip_dedicated_covid___2='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another resident. (choice=False)';
	label equip_dedicated_covid___3='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another resident. (choice=Facility is unsure)';
	label equip_dedicated_covid___4='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another resident. (choice=Unable to assess)';
	label ppe_supply_covid___1='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues).  (choice=True)';
	label ppe_supply_covid___2='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues).  (choice=False)';
	label ppe_supply_covid___3='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues).  (choice=Facility is unsure)';
	label ppe_supply_covid___4='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues).  (choice=Unable to assess)';
	label universal_mask_covid___1='Facility has considered universal masking (not required).   (choice=True)';
	label universal_mask_covid___2='Facility has considered universal masking (not required).   (choice=False)';
	label universal_mask_covid___3='Facility has considered universal masking (not required).   (choice=Facility is unsure)';
	label universal_mask_covid___4='Facility has considered universal masking (not required).   (choice=Unable to assess)';
	label hh_throughout_covid___1='Observe: Hand hygiene is available throughout the facility.  (choice=True)';
	label hh_throughout_covid___2='Observe: Hand hygiene is available throughout the facility.  (choice=False)';
	label hh_throughout_covid___4='Observe: Hand hygiene is available throughout the facility.  (choice=Unable to assess)';
	label hh_inout_covid___1='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=True)';
	label hh_inout_covid___2='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=False)';
	label hh_inout_covid___4='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=Unable to assess)';
	label hh_semi_private_covid___1='Observe: Hand hygiene supplies are available inside semi-private rooms.  (choice=True)';
	label hh_semi_private_covid___2='Observe: Hand hygiene supplies are available inside semi-private rooms.  (choice=False)';
	label hh_semi_private_covid___4='Observe: Hand hygiene supplies are available inside semi-private rooms.  (choice=Unable to assess)';
	label aware_flu___1='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=True)';
	label aware_flu___2='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=False)';
	label aware_flu___3='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=Facility is unsure)';
	label aware_flu___4='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=Unable to assess)';
	label signs_flu___1='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures.   (choice=True)';
	label signs_flu___2='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures.   (choice=False)';
	label signs_flu___4='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures.   (choice=Unable to assess)';
	label resp_entrance_flu___1='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=True)';
	label resp_entrance_flu___2='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=False)';
	label resp_entrance_flu___4='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=Unable to assess)';
	label resp_visitors_flu___1='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=True)';
	label resp_visitors_flu___2='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=False)';
	label resp_visitors_flu___3='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=Facility is unsure)';
	label resp_visitors_flu___4='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=Unable to assess)';
	label visitors_hh_flu___1='Facility educates visitors on hand hygiene.   (choice=True)';
	label visitors_hh_flu___2='Facility educates visitors on hand hygiene.   (choice=False)';
	label visitors_hh_flu___3='Facility educates visitors on hand hygiene.   (choice=Facility is unsure)';
	label visitors_hh_flu___4='Facility educates visitors on hand hygiene.   (choice=Unable to assess)';
	label resp_station_flu___1='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=True)';
	label resp_station_flu___2='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=False)';
	label resp_station_flu___4='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=Unable to assess)';
	label signage_flu___1='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered.  (choice=True)';
	label signage_flu___2='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered.  (choice=False)';
	label signage_flu___4='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered.  (choice=Unable to assess)';
	label sick_leave_flu___1='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=True)';
	label sick_leave_flu___2='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=False)';
	label sick_leave_flu___3='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=Facility is unsure)';
	label sick_leave_flu___4='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=Unable to assess)';
	label return_work_flu___1='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=True)';
	label return_work_flu___2='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=False)';
	label return_work_flu___3='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=Facility is unsure)';
	label return_work_flu___4='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=Unable to assess)';
	label ppe_flu___1='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak. Influenza=facemask (choice=True)';
	label ppe_flu___2='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak. Influenza=facemask (choice=False)';
	label ppe_flu___3='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak. Influenza=facemask (choice=Facility is unsure)';
	label ppe_flu___4='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak. Influenza=facemask (choice=Unable to assess)';
	label tbp_signage_flu___1='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. Influenza=Droplet precautions (choice=True)';
	label tbp_signage_flu___2='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. Influenza=Droplet precautions (choice=False)';
	label tbp_signage_flu___4='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. Influenza=Droplet precautions (choice=Unable to assess)';
	label ppe_pou_flu___1='Observe: PPE is available at point-of-use (outside of resident rooms).  (choice=True)';
	label ppe_pou_flu___2='Observe: PPE is available at point-of-use (outside of resident rooms).  (choice=False)';
	label ppe_pou_flu___4='Observe: PPE is available at point-of-use (outside of resident rooms).  (choice=Unable to assess)';
	label disposable_masks_flu___1='Disposable masks used for transmission-based precautions are used once and then discarded.  (choice=True)';
	label disposable_masks_flu___2='Disposable masks used for transmission-based precautions are used once and then discarded.  (choice=False)';
	label disposable_masks_flu___3='Disposable masks used for transmission-based precautions are used once and then discarded.  (choice=Facility is unsure)';
	label disposable_masks_flu___4='Disposable masks used for transmission-based precautions are used once and then discarded.  (choice=Unable to assess)';
	label staff_tbp_flu___1='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room.  (choice=True)';
	label staff_tbp_flu___2='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room.  (choice=False)';
	label staff_tbp_flu___4='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room.  (choice=Unable to assess)';
	label residents_tbp_flu___1='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask, perform hand hygiene and limit movement in the facility. (choice=True)';
	label residents_tbp_flu___2='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask, perform hand hygiene and limit movement in the facility. (choice=False)';
	label residents_tbp_flu___3='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask, perform hand hygiene and limit movement in the facility. (choice=Facility is unsure)';
	label residents_tbp_flu___4='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask, perform hand hygiene and limit movement in the facility. (choice=Unable to assess)';
	label private_rooms_flu___1='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=True)';
	label private_rooms_flu___2='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=False)';
	label private_rooms_flu___3='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=Facility is unsure)';
	label private_rooms_flu___4='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=Unable to assess)';
	label hh_audits_flu___1='Facility performs hand hygiene audits.  (choice=True)';
	label hh_audits_flu___2='Facility performs hand hygiene audits.  (choice=False)';
	label hh_audits_flu___3='Facility performs hand hygiene audits.  (choice=Facility is unsure)';
	label hh_audits_flu___4='Facility performs hand hygiene audits.  (choice=Unable to assess)';
	label ppe_audits_flu___1='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=True)';
	label ppe_audits_flu___2='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=False)';
	label ppe_audits_flu___3='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=Facility is unsure)';
	label ppe_audits_flu___4='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=Unable to assess)';
	label precautions_flu___1='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/flu/hcp/infection-control/healthcare-settings.html) (choice=True)';
	label precautions_flu___2='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/flu/hcp/infection-control/healthcare-settings.html) (choice=False)';
	label precautions_flu___3='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/flu/hcp/infection-control/healthcare-settings.html) (choice=Facility is unsure)';
	label precautions_flu___4='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/flu/hcp/infection-control/healthcare-settings.html) (choice=Unable to assess)';
	label high_touch_flu___1='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks.  (choice=True)';
	label high_touch_flu___2='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks.  (choice=False)';
	label high_touch_flu___3='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks.  (choice=Facility is unsure)';
	label high_touch_flu___4='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks.  (choice=Unable to assess)';
	label disinfect_flu___1='Observe: Disinfectants being used are effective against the pathogen.  (choice=True)';
	label disinfect_flu___2='Observe: Disinfectants being used are effective against the pathogen.  (choice=False)';
	label disinfect_flu___4='Observe: Disinfectants being used are effective against the pathogen.  (choice=Unable to assess)';
	label disinfect_pou_flu___1='Disinfectants are readily available at point-of-use.  (choice=True)';
	label disinfect_pou_flu___2='Disinfectants are readily available at point-of-use.  (choice=False)';
	label disinfect_pou_flu___3='Disinfectants are readily available at point-of-use.  (choice=Facility is unsure)';
	label disinfect_pou_flu___4='Disinfectants are readily available at point-of-use.  (choice=Unable to assess)';
	label ppe_supply_flu___1='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues).  (choice=True)';
	label ppe_supply_flu___2='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues).  (choice=False)';
	label ppe_supply_flu___3='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues).  (choice=Facility is unsure)';
	label ppe_supply_flu___4='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues).  (choice=Unable to assess)';
	label hh_throughout_flu___1='Observe: Hand hygiene is available throughout the facility.  (choice=True)';
	label hh_throughout_flu___2='Observe: Hand hygiene is available throughout the facility.  (choice=False)';
	label hh_throughout_flu___4='Observe: Hand hygiene is available throughout the facility.  (choice=Unable to assess)';
	label hh_inout_flu___1='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=True)';
	label hh_inout_flu___2='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=False)';
	label hh_inout_flu___4='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=Unable to assess)';
	label hh_semi_private_flu___1='Observe: Hand hygiene supplies are available inside semi-private rooms.  (choice=True)';
	label hh_semi_private_flu___2='Observe: Hand hygiene supplies are available inside semi-private rooms.  (choice=False)';
	label hh_semi_private_flu___4='Observe: Hand hygiene supplies are available inside semi-private rooms.  (choice=Unable to assess)';
	label aware_rsv___1='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=True)';
	label aware_rsv___2='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=False)';
	label aware_rsv___3='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=Facility is unsure)';
	label aware_rsv___4='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take.  (choice=Unable to assess)';
	label signs_rsv___1='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures. (choice=True)';
	label signs_rsv___2='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures. (choice=False)';
	label signs_rsv___4='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures. (choice=Unable to assess)';
	label resp_entrance_rsv___1='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved.  (choice=True)';
	label resp_entrance_rsv___2='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved.  (choice=False)';
	label resp_entrance_rsv___4='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved.  (choice=Unable to assess)';
	label resp_visitors_rsv___1='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=True)';
	label resp_visitors_rsv___2='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=False)';
	label resp_visitors_rsv___3='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=Facility is unsure)';
	label resp_visitors_rsv___4='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection.  (choice=Unable to assess)';
	label visitors_hh_rsv___1='Facility educates visitors on hand hygiene.  (choice=True)';
	label visitors_hh_rsv___2='Facility educates visitors on hand hygiene.  (choice=False)';
	label visitors_hh_rsv___3='Facility educates visitors on hand hygiene.  (choice=Facility is unsure)';
	label visitors_hh_rsv___4='Facility educates visitors on hand hygiene.  (choice=Unable to assess)';
	label resp_station_rsv___1='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=True)';
	label resp_station_rsv___2='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=False)';
	label resp_station_rsv___4='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas).  (choice=Unable to assess)';
	label signage_rsv___1='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered. (choice=True)';
	label signage_rsv___2='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered. (choice=False)';
	label signage_rsv___4='Observe: Facility should have signage with instructions, ABHS, tissues, no touch waste receptable, and masks available at entry to facility and in common areas where visitors may be encountered. (choice=Unable to assess)';
	label sick_leave_rsv___1='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=True)';
	label sick_leave_rsv___2='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=False)';
	label sick_leave_rsv___3='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=Facility is unsure)';
	label sick_leave_rsv___4='The facility encourages employees to stay home when sick and sick leave policies reflect this.  (choice=Unable to assess)';
	label return_work_rsv___1='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=True)';
	label return_work_rsv___2='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=False)';
	label return_work_rsv___3='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=Facility is unsure)';
	label return_work_rsv___4='Facility observes federal and/or state guidance for staff return to work following acute respiratory viral illness. CDC guidance for SNF under DHSR (https://www.cdc.gov/covid/hcp/infection-control/guidance-risk-assesment-hcp.html). All other settings can use the guidance provided in DPH memo dated September 18, 2025. (choice=Unable to assess)';
	label ppe_rsv___1='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak.RSV=gown and gloves, facemask if needed per standard precautions (choice=True)';
	label ppe_rsv___2='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak.RSV=gown and gloves, facemask if needed per standard precautions (choice=False)';
	label ppe_rsv___3='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak.RSV=gown and gloves, facemask if needed per standard precautions (choice=Facility is unsure)';
	label ppe_rsv___4='Facility observes federal and/or state guidance for recommended PPE for the type of respiratory pathogen in outbreak.RSV=gown and gloves, facemask if needed per standard precautions (choice=Unable to assess)';
	label tbp_signage_rsv___1='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. RSV=Contact precautions (choice=True)';
	label tbp_signage_rsv___2='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. RSV=Contact precautions (choice=False)';
	label tbp_signage_rsv___4='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. RSV=Contact precautions (choice=Unable to assess)';
	label stand_precaut_rsv___1='Facility understands the use of standard precautions in relation to RSV outbreaks. Contact precautions + Standard precautions - use a mask if resident is coughing, sneezing, etc. (choice=True)';
	label stand_precaut_rsv___2='Facility understands the use of standard precautions in relation to RSV outbreaks. Contact precautions + Standard precautions - use a mask if resident is coughing, sneezing, etc. (choice=False)';
	label stand_precaut_rsv___3='Facility understands the use of standard precautions in relation to RSV outbreaks. Contact precautions + Standard precautions - use a mask if resident is coughing, sneezing, etc. (choice=Facility is unsure)';
	label stand_precaut_rsv___4='Facility understands the use of standard precautions in relation to RSV outbreaks. Contact precautions + Standard precautions - use a mask if resident is coughing, sneezing, etc. (choice=Unable to assess)';
	label ppe_pou_rsv___1='Observe: PPE is available at point-of-use (outside of resident rooms). (choice=True)';
	label ppe_pou_rsv___2='Observe: PPE is available at point-of-use (outside of resident rooms). (choice=False)';
	label ppe_pou_rsv___4='Observe: PPE is available at point-of-use (outside of resident rooms). (choice=Unable to assess)';
	label disposable_masks_rsv___1='Disposable masks used for transmission-based precautions are used once and then discarded. (choice=True)';
	label disposable_masks_rsv___2='Disposable masks used for transmission-based precautions are used once and then discarded. (choice=False)';
	label disposable_masks_rsv___3='Disposable masks used for transmission-based precautions are used once and then discarded. (choice=Facility is unsure)';
	label disposable_masks_rsv___4='Disposable masks used for transmission-based precautions are used once and then discarded. (choice=Unable to assess)';
	label staff_tbp_rsv___1='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=True)';
	label staff_tbp_rsv___2='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=False)';
	label staff_tbp_rsv___4='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=Unable to assess)';
	label residents_tbp_rsv___1='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask (if exhibiting respiratory symptoms), perform hand hygiene and limit movement in the facility. (choice=True)';
	label residents_tbp_rsv___2='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask (if exhibiting respiratory symptoms), perform hand hygiene and limit movement in the facility. (choice=False)';
	label residents_tbp_rsv___3='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask (if exhibiting respiratory symptoms), perform hand hygiene and limit movement in the facility. (choice=Facility is unsure)';
	label residents_tbp_rsv___4='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they wear a facemask (if exhibiting respiratory symptoms), perform hand hygiene and limit movement in the facility. (choice=Unable to assess)';
	label private_rooms_rsv___1='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=True)';
	label private_rooms_rsv___2='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=False)';
	label private_rooms_rsv___3='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=Facility is unsure)';
	label private_rooms_rsv___4='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=Unable to assess)';
	label hh_audits_rsv___1='Facility performs hand hygiene audits. (choice=True)';
	label hh_audits_rsv___2='Facility performs hand hygiene audits. (choice=False)';
	label hh_audits_rsv___3='Facility performs hand hygiene audits. (choice=Facility is unsure)';
	label hh_audits_rsv___4='Facility performs hand hygiene audits. (choice=Unable to assess)';
	label ppe_audits_rsv___1='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=True)';
	label ppe_audits_rsv___2='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=False)';
	label ppe_audits_rsv___3='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=Facility is unsure)';
	label ppe_audits_rsv___4='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=Unable to assess)';
	label precautions_rsv___1='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html#R) (choice=True)';
	label precautions_rsv___2='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html#R) (choice=False)';
	label precautions_rsv___3='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html#R) (choice=Facility is unsure)';
	label precautions_rsv___4='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html#R) (choice=Unable to assess)';
	label high_touch_rsv___1='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks. (choice=True)';
	label high_touch_rsv___2='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks. (choice=False)';
	label high_touch_rsv___3='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks. (choice=Facility is unsure)';
	label high_touch_rsv___4='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks. (choice=Unable to assess)';
	label disinfect_rsv___1='Observe: Disinfectants being used are effective against the pathogen. (choice=True)';
	label disinfect_rsv___2='Observe: Disinfectants being used are effective against the pathogen. (choice=False)';
	label disinfect_rsv___4='Observe: Disinfectants being used are effective against the pathogen. (choice=Unable to assess)';
	label disinfect_pou_rsv___1='Observe: Disinfectants are readily available at point-of-use.  (choice=True)';
	label disinfect_pou_rsv___2='Observe: Disinfectants are readily available at point-of-use.  (choice=False)';
	label disinfect_pou_rsv___4='Observe: Disinfectants are readily available at point-of-use.  (choice=Unable to assess)';
	label equipment_dedicated_rsv___1='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another. (choice=True)';
	label equipment_dedicated_rsv___2='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another. (choice=False)';
	label equipment_dedicated_rsv___3='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another. (choice=Facility is unsure)';
	label equipment_dedicated_rsv___4='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another. (choice=Unable to assess)';
	label ppe_supply_rsv___1='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues). (choice=True)';
	label ppe_supply_rsv___2='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues). (choice=False)';
	label ppe_supply_rsv___3='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues). (choice=Facility is unsure)';
	label ppe_supply_rsv___4='Facility has assessed current supply of PPE and other critical materials (e.g., alcohol-based hand rub, EPA-registered disinfectants, tissues). (choice=Unable to assess)';
	label hh_throughout_rsv___1='Observe: Hand hygiene is available throughout the facility.  (choice=True)';
	label hh_throughout_rsv___2='Observe: Hand hygiene is available throughout the facility.  (choice=False)';
	label hh_throughout_rsv___4='Observe: Hand hygiene is available throughout the facility.  (choice=Unable to assess)';
	label hh_inout_rsv___1='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=True)';
	label hh_inout_rsv___2='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=False)';
	label hh_inout_rsv___4='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=Unable to assess)';
	label hh_semi_private_rsv___1='Observe: Hand hygiene supplies are available inside semi-private rooms. (choice=True)';
	label hh_semi_private_rsv___2='Observe: Hand hygiene supplies are available inside semi-private rooms. (choice=False)';
	label hh_semi_private_rsv___4='Observe: Hand hygiene supplies are available inside semi-private rooms. (choice=Unable to assess)';
	label aware_noro___1='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=True)';
	label aware_noro___2='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=False)';
	label aware_noro___3='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=Facility is unsure)';
	label aware_noro___4='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=Unable to assess)';
	label signs_noro___1='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures. (choice=True)';
	label signs_noro___2='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures. (choice=False)';
	label signs_noro___4='Observe: Facility has posted signs at entrances to the facility listing current visitation procedures. (choice=Unable to assess)';
	label resp_entrance_noro___1='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a gastrointestinal infection that they may not enter the facility until their symptoms have resolved.  (choice=True)';
	label resp_entrance_noro___2='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a gastrointestinal infection that they may not enter the facility until their symptoms have resolved.  (choice=False)';
	label resp_entrance_noro___4='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a gastrointestinal infection that they may not enter the facility until their symptoms have resolved.  (choice=Unable to assess)';
	label resp_visitors_noro___1='The facility educates family and visitors that they may not visit the facility while they have symptoms of a GI infection.  (choice=True)';
	label resp_visitors_noro___2='The facility educates family and visitors that they may not visit the facility while they have symptoms of a GI infection.  (choice=False)';
	label resp_visitors_noro___3='The facility educates family and visitors that they may not visit the facility while they have symptoms of a GI infection.  (choice=Facility is unsure)';
	label resp_visitors_noro___4='The facility educates family and visitors that they may not visit the facility while they have symptoms of a GI infection.  (choice=Unable to assess)';
	label visitors_hh_noro___1='Facility educates visitors on hand hygiene (soap and water for visitors during a norovirus outbreak). (choice=True)';
	label visitors_hh_noro___2='Facility educates visitors on hand hygiene (soap and water for visitors during a norovirus outbreak). (choice=False)';
	label visitors_hh_noro___3='Facility educates visitors on hand hygiene (soap and water for visitors during a norovirus outbreak). (choice=Facility is unsure)';
	label visitors_hh_noro___4='Facility educates visitors on hand hygiene (soap and water for visitors during a norovirus outbreak). (choice=Unable to assess)';
	label sick_leave_noro___1='The facility encourages employees to stay home when sick and sick leave policies reflect this. (choice=True)';
	label sick_leave_noro___2='The facility encourages employees to stay home when sick and sick leave policies reflect this. (choice=False)';
	label sick_leave_noro___3='The facility encourages employees to stay home when sick and sick leave policies reflect this. (choice=Facility is unsure)';
	label sick_leave_noro___4='The facility encourages employees to stay home when sick and sick leave policies reflect this. (choice=Unable to assess)';
	label return_work_noro___1='Facility observes federal and/or state guidance for staff return to work following acute gastrointestinal illness. (choice=True)';
	label return_work_noro___2='Facility observes federal and/or state guidance for staff return to work following acute gastrointestinal illness. (choice=False)';
	label return_work_noro___3='Facility observes federal and/or state guidance for staff return to work following acute gastrointestinal illness. (choice=Facility is unsure)';
	label return_work_noro___4='Facility observes federal and/or state guidance for staff return to work following acute gastrointestinal illness. (choice=Unable to assess)';
	label ppe_noro___1='Facility observes federal and/or state guidance for recommended PPE for the type of pathogen in outbreak. Norovirus=gown and gloves (choice=True)';
	label ppe_noro___2='Facility observes federal and/or state guidance for recommended PPE for the type of pathogen in outbreak. Norovirus=gown and gloves (choice=False)';
	label ppe_noro___3='Facility observes federal and/or state guidance for recommended PPE for the type of pathogen in outbreak. Norovirus=gown and gloves (choice=Facility is unsure)';
	label ppe_noro___4='Facility observes federal and/or state guidance for recommended PPE for the type of pathogen in outbreak. Norovirus=gown and gloves (choice=Unable to assess)';
	label bp_signage_noro___1='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. Norovirus=Contact precautions (choice=True)';
	label bp_signage_noro___2='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. Norovirus=Contact precautions (choice=False)';
	label bp_signage_noro___3='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. Norovirus=Contact precautions (choice=Facility is unsure)';
	label bp_signage_noro___4='Observe: Proper transmission-based signage is placed on the door of suspected and confirmed residents. Norovirus=Contact precautions (choice=Unable to assess)';
	label ppe_pou_noro___1='Observe: PPE is available at point-of-use (outside of resident rooms). (choice=True)';
	label ppe_pou_noro___2='Observe: PPE is available at point-of-use (outside of resident rooms). (choice=False)';
	label ppe_pou_noro___4='Observe: PPE is available at point-of-use (outside of resident rooms). (choice=Unable to assess)';
	label staff_tbp_noro___1='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=True)';
	label staff_tbp_noro___2='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=False)';
	label staff_tbp_noro___4='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=Unable to assess)';
	label residents_tbp_noro___1='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they should frequently perform hand hygiene and limit movement in the facility. (choice=True)';
	label residents_tbp_noro___2='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they should frequently perform hand hygiene and limit movement in the facility. (choice=False)';
	label residents_tbp_noro___3='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they should frequently perform hand hygiene and limit movement in the facility. (choice=Facility is unsure)';
	label residents_tbp_noro___4='Residents on transmission-based precautions are expected to remain in their rooms except for medically necessary purposes. If residents leave their room, they should frequently perform hand hygiene and limit movement in the facility. (choice=Unable to assess)';
	label private_rooms_noro___1='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=True)';
	label private_rooms_noro___2='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=False)';
	label private_rooms_noro___3='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=Facility is unsure)';
	label private_rooms_noro___4='Residents on transmission-based precautions are placed in private rooms or appropriately cohorted. If limited single rooms are available, or if numerous patients/residents are simultaneously identified to have known exposures or symptoms concerning for this pathogen, patient/residents should remain in their current location to reduce movement/further exposure within the facility. (choice=Unable to assess)';
	label wash_hands_noro___1='Staff are expected to wash their hands with soap and water during and after working with a resident with suspected or confirmed norovirus. (choice=True)';
	label wash_hands_noro___2='Staff are expected to wash their hands with soap and water during and after working with a resident with suspected or confirmed norovirus. (choice=False)';
	label wash_hands_noro___3='Staff are expected to wash their hands with soap and water during and after working with a resident with suspected or confirmed norovirus. (choice=Facility is unsure)';
	label wash_hands_noro___4='Staff are expected to wash their hands with soap and water during and after working with a resident with suspected or confirmed norovirus. (choice=Unable to assess)';
	label hh_audits_noro___1='Facility performs hand hygiene audits on a routine basis during outbreaks. (choice=True)';
	label hh_audits_noro___2='Facility performs hand hygiene audits on a routine basis during outbreaks. (choice=False)';
	label hh_audits_noro___3='Facility performs hand hygiene audits on a routine basis during outbreaks. (choice=Facility is unsure)';
	label hh_audits_noro___4='Facility performs hand hygiene audits on a routine basis during outbreaks. (choice=Unable to assess)';
	label ppe_audits_noro___1='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=True)';
	label ppe_audits_noro___2='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=False)';
	label ppe_audits_noro___3='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=Facility is unsure)';
	label ppe_audits_noro___4='Facility performs PPE donning and doffing audits on a routine basis during outbreaks. (choice=Unable to assess)';
	label precautions_noro___1='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html#R) (choice=True)';
	label precautions_noro___2='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html#R) (choice=False)';
	label precautions_noro___3='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html#R) (choice=Facility is unsure)';
	label precautions_noro___4='Facility observes CDC-recommended duration of precautions for confirmed positive residents. (https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html#R) (choice=Unable to assess)';
	label high_touch_noro___1='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks. (choice=True)';
	label high_touch_noro___2='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks. (choice=False)';
	label high_touch_noro___3='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks. (choice=Facility is unsure)';
	label high_touch_noro___4='High-touch surfaces are cleaned/disinfected on an increased and routine basis during outbreaks. (choice=Unable to assess)';
	label disinfect_noro___1='Observe: Disinfectants being used are effective against the pathogen. (choice=True)';
	label disinfect_noro___2='Observe: Disinfectants being used are effective against the pathogen. (choice=False)';
	label disinfect_noro___4='Observe: Disinfectants being used are effective against the pathogen. (choice=Unable to assess)';
	label disinfect_pou_noro___1='Observe: Disinfectants are readily available at point-of-use. (choice=True)';
	label disinfect_pou_noro___2='Observe: Disinfectants are readily available at point-of-use. (choice=False)';
	label disinfect_pou_noro___4='Observe: Disinfectants are readily available at point-of-use. (choice=Unable to assess)';
	label equipment_dedicated_noro___1='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another resident. (choice=True)';
	label equipment_dedicated_noro___2='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another resident. (choice=False)';
	label equipment_dedicated_noro___3='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another resident. (choice=Facility is unsure)';
	label equipment_dedicated_noro___4='When possible, equipment is dedicated to the resident. Otherwise, equipment is cleaned and disinfected appropriately prior to use on another resident. (choice=Unable to assess)';
	label ppe_supply___1='Facility has assessed current supply of PPE and other critical materials (e.g., hand soap, EPA-registered disinfectants). (choice=True)';
	label ppe_supply___2='Facility has assessed current supply of PPE and other critical materials (e.g., hand soap, EPA-registered disinfectants). (choice=False)';
	label ppe_supply___3='Facility has assessed current supply of PPE and other critical materials (e.g., hand soap, EPA-registered disinfectants). (choice=Facility is unsure)';
	label ppe_supply___4='Facility has assessed current supply of PPE and other critical materials (e.g., hand soap, EPA-registered disinfectants). (choice=Unable to assess)';
	label hh_throughout_noro___1='Observe: Hand hygiene is available throughout the facility.  (choice=True)';
	label hh_throughout_noro___2='Observe: Hand hygiene is available throughout the facility.  (choice=False)';
	label hh_throughout_noro___4='Observe: Hand hygiene is available throughout the facility.  (choice=Unable to assess)';
	label hh_inout_noro___1='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=True)';
	label hh_inout_noro___2='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=False)';
	label hh_inout_noro___4='Observe: ABHS is available at least once inside and directly outside each patient room.  (choice=Unable to assess)';
	label sinks_noro___1='Observe: Hand washing sinks can be identified for any resident room housing a norovirus suspected or confirmed resident. (choice=True)';
	label sinks_noro___2='Observe: Hand washing sinks can be identified for any resident room housing a norovirus suspected or confirmed resident. (choice=False)';
	label sinks_noro___4='Observe: Hand washing sinks can be identified for any resident room housing a norovirus suspected or confirmed resident. (choice=Unable to assess)';
	label hh_semi_private_noro___1='Observe: Hand hygiene supplies are available inside semi-private rooms. (choice=True)';
	label hh_semi_private_noro___2='Observe: Hand hygiene supplies are available inside semi-private rooms. (choice=False)';
	label hh_semi_private_noro___4='Observe: Hand hygiene supplies are available inside semi-private rooms. (choice=Unable to assess)';
	label pathresist_mdro='Please specify the outbreak pathogen and mechanism of resistance ';
	label contr_ob_mdro___1='	Check off the control measures that the facility has implemented. (choice=Screening for cases)';
	label contr_ob_mdro___2='	Check off the control measures that the facility has implemented. (choice=Implemented transmission-based precautions)';
	label contr_ob_mdro___3='	Check off the control measures that the facility has implemented. (choice=Halted admissions)';
	label contr_ob_mdro___4='	Check off the control measures that the facility has implemented. (choice=Halted group dining and communal activities)';
	label contr_ob_mdro___5='	Check off the control measures that the facility has implemented. (choice=Visitation occurring, but visitors are educated about outbreak and instructed to adhere to transmission-based precautions)';
	label contr_ob_mdro___6='	Check off the control measures that the facility has implemented. (choice=Sick residents are housed together in a wing/area)';
	label contr_ob_mdro___7='	Check off the control measures that the facility has implemented. (choice=Staff are cohorted so certain staff exclusively care for patients with the outbreak pathogen)';
	label contr_ob_mdro___8='	Check off the control measures that the facility has implemented. (choice=None of the above)';
	label contr_ob_mdro___9='	Check off the control measures that the facility has implemented. (choice=Other)';
	label cont_other_ob_mdro='Please describe other control measures implemented';
	label screen_ob_mdro___1='The facility is following all screening/testing recommendations from the LHD. (choice=True)';
	label screen_ob_mdro___2='The facility is following all screening/testing recommendations from the LHD. (choice=False)';
	label screen_ob_mdro___3='The facility is following all screening/testing recommendations from the LHD. (choice=Facility is unsure)';
	label screen_ob_mdro___4='The facility is following all screening/testing recommendations from the LHD. (choice=Unable to assess)';
	label rec_ob_mdro___1='The facility is following all infection control recommendations from the LHD. (choice=True)';
	label rec_ob_mdro___2='The facility is following all infection control recommendations from the LHD. (choice=False)';
	label rec_ob_mdro___3='The facility is following all infection control recommendations from the LHD. (choice=Facility is unsure)';
	label rec_ob_mdro___4='The facility is following all infection control recommendations from the LHD. (choice=Unable to assess)';
	label iso_ob_mdro___1='Cases are in private rooms or housed with other people with the same diagnosis. (choice=True)';
	label iso_ob_mdro___2='Cases are in private rooms or housed with other people with the same diagnosis. (choice=False)';
	label iso_ob_mdro___3='Cases are in private rooms or housed with other people with the same diagnosis. (choice=Facility is unsure)';
	label iso_ob_mdro___4='Cases are in private rooms or housed with other people with the same diagnosis. (choice=Unable to assess)';
	label contacts_ob_mdro___1='Close contacts are being appropriately screened, quarantined, and/or monitored as recommended by the LHD. (choice=True)';
	label contacts_ob_mdro___2='Close contacts are being appropriately screened, quarantined, and/or monitored as recommended by the LHD. (choice=False)';
	label contacts_ob_mdro___3='Close contacts are being appropriately screened, quarantined, and/or monitored as recommended by the LHD. (choice=Facility is unsure)';
	label contacts_ob_mdro___4='Close contacts are being appropriately screened, quarantined, and/or monitored as recommended by the LHD. (choice=Unable to assess)';
	label precaut_ob_mdro___1='Observe: Correct transmission-based precautions signs are posted on the patient''s door for all cases. (choice=True)';
	label precaut_ob_mdro___2='Observe: Correct transmission-based precautions signs are posted on the patient''s door for all cases. (choice=False)';
	label precaut_ob_mdro___4='Observe: Correct transmission-based precautions signs are posted on the patient''s door for all cases. (choice=Unable to assess)';
	label staff_ob_mdro___1='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=True)';
	label staff_ob_mdro___2='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=False)';
	label staff_ob_mdro___4='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=Unable to assess)';
	label edu_ob_mdro___1='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=True)';
	label edu_ob_mdro___2='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=False)';
	label edu_ob_mdro___3='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=Facility is unsure)';
	label edu_ob_mdro___4='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=Unable to assess)';
	label report_list_mdro___1='The facility has a current list of diseases reportable to public health authorities. (choice=True)';
	label report_list_mdro___2='The facility has a current list of diseases reportable to public health authorities. (choice=False)';
	label report_list_mdro___3='The facility has a current list of diseases reportable to public health authorities. (choice=Facility is unsure)';
	label report_list_mdro___4='The facility has a current list of diseases reportable to public health authorities. (choice=Unable to assess)';
	label ph_contact_mdro___1='The facility knows how to get in contact with the local and/or state health department. (choice=True)';
	label ph_contact_mdro___2='The facility knows how to get in contact with the local and/or state health department. (choice=False)';
	label ph_contact_mdro___3='The facility knows how to get in contact with the local and/or state health department. (choice=Facility is unsure)';
	label ph_contact_mdro___4='The facility knows how to get in contact with the local and/or state health department. (choice=Unable to assess)';
	label comm_infect_mdro___1='The facility has a system for communicating communicable diseases/need for TBP when patients are transferred to other facilities. (choice=True)';
	label comm_infect_mdro___2='The facility has a system for communicating communicable diseases/need for TBP when patients are transferred to other facilities. (choice=False)';
	label comm_infect_mdro___3='The facility has a system for communicating communicable diseases/need for TBP when patients are transferred to other facilities. (choice=Facility is unsure)';
	label comm_infect_mdro___4='The facility has a system for communicating communicable diseases/need for TBP when patients are transferred to other facilities. (choice=Unable to assess)';
	label infect_intake_mdro___1='The facility has written intake procedures to identify potentially infectious persons/need for TBP at time of admission. (choice=True)';
	label infect_intake_mdro___2='The facility has written intake procedures to identify potentially infectious persons/need for TBP at time of admission. (choice=False)';
	label infect_intake_mdro___3='The facility has written intake procedures to identify potentially infectious persons/need for TBP at time of admission. (choice=Facility is unsure)';
	label infect_intake_mdro___4='The facility has written intake procedures to identify potentially infectious persons/need for TBP at time of admission. (choice=Unable to assess)';
	label lab_notif_mdro___1='The facility has system to notify the IP when communicable diseases are reported by a laboratory. (choice=True)';
	label lab_notif_mdro___2='The facility has system to notify the IP when communicable diseases are reported by a laboratory. (choice=False)';
	label lab_notif_mdro___3='The facility has system to notify the IP when communicable diseases are reported by a laboratory. (choice=Facility is unsure)';
	label lab_notif_mdro___4='The facility has system to notify the IP when communicable diseases are reported by a laboratory. (choice=Unable to assess)';
	label indiv_antistew_mdro___1='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Physician)';
	label indiv_antistew_mdro___2='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Pharmacist)';
	label indiv_antistew_mdro___3='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Other)';
	label indiv_antistew_mdro___4='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Facility does not have an individual responsible for antibiotic stewardship activities)';
	label indiv_antistew_mdro___5='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Facility is unsure)';
	label indiv_antistew_mdro___6='Which of the following individuals are responsible for the management and outcomes of antibiotic stewardship activities at your facility? (choice=Unable to assess)';
	label other_antistew_mdro='Please specify other';
	label hh_policies_mdro___1='Facility promotes preferential use of alcohol-based hand sanitizer (ABHS) over soap and water in most clinical situations. (choice=True)';
	label hh_policies_mdro___2='Facility promotes preferential use of alcohol-based hand sanitizer (ABHS) over soap and water in most clinical situations. (choice=False)';
	label hh_policies_mdro___3='Facility promotes preferential use of alcohol-based hand sanitizer (ABHS) over soap and water in most clinical situations. (choice=Facility is unsure)';
	label hh_policies_mdro___4='Facility promotes preferential use of alcohol-based hand sanitizer (ABHS) over soap and water in most clinical situations. (choice=Unable to assess)';
	label hh_expectations_mdro___1='When are employees expected to perform hand hygiene? (choice=At room entry and exit)';
	label hh_expectations_mdro___2='When are employees expected to perform hand hygiene? (choice=Immediately before touching a patient)';
	label hh_expectations_mdro___3='When are employees expected to perform hand hygiene? (choice=Before performing an aseptic task)';
	label hh_expectations_mdro___4='When are employees expected to perform hand hygiene? (choice=Before moving from work on a soiled body site to a clean site on the same patient)';
	label hh_expectations_mdro___5='When are employees expected to perform hand hygiene? (choice=After touching patient or the patients immediate surroundings)';
	label hh_expectations_mdro___6='When are employees expected to perform hand hygiene? (choice=After contact with blood, body fluids, or contaminated surfaces)';
	label hh_expectations_mdro___7='When are employees expected to perform hand hygiene? (choice=Immediately after glove removal)';
	label hh_expectations_mdro___8='When are employees expected to perform hand hygiene? (choice=Facility is unsure)';
	label hh_expectations_mdro___9='When are employees expected to perform hand hygiene? (choice=Unable to assess)';
	label hh_inout_mdro___1='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=True)';
	label hh_inout_mdro___2='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=False)';
	label hh_inout_mdro___4='Observe: ABHS is available at least once inside and directly outside each patient room. (choice=Unable to assess)';
	label hh_sinkavail_mdro___1='Observe: A hand hygiene sink can be identified for any given room that could house a patient with norovirus or C. diff. (choice=True)';
	label hh_sinkavail_mdro___2='Observe: A hand hygiene sink can be identified for any given room that could house a patient with norovirus or C. diff. (choice=False)';
	label hh_sinkavail_mdro___3='Observe: A hand hygiene sink can be identified for any given room that could house a patient with norovirus or C. diff. (choice=Facility is unsure)';
	label hh_sinkavail_mdro___4='Observe: A hand hygiene sink can be identified for any given room that could house a patient with norovirus or C. diff. (choice=Unable to assess)';
	label hh_soapwater_mdro___1='When are employees expected to use soap and water vs. ABHS? (choice=When hands are visibly soiled)';
	label hh_soapwater_mdro___2='When are employees expected to use soap and water vs. ABHS? (choice=During the care of patients with suspected or confirmed infection during outbreaks of C. difficile and norovirus)';
	label hh_soapwater_mdro___3='When are employees expected to use soap and water vs. ABHS? (choice=Before eating)';
	label hh_soapwater_mdro___4='When are employees expected to use soap and water vs. ABHS? (choice=After using the restroom)';
	label hh_soapwater_mdro___5='When are employees expected to use soap and water vs. ABHS? (choice=Facility is unsure)';
	label hh_soapwater_mdro___6='When are employees expected to use soap and water vs. ABHS? (choice=Unable to assess)';
	label hh_throughout_mdro___1='Observe: Hand hygiene is available throughout the facility. (choice=True)';
	label hh_throughout_mdro___2='Observe: Hand hygiene is available throughout the facility. (choice=False)';
	label hh_throughout_mdro___3='Observe: Hand hygiene is available throughout the facility. (choice=Unable to assess)';
	label hh_pocket_mdro___1='Facility staff use pocket-sized dispensers of ABHS. (choice=True)';
	label hh_pocket_mdro___2='Facility staff use pocket-sized dispensers of ABHS. (choice=False)';
	label hh_pocket_mdro___3='Facility staff use pocket-sized dispensers of ABHS. (choice=Facility is unsure)';
	label hh_pocket_mdro___4='Facility staff use pocket-sized dispensers of ABHS. (choice=Unable to assess)';
	label hh_only_mdro___1='Sinks are only used for hand washing (i.e., not used for disposal of body fluids, cleaning equipment, or rinsing linen). (choice=True)';
	label hh_only_mdro___2='Sinks are only used for hand washing (i.e., not used for disposal of body fluids, cleaning equipment, or rinsing linen). (choice=False)';
	label hh_only_mdro___3='Sinks are only used for hand washing (i.e., not used for disposal of body fluids, cleaning equipment, or rinsing linen). (choice=Facility is unsure)';
	label hh_only_mdro___4='Sinks are only used for hand washing (i.e., not used for disposal of body fluids, cleaning equipment, or rinsing linen). (choice=Unable to assess)';
	label hh_supplies_mdro___1='Observe: Supplies necessary for adherence to HH (e.g., soap, water, paper towels, alcohol-based hand rub) are readily accessible. (choice=True)';
	label hh_supplies_mdro___2='Observe: Supplies necessary for adherence to HH (e.g., soap, water, paper towels, alcohol-based hand rub) are readily accessible. (choice=False)';
	label hh_supplies_mdro___4='Observe: Supplies necessary for adherence to HH (e.g., soap, water, paper towels, alcohol-based hand rub) are readily accessible. (choice=Unable to assess)';
	label hh_lotion_mdro___1='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=True)';
	label hh_lotion_mdro___2='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=False)';
	label hh_lotion_mdro___3='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=Facility is unsure)';
	label hh_lotion_mdro___4='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=Unable to assess)';
	label hh_lotion_mdro___5='Hand lotion supplied by facility is compatible with facility''s HH products. (choice=Facility does not currently supply lotion)';
	label hh_nails_mdro___1='Facility addresses employee fingernails, such as nail length and use of artificial nails. (choice=True)';
	label hh_nails_mdro___2='Facility addresses employee fingernails, such as nail length and use of artificial nails. (choice=False)';
	label hh_nails_mdro___3='Facility addresses employee fingernails, such as nail length and use of artificial nails. (choice=Facility is unsure)';
	label hh_nails_mdro___4='Facility addresses employee fingernails, such as nail length and use of artificial nails. (choice=Unable to assess)';
	label patienthh_mdro___1='How do patients, residents and visitors clean their hands? (choice=ABHS)';
	label patienthh_mdro___2='How do patients, residents and visitors clean their hands? (choice=Antimicrobial-impregnated wipes)';
	label patienthh_mdro___3='How do patients, residents and visitors clean their hands? (choice=Handwashing with soap and water)';
	label patienthh_mdro___4='How do patients, residents and visitors clean their hands? (choice=Facility is unsure/process not discussed prior)';
	label patienthh_mdro___5='How do patients, residents and visitors clean their hands? (choice=Unable to assess)';
	label transmission_policy_mdro___1='The facility observes TBP in accordance with CDC recommendations (Appendix A - e.g., MDROs=Contact Precautions, or EBP in nursing homes) (choice=True)';
	label transmission_policy_mdro___2='The facility observes TBP in accordance with CDC recommendations (Appendix A - e.g., MDROs=Contact Precautions, or EBP in nursing homes) (choice=False)';
	label transmission_policy_mdro___3='The facility observes TBP in accordance with CDC recommendations (Appendix A - e.g., MDROs=Contact Precautions, or EBP in nursing homes) (choice=Facility is unsure)';
	label transmission_policy_mdro___4='The facility observes TBP in accordance with CDC recommendations (Appendix A - e.g., MDROs=Contact Precautions, or EBP in nursing homes) (choice=Unable to assess)';
	label trans_signage_mdro___1='What actions are taken when a patient is placed on TBP? (choice=Signage placed at room entry)';
	label trans_signage_mdro___2='What actions are taken when a patient is placed on TBP? (choice=PPE supplies placed at room entry)';
	label trans_signage_mdro___3='What actions are taken when a patient is placed on TBP? (choice=Medical equipment is dedicated to the patient)';
	label trans_signage_mdro___4='What actions are taken when a patient is placed on TBP? (choice=Evaluation of need for room placement changes (if necessary))';
	label trans_signage_mdro___5='What actions are taken when a patient is placed on TBP? (choice=Patient movement is restricted unless medically necessary)';
	label trans_signage_mdro___6='What actions are taken when a patient is placed on TBP? (choice=Patient and family members are educated about TBP (including HH and PPE expectations))';
	label trans_signage_mdro___7='What actions are taken when a patient is placed on TBP? (choice=Possible exposures are evaluated (if necessary))';
	label trans_signage_mdro___8='What actions are taken when a patient is placed on TBP? (choice=Facility is unsure)';
	label trans_signage_mdro___9='What actions are taken when a patient is placed on TBP? (choice=Unable to assess)';
	label ppe_supplies_mdro___1='Observe: Supplies necessary for standard precautions and TBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=True)';
	label ppe_supplies_mdro___2='Observe: Supplies necessary for standard precautions and TBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=False)';
	label ppe_supplies_mdro___4='Observe: Supplies necessary for standard precautions and TBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=Unable to assess)';
	label semipriv_mdro___1='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms. (choice=True)';
	label semipriv_mdro___2='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms. (choice=False)';
	label semipriv_mdro___3='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms. (choice=Facility is unsure)';
	label semipriv_mdro___4='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms. (choice=Unable to assess)';
	label tbp_admit_mdro___1='Facility has a process for identifying patients who require TBP upon admission. (choice=True)';
	label tbp_admit_mdro___2='Facility has a process for identifying patients who require TBP upon admission. (choice=False)';
	label tbp_admit_mdro___3='Facility has a process for identifying patients who require TBP upon admission. (choice=Facility is unsure)';
	label tbp_admit_mdro___4='Facility has a process for identifying patients who require TBP upon admission. (choice=Unable to assess)';
	label tbp_transfer_mdro___1='Facility has a process for communicating need for TBP upon transfer/discharge to another facility. (choice=True)';
	label tbp_transfer_mdro___2='Facility has a process for communicating need for TBP upon transfer/discharge to another facility. (choice=False)';
	label tbp_transfer_mdro___3='Facility has a process for communicating need for TBP upon transfer/discharge to another facility. (choice=Facility is unsure)';
	label tbp_transfer_mdro___4='Facility has a process for communicating need for TBP upon transfer/discharge to another facility. (choice=Unable to assess)';
	label tbp_change_mdro___1='Facility has a process for evaluating changes in TBP as needed. (choice=True)';
	label tbp_change_mdro___2='Facility has a process for evaluating changes in TBP as needed. (choice=False)';
	label tbp_change_mdro___3='Facility has a process for evaluating changes in TBP as needed. (choice=Facility is unsure)';
	label tbp_change_mdro___4='Facility has a process for evaluating changes in TBP as needed. (choice=Unable to assess)';
	label ebp_identify_mdro___1='Nursing homes only: Facility has a process for identifying and alerting staff of residents that require enhanced barrier precautions (EBP). (choice=True)';
	label ebp_identify_mdro___2='Nursing homes only: Facility has a process for identifying and alerting staff of residents that require enhanced barrier precautions (EBP). (choice=False)';
	label ebp_identify_mdro___3='Nursing homes only: Facility has a process for identifying and alerting staff of residents that require enhanced barrier precautions (EBP). (choice=Facility is unsure)';
	label ebp_identify_mdro___4='Nursing homes only: Facility has a process for identifying and alerting staff of residents that require enhanced barrier precautions (EBP). (choice=Unable to assess)';
	label trans_signforclean_mdro___1='Facility has a process for keeping TBP signage in place after discharge so cleaning staff knows proper cleaning procedures for the room. (choice=True)';
	label trans_signforclean_mdro___2='Facility has a process for keeping TBP signage in place after discharge so cleaning staff knows proper cleaning procedures for the room. (choice=False)';
	label trans_signforclean_mdro___3='Facility has a process for keeping TBP signage in place after discharge so cleaning staff knows proper cleaning procedures for the room. (choice=Facility is unsure)';
	label trans_signforclean_mdro___4='Facility has a process for keeping TBP signage in place after discharge so cleaning staff knows proper cleaning procedures for the room. (choice=Unable to assess)';
	label one_time_syringe_mdro___1='Needles and syringes are used for only one patient, one time and then discarded. (choice=True)';
	label one_time_syringe_mdro___2='Needles and syringes are used for only one patient, one time and then discarded. (choice=False)';
	label one_time_syringe_mdro___3='Needles and syringes are used for only one patient, one time and then discarded. (choice=Facility is unsure)';
	label one_time_syringe_mdro___4='Needles and syringes are used for only one patient, one time and then discarded. (choice=Unable to assess)';
	label watermang_mdro___1='Facility has a water management plan. (choice=True)';
	label watermang_mdro___2='Facility has a water management plan. (choice=False)';
	label watermang_mdro___3='Facility has a water management plan. (choice=Facility is unsure)';
	label watermang_mdro___4='Facility has a water management plan. (choice=Unable to assess)';
	label splash_mdro___1='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Taps located offset from sink drains)';
	label splash_mdro___2='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Water discharge points at least 10 inches above the sink bottoms in handwashing sinks)';
	label splash_mdro___3='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Patient care items located at least 3 feet from sinks or a splash guard in place to prevent items from becoming wet, including in medication preparation areas)';
	label splash_mdro___5='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Avoidance of faucet aerators in protective environments and transplant units)';
	label splash_mdro___6='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Daily cleaning and disinfection of adjacent countertops with an EPA-registered disinfectant)';
	label splash_mdro___7='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Where installed, daily cleaning and disinfection of splash guards with an EPA-registered disinfectant)';
	label splash_mdro___8='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=No strategies practiced)';
	label splash_mdro___9='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Facility is unsure)';
	label splash_mdro___10='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Unable to assess)';
	label splash_mdro___11='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=Other (specify):)';
	label splash_mdro___12='Which of the following strategies to prevent contamination of the patient care supplies due to splashing are practiced? (Select all that apply)Observe when possible (choice=No strategies are taken by the facility)';
	label splash_other_mdro='Specify other';
	label biofilm_measures_mdro___1='What measures are taken? (select all that apply) (choice=Daily cleaning and disinfection of sinks with an EPA-registered disinfectant)';
	label biofilm_measures_mdro___2='What measures are taken? (select all that apply) (choice=Application of an EPA-registered disinfectant with label claim against biofilms)';
	label biofilm_measures_mdro___3='What measures are taken? (select all that apply) (choice=Staff education to avoid discarding patient waste and/or nutritive fluids down sinks)';
	label biofilm_measures_mdro___4='What measures are taken? (select all that apply) (choice=Facility is unsure)';
	label biofilm_measures_mdro___5='What measures are taken? (select all that apply) (choice=Unable to assess)';
	label biofilm_measures_mdro___6='What measures are taken? (select all that apply) (choice=Other (specify):)';
	label biofilm_measures_mdro___7='What measures are taken? (select all that apply) (choice=No measures are taken by the facility)';
	label biofilm_meas_other_mdro='Specify other';
	label toiletdoor_mdro___1='All toilets in patient/resident rooms are located in restrooms with doors that can be closed when flushed. (choice=True)';
	label toiletdoor_mdro___2='All toilets in patient/resident rooms are located in restrooms with doors that can be closed when flushed. (choice=False)';
	label toiletdoor_mdro___3='All toilets in patient/resident rooms are located in restrooms with doors that can be closed when flushed. (choice=Facility is unsure)';
	label toiletdoor_mdro___4='All toilets in patient/resident rooms are located in restrooms with doors that can be closed when flushed. (choice=Unable to assess)';
	label toiletdoor_no_mdro___1='Toilets that are not located in restrooms are equipped with flush covers. (choice=True)';
	label toiletdoor_no_mdro___2='Toilets that are not located in restrooms are equipped with flush covers. (choice=False)';
	label toiletdoor_no_mdro___3='Toilets that are not located in restrooms are equipped with flush covers. (choice=Facility is unsure)';
	label toiletdoor_no_mdro___4='Toilets that are not located in restrooms are equipped with flush covers. (choice=Unable to assess)';
	label hooperdoor_mdro___1='All hoppers located in soiled utility rooms have doors that are closed during flushing. (choice=True)';
	label hooperdoor_mdro___2='All hoppers located in soiled utility rooms have doors that are closed during flushing. (choice=False)';
	label hooperdoor_mdro___3='All hoppers located in soiled utility rooms have doors that are closed during flushing. (choice=Facility is unsure)';
	label hooperdoor_mdro___4='All hoppers located in soiled utility rooms have doors that are closed during flushing. (choice=Unable to assess)';
	label hopperdoor_no_mdro___1='Hoopers not located in soiled utility rooms are equipped with flush covers. (choice=True)';
	label hopperdoor_no_mdro___2='Hoopers not located in soiled utility rooms are equipped with flush covers. (choice=False)';
	label hopperdoor_no_mdro___3='Hoopers not located in soiled utility rooms are equipped with flush covers. (choice=Facility is unsure)';
	label hopperdoor_no_mdro___4='Hoopers not located in soiled utility rooms are equipped with flush covers. (choice=Unable to assess)';
	label iceobs_mdro___1='Observe: Ice dispenser area is uncluttered, clean, and free of signs of rodents or insects? (choice=True)';
	label iceobs_mdro___2='Observe: Ice dispenser area is uncluttered, clean, and free of signs of rodents or insects? (choice=False)';
	label iceobs_mdro___4='Observe: Ice dispenser area is uncluttered, clean, and free of signs of rodents or insects? (choice=Unable to assess)';
	label icemaint_mdro___1='Ice dispensers are maintained on a routine-basis. (choice=True)';
	label icemaint_mdro___2='Ice dispensers are maintained on a routine-basis. (choice=False)';
	label icemaint_mdro___3='Ice dispensers are maintained on a routine-basis. (choice=Facility is unsure)';
	label icemaint_mdro___4='Ice dispensers are maintained on a routine-basis. (choice=Unable to assess)';
	label showerchair_mdro___1='Shower chairs are constructed of non-porous materials and stored in a manner that allows for drying of all surfaces. (choice=True)';
	label showerchair_mdro___2='Shower chairs are constructed of non-porous materials and stored in a manner that allows for drying of all surfaces. (choice=False)';
	label showerchair_mdro___3='Shower chairs are constructed of non-porous materials and stored in a manner that allows for drying of all surfaces. (choice=Facility is unsure)';
	label showerchair_mdro___4='Shower chairs are constructed of non-porous materials and stored in a manner that allows for drying of all surfaces. (choice=Unable to assess)';
	label ptcarewater_mdro___1='All patient care items that require water are maintained per manufacturer''s instructions for use.  (choice=True)';
	label ptcarewater_mdro___2='All patient care items that require water are maintained per manufacturer''s instructions for use.  (choice=False)';
	label ptcarewater_mdro___3='All patient care items that require water are maintained per manufacturer''s instructions for use.  (choice=Facility is unsure)';
	label ptcarewater_mdro___4='All patient care items that require water are maintained per manufacturer''s instructions for use.  (choice=Unable to assess)';
	label woundmask_gas___1='Observe: Facemasks are worn by staff for source control during wound care activities until the outbreak is over. (choice=True)';
	label woundmask_gas___2='Observe: Facemasks are worn by staff for source control during wound care activities until the outbreak is over. (choice=False)';
	label woundmask_gas___3='Observe: Facemasks are worn by staff for source control during wound care activities until the outbreak is over. (choice=Unable to assess)';
	label reusable_gas___1='Does the wound care provider use any reusable equipment or supplies?  (choice=Yes)';
	label reusable_gas___2='Does the wound care provider use any reusable equipment or supplies?  (choice=No)';
	label reusable_gas___3='Does the wound care provider use any reusable equipment or supplies?  (choice=Facility is unsure)';
	label devices_disinf_gas___1='Reusable medical devices (e.g., wound care equipment, podiatry equipment, and dental equipment) are cleaned and reprocessed appropriately prior to use on another patient. (choice=True)';
	label devices_disinf_gas___2='Reusable medical devices (e.g., wound care equipment, podiatry equipment, and dental equipment) are cleaned and reprocessed appropriately prior to use on another patient. (choice=False)';
	label devices_disinf_gas___3='Reusable medical devices (e.g., wound care equipment, podiatry equipment, and dental equipment) are cleaned and reprocessed appropriately prior to use on another patient. (choice=Facility is unsure)';
	label devices_disinf_gas___4='Reusable medical devices (e.g., wound care equipment, podiatry equipment, and dental equipment) are cleaned and reprocessed appropriately prior to use on another patient. (choice=Unable to assess)';
	label aware_gas___1='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take and what symptoms to look for among residents.  (choice=True)';
	label aware_gas___2='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take and what symptoms to look for among residents.  (choice=False)';
	label aware_gas___3='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take and what symptoms to look for among residents.  (choice=Facility is unsure)';
	label aware_gas___4='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take and what symptoms to look for among residents.  (choice=Unable to assess)';
	label wound_notes_gas='Please use this space to expand on any items discussed.';
	label precautions_gas___1='Facility observes TBP in accordance with CDC recommendations for group A strep. (choice=True)';
	label precautions_gas___2='Facility observes TBP in accordance with CDC recommendations for group A strep. (choice=False)';
	label precautions_gas___3='Facility observes TBP in accordance with CDC recommendations for group A strep. (choice=Facility is unsure)';
	label precautions_gas___4='Facility observes TBP in accordance with CDC recommendations for group A strep. (choice=Unable to assess)';
	label trans_signage_gas___1='What actions are taken when a patient is placed on TBP? (choice=Signage placed at room entry)';
	label trans_signage_gas___2='What actions are taken when a patient is placed on TBP? (choice=PPE supplies placed at room entry)';
	label trans_signage_gas___3='What actions are taken when a patient is placed on TBP? (choice=Medical equipment is dedicated to the patient)';
	label trans_signage_gas___4='What actions are taken when a patient is placed on TBP? (choice=Evaluation of need for room placement changes (if necessary))';
	label trans_signage_gas___5='What actions are taken when a patient is placed on TBP? (choice=Patient movement is restricted unless medically necessary)';
	label trans_signage_gas___6='What actions are taken when a patient is placed on TBP? (choice=Patient and family members are educated about TBP (including HH and PPE expectations))';
	label trans_signage_gas___7='What actions are taken when a patient is placed on TBP? (choice=Possible exposures are evaluated (if necessary))';
	label trans_signage_gas___8='What actions are taken when a patient is placed on TBP? (choice=Facility is unsure)';
	label trans_signage_gas___9='What actions are taken when a patient is placed on TBP? (choice=Unable to assess)';
	label ppe_supplies_gas___1='Observe: Supplies necessary for standard precautions, TBP and EBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=True)';
	label ppe_supplies_gas___2='Observe: Supplies necessary for standard precautions, TBP and EBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=False)';
	label ppe_supplies_gas___3='Observe: Supplies necessary for standard precautions, TBP and EBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=Facility is unsure)';
	label ppe_supplies_gas___4='Observe: Supplies necessary for standard precautions, TBP and EBP (e.g., gloves, gowns, masks) are readily accessible (i.e., outside the room of patients on precautions, readily available when needed for standard precautions, therapy room, etc.). (choice=Unable to assess)';
	label semipriv_gas___1='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms. (choice=True)';
	label semipriv_gas___2='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms. (choice=False)';
	label semipriv_gas___3='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms. (choice=Facility is unsure)';
	label semipriv_gas___4='Employees are expected to doff PPE appropriately and perform hand hygiene when working between patients in semi-private rooms. (choice=Unable to assess)';
	label tbp_change_gas___1='Facility has a process for evaluating changes in TBP (and EBP in nursing homes) as needed. (choice=True)';
	label tbp_change_gas___2='Facility has a process for evaluating changes in TBP (and EBP in nursing homes) as needed. (choice=False)';
	label tbp_change_gas___3='Facility has a process for evaluating changes in TBP (and EBP in nursing homes) as needed. (choice=Facility is unsure)';
	label tbp_change_gas___4='Facility has a process for evaluating changes in TBP (and EBP in nursing homes) as needed. (choice=Unable to assess)';
	label resp_entrance_gas___1='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=True)';
	label resp_entrance_gas___2='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=False)';
	label resp_entrance_gas___3='Observe: The facility has signs posted at the entrances instructing visitors with symptoms of a respiratory infection that they may not enter the facility until their symptoms have resolved. (choice=Unable to assess)';
	label resp_station_gas___1='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas). (choice=True)';
	label resp_station_gas___2='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas). (choice=False)';
	label resp_station_gas___3='Observe: The facility provides resources for complying with respiratory hygiene/cough etiquette at facility entrance(s) and in common area (e.g., waiting areas). (choice=Unable to assess)';
	label resp_visitors_gas___1='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection. (choice=True)';
	label resp_visitors_gas___2='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection. (choice=False)';
	label resp_visitors_gas___3='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection. (choice=Facility is unsure)';
	label resp_visitors_gas___4='The facility educates family and visitors that they may not visit the facility while they have symptoms of a respiratory infection. (choice=Unable to assess)';
	label sick_leave_gas___1='The facility encourages employees to stay home when sick and sick leave policies reflect this. (choice=True)';
	label sick_leave_gas___2='The facility encourages employees to stay home when sick and sick leave policies reflect this. (choice=False)';
	label sick_leave_gas___3='The facility encourages employees to stay home when sick and sick leave policies reflect this. (choice=Facility is unsure)';
	label sick_leave_gas___4='The facility encourages employees to stay home when sick and sick leave policies reflect this. (choice=Unable to assess)';
	label resptreat_gas___1='Were any group A strep cases receiving respiratory care (such as nebulizer treatments, CPAP, trach care, suctioning). (choice=True)';
	label resptreat_gas___2='Were any group A strep cases receiving respiratory care (such as nebulizer treatments, CPAP, trach care, suctioning). (choice=False)';
	label resptreat_gas___3='Were any group A strep cases receiving respiratory care (such as nebulizer treatments, CPAP, trach care, suctioning). (choice=Facility is unsure)';
	label resptreat_gas___4='Were any group A strep cases receiving respiratory care (such as nebulizer treatments, CPAP, trach care, suctioning). (choice=Unable to assess)';
	label resptreat_notes_gas='What type of respiratory care?';
	label resp_aseptic_gas___1='Staff use aseptic technique when performing respiratory care.  (choice=True)';
	label resp_aseptic_gas___2='Staff use aseptic technique when performing respiratory care.  (choice=False)';
	label resp_aseptic_gas___3='Staff use aseptic technique when performing respiratory care.  (choice=Facility is unsure)';
	label resp_aseptic_gas___4='Staff use aseptic technique when performing respiratory care.  (choice=Unable to assess)';
	label trachcare_gas___1='Staff use sterile, single-use supplies when performing trach care and suctioning. (choice=True)';
	label trachcare_gas___2='Staff use sterile, single-use supplies when performing trach care and suctioning. (choice=False)';
	label trachcare_gas___3='Staff use sterile, single-use supplies when performing trach care and suctioning. (choice=Facility is unsure)';
	label trachcare_gas___4='Staff use sterile, single-use supplies when performing trach care and suctioning. (choice=Unable to assess)';
	label trachcare_gas___5='Staff use sterile, single-use supplies when performing trach care and suctioning. (choice=Not applicable)';
	label resp_supplies_gas___1='Respiratory care supplies for other treatments (e.g. nebulizer supplies) are used and stored appropriately to prevent cross contamination.   (choice=True)';
	label resp_supplies_gas___2='Respiratory care supplies for other treatments (e.g. nebulizer supplies) are used and stored appropriately to prevent cross contamination.   (choice=False)';
	label resp_supplies_gas___3='Respiratory care supplies for other treatments (e.g. nebulizer supplies) are used and stored appropriately to prevent cross contamination.   (choice=Facility is unsure)';
	label resp_supplies_gas___4='Respiratory care supplies for other treatments (e.g. nebulizer supplies) are used and stored appropriately to prevent cross contamination.   (choice=Unable to assess)';
	label resp_notes_gas='Please use this space to expand on any items discussed.';
	label disinfectequip_obs_gas___1='Shared equipment is appropriately disinfected between patients. (choice=True)';
	label disinfectequip_obs_gas___2='Shared equipment is appropriately disinfected between patients. (choice=False)';
	label disinfectequip_obs_gas___3='Shared equipment is appropriately disinfected between patients. (choice=Unable to assess)';
	label eqip_obs_gas___1='Shared equipment is clearly labeled clean or dirty. (choice=True)';
	label eqip_obs_gas___2='Shared equipment is clearly labeled clean or dirty. (choice=False)';
	label eqip_obs_gas___3='Shared equipment is clearly labeled clean or dirty. (choice=Unable to assess)';
	label eqip_process_gas='What indicators or processes are used for staff to identify which equipment has been cleaned/disinfected or waiting to be clean/disinfected? ';
	label policy_disinf_gas___1='The facility has processes (accessible in written form to administration and staff, staff are educated on processes) for routine and terminal cleaning and disinfection of patient rooms. (choice=True)';
	label policy_disinf_gas___2='The facility has processes (accessible in written form to administration and staff, staff are educated on processes) for routine and terminal cleaning and disinfection of patient rooms. (choice=False)';
	label policy_disinf_gas___3='The facility has processes (accessible in written form to administration and staff, staff are educated on processes) for routine and terminal cleaning and disinfection of patient rooms. (choice=Facility is unsure)';
	label policy_disinf_gas___4='The facility has processes (accessible in written form to administration and staff, staff are educated on processes) for routine and terminal cleaning and disinfection of patient rooms. (choice=Unable to assess)';
	label contact_disinf_gas___1='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include routine and terminal cleaning and disinfection of rooms of residents on TBP (e.g., C. difficile). (choice=True)';
	label contact_disinf_gas___2='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include routine and terminal cleaning and disinfection of rooms of residents on TBP (e.g., C. difficile). (choice=False)';
	label contact_disinf_gas___3='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include routine and terminal cleaning and disinfection of rooms of residents on TBP (e.g., C. difficile). (choice=Facility is unsure)';
	label contact_disinf_gas___4='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include routine and terminal cleaning and disinfection of rooms of residents on TBP (e.g., C. difficile). (choice=Unable to assess)';
	label hightouch_disinf_gas___1='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include cleaning and disinfection of high-touch surfaces in common areas. (choice=True)';
	label hightouch_disinf_gas___2='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include cleaning and disinfection of high-touch surfaces in common areas. (choice=False)';
	label hightouch_disinf_gas___3='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include cleaning and disinfection of high-touch surfaces in common areas. (choice=Facility is unsure)';
	label hightouch_disinf_gas___4='The facility has written cleaning/disinfection processes (accessible to administration and staff) which include cleaning and disinfection of high-touch surfaces in common areas. (choice=Unable to assess)';
	label epa_disinf_gas___1='Supplies necessary for cleaning and disinfection procedures are EPA-registered. EPA-registered products labeled as effective against C. difficile, norovirus and C. auris are also available. (choice=True)';
	label epa_disinf_gas___2='Supplies necessary for cleaning and disinfection procedures are EPA-registered. EPA-registered products labeled as effective against C. difficile, norovirus and C. auris are also available. (choice=False)';
	label epa_disinf_gas___3='Supplies necessary for cleaning and disinfection procedures are EPA-registered. EPA-registered products labeled as effective against C. difficile, norovirus and C. auris are also available. (choice=Facility is unsure)';
	label epa_disinf_gas___4='Supplies necessary for cleaning and disinfection procedures are EPA-registered. EPA-registered products labeled as effective against C. difficile, norovirus and C. auris are also available. (choice=Unable to assess)';
	label shower_disinf_gas___1='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=True)';
	label shower_disinf_gas___2='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=False)';
	label shower_disinf_gas___3='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=Facility is unsure)';
	label shower_disinf_gas___4='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=Unable to assess)';
	label shower_disinf_gas___5='Shower rooms/treatment rooms are cleaned and disinfected between patients with an EPA registered disinfectant. (choice=Facility does not have shared shower or treatment rooms)';
	label showindicate_disinf_gas___1='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=True)';
	label showindicate_disinf_gas___2='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=False)';
	label showindicate_disinf_gas___3='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=Facility is unsure)';
	label showindicate_disinf_gas___4='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=Unable to assess)';
	label showindicate_disinf_gas___5='The facility has a process indicating if the shower room/treatment room has been cleaned and disinfected. (choice=Facility does not have shared shower or treatment rooms)';
	label supp_disinf_gas___1='Observe: Cleaning and disinfection supplies are readily available in shower rooms, treatment rooms and at point of use of shared equipment. (choice=True)';
	label supp_disinf_gas___2='Observe: Cleaning and disinfection supplies are readily available in shower rooms, treatment rooms and at point of use of shared equipment. (choice=False)';
	label supp_disinf_gas___3='Observe: Cleaning and disinfection supplies are readily available in shower rooms, treatment rooms and at point of use of shared equipment. (choice=Unable to assess)';
	label enviro_notes_gas='Please use this space to expand on any items discussed.';
	label trainaudit_notes_gas='Please use this text box to note anything discussed about training and audits.  Does IP, DON, or other staff perform audits on hand hygiene, PPE, wound care, or environmental cleaning and how often? How is feedback provided to staff?';
	label outbreak_management__v_9='Complete?';
	label disease_ob___1='What is the outbreak disease? (choice=COVID-19)';
	label disease_ob___2='What is the outbreak disease? (choice=Influenza)';
	label disease_ob___3='What is the outbreak disease? (choice=Norovirus)';
	label disease_ob___4='What is the outbreak disease? (choice=C. difficile)';
	label disease_ob___5='What is the outbreak disease? (choice=CRE or other MDRO)';
	label disease_ob___6='What is the outbreak disease? (choice=Group A Strep)';
	label disease_ob___7='What is the outbreak disease? (choice=Legionella)';
	label disease_ob___8='What is the outbreak disease? (choice=Scabies)';
	label disease_ob___9='What is the outbreak disease? (choice=Other)';
	label patho_ob='Please specify the outbreak pathogen ';
	label contr_ob___1='Check off the control measures that the facility has implemented. (choice=Screening for cases)';
	label contr_ob___2='Check off the control measures that the facility has implemented. (choice=Implemented transmission-based precautions)';
	label contr_ob___3='Check off the control measures that the facility has implemented. (choice=Halted admissions)';
	label contr_ob___4='Check off the control measures that the facility has implemented. (choice=Halted group dining and communal activities)';
	label contr_ob___5='Check off the control measures that the facility has implemented. (choice=Halted visitation)';
	label contr_ob___6='Check off the control measures that the facility has implemented. (choice=Visitation occurring, but visitors are educated about outbreak and instructed to adhere to transmission-based precautions)';
	label contr_ob___7='Check off the control measures that the facility has implemented. (choice=Sick residents are housed together in a wing/area)';
	label contr_ob___8='Check off the control measures that the facility has implemented. (choice=Staff are cohorted so certain staff exclusively care for patients with the outbreak pathogen)';
	label contr_ob___9='Check off the control measures that the facility has implemented. (choice=Vaccine or post-exposure prophylaxis administered)';
	label contr_ob___10='Check off the control measures that the facility has implemented. (choice=None of the above)';
	label contr_ob___11='Check off the control measures that the facility has implemented. (choice=Other)';
	label cont_other_ob='Please describe other control measures implemented';
	label lhd_ob___1='The facility has notified the LHD of the outbreak.  (choice=True)';
	label lhd_ob___2='The facility has notified the LHD of the outbreak.  (choice=False)';
	label lhd_ob___3='The facility has notified the LHD of the outbreak.  (choice=Facility is unsure)';
	label screen_ob___1='The facility is following all screening/testing recommendations from the LHD. (choice=True)';
	label screen_ob___2='The facility is following all screening/testing recommendations from the LHD. (choice=False)';
	label screen_ob___3='The facility is following all screening/testing recommendations from the LHD. (choice=Facility is unsure)';
	label rec_ob___1='The facility is following all infection control recommendations from the LHD. (choice=True)';
	label rec_ob___2='The facility is following all infection control recommendations from the LHD. (choice=False)';
	label rec_ob___3='The facility is following all infection control recommendations from the LHD. (choice=Facility is unsure)';
	label iso_ob___1='Cases are in private rooms or housed with other people with the same diagnosis. (choice=True)';
	label iso_ob___2='Cases are in private rooms or housed with other people with the same diagnosis. (choice=False)';
	label iso_ob___3='Cases are in private rooms or housed with other people with the same diagnosis. (choice=Facility is unsure)';
	label contacts_ob___1='Close contacts are being appropriately screened, quarantined, and/or monitored as recommended by the LHD. (choice=True)';
	label contacts_ob___2='Close contacts are being appropriately screened, quarantined, and/or monitored as recommended by the LHD. (choice=False)';
	label contacts_ob___3='Close contacts are being appropriately screened, quarantined, and/or monitored as recommended by the LHD. (choice=Facility is unsure)';
	label precaut_ob___1='Observe: Correct transmission-based precautions signs are posted on the patient''s door for all cases. (choice=True)';
	label precaut_ob___2='Observe: Correct transmission-based precautions signs are posted on the patient''s door for all cases. (choice=False)';
	label precaut_ob___3='Observe: Correct transmission-based precautions signs are posted on the patient''s door for all cases. (choice=Unable to assess)';
	label staff_ob___1='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=True)';
	label staff_ob___2='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=False)';
	label staff_ob___3='Observe: Staff, including environmental services and non-clinical staff, are following appropriate transmission-based precautions when entering a case''s room. (choice=Unable to assess)';
	label edu_ob___1='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=True)';
	label edu_ob___2='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=False)';
	label edu_ob___3='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=Facility is unsure)';
	label edu_ob___4='All staff, including contracted and non-medical staff, are aware of the outbreak and have received education about what precautions they need to take. (choice=Unable to assess)';
	label expand_outbreak='Please use this space to expand on any topics in the Outbreak Management module.';
	label outbreak_management_complete='Complete?';
	label urincath_1___1='Observation 1 (choice=Confirm necessity of catheter)';
	label urincath_1___2='Observation 1 (choice=Peri Care has been performed in the past 12 hours)';
	label urincath_1___3='Observation 1 (choice=Catheter is secured (example: statlock))';
	label urincath_1___4='Observation 1 (choice=Collection bag is not touching the floor)';
	label urincath_1___5='Observation 1 (choice=Collection bag is below bladder level)';
	label urincath_1___6='Observation 1 (choice=Catheter is able to drain into bag (tubing unobstructed))';
	label urincath_2___1='Observation 2 (choice=Confirm necessity of catheter)';
	label urincath_2___2='Observation 2 (choice=Peri Care has been performed in the past 12 hours)';
	label urincath_2___3='Observation 2 (choice=Catheter is secured (example: statlock))';
	label urincath_2___4='Observation 2 (choice=Collection bag is not touching the floor)';
	label urincath_2___5='Observation 2 (choice=Collection bag is below bladder level)';
	label urincath_2___6='Observation 2 (choice=Catheter is able to drain into bag (tubing unobstructed))';
	label urincath_3___1='Observation 3 (choice=Confirm necessity of catheter)';
	label urincath_3___2='Observation 3 (choice=Peri Care has been performed in the past 12 hours)';
	label urincath_3___3='Observation 3 (choice=Catheter is secured (example: statlock))';
	label urincath_3___4='Observation 3 (choice=Collection bag is not touching the floor)';
	label urincath_3___5='Observation 3 (choice=Collection bag is below bladder level)';
	label urincath_3___6='Observation 3 (choice=Catheter is able to drain into bag (tubing unobstructed))';
	label urincath_4___1='Observation 4 (choice=Confirm necessity of catheter)';
	label urincath_4___2='Observation 4 (choice=Peri Care has been performed in the past 12 hours)';
	label urincath_4___3='Observation 4 (choice=Catheter is secured (example: statlock))';
	label urincath_4___4='Observation 4 (choice=Collection bag is not touching the floor)';
	label urincath_4___5='Observation 4 (choice=Collection bag is below bladder level)';
	label urincath_4___6='Observation 4 (choice=Catheter is able to drain into bag (tubing unobstructed))';
	label urincath_5___1='Observation 5 (choice=Confirm necessity of catheter)';
	label urincath_5___2='Observation 5 (choice=Peri Care has been performed in the past 12 hours)';
	label urincath_5___3='Observation 5 (choice=Catheter is secured (example: statlock))';
	label urincath_5___4='Observation 5 (choice=Collection bag is not touching the floor)';
	label urincath_5___5='Observation 5 (choice=Collection bag is below bladder level)';
	label urincath_5___6='Observation 5 (choice=Catheter is able to drain into bag (tubing unobstructed))';
	label urincath_notes_obs='Urinary Catheter Observation Notes';
	label cl_1___1='Observation 1 (choice=Confirm necessity of CL)';
	label cl_1___2='Observation 1 (choice=HH performed and don gloves before handling catheter)';
	label cl_1___3='Observation 1 (choice=Dressing in clean/dry/intact)';
	label cl_1___4='Observation 1 (choice=Tubing is labeled and managed per facility policy)';
	label cl_1___5='Observation 1 (choice=Dressing is label and managed per facility policy)';
	label cl_1___6='Observation 1 (choice=Patient has received a bath in the last 24 hours)';
	label cl_1___7='Observation 1 (choice=Scrub the hub prior to access (observe or confirm with staff))';
	label cl_1___8='Observation 1 (choice=Unused ports are capped/clamped)';
	label cl_2___1='Observation 2 (choice=Confirm necessity of CL)';
	label cl_2___2='Observation 2 (choice=HH performed and don gloves before handling catheter)';
	label cl_2___3='Observation 2 (choice=Dressing in clean/dry/intact)';
	label cl_2___4='Observation 2 (choice=Tubing is labeled and managed per facility policy)';
	label cl_2___5='Observation 2 (choice=Dressing is label and managed per facility policy)';
	label cl_2___6='Observation 2 (choice=Patient has received a bath in the last 24 hours)';
	label cl_2___7='Observation 2 (choice=Scrub the hub prior to access (observe or confirm with staff))';
	label cl_2___8='Observation 2 (choice=Unused ports are capped/clamped)';
	label cl_3___1='Observation 3 (choice=Confirm necessity of CL)';
	label cl_3___2='Observation 3 (choice=HH performed and don gloves before handling catheter)';
	label cl_3___3='Observation 3 (choice=Dressing in clean/dry/intact)';
	label cl_3___4='Observation 3 (choice=Tubing is labeled and managed per facility policy)';
	label cl_3___5='Observation 3 (choice=Dressing is label and managed per facility policy)';
	label cl_3___6='Observation 3 (choice=Patient has received a bath in the last 24 hours)';
	label cl_3___7='Observation 3 (choice=Scrub the hub prior to access (observe or confirm with staff))';
	label cl_3___8='Observation 3 (choice=Unused ports are capped/clamped)';
	label cl_4___1='Observation 4 (choice=Confirm necessity of CL)';
	label cl_4___2='Observation 4 (choice=HH performed and don gloves before handling catheter)';
	label cl_4___3='Observation 4 (choice=Dressing in clean/dry/intact)';
	label cl_4___4='Observation 4 (choice=Tubing is labeled and managed per facility policy)';
	label cl_4___5='Observation 4 (choice=Dressing is label and managed per facility policy)';
	label cl_4___6='Observation 4 (choice=Patient has received a bath in the last 24 hours)';
	label cl_4___7='Observation 4 (choice=Scrub the hub prior to access (observe or confirm with staff))';
	label cl_4___8='Observation 4 (choice=Unused ports are capped/clamped)';
	label cl_5___1='Observation 5 (choice=Confirm necessity of CL)';
	label cl_5___2='Observation 5 (choice=HH performed and don gloves before handling catheter)';
	label cl_5___3='Observation 5 (choice=Dressing in clean/dry/intact)';
	label cl_5___4='Observation 5 (choice=Tubing is labeled and managed per facility policy)';
	label cl_5___5='Observation 5 (choice=Dressing is label and managed per facility policy)';
	label cl_5___6='Observation 5 (choice=Patient has received a bath in the last 24 hours)';
	label cl_5___7='Observation 5 (choice=Scrub the hub prior to access (observe or confirm with staff))';
	label cl_5___8='Observation 5 (choice=Unused ports are capped/clamped)';
	label cld_1___1='Observation #1 (choice=All supplies gathered before starting)';
	label cld_1___2='Observation #1 (choice=HH performed, donned clean gloves)';
	label cld_1___3='Observation #1 (choice=Mask is worn by staff and patient, if able)';
	label cld_1___4='Observation #1 (choice=Dirty dressing removed and discarded immediately)';
	label cld_1___5='Observation #1 (choice=HH performed, donned sterile gloves)';
	label cld_1___6='Observation #1 (choice=Sterile field maintained)';
	label cld_1___7='Observation #1 (choice=Site cleaned thoroughly and allowed to dry)';
	label cld_1___8='Observation #1 (choice=Dressing applied appropriately)';
	label cld_1___9='Observation #1 (choice=HH performed)';
	label cld_2___1='Observation #2 (choice=All supplies gathered before starting)';
	label cld_2___2='Observation #2 (choice=HH performed, donned clean gloves)';
	label cld_2___3='Observation #2 (choice=Mask is worn by staff and patient, if able)';
	label cld_2___4='Observation #2 (choice=Dirty dressing removed and discarded immediately)';
	label cld_2___5='Observation #2 (choice=HH performed, donned sterile gloves)';
	label cld_2___6='Observation #2 (choice=Sterile field maintained)';
	label cld_2___7='Observation #2 (choice=Site cleaned thoroughly and allowed to dry)';
	label cld_2___8='Observation #2 (choice=Dressing applied appropriately)';
	label cld_2___9='Observation #2 (choice=HH performed)';
	label cld_3___1='Observation #3 (choice=All supplies gathered before starting)';
	label cld_3___2='Observation #3 (choice=HH performed, donned clean gloves)';
	label cld_3___3='Observation #3 (choice=Mask is worn by staff and patient, if able)';
	label cld_3___4='Observation #3 (choice=Dirty dressing removed and discarded immediately)';
	label cld_3___5='Observation #3 (choice=HH performed, donned sterile gloves)';
	label cld_3___6='Observation #3 (choice=Sterile field maintained)';
	label cld_3___7='Observation #3 (choice=Site cleaned thoroughly and allowed to dry)';
	label cld_3___8='Observation #3 (choice=Dressing applied appropriately)';
	label cld_3___9='Observation #3 (choice=HH performed)';
	label cl_notes_obs='Central Line Observation Notes';
	label tra_1___1='Observation #1 (choice=All supplies gathered prior to beginning)';
	label tra_1___2='Observation #1 (choice=HH performed, clean gloves donned)';
	label tra_1___3='Observation #1 (choice=Single use inner cannula is discarded/Reusable is cleaned appropriately (usually sterile water))';
	label tra_1___4='Observation #1 (choice=Sterile gloves worn)';
	label tra_1___5='Observation #1 (choice=Site is cleaned)';
	label tra_1___6='Observation #1 (choice=Sterile dressing is applied)';
	label tra_1___7='Observation #1 (choice=Ties are checked for cleanliness)';
	label tra_1___8='Observation #1 (choice=Dominant hand remained sterile)';
	label tra_1___9='Observation #1 (choice=HH performed)';
	label tra_2___1='Observation #2 (choice=All supplies gathered prior to beginning)';
	label tra_2___2='Observation #2 (choice=HH performed, clean gloves donned)';
	label tra_2___3='Observation #2 (choice=Single use inner cannula is discarded/Reusable is cleaned appropriately (usually sterile water))';
	label tra_2___4='Observation #2 (choice=Sterile gloves worn)';
	label tra_2___5='Observation #2 (choice=Site is cleaned)';
	label tra_2___6='Observation #2 (choice=Sterile dressing is applied)';
	label tra_2___7='Observation #2 (choice=Ties are checked for cleanliness)';
	label tra_2___8='Observation #2 (choice=Dominant hand remained sterile)';
	label tra_2___9='Observation #2 (choice=HH performed)';
	label tra_3___1='Observation #3 (choice=All supplies gathered prior to beginning)';
	label tra_3___2='Observation #3 (choice=HH performed, clean gloves donned)';
	label tra_3___3='Observation #3 (choice=Single use inner cannula is discarded/Reusable is cleaned appropriately (usually sterile water))';
	label tra_3___4='Observation #3 (choice=Sterile gloves worn)';
	label tra_3___5='Observation #3 (choice=Site is cleaned)';
	label tra_3___6='Observation #3 (choice=Sterile dressing is applied)';
	label tra_3___7='Observation #3 (choice=Ties are checked for cleanliness)';
	label tra_3___8='Observation #3 (choice=Dominant hand remained sterile)';
	label tra_3___9='Observation #3 (choice=HH performed)';
	label suc_1___1='Observation #1 (choice=All supplies gathered prior to beginning)';
	label suc_1___2='Observation #1 (choice=HH performed)';
	label suc_1___3='Observation #1 (choice=Sterile gloves are worn)';
	label suc_1___4='Observation #1 (choice=Dominant hand remained sterile)';
	label suc_1___5='Observation #1 (choice=Suction catheter remained sterile)';
	label suc_1___6='Observation #1 (choice=Only sterile water/saline is used)';
	label suc_1___7='Observation #1 (choice=HH performed)';
	label suc_2___1='Observation #2 (choice=All supplies gathered prior to beginning)';
	label suc_2___2='Observation #2 (choice=HH performed)';
	label suc_2___3='Observation #2 (choice=Sterile gloves are worn)';
	label suc_2___4='Observation #2 (choice=Dominant hand remained sterile)';
	label suc_2___5='Observation #2 (choice=Suction catheter remained sterile)';
	label suc_2___6='Observation #2 (choice=Only sterile water/saline is used)';
	label suc_2___7='Observation #2 (choice=HH performed)';
	label suc_3___1='Observation #3 (choice=All supplies gathered prior to beginning)';
	label suc_3___2='Observation #3 (choice=HH performed)';
	label suc_3___3='Observation #3 (choice=Sterile gloves are worn)';
	label suc_3___4='Observation #3 (choice=Dominant hand remained sterile)';
	label suc_3___5='Observation #3 (choice=Suction catheter remained sterile)';
	label suc_3___6='Observation #3 (choice=Only sterile water/saline is used)';
	label suc_3___7='Observation #3 (choice=HH performed)';
	label device_obs='Airway Device Observation Notes';
	label expand_devicareobs='Please use this space to expand on any topics in the Device Care Observation module.';
	label device_care_observat_v_10='Complete?';
	label wound_obs1___1='Wound Care Observation #1 (choice=Supplies gathered prior to start)';
	label wound_obs1___2='Wound Care Observation #1 (choice=HH performed, don gloves)';
	label wound_obs1___3='Wound Care Observation #1 (choice=Clean field prepared)';
	label wound_obs1___4='Wound Care Observation #1 (choice=Mult-dose meds used correctly)';
	label wound_obs1___5='Wound Care Observation #1 (choice=Barrier positioned under wound)';
	label wound_obs1___6='Wound Care Observation #1 (choice=Removed dirty dressing discarded immediately)';
	label wound_obs1___7='Wound Care Observation #1 (choice=HH performed, don clean gloves between dirty and clean)';
	label wound_obs1___8='Wound Care Observation #1 (choice=Wound treated and dressing applied aseptically)';
	label wound_obs1___9='Wound Care Observation #1 (choice=HH performed, don clean gloves)';
	label wound_obs1___10='Wound Care Observation #1 (choice=Reusable equipment cleaned and disinfected correctly)';
	label wound_obs1___11='Wound Care Observation #1 (choice=Clean, unused supplies discarded or dedicated to resident)';
	label wound_obs1___12='Wound Care Observation #1 (choice=Wound care area disinfected)';
	label wound_obs1___13='Wound Care Observation #1 (choice=HH performed)';
	label wound_obs1___14='Wound Care Observation #1 (choice=No concern for wound care cart to be contaminated)';
	label wound_obs2___1='Wound Care Observation #2 (choice=Supplies gathered prior to start)';
	label wound_obs2___2='Wound Care Observation #2 (choice=HH performed, don gloves)';
	label wound_obs2___3='Wound Care Observation #2 (choice=Clean field prepared)';
	label wound_obs2___4='Wound Care Observation #2 (choice=Mult-dose meds used correctly)';
	label wound_obs2___5='Wound Care Observation #2 (choice=Barrier positioned under wound)';
	label wound_obs2___6='Wound Care Observation #2 (choice=Removed dirty dressing discarded immediately)';
	label wound_obs2___7='Wound Care Observation #2 (choice=HH performed, don clean gloves between dirty and clean)';
	label wound_obs2___8='Wound Care Observation #2 (choice=Wound treated and dressing applied aseptically)';
	label wound_obs2___9='Wound Care Observation #2 (choice=HH performed, don clean gloves)';
	label wound_obs2___10='Wound Care Observation #2 (choice=Reusable equipment cleaned and disinfected correctly)';
	label wound_obs2___11='Wound Care Observation #2 (choice=Clean, unused supplies discarded or dedicated to resident)';
	label wound_obs2___12='Wound Care Observation #2 (choice=Wound care area disinfected)';
	label wound_obs2___13='Wound Care Observation #2 (choice=HH performed)';
	label wound_obs2___14='Wound Care Observation #2 (choice=No concern for wound care cart to be contaminated)';
	label wound_obs3___1='Wound Care Observation #3 (choice=Supplies gathered prior to start)';
	label wound_obs3___2='Wound Care Observation #3 (choice=HH performed, don gloves)';
	label wound_obs3___3='Wound Care Observation #3 (choice=Clean field prepared)';
	label wound_obs3___4='Wound Care Observation #3 (choice=Mult-dose meds used correctly)';
	label wound_obs3___5='Wound Care Observation #3 (choice=Barrier positioned under wound)';
	label wound_obs3___6='Wound Care Observation #3 (choice=Removed dirty dressing discarded immediately)';
	label wound_obs3___7='Wound Care Observation #3 (choice=HH performed, don clean gloves between dirty and clean)';
	label wound_obs3___8='Wound Care Observation #3 (choice=Wound treated and dressing applied aseptically)';
	label wound_obs3___9='Wound Care Observation #3 (choice=HH performed, don clean gloves)';
	label wound_obs3___10='Wound Care Observation #3 (choice=Reusable equipment cleaned and disinfected correctly)';
	label wound_obs3___11='Wound Care Observation #3 (choice=Clean, unused supplies discarded or dedicated to resident)';
	label wound_obs3___12='Wound Care Observation #3 (choice=Wound care area disinfected)';
	label wound_obs3___13='Wound Care Observation #3 (choice=HH performed)';
	label wound_obs3___14='Wound Care Observation #3 (choice=No concern for wound care cart to be contaminated)';
	label wound_notes_obs='Wound Care Observation Notes';
	label wound_care_observati_v_11='Complete?';
	format assessor___1 assessor___1_.;
	format assessor___2 assessor___2_.;
	format assessor___3 assessor___3_.;
	format assessor___4 assessor___4_.;
	format assessor___5 assessor___5_.;
	format assessor___6 assessor___6_.;
	format assessor___7 assessor___7_.;
	format assessor___8 assessor___8_.;
	format assessor___9 assessor___9_.;
	format assessor___10 assessor___10_.;
	format visit_remote visit_remote_.;
	format reason___1 reason___1_.;
	format reason___2 reason___2_.;
	format reason___3 reason___3_.;
	format reason___4 reason___4_.;
	format reason___5 reason___5_.;
	format reason___6 reason___6_.;
	format reason___7 reason___7_.;
	format outbreak_type___1 outbreak_type___1_.;
	format outbreak_type___2 outbreak_type___2_.;
	format outbreak_type___3 outbreak_type___3_.;
	format outbreak_type___4 outbreak_type___4_.;
	format outbreak_type___5 outbreak_type___5_.;
	format outbreak_type___6 outbreak_type___6_.;
	format outbreak_type___7 outbreak_type___7_.;
	format outbreak_mdro___1 outbreak_mdro___1_.;
	format outbreak_mdro___2 outbreak_mdro___2_.;
	format outbreak_mdro___3 outbreak_mdro___3_.;
	format outbreak_mdro___4 outbreak_mdro___4_.;
	format outbreak_mdro___5 outbreak_mdro___5_.;
	format facility_county facility_county_.;
	format ripsvisit ripsvisit_.;
	format facility_type___1 facility_type___1_.;
	format facility_type___2 facility_type___2_.;
	format facility_type___3 facility_type___3_.;
	format facility_type___4 facility_type___4_.;
	format facility_type___5 facility_type___5_.;
	format facility_type___6 facility_type___6_.;
	format facility_type___7 facility_type___7_.;
	format facility_type___8 facility_type___8_.;
	format facility_type___9 facility_type___9_.;
	format facility_type___10 facility_type___10_.;
	format facility_type___11 facility_type___11_.;
	format facility_type___12 facility_type___12_.;
	format facility_type___13 facility_type___13_.;
	format facility_type___14 facility_type___14_.;
	format facility_type___15 facility_type___15_.;
	format facility_type___16 facility_type___16_.;
	format facility_type___17 facility_type___17_.;
	format facility_type___18 facility_type___18_.;
	format facility_type___19 facility_type___19_.;
	format facility_type___20 facility_type___20_.;
	format system_facility system_facility_.;
	format full_ip full_ip_.;
	format ip ip_.;
	format ip_training___1 ip_training___1_.;
	format ip_training___2 ip_training___2_.;
	format ip_training___3 ip_training___3_.;
	format ip_training___4 ip_training___4_.;
	format facility_information_complete facility_information_complete_.;
	format report_list___1 report_list___1_.;
	format report_list___2 report_list___2_.;
	format report_list___3 report_list___3_.;
	format report_list___4 report_list___4_.;
	format ph_contact___1 ph_contact___1_.;
	format ph_contact___2 ph_contact___2_.;
	format ph_contact___3 ph_contact___3_.;
	format ph_contact___4 ph_contact___4_.;
	format comm_infect___1 comm_infect___1_.;
	format comm_infect___2 comm_infect___2_.;
	format comm_infect___3 comm_infect___3_.;
	format comm_infect___4 comm_infect___4_.;
	format infect_intake___1 infect_intake___1_.;
	format infect_intake___2 infect_intake___2_.;
	format infect_intake___3 infect_intake___3_.;
	format infect_intake___4 infect_intake___4_.;
	format ip_policies___1 ip_policies___1_.;
	format ip_policies___2 ip_policies___2_.;
	format ip_policies___3 ip_policies___3_.;
	format ip_policies___4 ip_policies___4_.;
	format ip_policies___5 ip_policies___5_.;
	format policies_reviewed___1 policies_reviewed___1_.;
	format policies_reviewed___2 policies_reviewed___2_.;
	format policies_reviewed___3 policies_reviewed___3_.;
	format policies_reviewed___4 policies_reviewed___4_.;
	format lab_notif___1 lab_notif___1_.;
	format lab_notif___2 lab_notif___2_.;
	format lab_notif___3 lab_notif___3_.;
	format lab_notif___4 lab_notif___4_.;
	format infect_monitoring___1 infect_monitoring___1_.;
	format infect_monitoring___2 infect_monitoring___2_.;
	format infect_monitoring___3 infect_monitoring___3_.;
	format infect_monitoring___4 infect_monitoring___4_.;
	format ip_process___1 ip_process___1_.;
	format ip_process___2 ip_process___2_.;
	format ip_process___3 ip_process___3_.;
	format ip_process___4 ip_process___4_.;
	format outbreak_response___1 outbreak_response___1_.;
	format outbreak_response___2 outbreak_response___2_.;
	format outbreak_response___3 outbreak_response___3_.;
	format outbreak_response___4 outbreak_response___4_.;
	format resp_program___1 resp_program___1_.;
	format resp_program___2 resp_program___2_.;
	format resp_program___3 resp_program___3_.;
	format resp_program___4 resp_program___4_.;
	format emergency_plan___1 emergency_plan___1_.;
	format emergency_plan___2 emergency_plan___2_.;
	format emergency_plan___3 emergency_plan___3_.;
	format emergency_plan___4 emergency_plan___4_.;
	format riskassess___1 riskassess___1_.;
	format riskassess___2 riskassess___2_.;
	format riskassess___3 riskassess___3_.;
	format riskassess___4 riskassess___4_.;
	format respetc_site___1 respetc_site___1_.;
	format respetc_site___2 respetc_site___2_.;
	format respetc_site___3 respetc_site___3_.;
	format work_exclusions___1 work_exclusions___1_.;
	format work_exclusions___2 work_exclusions___2_.;
	format work_exclusions___3 work_exclusions___3_.;
	format work_exclusions___4 work_exclusions___4_.;
	format tb_hire___1 tb_hire___1_.;
	format tb_hire___2 tb_hire___2_.;
	format tb_hire___3 tb_hire___3_.;
	format tb_hire___4 tb_hire___4_.;
	format tb_risk___1 tb_risk___1_.;
	format tb_risk___2 tb_risk___2_.;
	format tb_risk___3 tb_risk___3_.;
	format tb_risk___4 tb_risk___4_.;
	format bloodborne_plan___1 bloodborne_plan___1_.;
	format bloodborne_plan___2 bloodborne_plan___2_.;
	format bloodborne_plan___3 bloodborne_plan___3_.;
	format bloodborne_plan___4 bloodborne_plan___4_.;
	format hepb_vac___1 hepb_vac___1_.;
	format hepb_vac___2 hepb_vac___2_.;
	format hepb_vac___3 hepb_vac___3_.;
	format hepb_vac___4 hepb_vac___4_.;
	format annual_flu___1 annual_flu___1_.;
	format annual_flu___2 annual_flu___2_.;
	format annual_flu___3 annual_flu___3_.;
	format annual_flu___4 annual_flu___4_.;
	format annual_covid___1 annual_covid___1_.;
	format annual_covid___2 annual_covid___2_.;
	format annual_covid___3 annual_covid___3_.;
	format annual_covid___4 annual_covid___4_.;
	format vac_record___1 vac_record___1_.;
	format vac_record___2 vac_record___2_.;
	format vac_record___3 vac_record___3_.;
	format vac_record___4 vac_record___4_.;
	format tb_patient___1 tb_patient___1_.;
	format tb_patient___2 tb_patient___2_.;
	format tb_patient___3 tb_patient___3_.;
	format tb_patient___4 tb_patient___4_.;
	format tb_patient___5 tb_patient___5_.;
	format offer_vac___1 offer_vac___1_.;
	format offer_vac___2 offer_vac___2_.;
	format offer_vac___3 offer_vac___3_.;
	format offer_vac___4 offer_vac___4_.;
	format vac_edu___1 vac_edu___1_.;
	format vac_edu___2 vac_edu___2_.;
	format vac_edu___3 vac_edu___3_.;
	format vac_edu___4 vac_edu___4_.;
	format indiv_antistew___1 indiv_antistew___1_.;
	format indiv_antistew___2 indiv_antistew___2_.;
	format indiv_antistew___3 indiv_antistew___3_.;
	format indiv_antistew___4 indiv_antistew___4_.;
	format indiv_antistew___5 indiv_antistew___5_.;
	format indiv_antistew___6 indiv_antistew___6_.;
	format spice_referral spice_referral_.;
	format employee_and_patient_v_0 employee_and_patient_v_0_.;
	format ip_education___1 ip_education___1_.;
	format ip_education___2 ip_education___2_.;
	format ip_education___3 ip_education___3_.;
	format ip_education___4 ip_education___4_.;
	format ip_education___5 ip_education___5_.;
	format ip_education___6 ip_education___6_.;
	format ip_education___7 ip_education___7_.;
	format ip_education___8 ip_education___8_.;
	format ip_education___9 ip_education___9_.;
	format ip_education___10 ip_education___10_.;
	format competency___1 competency___1_.;
	format competency___2 competency___2_.;
	format competency___3 competency___3_.;
	format competency___4 competency___4_.;
	format competency___5 competency___5_.;
	format demonstrateskills___1 demonstrateskills___1_.;
	format demonstrateskills___2 demonstrateskills___2_.;
	format demonstrateskills___3 demonstrateskills___3_.;
	format demonstrateskills___4 demonstrateskills___4_.;
	format demonstrateskills___5 demonstrateskills___5_.;
	format demonstrateskills___6 demonstrateskills___6_.;
	format demonstrateskills___7 demonstrateskills___7_.;
	format demonstrateskills___8 demonstrateskills___8_.;
	format testtopics___1 testtopics___1_.;
	format testtopics___2 testtopics___2_.;
	format testtopics___3 testtopics___3_.;
	format testtopics___4 testtopics___4_.;
	format testtopics___5 testtopics___5_.;
	format testtopics___6 testtopics___6_.;
	format testtopics___7 testtopics___7_.;
	format testtopics___8 testtopics___8_.;
	format annualskills___1 annualskills___1_.;
	format annualskills___2 annualskills___2_.;
	format annualskills___3 annualskills___3_.;
	format annualskills___4 annualskills___4_.;
	format annualskills___5 annualskills___5_.;
	format annualskills___6 annualskills___6_.;
	format annualskills___7 annualskills___7_.;
	format annualskills___8 annualskills___8_.;
	format audits___1 audits___1_.;
	format audits___2 audits___2_.;
	format audits___3 audits___3_.;
	format audits___4 audits___4_.;
	format audits___5 audits___5_.;
	format audits___6 audits___6_.;
	format audits___7 audits___7_.;
	format audits___8 audits___8_.;
	format audits___9 audits___9_.;
	format hh_audits hh_audits_.;
	format audit_ppe audit_ppe_.;
	format audit_cleandisinf audit_cleandisinf_.;
	format audit_injectsafety audit_injectsafety_.;
	format audit_poc audit_poc_.;
	format audit_repro audit_repro_.;
	format audits_feedback___1 audits_feedback___1_.;
	format audits_feedback___2 audits_feedback___2_.;
	format audits_feedback___3 audits_feedback___3_.;
	format audits_feedback___4 audits_feedback___4_.;
	format audits_feedback___5 audits_feedback___5_.;
	format audits_feedback___6 audits_feedback___6_.;
	format trainingaudits_complete trainingaudits_complete_.;
	format hh_policies___1 hh_policies___1_.;
	format hh_policies___2 hh_policies___2_.;
	format hh_policies___3 hh_policies___3_.;
	format hh_policies___4 hh_policies___4_.;
	format hh_expectations___1 hh_expectations___1_.;
	format hh_expectations___2 hh_expectations___2_.;
	format hh_expectations___3 hh_expectations___3_.;
	format hh_expectations___4 hh_expectations___4_.;
	format hh_expectations___5 hh_expectations___5_.;
	format hh_expectations___6 hh_expectations___6_.;
	format hh_expectations___7 hh_expectations___7_.;
	format hh_expectations___8 hh_expectations___8_.;
	format hh_expectations___9 hh_expectations___9_.;
	format hh_inout___1 hh_inout___1_.;
	format hh_inout___2 hh_inout___2_.;
	format hh_inout___3 hh_inout___3_.;
	format hh_sinkavail___1 hh_sinkavail___1_.;
	format hh_sinkavail___2 hh_sinkavail___2_.;
	format hh_sinkavail___3 hh_sinkavail___3_.;
	format hh_sinkavail___4 hh_sinkavail___4_.;
	format hh_soapwater___1 hh_soapwater___1_.;
	format hh_soapwater___2 hh_soapwater___2_.;
	format hh_soapwater___3 hh_soapwater___3_.;
	format hh_soapwater___4 hh_soapwater___4_.;
	format hh_soapwater___5 hh_soapwater___5_.;
	format hh_soapwater___6 hh_soapwater___6_.;
	format hh_throughout___1 hh_throughout___1_.;
	format hh_throughout___2 hh_throughout___2_.;
	format hh_throughout___3 hh_throughout___3_.;
	format hh_pocket___1 hh_pocket___1_.;
	format hh_pocket___2 hh_pocket___2_.;
	format hh_pocket___3 hh_pocket___3_.;
	format hh_pocket___4 hh_pocket___4_.;
	format hh_only___1 hh_only___1_.;
	format hh_only___2 hh_only___2_.;
	format hh_only___3 hh_only___3_.;
	format hh_only___4 hh_only___4_.;
	format hh_supplies___1 hh_supplies___1_.;
	format hh_supplies___2 hh_supplies___2_.;
	format hh_supplies___3 hh_supplies___3_.;
	format hh_lotion___1 hh_lotion___1_.;
	format hh_lotion___2 hh_lotion___2_.;
	format hh_lotion___3 hh_lotion___3_.;
	format hh_lotion___4 hh_lotion___4_.;
	format hh_lotion___5 hh_lotion___5_.;
	format hh_nails___1 hh_nails___1_.;
	format hh_nails___2 hh_nails___2_.;
	format hh_nails___3 hh_nails___3_.;
	format hh_nails___4 hh_nails___4_.;
	format patienthh___1 patienthh___1_.;
	format patienthh___2 patienthh___2_.;
	format patienthh___3 patienthh___3_.;
	format patienthh___4 patienthh___4_.;
	format patienthh___5 patienthh___5_.;
	format hand_hygiene_complete hand_hygiene_complete_.;
	format hh_1 hh_1_.;
	format hh_2 hh_2_.;
	format hh_3 hh_3_.;
	format hh_4 hh_4_.;
	format hh_5 hh_5_.;
	format hh_6 hh_6_.;
	format hh_7 hh_7_.;
	format hh_8 hh_8_.;
	format hh_9 hh_9_.;
	format hh_10 hh_10_.;
	format hand_hygiene_observa_v_1 hand_hygiene_observa_v_1_.;
	format transmission_policy___1 transmission_policy___1_.;
	format transmission_policy___2 transmission_policy___2_.;
	format transmission_policy___3 transmission_policy___3_.;
	format transmission_policy___4 transmission_policy___4_.;
	format trans_signage___1 trans_signage___1_.;
	format trans_signage___2 trans_signage___2_.;
	format trans_signage___3 trans_signage___3_.;
	format trans_signage___4 trans_signage___4_.;
	format trans_signage___5 trans_signage___5_.;
	format trans_signage___6 trans_signage___6_.;
	format trans_signage___7 trans_signage___7_.;
	format trans_signage___8 trans_signage___8_.;
	format trans_signage___9 trans_signage___9_.;
	format ppe_supplies___1 ppe_supplies___1_.;
	format ppe_supplies___2 ppe_supplies___2_.;
	format ppe_supplies___3 ppe_supplies___3_.;
	format semipriv___1 semipriv___1_.;
	format semipriv___2 semipriv___2_.;
	format semipriv___3 semipriv___3_.;
	format semipriv___4 semipriv___4_.;
	format tbp_admit___1 tbp_admit___1_.;
	format tbp_admit___2 tbp_admit___2_.;
	format tbp_admit___3 tbp_admit___3_.;
	format tbp_admit___4 tbp_admit___4_.;
	format tbp_transfer___1 tbp_transfer___1_.;
	format tbp_transfer___2 tbp_transfer___2_.;
	format tbp_transfer___3 tbp_transfer___3_.;
	format tbp_transfer___4 tbp_transfer___4_.;
	format tbp_change___1 tbp_change___1_.;
	format tbp_change___2 tbp_change___2_.;
	format tbp_change___3 tbp_change___3_.;
	format tbp_change___4 tbp_change___4_.;
	format ebp_identify___1 ebp_identify___1_.;
	format ebp_identify___2 ebp_identify___2_.;
	format ebp_identify___3 ebp_identify___3_.;
	format ebp_identify___4 ebp_identify___4_.;
	format trans_signforclean___1 trans_signforclean___1_.;
	format trans_signforclean___2 trans_signforclean___2_.;
	format trans_signforclean___3 trans_signforclean___3_.;
	format trans_signforclean___4 trans_signforclean___4_.;
	format resp_entrance___1 resp_entrance___1_.;
	format resp_entrance___2 resp_entrance___2_.;
	format resp_entrance___3 resp_entrance___3_.;
	format resp_station___1 resp_station___1_.;
	format resp_station___2 resp_station___2_.;
	format resp_station___3 resp_station___3_.;
	format resp_visitors___1 resp_visitors___1_.;
	format resp_visitors___2 resp_visitors___2_.;
	format resp_visitors___3 resp_visitors___3_.;
	format resp_visitors___4 resp_visitors___4_.;
	format fit_testing___1 fit_testing___1_.;
	format fit_testing___2 fit_testing___2_.;
	format fit_testing___3 fit_testing___3_.;
	format fit_testing___4 fit_testing___4_.;
	format standard_and_transmi_v_2 standard_and_transmi_v_2_.;
	format prec_obs___1 prec_obs___1_.;
	format prec_obs___2 prec_obs___2_.;
	format prec_obs___3 prec_obs___3_.;
	format don_obs___1 don_obs___1_.;
	format don_obs___2 don_obs___2_.;
	format don_obs___3 don_obs___3_.;
	format doff_obs___1 doff_obs___1_.;
	format doff_obs___2 doff_obs___2_.;
	format doff_obs___3 doff_obs___3_.;
	format aiir_obs___1 aiir_obs___1_.;
	format aiir_obs___2 aiir_obs___2_.;
	format aiir_obs___3 aiir_obs___3_.;
	format aiir_obs___4 aiir_obs___4_.;
	format aiir_obs___5 aiir_obs___5_.;
	format aiir_obs___6 aiir_obs___6_.;
	format priv_obs___1 priv_obs___1_.;
	format priv_obs___2 priv_obs___2_.;
	format priv_obs___3 priv_obs___3_.;
	format priv_obs___4 priv_obs___4_.;
	format standard_and_transmi_v_3 standard_and_transmi_v_3_.;
	format policy_disinf___1 policy_disinf___1_.;
	format policy_disinf___2 policy_disinf___2_.;
	format policy_disinf___3 policy_disinf___3_.;
	format policy_disinf___4 policy_disinf___4_.;
	format contact_disinf___1 contact_disinf___1_.;
	format contact_disinf___2 contact_disinf___2_.;
	format contact_disinf___3 contact_disinf___3_.;
	format contact_disinf___4 contact_disinf___4_.;
	format hightouch_disinf___1 hightouch_disinf___1_.;
	format hightouch_disinf___2 hightouch_disinf___2_.;
	format hightouch_disinf___3 hightouch_disinf___3_.;
	format hightouch_disinf___4 hightouch_disinf___4_.;
	format room_disinf___1 room_disinf___1_.;
	format room_disinf___2 room_disinf___2_.;
	format room_disinf___3 room_disinf___3_.;
	format room_disinf___4 room_disinf___4_.;
	format epa_disinf___1 epa_disinf___1_.;
	format epa_disinf___2 epa_disinf___2_.;
	format epa_disinf___3 epa_disinf___3_.;
	format epa_disinf___4 epa_disinf___4_.;
	format equip_disinf___1 equip_disinf___1_.;
	format equip_disinf___2 equip_disinf___2_.;
	format equip_disinf___3 equip_disinf___3_.;
	format equip_disinf___4 equip_disinf___4_.;
	format gluc_disinf___1 gluc_disinf___1_.;
	format gluc_disinf___2 gluc_disinf___2_.;
	format gluc_disinf___3 gluc_disinf___3_.;
	format gluc_disinf___4 gluc_disinf___4_.;
	format disinf_glucavail___1 disinf_glucavail___1_.;
	format disinf_glucavail___2 disinf_glucavail___2_.;
	format disinf_glucavail___3 disinf_glucavail___3_.;
	format gluc_disinfection_2___1 gluc_disinfection_2___1_.;
	format gluc_disinfection_2___2 gluc_disinfection_2___2_.;
	format gluc_disinfection_2___3 gluc_disinfection_2___3_.;
	format gluc_disinfection_2___4 gluc_disinfection_2___4_.;
	format shower_disinf___1 shower_disinf___1_.;
	format shower_disinf___2 shower_disinf___2_.;
	format shower_disinf___3 shower_disinf___3_.;
	format shower_disinf___4 shower_disinf___4_.;
	format shower_disinf___5 shower_disinf___5_.;
	format showindicate_disinf___1 showindicate_disinf___1_.;
	format showindicate_disinf___2 showindicate_disinf___2_.;
	format showindicate_disinf___3 showindicate_disinf___3_.;
	format showindicate_disinf___4 showindicate_disinf___4_.;
	format showindicate_disinf___5 showindicate_disinf___5_.;
	format supp_disinf___1 supp_disinf___1_.;
	format supp_disinf___2 supp_disinf___2_.;
	format supp_disinf___3 supp_disinf___3_.;
	format devices_disinf devices_disinf_.;
	format environmental_cleani_v_4 environmental_cleani_v_4_.;
	format hhprod_obs___1 hhprod_obs___1_.;
	format hhprod_obs___2 hhprod_obs___2_.;
	format hhprod_obs___3 hhprod_obs___3_.;
	format resp_signage_obs___1 resp_signage_obs___1_.;
	format resp_signage_obs___2 resp_signage_obs___2_.;
	format resp_signage_obs___3 resp_signage_obs___3_.;
	format gen_obs___1 gen_obs___1_.;
	format gen_obs___2 gen_obs___2_.;
	format gen_obs___3 gen_obs___3_.;
	format sink_obs___1 sink_obs___1_.;
	format sink_obs___2 sink_obs___2_.;
	format sink_obs___3 sink_obs___3_.;
	format undersink_obs___1 undersink_obs___1_.;
	format undersink_obs___2 undersink_obs___2_.;
	format undersink_obs___3 undersink_obs___3_.;
	format cleansupp_obs___1 cleansupp_obs___1_.;
	format cleansupp_obs___2 cleansupp_obs___2_.;
	format cleansupp_obs___3 cleansupp_obs___3_.;
	format sharpstor_obs sharpstor_obs_.;
	format cleandirty_obs___1 cleandirty_obs___1_.;
	format cleandirty_obs___2 cleandirty_obs___2_.;
	format cleandirty_obs___3 cleandirty_obs___3_.;
	format disinfectequip_obs___1 disinfectequip_obs___1_.;
	format disinfectequip_obs___2 disinfectequip_obs___2_.;
	format disinfectequip_obs___3 disinfectequip_obs___3_.;
	format eqip_obs___1 eqip_obs___1_.;
	format eqip_obs___2 eqip_obs___2_.;
	format eqip_obs___3 eqip_obs___3_.;
	format coverlinen_obs___1 coverlinen_obs___1_.;
	format coverlinen_obs___2 coverlinen_obs___2_.;
	format coverlinen_obs___3 coverlinen_obs___3_.;
	format soiled_obs___1 soiled_obs___1_.;
	format soiled_obs___2 soiled_obs___2_.;
	format soiled_obs___3 soiled_obs___3_.;
	format sharps_obs___1 sharps_obs___1_.;
	format sharps_obs___2 sharps_obs___2_.;
	format sharps_obs___3 sharps_obs___3_.;
	format medprep_obs___1 medprep_obs___1_.;
	format medprep_obs___2 medprep_obs___2_.;
	format medprep_obs___3 medprep_obs___3_.;
	format expir_obs___1 expir_obs___1_.;
	format expir_obs___2 expir_obs___2_.;
	format expir_obs___3 expir_obs___3_.;
	format environmental_observ_v_5 environmental_observ_v_5_.;
	format gluc_disinf_2___1 gluc_disinf_2___1_.;
	format gluc_disinf_2___2 gluc_disinf_2___2_.;
	format gluc_disinf_2___3 gluc_disinf_2___3_.;
	format gluc_disinf_2___4 gluc_disinf_2___4_.;
	format disinf_glucavail_2___1 disinf_glucavail_2___1_.;
	format disinf_glucavail_2___2 disinf_glucavail_2___2_.;
	format disinf_glucavail_2___3 disinf_glucavail_2___3_.;
	format gluc_disinfection___1 gluc_disinfection___1_.;
	format gluc_disinfection___2 gluc_disinfection___2_.;
	format gluc_disinfection___3 gluc_disinfection___3_.;
	format gluc_disinfection___4 gluc_disinfection___4_.;
	format gluc_supplies___1 gluc_supplies___1_.;
	format gluc_supplies___2 gluc_supplies___2_.;
	format gluc_supplies___3 gluc_supplies___3_.;
	format gluc_supplies___4 gluc_supplies___4_.;
	format stor_gluc___1 stor_gluc___1_.;
	format stor_gluc___2 stor_gluc___2_.;
	format stor_gluc___3 stor_gluc___3_.;
	format insulin_pens___1 insulin_pens___1_.;
	format insulin_pens___2 insulin_pens___2_.;
	format insulin_pens___3 insulin_pens___3_.;
	format insulin_storage___1 insulin_storage___1_.;
	format insulin_storage___2 insulin_storage___2_.;
	format insulin_storage___3 insulin_storage___3_.;
	format inject_policy___1 inject_policy___1_.;
	format inject_policy___2 inject_policy___2_.;
	format inject_policy___3 inject_policy___3_.;
	format inject_policy___4 inject_policy___4_.;
	format one_time_syringe___1 one_time_syringe___1_.;
	format one_time_syringe___2 one_time_syringe___2_.;
	format one_time_syringe___3 one_time_syringe___3_.;
	format one_time_syringe___4 one_time_syringe___4_.;
	format single_dose___1 single_dose___1_.;
	format single_dose___2 single_dose___2_.;
	format single_dose___3 single_dose___3_.;
	format single_dose___4 single_dose___4_.;
	format multi_dose___1 multi_dose___1_.;
	format multi_dose___2 multi_dose___2_.;
	format multi_dose___3 multi_dose___3_.;
	format multi_dose___4 multi_dose___4_.;
	format gloves_inject___1 gloves_inject___1_.;
	format gloves_inject___2 gloves_inject___2_.;
	format gloves_inject___3 gloves_inject___3_.;
	format gloves_inject___4 gloves_inject___4_.;
	format diversion_policy___1 diversion_policy___1_.;
	format diversion_policy___2 diversion_policy___2_.;
	format diversion_policy___3 diversion_policy___3_.;
	format diversion_policy___4 diversion_policy___4_.;
	format infectionmedication__v_6 infectionmedication__v_6_.;
	format glu_1___1 glu_1___1_.;
	format glu_1___2 glu_1___2_.;
	format glu_1___3 glu_1___3_.;
	format glu_1___4 glu_1___4_.;
	format glu_1___5 glu_1___5_.;
	format glu_1___6 glu_1___6_.;
	format glu_1___7 glu_1___7_.;
	format glu_2___1 glu_2___1_.;
	format glu_2___2 glu_2___2_.;
	format glu_2___3 glu_2___3_.;
	format glu_2___4 glu_2___4_.;
	format glu_2___5 glu_2___5_.;
	format glu_2___6 glu_2___6_.;
	format glu_2___7 glu_2___7_.;
	format glu_3___1 glu_3___1_.;
	format glu_3___2 glu_3___2_.;
	format glu_3___3 glu_3___3_.;
	format glu_3___4 glu_3___4_.;
	format glu_3___5 glu_3___5_.;
	format glu_3___6 glu_3___6_.;
	format glu_3___7 glu_3___7_.;
	format glu_4___1 glu_4___1_.;
	format glu_4___2 glu_4___2_.;
	format glu_4___3 glu_4___3_.;
	format glu_4___4 glu_4___4_.;
	format glu_4___5 glu_4___5_.;
	format glu_4___6 glu_4___6_.;
	format glu_4___7 glu_4___7_.;
	format glu_5___1 glu_5___1_.;
	format glu_5___2 glu_5___2_.;
	format glu_5___3 glu_5___3_.;
	format glu_5___4 glu_5___4_.;
	format glu_5___5 glu_5___5_.;
	format glu_5___6 glu_5___6_.;
	format glu_5___7 glu_5___7_.;
	format assisted_blood_gluco_v_7 assisted_blood_gluco_v_7_.;
	format sterilization_loc___1 sterilization_loc___1_.;
	format sterilization_loc___2 sterilization_loc___2_.;
	format sterilization_loc___3 sterilization_loc___3_.;
	format sterilization_loc___4 sterilization_loc___4_.;
	format sterilization_loc___5 sterilization_loc___5_.;
	format iuss___1 iuss___1_.;
	format iuss___2 iuss___2_.;
	format iuss___3 iuss___3_.;
	format iuss___4 iuss___4_.;
	format hld_loc___1 hld_loc___1_.;
	format hld_loc___2 hld_loc___2_.;
	format hld_loc___3 hld_loc___3_.;
	format hld_loc___4 hld_loc___4_.;
	format hld_loc___5 hld_loc___5_.;
	format critical_item___1 critical_item___1_.;
	format critical_item___2 critical_item___2_.;
	format critical_item___3 critical_item___3_.;
	format critical_item___4 critical_item___4_.;
	format hld_items___1 hld_items___1_.;
	format hld_items___2 hld_items___2_.;
	format hld_items___3 hld_items___3_.;
	format hld_items___4 hld_items___4_.;
	format single_items___1 single_items___1_.;
	format single_items___2 single_items___2_.;
	format single_items___3 single_items___3_.;
	format single_items___4 single_items___4_.;
	format sterilizationdisinfe_v_8 sterilizationdisinfe_v_8_.;
	format laundry___1 laundry___1_.;
	format laundry___2 laundry___2_.;
	format laundry___3 laundry___3_.;
	format laundry___4 laundry___4_.;
	format bag_laund___1 bag_laund___1_.;
	format bag_laund___2 bag_laund___2_.;
	format bag_laund___3 bag_laund___3_.;
	format bag_laund___4 bag_laund___4_.;
	format trans_laund___1 trans_laund___1_.;
	format trans_laund___2 trans_laund___2_.;
	format trans_laund___3 trans_laund___3_.;
	format trans_laund___4 trans_laund___4_.;
	format store_laund___1 store_laund___1_.;
	format store_laund___2 store_laund___2_.;
	format store_laund___3 store_laund___3_.;
	format store_laund___4 store_laund___4_.;
	format supp_laund___1 supp_laund___1_.;
	format supp_laund___2 supp_laund___2_.;
	format supp_laund___3 supp_laund___3_.;
	format clean_laund___1 clean_laund___1_.;
	format clean_laund___2 clean_laund___2_.;
	format clean_laund___3 clean_laund___3_.;
	format healthcare_laundry_complete healthcare_laundry_complete_.;
	format ob_type___1 ob_type___1_.;
	format ob_type___2 ob_type___2_.;
	format ob_type___3 ob_type___3_.;
	format ob_type___4 ob_type___4_.;
	format ob_type___5 ob_type___5_.;
	format ob_type___6 ob_type___6_.;
	format aware_covid___1 aware_covid___1_.;
	format aware_covid___2 aware_covid___2_.;
	format aware_covid___3 aware_covid___3_.;
	format aware_covid___4 aware_covid___4_.;
	format signs_covid___1 signs_covid___1_.;
	format signs_covid___2 signs_covid___2_.;
	format signs_covid___4 signs_covid___4_.;
	format resp_entrance_covid___1 resp_entrance_covid___1_.;
	format resp_entrance_covid___2 resp_entrance_covid___2_.;
	format resp_entrance_covid___4 resp_entrance_covid___4_.;
	format resp_visitors_covid___1 resp_visitors_covid___1_.;
	format resp_visitors_covid___2 resp_visitors_covid___2_.;
	format resp_visitors_covid___3 resp_visitors_covid___3_.;
	format resp_visitors_covid___4 resp_visitors_covid___4_.;
	format visitors_hh_covid___1 visitors_hh_covid___1_.;
	format visitors_hh_covid___2 visitors_hh_covid___2_.;
	format visitors_hh_covid___3 visitors_hh_covid___3_.;
	format visitors_hh_covid___4 visitors_hh_covid___4_.;
	format resp_station_covid___1 resp_station_covid___1_.;
	format resp_station_covid___2 resp_station_covid___2_.;
	format resp_station_covid___4 resp_station_covid___4_.;
	format signage_covid___1 signage_covid___1_.;
	format signage_covid___2 signage_covid___2_.;
	format signage_covid___4 signage_covid___4_.;
	format sick_leave_covid___1 sick_leave_covid___1_.;
	format sick_leave_covid___2 sick_leave_covid___2_.;
	format sick_leave_covid___3 sick_leave_covid___3_.;
	format sick_leave_covid___4 sick_leave_covid___4_.;
	format return_work_covid___1 return_work_covid___1_.;
	format return_work_covid___2 return_work_covid___2_.;
	format return_work_covid___3 return_work_covid___3_.;
	format return_work_covid___4 return_work_covid___4_.;
	format ppe_covid___1 ppe_covid___1_.;
	format ppe_covid___2 ppe_covid___2_.;
	format ppe_covid___3 ppe_covid___3_.;
	format ppe_covid___4 ppe_covid___4_.;
	format tbp_signage_covid___1 tbp_signage_covid___1_.;
	format tbp_signage_covid___2 tbp_signage_covid___2_.;
	format tbp_signage_covid___4 tbp_signage_covid___4_.;
	format fit_testing_covid___1 fit_testing_covid___1_.;
	format fit_testing_covid___2 fit_testing_covid___2_.;
	format fit_testing_covid___3 fit_testing_covid___3_.;
	format fit_testing_covid___4 fit_testing_covid___4_.;
	format ppe_pou_covid___1 ppe_pou_covid___1_.;
	format ppe_pou_covid___2 ppe_pou_covid___2_.;
	format ppe_pou_covid___4 ppe_pou_covid___4_.;
	format disposable_masks_covid___1 disposable_masks_covid___1_.;
	format disposable_masks_covid___2 disposable_masks_covid___2_.;
	format disposable_masks_covid___3 disposable_masks_covid___3_.;
	format disposable_masks_covid___4 disposable_masks_covid___4_.;
	format staff_tbp_covid___1 staff_tbp_covid___1_.;
	format staff_tbp_covid___2 staff_tbp_covid___2_.;
	format staff_tbp_covid___4 staff_tbp_covid___4_.;
	format residents_tbp_covid___1 residents_tbp_covid___1_.;
	format residents_tbp_covid___2 residents_tbp_covid___2_.;
	format residents_tbp_covid___3 residents_tbp_covid___3_.;
	format residents_tbp_covid___4 residents_tbp_covid___4_.;
	format private_rooms_covid___1 private_rooms_covid___1_.;
	format private_rooms_covid___2 private_rooms_covid___2_.;
	format private_rooms_covid___3 private_rooms_covid___3_.;
	format private_rooms_covid___4 private_rooms_covid___4_.;
	format hh_audits_covid___1 hh_audits_covid___1_.;
	format hh_audits_covid___2 hh_audits_covid___2_.;
	format hh_audits_covid___3 hh_audits_covid___3_.;
	format hh_audits_covid___4 hh_audits_covid___4_.;
	format ppe_audits_covid___1 ppe_audits_covid___1_.;
	format ppe_audits_covid___2 ppe_audits_covid___2_.;
	format ppe_audits_covid___3 ppe_audits_covid___3_.;
	format ppe_audits_covid___4 ppe_audits_covid___4_.;
	format precautions_covid___1 precautions_covid___1_.;
	format precautions_covid___2 precautions_covid___2_.;
	format precautions_covid___3 precautions_covid___3_.;
	format precautions_covid___4 precautions_covid___4_.;
	format high_touch_covid___1 high_touch_covid___1_.;
	format high_touch_covid___2 high_touch_covid___2_.;
	format high_touch_covid___3 high_touch_covid___3_.;
	format high_touch_covid___4 high_touch_covid___4_.;
	format disinfect_covid___1 disinfect_covid___1_.;
	format disinfect_covid___2 disinfect_covid___2_.;
	format disinfect_covid___4 disinfect_covid___4_.;
	format disinfect_pou_covid___1 disinfect_pou_covid___1_.;
	format disinfect_pou_covid___2 disinfect_pou_covid___2_.;
	format disinfect_pou_covid___4 disinfect_pou_covid___4_.;
	format equip_dedicated_covid___1 equip_dedicated_covid___1_.;
	format equip_dedicated_covid___2 equip_dedicated_covid___2_.;
	format equip_dedicated_covid___3 equip_dedicated_covid___3_.;
	format equip_dedicated_covid___4 equip_dedicated_covid___4_.;
	format ppe_supply_covid___1 ppe_supply_covid___1_.;
	format ppe_supply_covid___2 ppe_supply_covid___2_.;
	format ppe_supply_covid___3 ppe_supply_covid___3_.;
	format ppe_supply_covid___4 ppe_supply_covid___4_.;
	format universal_mask_covid___1 universal_mask_covid___1_.;
	format universal_mask_covid___2 universal_mask_covid___2_.;
	format universal_mask_covid___3 universal_mask_covid___3_.;
	format universal_mask_covid___4 universal_mask_covid___4_.;
	format hh_throughout_covid___1 hh_throughout_covid___1_.;
	format hh_throughout_covid___2 hh_throughout_covid___2_.;
	format hh_throughout_covid___4 hh_throughout_covid___4_.;
	format hh_inout_covid___1 hh_inout_covid___1_.;
	format hh_inout_covid___2 hh_inout_covid___2_.;
	format hh_inout_covid___4 hh_inout_covid___4_.;
	format hh_semi_private_covid___1 hh_semi_private_covid___1_.;
	format hh_semi_private_covid___2 hh_semi_private_covid___2_.;
	format hh_semi_private_covid___4 hh_semi_private_covid___4_.;
	format aware_flu___1 aware_flu___1_.;
	format aware_flu___2 aware_flu___2_.;
	format aware_flu___3 aware_flu___3_.;
	format aware_flu___4 aware_flu___4_.;
	format signs_flu___1 signs_flu___1_.;
	format signs_flu___2 signs_flu___2_.;
	format signs_flu___4 signs_flu___4_.;
	format resp_entrance_flu___1 resp_entrance_flu___1_.;
	format resp_entrance_flu___2 resp_entrance_flu___2_.;
	format resp_entrance_flu___4 resp_entrance_flu___4_.;
	format resp_visitors_flu___1 resp_visitors_flu___1_.;
	format resp_visitors_flu___2 resp_visitors_flu___2_.;
	format resp_visitors_flu___3 resp_visitors_flu___3_.;
	format resp_visitors_flu___4 resp_visitors_flu___4_.;
	format visitors_hh_flu___1 visitors_hh_flu___1_.;
	format visitors_hh_flu___2 visitors_hh_flu___2_.;
	format visitors_hh_flu___3 visitors_hh_flu___3_.;
	format visitors_hh_flu___4 visitors_hh_flu___4_.;
	format resp_station_flu___1 resp_station_flu___1_.;
	format resp_station_flu___2 resp_station_flu___2_.;
	format resp_station_flu___4 resp_station_flu___4_.;
	format signage_flu___1 signage_flu___1_.;
	format signage_flu___2 signage_flu___2_.;
	format signage_flu___4 signage_flu___4_.;
	format sick_leave_flu___1 sick_leave_flu___1_.;
	format sick_leave_flu___2 sick_leave_flu___2_.;
	format sick_leave_flu___3 sick_leave_flu___3_.;
	format sick_leave_flu___4 sick_leave_flu___4_.;
	format return_work_flu___1 return_work_flu___1_.;
	format return_work_flu___2 return_work_flu___2_.;
	format return_work_flu___3 return_work_flu___3_.;
	format return_work_flu___4 return_work_flu___4_.;
	format ppe_flu___1 ppe_flu___1_.;
	format ppe_flu___2 ppe_flu___2_.;
	format ppe_flu___3 ppe_flu___3_.;
	format ppe_flu___4 ppe_flu___4_.;
	format tbp_signage_flu___1 tbp_signage_flu___1_.;
	format tbp_signage_flu___2 tbp_signage_flu___2_.;
	format tbp_signage_flu___4 tbp_signage_flu___4_.;
	format ppe_pou_flu___1 ppe_pou_flu___1_.;
	format ppe_pou_flu___2 ppe_pou_flu___2_.;
	format ppe_pou_flu___4 ppe_pou_flu___4_.;
	format disposable_masks_flu___1 disposable_masks_flu___1_.;
	format disposable_masks_flu___2 disposable_masks_flu___2_.;
	format disposable_masks_flu___3 disposable_masks_flu___3_.;
	format disposable_masks_flu___4 disposable_masks_flu___4_.;
	format staff_tbp_flu___1 staff_tbp_flu___1_.;
	format staff_tbp_flu___2 staff_tbp_flu___2_.;
	format staff_tbp_flu___4 staff_tbp_flu___4_.;
	format residents_tbp_flu___1 residents_tbp_flu___1_.;
	format residents_tbp_flu___2 residents_tbp_flu___2_.;
	format residents_tbp_flu___3 residents_tbp_flu___3_.;
	format residents_tbp_flu___4 residents_tbp_flu___4_.;
	format private_rooms_flu___1 private_rooms_flu___1_.;
	format private_rooms_flu___2 private_rooms_flu___2_.;
	format private_rooms_flu___3 private_rooms_flu___3_.;
	format private_rooms_flu___4 private_rooms_flu___4_.;
	format hh_audits_flu___1 hh_audits_flu___1_.;
	format hh_audits_flu___2 hh_audits_flu___2_.;
	format hh_audits_flu___3 hh_audits_flu___3_.;
	format hh_audits_flu___4 hh_audits_flu___4_.;
	format ppe_audits_flu___1 ppe_audits_flu___1_.;
	format ppe_audits_flu___2 ppe_audits_flu___2_.;
	format ppe_audits_flu___3 ppe_audits_flu___3_.;
	format ppe_audits_flu___4 ppe_audits_flu___4_.;
	format precautions_flu___1 precautions_flu___1_.;
	format precautions_flu___2 precautions_flu___2_.;
	format precautions_flu___3 precautions_flu___3_.;
	format precautions_flu___4 precautions_flu___4_.;
	format high_touch_flu___1 high_touch_flu___1_.;
	format high_touch_flu___2 high_touch_flu___2_.;
	format high_touch_flu___3 high_touch_flu___3_.;
	format high_touch_flu___4 high_touch_flu___4_.;
	format disinfect_flu___1 disinfect_flu___1_.;
	format disinfect_flu___2 disinfect_flu___2_.;
	format disinfect_flu___4 disinfect_flu___4_.;
	format disinfect_pou_flu___1 disinfect_pou_flu___1_.;
	format disinfect_pou_flu___2 disinfect_pou_flu___2_.;
	format disinfect_pou_flu___3 disinfect_pou_flu___3_.;
	format disinfect_pou_flu___4 disinfect_pou_flu___4_.;
	format ppe_supply_flu___1 ppe_supply_flu___1_.;
	format ppe_supply_flu___2 ppe_supply_flu___2_.;
	format ppe_supply_flu___3 ppe_supply_flu___3_.;
	format ppe_supply_flu___4 ppe_supply_flu___4_.;
	format hh_throughout_flu___1 hh_throughout_flu___1_.;
	format hh_throughout_flu___2 hh_throughout_flu___2_.;
	format hh_throughout_flu___4 hh_throughout_flu___4_.;
	format hh_inout_flu___1 hh_inout_flu___1_.;
	format hh_inout_flu___2 hh_inout_flu___2_.;
	format hh_inout_flu___4 hh_inout_flu___4_.;
	format hh_semi_private_flu___1 hh_semi_private_flu___1_.;
	format hh_semi_private_flu___2 hh_semi_private_flu___2_.;
	format hh_semi_private_flu___4 hh_semi_private_flu___4_.;
	format aware_rsv___1 aware_rsv___1_.;
	format aware_rsv___2 aware_rsv___2_.;
	format aware_rsv___3 aware_rsv___3_.;
	format aware_rsv___4 aware_rsv___4_.;
	format signs_rsv___1 signs_rsv___1_.;
	format signs_rsv___2 signs_rsv___2_.;
	format signs_rsv___4 signs_rsv___4_.;
	format resp_entrance_rsv___1 resp_entrance_rsv___1_.;
	format resp_entrance_rsv___2 resp_entrance_rsv___2_.;
	format resp_entrance_rsv___4 resp_entrance_rsv___4_.;
	format resp_visitors_rsv___1 resp_visitors_rsv___1_.;
	format resp_visitors_rsv___2 resp_visitors_rsv___2_.;
	format resp_visitors_rsv___3 resp_visitors_rsv___3_.;
	format resp_visitors_rsv___4 resp_visitors_rsv___4_.;
	format visitors_hh_rsv___1 visitors_hh_rsv___1_.;
	format visitors_hh_rsv___2 visitors_hh_rsv___2_.;
	format visitors_hh_rsv___3 visitors_hh_rsv___3_.;
	format visitors_hh_rsv___4 visitors_hh_rsv___4_.;
	format resp_station_rsv___1 resp_station_rsv___1_.;
	format resp_station_rsv___2 resp_station_rsv___2_.;
	format resp_station_rsv___4 resp_station_rsv___4_.;
	format signage_rsv___1 signage_rsv___1_.;
	format signage_rsv___2 signage_rsv___2_.;
	format signage_rsv___4 signage_rsv___4_.;
	format sick_leave_rsv___1 sick_leave_rsv___1_.;
	format sick_leave_rsv___2 sick_leave_rsv___2_.;
	format sick_leave_rsv___3 sick_leave_rsv___3_.;
	format sick_leave_rsv___4 sick_leave_rsv___4_.;
	format return_work_rsv___1 return_work_rsv___1_.;
	format return_work_rsv___2 return_work_rsv___2_.;
	format return_work_rsv___3 return_work_rsv___3_.;
	format return_work_rsv___4 return_work_rsv___4_.;
	format ppe_rsv___1 ppe_rsv___1_.;
	format ppe_rsv___2 ppe_rsv___2_.;
	format ppe_rsv___3 ppe_rsv___3_.;
	format ppe_rsv___4 ppe_rsv___4_.;
	format tbp_signage_rsv___1 tbp_signage_rsv___1_.;
	format tbp_signage_rsv___2 tbp_signage_rsv___2_.;
	format tbp_signage_rsv___4 tbp_signage_rsv___4_.;
	format stand_precaut_rsv___1 stand_precaut_rsv___1_.;
	format stand_precaut_rsv___2 stand_precaut_rsv___2_.;
	format stand_precaut_rsv___3 stand_precaut_rsv___3_.;
	format stand_precaut_rsv___4 stand_precaut_rsv___4_.;
	format ppe_pou_rsv___1 ppe_pou_rsv___1_.;
	format ppe_pou_rsv___2 ppe_pou_rsv___2_.;
	format ppe_pou_rsv___4 ppe_pou_rsv___4_.;
	format disposable_masks_rsv___1 disposable_masks_rsv___1_.;
	format disposable_masks_rsv___2 disposable_masks_rsv___2_.;
	format disposable_masks_rsv___3 disposable_masks_rsv___3_.;
	format disposable_masks_rsv___4 disposable_masks_rsv___4_.;
	format staff_tbp_rsv___1 staff_tbp_rsv___1_.;
	format staff_tbp_rsv___2 staff_tbp_rsv___2_.;
	format staff_tbp_rsv___4 staff_tbp_rsv___4_.;
	format residents_tbp_rsv___1 residents_tbp_rsv___1_.;
	format residents_tbp_rsv___2 residents_tbp_rsv___2_.;
	format residents_tbp_rsv___3 residents_tbp_rsv___3_.;
	format residents_tbp_rsv___4 residents_tbp_rsv___4_.;
	format private_rooms_rsv___1 private_rooms_rsv___1_.;
	format private_rooms_rsv___2 private_rooms_rsv___2_.;
	format private_rooms_rsv___3 private_rooms_rsv___3_.;
	format private_rooms_rsv___4 private_rooms_rsv___4_.;
	format hh_audits_rsv___1 hh_audits_rsv___1_.;
	format hh_audits_rsv___2 hh_audits_rsv___2_.;
	format hh_audits_rsv___3 hh_audits_rsv___3_.;
	format hh_audits_rsv___4 hh_audits_rsv___4_.;
	format ppe_audits_rsv___1 ppe_audits_rsv___1_.;
	format ppe_audits_rsv___2 ppe_audits_rsv___2_.;
	format ppe_audits_rsv___3 ppe_audits_rsv___3_.;
	format ppe_audits_rsv___4 ppe_audits_rsv___4_.;
	format precautions_rsv___1 precautions_rsv___1_.;
	format precautions_rsv___2 precautions_rsv___2_.;
	format precautions_rsv___3 precautions_rsv___3_.;
	format precautions_rsv___4 precautions_rsv___4_.;
	format high_touch_rsv___1 high_touch_rsv___1_.;
	format high_touch_rsv___2 high_touch_rsv___2_.;
	format high_touch_rsv___3 high_touch_rsv___3_.;
	format high_touch_rsv___4 high_touch_rsv___4_.;
	format disinfect_rsv___1 disinfect_rsv___1_.;
	format disinfect_rsv___2 disinfect_rsv___2_.;
	format disinfect_rsv___4 disinfect_rsv___4_.;
	format disinfect_pou_rsv___1 disinfect_pou_rsv___1_.;
	format disinfect_pou_rsv___2 disinfect_pou_rsv___2_.;
	format disinfect_pou_rsv___4 disinfect_pou_rsv___4_.;
	format equipment_dedicated_rsv___1 equipment_dedicated_rsv___1_.;
	format equipment_dedicated_rsv___2 equipment_dedicated_rsv___2_.;
	format equipment_dedicated_rsv___3 equipment_dedicated_rsv___3_.;
	format equipment_dedicated_rsv___4 equipment_dedicated_rsv___4_.;
	format ppe_supply_rsv___1 ppe_supply_rsv___1_.;
	format ppe_supply_rsv___2 ppe_supply_rsv___2_.;
	format ppe_supply_rsv___3 ppe_supply_rsv___3_.;
	format ppe_supply_rsv___4 ppe_supply_rsv___4_.;
	format hh_throughout_rsv___1 hh_throughout_rsv___1_.;
	format hh_throughout_rsv___2 hh_throughout_rsv___2_.;
	format hh_throughout_rsv___4 hh_throughout_rsv___4_.;
	format hh_inout_rsv___1 hh_inout_rsv___1_.;
	format hh_inout_rsv___2 hh_inout_rsv___2_.;
	format hh_inout_rsv___4 hh_inout_rsv___4_.;
	format hh_semi_private_rsv___1 hh_semi_private_rsv___1_.;
	format hh_semi_private_rsv___2 hh_semi_private_rsv___2_.;
	format hh_semi_private_rsv___4 hh_semi_private_rsv___4_.;
	format aware_noro___1 aware_noro___1_.;
	format aware_noro___2 aware_noro___2_.;
	format aware_noro___3 aware_noro___3_.;
	format aware_noro___4 aware_noro___4_.;
	format signs_noro___1 signs_noro___1_.;
	format signs_noro___2 signs_noro___2_.;
	format signs_noro___4 signs_noro___4_.;
	format resp_entrance_noro___1 resp_entrance_noro___1_.;
	format resp_entrance_noro___2 resp_entrance_noro___2_.;
	format resp_entrance_noro___4 resp_entrance_noro___4_.;
	format resp_visitors_noro___1 resp_visitors_noro___1_.;
	format resp_visitors_noro___2 resp_visitors_noro___2_.;
	format resp_visitors_noro___3 resp_visitors_noro___3_.;
	format resp_visitors_noro___4 resp_visitors_noro___4_.;
	format visitors_hh_noro___1 visitors_hh_noro___1_.;
	format visitors_hh_noro___2 visitors_hh_noro___2_.;
	format visitors_hh_noro___3 visitors_hh_noro___3_.;
	format visitors_hh_noro___4 visitors_hh_noro___4_.;
	format sick_leave_noro___1 sick_leave_noro___1_.;
	format sick_leave_noro___2 sick_leave_noro___2_.;
	format sick_leave_noro___3 sick_leave_noro___3_.;
	format sick_leave_noro___4 sick_leave_noro___4_.;
	format return_work_noro___1 return_work_noro___1_.;
	format return_work_noro___2 return_work_noro___2_.;
	format return_work_noro___3 return_work_noro___3_.;
	format return_work_noro___4 return_work_noro___4_.;
	format ppe_noro___1 ppe_noro___1_.;
	format ppe_noro___2 ppe_noro___2_.;
	format ppe_noro___3 ppe_noro___3_.;
	format ppe_noro___4 ppe_noro___4_.;
	format bp_signage_noro___1 bp_signage_noro___1_.;
	format bp_signage_noro___2 bp_signage_noro___2_.;
	format bp_signage_noro___3 bp_signage_noro___3_.;
	format bp_signage_noro___4 bp_signage_noro___4_.;
	format ppe_pou_noro___1 ppe_pou_noro___1_.;
	format ppe_pou_noro___2 ppe_pou_noro___2_.;
	format ppe_pou_noro___4 ppe_pou_noro___4_.;
	format staff_tbp_noro___1 staff_tbp_noro___1_.;
	format staff_tbp_noro___2 staff_tbp_noro___2_.;
	format staff_tbp_noro___4 staff_tbp_noro___4_.;
	format residents_tbp_noro___1 residents_tbp_noro___1_.;
	format residents_tbp_noro___2 residents_tbp_noro___2_.;
	format residents_tbp_noro___3 residents_tbp_noro___3_.;
	format residents_tbp_noro___4 residents_tbp_noro___4_.;
	format private_rooms_noro___1 private_rooms_noro___1_.;
	format private_rooms_noro___2 private_rooms_noro___2_.;
	format private_rooms_noro___3 private_rooms_noro___3_.;
	format private_rooms_noro___4 private_rooms_noro___4_.;
	format wash_hands_noro___1 wash_hands_noro___1_.;
	format wash_hands_noro___2 wash_hands_noro___2_.;
	format wash_hands_noro___3 wash_hands_noro___3_.;
	format wash_hands_noro___4 wash_hands_noro___4_.;
	format hh_audits_noro___1 hh_audits_noro___1_.;
	format hh_audits_noro___2 hh_audits_noro___2_.;
	format hh_audits_noro___3 hh_audits_noro___3_.;
	format hh_audits_noro___4 hh_audits_noro___4_.;
	format ppe_audits_noro___1 ppe_audits_noro___1_.;
	format ppe_audits_noro___2 ppe_audits_noro___2_.;
	format ppe_audits_noro___3 ppe_audits_noro___3_.;
	format ppe_audits_noro___4 ppe_audits_noro___4_.;
	format precautions_noro___1 precautions_noro___1_.;
	format precautions_noro___2 precautions_noro___2_.;
	format precautions_noro___3 precautions_noro___3_.;
	format precautions_noro___4 precautions_noro___4_.;
	format high_touch_noro___1 high_touch_noro___1_.;
	format high_touch_noro___2 high_touch_noro___2_.;
	format high_touch_noro___3 high_touch_noro___3_.;
	format high_touch_noro___4 high_touch_noro___4_.;
	format disinfect_noro___1 disinfect_noro___1_.;
	format disinfect_noro___2 disinfect_noro___2_.;
	format disinfect_noro___4 disinfect_noro___4_.;
	format disinfect_pou_noro___1 disinfect_pou_noro___1_.;
	format disinfect_pou_noro___2 disinfect_pou_noro___2_.;
	format disinfect_pou_noro___4 disinfect_pou_noro___4_.;
	format equipment_dedicated_noro___1 equipment_dedicated_noro___1_.;
	format equipment_dedicated_noro___2 equipment_dedicated_noro___2_.;
	format equipment_dedicated_noro___3 equipment_dedicated_noro___3_.;
	format equipment_dedicated_noro___4 equipment_dedicated_noro___4_.;
	format ppe_supply___1 ppe_supply___1_.;
	format ppe_supply___2 ppe_supply___2_.;
	format ppe_supply___3 ppe_supply___3_.;
	format ppe_supply___4 ppe_supply___4_.;
	format hh_throughout_noro___1 hh_throughout_noro___1_.;
	format hh_throughout_noro___2 hh_throughout_noro___2_.;
	format hh_throughout_noro___4 hh_throughout_noro___4_.;
	format hh_inout_noro___1 hh_inout_noro___1_.;
	format hh_inout_noro___2 hh_inout_noro___2_.;
	format hh_inout_noro___4 hh_inout_noro___4_.;
	format sinks_noro___1 sinks_noro___1_.;
	format sinks_noro___2 sinks_noro___2_.;
	format sinks_noro___4 sinks_noro___4_.;
	format hh_semi_private_noro___1 hh_semi_private_noro___1_.;
	format hh_semi_private_noro___2 hh_semi_private_noro___2_.;
	format hh_semi_private_noro___4 hh_semi_private_noro___4_.;
	format contr_ob_mdro___1 contr_ob_mdro___1_.;
	format contr_ob_mdro___2 contr_ob_mdro___2_.;
	format contr_ob_mdro___3 contr_ob_mdro___3_.;
	format contr_ob_mdro___4 contr_ob_mdro___4_.;
	format contr_ob_mdro___5 contr_ob_mdro___5_.;
	format contr_ob_mdro___6 contr_ob_mdro___6_.;
	format contr_ob_mdro___7 contr_ob_mdro___7_.;
	format contr_ob_mdro___8 contr_ob_mdro___8_.;
	format contr_ob_mdro___9 contr_ob_mdro___9_.;
	format screen_ob_mdro___1 screen_ob_mdro___1_.;
	format screen_ob_mdro___2 screen_ob_mdro___2_.;
	format screen_ob_mdro___3 screen_ob_mdro___3_.;
	format screen_ob_mdro___4 screen_ob_mdro___4_.;
	format rec_ob_mdro___1 rec_ob_mdro___1_.;
	format rec_ob_mdro___2 rec_ob_mdro___2_.;
	format rec_ob_mdro___3 rec_ob_mdro___3_.;
	format rec_ob_mdro___4 rec_ob_mdro___4_.;
	format iso_ob_mdro___1 iso_ob_mdro___1_.;
	format iso_ob_mdro___2 iso_ob_mdro___2_.;
	format iso_ob_mdro___3 iso_ob_mdro___3_.;
	format iso_ob_mdro___4 iso_ob_mdro___4_.;
	format contacts_ob_mdro___1 contacts_ob_mdro___1_.;
	format contacts_ob_mdro___2 contacts_ob_mdro___2_.;
	format contacts_ob_mdro___3 contacts_ob_mdro___3_.;
	format contacts_ob_mdro___4 contacts_ob_mdro___4_.;
	format precaut_ob_mdro___1 precaut_ob_mdro___1_.;
	format precaut_ob_mdro___2 precaut_ob_mdro___2_.;
	format precaut_ob_mdro___4 precaut_ob_mdro___4_.;
	format staff_ob_mdro___1 staff_ob_mdro___1_.;
	format staff_ob_mdro___2 staff_ob_mdro___2_.;
	format staff_ob_mdro___4 staff_ob_mdro___4_.;
	format edu_ob_mdro___1 edu_ob_mdro___1_.;
	format edu_ob_mdro___2 edu_ob_mdro___2_.;
	format edu_ob_mdro___3 edu_ob_mdro___3_.;
	format edu_ob_mdro___4 edu_ob_mdro___4_.;
	format report_list_mdro___1 report_list_mdro___1_.;
	format report_list_mdro___2 report_list_mdro___2_.;
	format report_list_mdro___3 report_list_mdro___3_.;
	format report_list_mdro___4 report_list_mdro___4_.;
	format ph_contact_mdro___1 ph_contact_mdro___1_.;
	format ph_contact_mdro___2 ph_contact_mdro___2_.;
	format ph_contact_mdro___3 ph_contact_mdro___3_.;
	format ph_contact_mdro___4 ph_contact_mdro___4_.;
	format comm_infect_mdro___1 comm_infect_mdro___1_.;
	format comm_infect_mdro___2 comm_infect_mdro___2_.;
	format comm_infect_mdro___3 comm_infect_mdro___3_.;
	format comm_infect_mdro___4 comm_infect_mdro___4_.;
	format infect_intake_mdro___1 infect_intake_mdro___1_.;
	format infect_intake_mdro___2 infect_intake_mdro___2_.;
	format infect_intake_mdro___3 infect_intake_mdro___3_.;
	format infect_intake_mdro___4 infect_intake_mdro___4_.;
	format lab_notif_mdro___1 lab_notif_mdro___1_.;
	format lab_notif_mdro___2 lab_notif_mdro___2_.;
	format lab_notif_mdro___3 lab_notif_mdro___3_.;
	format lab_notif_mdro___4 lab_notif_mdro___4_.;
	format indiv_antistew_mdro___1 indiv_antistew_mdro___1_.;
	format indiv_antistew_mdro___2 indiv_antistew_mdro___2_.;
	format indiv_antistew_mdro___3 indiv_antistew_mdro___3_.;
	format indiv_antistew_mdro___4 indiv_antistew_mdro___4_.;
	format indiv_antistew_mdro___5 indiv_antistew_mdro___5_.;
	format indiv_antistew_mdro___6 indiv_antistew_mdro___6_.;
	format hh_policies_mdro___1 hh_policies_mdro___1_.;
	format hh_policies_mdro___2 hh_policies_mdro___2_.;
	format hh_policies_mdro___3 hh_policies_mdro___3_.;
	format hh_policies_mdro___4 hh_policies_mdro___4_.;
	format hh_expectations_mdro___1 hh_expectations_mdro___1_.;
	format hh_expectations_mdro___2 hh_expectations_mdro___2_.;
	format hh_expectations_mdro___3 hh_expectations_mdro___3_.;
	format hh_expectations_mdro___4 hh_expectations_mdro___4_.;
	format hh_expectations_mdro___5 hh_expectations_mdro___5_.;
	format hh_expectations_mdro___6 hh_expectations_mdro___6_.;
	format hh_expectations_mdro___7 hh_expectations_mdro___7_.;
	format hh_expectations_mdro___8 hh_expectations_mdro___8_.;
	format hh_expectations_mdro___9 hh_expectations_mdro___9_.;
	format hh_inout_mdro___1 hh_inout_mdro___1_.;
	format hh_inout_mdro___2 hh_inout_mdro___2_.;
	format hh_inout_mdro___4 hh_inout_mdro___4_.;
	format hh_sinkavail_mdro___1 hh_sinkavail_mdro___1_.;
	format hh_sinkavail_mdro___2 hh_sinkavail_mdro___2_.;
	format hh_sinkavail_mdro___3 hh_sinkavail_mdro___3_.;
	format hh_sinkavail_mdro___4 hh_sinkavail_mdro___4_.;
	format hh_soapwater_mdro___1 hh_soapwater_mdro___1_.;
	format hh_soapwater_mdro___2 hh_soapwater_mdro___2_.;
	format hh_soapwater_mdro___3 hh_soapwater_mdro___3_.;
	format hh_soapwater_mdro___4 hh_soapwater_mdro___4_.;
	format hh_soapwater_mdro___5 hh_soapwater_mdro___5_.;
	format hh_soapwater_mdro___6 hh_soapwater_mdro___6_.;
	format hh_throughout_mdro___1 hh_throughout_mdro___1_.;
	format hh_throughout_mdro___2 hh_throughout_mdro___2_.;
	format hh_throughout_mdro___3 hh_throughout_mdro___3_.;
	format hh_pocket_mdro___1 hh_pocket_mdro___1_.;
	format hh_pocket_mdro___2 hh_pocket_mdro___2_.;
	format hh_pocket_mdro___3 hh_pocket_mdro___3_.;
	format hh_pocket_mdro___4 hh_pocket_mdro___4_.;
	format hh_only_mdro___1 hh_only_mdro___1_.;
	format hh_only_mdro___2 hh_only_mdro___2_.;
	format hh_only_mdro___3 hh_only_mdro___3_.;
	format hh_only_mdro___4 hh_only_mdro___4_.;
	format hh_supplies_mdro___1 hh_supplies_mdro___1_.;
	format hh_supplies_mdro___2 hh_supplies_mdro___2_.;
	format hh_supplies_mdro___4 hh_supplies_mdro___4_.;
	format hh_lotion_mdro___1 hh_lotion_mdro___1_.;
	format hh_lotion_mdro___2 hh_lotion_mdro___2_.;
	format hh_lotion_mdro___3 hh_lotion_mdro___3_.;
	format hh_lotion_mdro___4 hh_lotion_mdro___4_.;
	format hh_lotion_mdro___5 hh_lotion_mdro___5_.;
	format hh_nails_mdro___1 hh_nails_mdro___1_.;
	format hh_nails_mdro___2 hh_nails_mdro___2_.;
	format hh_nails_mdro___3 hh_nails_mdro___3_.;
	format hh_nails_mdro___4 hh_nails_mdro___4_.;
	format patienthh_mdro___1 patienthh_mdro___1_.;
	format patienthh_mdro___2 patienthh_mdro___2_.;
	format patienthh_mdro___3 patienthh_mdro___3_.;
	format patienthh_mdro___4 patienthh_mdro___4_.;
	format patienthh_mdro___5 patienthh_mdro___5_.;
	format transmission_policy_mdro___1 transmission_policy_mdro___1_.;
	format transmission_policy_mdro___2 transmission_policy_mdro___2_.;
	format transmission_policy_mdro___3 transmission_policy_mdro___3_.;
	format transmission_policy_mdro___4 transmission_policy_mdro___4_.;
	format trans_signage_mdro___1 trans_signage_mdro___1_.;
	format trans_signage_mdro___2 trans_signage_mdro___2_.;
	format trans_signage_mdro___3 trans_signage_mdro___3_.;
	format trans_signage_mdro___4 trans_signage_mdro___4_.;
	format trans_signage_mdro___5 trans_signage_mdro___5_.;
	format trans_signage_mdro___6 trans_signage_mdro___6_.;
	format trans_signage_mdro___7 trans_signage_mdro___7_.;
	format trans_signage_mdro___8 trans_signage_mdro___8_.;
	format trans_signage_mdro___9 trans_signage_mdro___9_.;
	format ppe_supplies_mdro___1 ppe_supplies_mdro___1_.;
	format ppe_supplies_mdro___2 ppe_supplies_mdro___2_.;
	format ppe_supplies_mdro___4 ppe_supplies_mdro___4_.;
	format semipriv_mdro___1 semipriv_mdro___1_.;
	format semipriv_mdro___2 semipriv_mdro___2_.;
	format semipriv_mdro___3 semipriv_mdro___3_.;
	format semipriv_mdro___4 semipriv_mdro___4_.;
	format tbp_admit_mdro___1 tbp_admit_mdro___1_.;
	format tbp_admit_mdro___2 tbp_admit_mdro___2_.;
	format tbp_admit_mdro___3 tbp_admit_mdro___3_.;
	format tbp_admit_mdro___4 tbp_admit_mdro___4_.;
	format tbp_transfer_mdro___1 tbp_transfer_mdro___1_.;
	format tbp_transfer_mdro___2 tbp_transfer_mdro___2_.;
	format tbp_transfer_mdro___3 tbp_transfer_mdro___3_.;
	format tbp_transfer_mdro___4 tbp_transfer_mdro___4_.;
	format tbp_change_mdro___1 tbp_change_mdro___1_.;
	format tbp_change_mdro___2 tbp_change_mdro___2_.;
	format tbp_change_mdro___3 tbp_change_mdro___3_.;
	format tbp_change_mdro___4 tbp_change_mdro___4_.;
	format ebp_identify_mdro___1 ebp_identify_mdro___1_.;
	format ebp_identify_mdro___2 ebp_identify_mdro___2_.;
	format ebp_identify_mdro___3 ebp_identify_mdro___3_.;
	format ebp_identify_mdro___4 ebp_identify_mdro___4_.;
	format trans_signforclean_mdro___1 trans_signforclean_mdro___1_.;
	format trans_signforclean_mdro___2 trans_signforclean_mdro___2_.;
	format trans_signforclean_mdro___3 trans_signforclean_mdro___3_.;
	format trans_signforclean_mdro___4 trans_signforclean_mdro___4_.;
	format one_time_syringe_mdro___1 one_time_syringe_mdro___1_.;
	format one_time_syringe_mdro___2 one_time_syringe_mdro___2_.;
	format one_time_syringe_mdro___3 one_time_syringe_mdro___3_.;
	format one_time_syringe_mdro___4 one_time_syringe_mdro___4_.;
	format watermang_mdro___1 watermang_mdro___1_.;
	format watermang_mdro___2 watermang_mdro___2_.;
	format watermang_mdro___3 watermang_mdro___3_.;
	format watermang_mdro___4 watermang_mdro___4_.;
	format splash_mdro___1 splash_mdro___1_.;
	format splash_mdro___2 splash_mdro___2_.;
	format splash_mdro___3 splash_mdro___3_.;
	format splash_mdro___5 splash_mdro___5_.;
	format splash_mdro___6 splash_mdro___6_.;
	format splash_mdro___7 splash_mdro___7_.;
	format splash_mdro___8 splash_mdro___8_.;
	format splash_mdro___9 splash_mdro___9_.;
	format splash_mdro___10 splash_mdro___10_.;
	format splash_mdro___11 splash_mdro___11_.;
	format splash_mdro___12 splash_mdro___12_.;
	format biofilm_measures_mdro___1 biofilm_measures_mdro___1_.;
	format biofilm_measures_mdro___2 biofilm_measures_mdro___2_.;
	format biofilm_measures_mdro___3 biofilm_measures_mdro___3_.;
	format biofilm_measures_mdro___4 biofilm_measures_mdro___4_.;
	format biofilm_measures_mdro___5 biofilm_measures_mdro___5_.;
	format biofilm_measures_mdro___6 biofilm_measures_mdro___6_.;
	format biofilm_measures_mdro___7 biofilm_measures_mdro___7_.;
	format toiletdoor_mdro___1 toiletdoor_mdro___1_.;
	format toiletdoor_mdro___2 toiletdoor_mdro___2_.;
	format toiletdoor_mdro___3 toiletdoor_mdro___3_.;
	format toiletdoor_mdro___4 toiletdoor_mdro___4_.;
	format toiletdoor_no_mdro___1 toiletdoor_no_mdro___1_.;
	format toiletdoor_no_mdro___2 toiletdoor_no_mdro___2_.;
	format toiletdoor_no_mdro___3 toiletdoor_no_mdro___3_.;
	format toiletdoor_no_mdro___4 toiletdoor_no_mdro___4_.;
	format hooperdoor_mdro___1 hooperdoor_mdro___1_.;
	format hooperdoor_mdro___2 hooperdoor_mdro___2_.;
	format hooperdoor_mdro___3 hooperdoor_mdro___3_.;
	format hooperdoor_mdro___4 hooperdoor_mdro___4_.;
	format hopperdoor_no_mdro___1 hopperdoor_no_mdro___1_.;
	format hopperdoor_no_mdro___2 hopperdoor_no_mdro___2_.;
	format hopperdoor_no_mdro___3 hopperdoor_no_mdro___3_.;
	format hopperdoor_no_mdro___4 hopperdoor_no_mdro___4_.;
	format iceobs_mdro___1 iceobs_mdro___1_.;
	format iceobs_mdro___2 iceobs_mdro___2_.;
	format iceobs_mdro___4 iceobs_mdro___4_.;
	format icemaint_mdro___1 icemaint_mdro___1_.;
	format icemaint_mdro___2 icemaint_mdro___2_.;
	format icemaint_mdro___3 icemaint_mdro___3_.;
	format icemaint_mdro___4 icemaint_mdro___4_.;
	format showerchair_mdro___1 showerchair_mdro___1_.;
	format showerchair_mdro___2 showerchair_mdro___2_.;
	format showerchair_mdro___3 showerchair_mdro___3_.;
	format showerchair_mdro___4 showerchair_mdro___4_.;
	format ptcarewater_mdro___1 ptcarewater_mdro___1_.;
	format ptcarewater_mdro___2 ptcarewater_mdro___2_.;
	format ptcarewater_mdro___3 ptcarewater_mdro___3_.;
	format ptcarewater_mdro___4 ptcarewater_mdro___4_.;
	format woundmask_gas___1 woundmask_gas___1_.;
	format woundmask_gas___2 woundmask_gas___2_.;
	format woundmask_gas___3 woundmask_gas___3_.;
	format reusable_gas___1 reusable_gas___1_.;
	format reusable_gas___2 reusable_gas___2_.;
	format reusable_gas___3 reusable_gas___3_.;
	format devices_disinf_gas___1 devices_disinf_gas___1_.;
	format devices_disinf_gas___2 devices_disinf_gas___2_.;
	format devices_disinf_gas___3 devices_disinf_gas___3_.;
	format devices_disinf_gas___4 devices_disinf_gas___4_.;
	format aware_gas___1 aware_gas___1_.;
	format aware_gas___2 aware_gas___2_.;
	format aware_gas___3 aware_gas___3_.;
	format aware_gas___4 aware_gas___4_.;
	format precautions_gas___1 precautions_gas___1_.;
	format precautions_gas___2 precautions_gas___2_.;
	format precautions_gas___3 precautions_gas___3_.;
	format precautions_gas___4 precautions_gas___4_.;
	format trans_signage_gas___1 trans_signage_gas___1_.;
	format trans_signage_gas___2 trans_signage_gas___2_.;
	format trans_signage_gas___3 trans_signage_gas___3_.;
	format trans_signage_gas___4 trans_signage_gas___4_.;
	format trans_signage_gas___5 trans_signage_gas___5_.;
	format trans_signage_gas___6 trans_signage_gas___6_.;
	format trans_signage_gas___7 trans_signage_gas___7_.;
	format trans_signage_gas___8 trans_signage_gas___8_.;
	format trans_signage_gas___9 trans_signage_gas___9_.;
	format ppe_supplies_gas___1 ppe_supplies_gas___1_.;
	format ppe_supplies_gas___2 ppe_supplies_gas___2_.;
	format ppe_supplies_gas___3 ppe_supplies_gas___3_.;
	format ppe_supplies_gas___4 ppe_supplies_gas___4_.;
	format semipriv_gas___1 semipriv_gas___1_.;
	format semipriv_gas___2 semipriv_gas___2_.;
	format semipriv_gas___3 semipriv_gas___3_.;
	format semipriv_gas___4 semipriv_gas___4_.;
	format tbp_change_gas___1 tbp_change_gas___1_.;
	format tbp_change_gas___2 tbp_change_gas___2_.;
	format tbp_change_gas___3 tbp_change_gas___3_.;
	format tbp_change_gas___4 tbp_change_gas___4_.;
	format resp_entrance_gas___1 resp_entrance_gas___1_.;
	format resp_entrance_gas___2 resp_entrance_gas___2_.;
	format resp_entrance_gas___3 resp_entrance_gas___3_.;
	format resp_station_gas___1 resp_station_gas___1_.;
	format resp_station_gas___2 resp_station_gas___2_.;
	format resp_station_gas___3 resp_station_gas___3_.;
	format resp_visitors_gas___1 resp_visitors_gas___1_.;
	format resp_visitors_gas___2 resp_visitors_gas___2_.;
	format resp_visitors_gas___3 resp_visitors_gas___3_.;
	format resp_visitors_gas___4 resp_visitors_gas___4_.;
	format sick_leave_gas___1 sick_leave_gas___1_.;
	format sick_leave_gas___2 sick_leave_gas___2_.;
	format sick_leave_gas___3 sick_leave_gas___3_.;
	format sick_leave_gas___4 sick_leave_gas___4_.;
	format resptreat_gas___1 resptreat_gas___1_.;
	format resptreat_gas___2 resptreat_gas___2_.;
	format resptreat_gas___3 resptreat_gas___3_.;
	format resptreat_gas___4 resptreat_gas___4_.;
	format resp_aseptic_gas___1 resp_aseptic_gas___1_.;
	format resp_aseptic_gas___2 resp_aseptic_gas___2_.;
	format resp_aseptic_gas___3 resp_aseptic_gas___3_.;
	format resp_aseptic_gas___4 resp_aseptic_gas___4_.;
	format trachcare_gas___1 trachcare_gas___1_.;
	format trachcare_gas___2 trachcare_gas___2_.;
	format trachcare_gas___3 trachcare_gas___3_.;
	format trachcare_gas___4 trachcare_gas___4_.;
	format trachcare_gas___5 trachcare_gas___5_.;
	format resp_supplies_gas___1 resp_supplies_gas___1_.;
	format resp_supplies_gas___2 resp_supplies_gas___2_.;
	format resp_supplies_gas___3 resp_supplies_gas___3_.;
	format resp_supplies_gas___4 resp_supplies_gas___4_.;
	format disinfectequip_obs_gas___1 disinfectequip_obs_gas___1_.;
	format disinfectequip_obs_gas___2 disinfectequip_obs_gas___2_.;
	format disinfectequip_obs_gas___3 disinfectequip_obs_gas___3_.;
	format eqip_obs_gas___1 eqip_obs_gas___1_.;
	format eqip_obs_gas___2 eqip_obs_gas___2_.;
	format eqip_obs_gas___3 eqip_obs_gas___3_.;
	format policy_disinf_gas___1 policy_disinf_gas___1_.;
	format policy_disinf_gas___2 policy_disinf_gas___2_.;
	format policy_disinf_gas___3 policy_disinf_gas___3_.;
	format policy_disinf_gas___4 policy_disinf_gas___4_.;
	format contact_disinf_gas___1 contact_disinf_gas___1_.;
	format contact_disinf_gas___2 contact_disinf_gas___2_.;
	format contact_disinf_gas___3 contact_disinf_gas___3_.;
	format contact_disinf_gas___4 contact_disinf_gas___4_.;
	format hightouch_disinf_gas___1 hightouch_disinf_gas___1_.;
	format hightouch_disinf_gas___2 hightouch_disinf_gas___2_.;
	format hightouch_disinf_gas___3 hightouch_disinf_gas___3_.;
	format hightouch_disinf_gas___4 hightouch_disinf_gas___4_.;
	format epa_disinf_gas___1 epa_disinf_gas___1_.;
	format epa_disinf_gas___2 epa_disinf_gas___2_.;
	format epa_disinf_gas___3 epa_disinf_gas___3_.;
	format epa_disinf_gas___4 epa_disinf_gas___4_.;
	format shower_disinf_gas___1 shower_disinf_gas___1_.;
	format shower_disinf_gas___2 shower_disinf_gas___2_.;
	format shower_disinf_gas___3 shower_disinf_gas___3_.;
	format shower_disinf_gas___4 shower_disinf_gas___4_.;
	format shower_disinf_gas___5 shower_disinf_gas___5_.;
	format showindicate_disinf_gas___1 showindicate_disinf_gas___1_.;
	format showindicate_disinf_gas___2 showindicate_disinf_gas___2_.;
	format showindicate_disinf_gas___3 showindicate_disinf_gas___3_.;
	format showindicate_disinf_gas___4 showindicate_disinf_gas___4_.;
	format showindicate_disinf_gas___5 showindicate_disinf_gas___5_.;
	format supp_disinf_gas___1 supp_disinf_gas___1_.;
	format supp_disinf_gas___2 supp_disinf_gas___2_.;
	format supp_disinf_gas___3 supp_disinf_gas___3_.;
	format outbreak_management__v_9 outbreak_management__v_9_.;
	format disease_ob___1 disease_ob___1_.;
	format disease_ob___2 disease_ob___2_.;
	format disease_ob___3 disease_ob___3_.;
	format disease_ob___4 disease_ob___4_.;
	format disease_ob___5 disease_ob___5_.;
	format disease_ob___6 disease_ob___6_.;
	format disease_ob___7 disease_ob___7_.;
	format disease_ob___8 disease_ob___8_.;
	format disease_ob___9 disease_ob___9_.;
	format contr_ob___1 contr_ob___1_.;
	format contr_ob___2 contr_ob___2_.;
	format contr_ob___3 contr_ob___3_.;
	format contr_ob___4 contr_ob___4_.;
	format contr_ob___5 contr_ob___5_.;
	format contr_ob___6 contr_ob___6_.;
	format contr_ob___7 contr_ob___7_.;
	format contr_ob___8 contr_ob___8_.;
	format contr_ob___9 contr_ob___9_.;
	format contr_ob___10 contr_ob___10_.;
	format contr_ob___11 contr_ob___11_.;
	format lhd_ob___1 lhd_ob___1_.;
	format lhd_ob___2 lhd_ob___2_.;
	format lhd_ob___3 lhd_ob___3_.;
	format screen_ob___1 screen_ob___1_.;
	format screen_ob___2 screen_ob___2_.;
	format screen_ob___3 screen_ob___3_.;
	format rec_ob___1 rec_ob___1_.;
	format rec_ob___2 rec_ob___2_.;
	format rec_ob___3 rec_ob___3_.;
	format iso_ob___1 iso_ob___1_.;
	format iso_ob___2 iso_ob___2_.;
	format iso_ob___3 iso_ob___3_.;
	format contacts_ob___1 contacts_ob___1_.;
	format contacts_ob___2 contacts_ob___2_.;
	format contacts_ob___3 contacts_ob___3_.;
	format precaut_ob___1 precaut_ob___1_.;
	format precaut_ob___2 precaut_ob___2_.;
	format precaut_ob___3 precaut_ob___3_.;
	format staff_ob___1 staff_ob___1_.;
	format staff_ob___2 staff_ob___2_.;
	format staff_ob___3 staff_ob___3_.;
	format edu_ob___1 edu_ob___1_.;
	format edu_ob___2 edu_ob___2_.;
	format edu_ob___3 edu_ob___3_.;
	format edu_ob___4 edu_ob___4_.;
	format outbreak_management_complete outbreak_management_complete_.;
	format urincath_1___1 urincath_1___1_.;
	format urincath_1___2 urincath_1___2_.;
	format urincath_1___3 urincath_1___3_.;
	format urincath_1___4 urincath_1___4_.;
	format urincath_1___5 urincath_1___5_.;
	format urincath_1___6 urincath_1___6_.;
	format urincath_2___1 urincath_2___1_.;
	format urincath_2___2 urincath_2___2_.;
	format urincath_2___3 urincath_2___3_.;
	format urincath_2___4 urincath_2___4_.;
	format urincath_2___5 urincath_2___5_.;
	format urincath_2___6 urincath_2___6_.;
	format urincath_3___1 urincath_3___1_.;
	format urincath_3___2 urincath_3___2_.;
	format urincath_3___3 urincath_3___3_.;
	format urincath_3___4 urincath_3___4_.;
	format urincath_3___5 urincath_3___5_.;
	format urincath_3___6 urincath_3___6_.;
	format urincath_4___1 urincath_4___1_.;
	format urincath_4___2 urincath_4___2_.;
	format urincath_4___3 urincath_4___3_.;
	format urincath_4___4 urincath_4___4_.;
	format urincath_4___5 urincath_4___5_.;
	format urincath_4___6 urincath_4___6_.;
	format urincath_5___1 urincath_5___1_.;
	format urincath_5___2 urincath_5___2_.;
	format urincath_5___3 urincath_5___3_.;
	format urincath_5___4 urincath_5___4_.;
	format urincath_5___5 urincath_5___5_.;
	format urincath_5___6 urincath_5___6_.;
	format cl_1___1 cl_1___1_.;
	format cl_1___2 cl_1___2_.;
	format cl_1___3 cl_1___3_.;
	format cl_1___4 cl_1___4_.;
	format cl_1___5 cl_1___5_.;
	format cl_1___6 cl_1___6_.;
	format cl_1___7 cl_1___7_.;
	format cl_1___8 cl_1___8_.;
	format cl_2___1 cl_2___1_.;
	format cl_2___2 cl_2___2_.;
	format cl_2___3 cl_2___3_.;
	format cl_2___4 cl_2___4_.;
	format cl_2___5 cl_2___5_.;
	format cl_2___6 cl_2___6_.;
	format cl_2___7 cl_2___7_.;
	format cl_2___8 cl_2___8_.;
	format cl_3___1 cl_3___1_.;
	format cl_3___2 cl_3___2_.;
	format cl_3___3 cl_3___3_.;
	format cl_3___4 cl_3___4_.;
	format cl_3___5 cl_3___5_.;
	format cl_3___6 cl_3___6_.;
	format cl_3___7 cl_3___7_.;
	format cl_3___8 cl_3___8_.;
	format cl_4___1 cl_4___1_.;
	format cl_4___2 cl_4___2_.;
	format cl_4___3 cl_4___3_.;
	format cl_4___4 cl_4___4_.;
	format cl_4___5 cl_4___5_.;
	format cl_4___6 cl_4___6_.;
	format cl_4___7 cl_4___7_.;
	format cl_4___8 cl_4___8_.;
	format cl_5___1 cl_5___1_.;
	format cl_5___2 cl_5___2_.;
	format cl_5___3 cl_5___3_.;
	format cl_5___4 cl_5___4_.;
	format cl_5___5 cl_5___5_.;
	format cl_5___6 cl_5___6_.;
	format cl_5___7 cl_5___7_.;
	format cl_5___8 cl_5___8_.;
	format cld_1___1 cld_1___1_.;
	format cld_1___2 cld_1___2_.;
	format cld_1___3 cld_1___3_.;
	format cld_1___4 cld_1___4_.;
	format cld_1___5 cld_1___5_.;
	format cld_1___6 cld_1___6_.;
	format cld_1___7 cld_1___7_.;
	format cld_1___8 cld_1___8_.;
	format cld_1___9 cld_1___9_.;
	format cld_2___1 cld_2___1_.;
	format cld_2___2 cld_2___2_.;
	format cld_2___3 cld_2___3_.;
	format cld_2___4 cld_2___4_.;
	format cld_2___5 cld_2___5_.;
	format cld_2___6 cld_2___6_.;
	format cld_2___7 cld_2___7_.;
	format cld_2___8 cld_2___8_.;
	format cld_2___9 cld_2___9_.;
	format cld_3___1 cld_3___1_.;
	format cld_3___2 cld_3___2_.;
	format cld_3___3 cld_3___3_.;
	format cld_3___4 cld_3___4_.;
	format cld_3___5 cld_3___5_.;
	format cld_3___6 cld_3___6_.;
	format cld_3___7 cld_3___7_.;
	format cld_3___8 cld_3___8_.;
	format cld_3___9 cld_3___9_.;
	format tra_1___1 tra_1___1_.;
	format tra_1___2 tra_1___2_.;
	format tra_1___3 tra_1___3_.;
	format tra_1___4 tra_1___4_.;
	format tra_1___5 tra_1___5_.;
	format tra_1___6 tra_1___6_.;
	format tra_1___7 tra_1___7_.;
	format tra_1___8 tra_1___8_.;
	format tra_1___9 tra_1___9_.;
	format tra_2___1 tra_2___1_.;
	format tra_2___2 tra_2___2_.;
	format tra_2___3 tra_2___3_.;
	format tra_2___4 tra_2___4_.;
	format tra_2___5 tra_2___5_.;
	format tra_2___6 tra_2___6_.;
	format tra_2___7 tra_2___7_.;
	format tra_2___8 tra_2___8_.;
	format tra_2___9 tra_2___9_.;
	format tra_3___1 tra_3___1_.;
	format tra_3___2 tra_3___2_.;
	format tra_3___3 tra_3___3_.;
	format tra_3___4 tra_3___4_.;
	format tra_3___5 tra_3___5_.;
	format tra_3___6 tra_3___6_.;
	format tra_3___7 tra_3___7_.;
	format tra_3___8 tra_3___8_.;
	format tra_3___9 tra_3___9_.;
	format suc_1___1 suc_1___1_.;
	format suc_1___2 suc_1___2_.;
	format suc_1___3 suc_1___3_.;
	format suc_1___4 suc_1___4_.;
	format suc_1___5 suc_1___5_.;
	format suc_1___6 suc_1___6_.;
	format suc_1___7 suc_1___7_.;
	format suc_2___1 suc_2___1_.;
	format suc_2___2 suc_2___2_.;
	format suc_2___3 suc_2___3_.;
	format suc_2___4 suc_2___4_.;
	format suc_2___5 suc_2___5_.;
	format suc_2___6 suc_2___6_.;
	format suc_2___7 suc_2___7_.;
	format suc_3___1 suc_3___1_.;
	format suc_3___2 suc_3___2_.;
	format suc_3___3 suc_3___3_.;
	format suc_3___4 suc_3___4_.;
	format suc_3___5 suc_3___5_.;
	format suc_3___6 suc_3___6_.;
	format suc_3___7 suc_3___7_.;
	format device_care_observat_v_10 device_care_observat_v_10_.;
	format wound_obs1___1 wound_obs1___1_.;
	format wound_obs1___2 wound_obs1___2_.;
	format wound_obs1___3 wound_obs1___3_.;
	format wound_obs1___4 wound_obs1___4_.;
	format wound_obs1___5 wound_obs1___5_.;
	format wound_obs1___6 wound_obs1___6_.;
	format wound_obs1___7 wound_obs1___7_.;
	format wound_obs1___8 wound_obs1___8_.;
	format wound_obs1___9 wound_obs1___9_.;
	format wound_obs1___10 wound_obs1___10_.;
	format wound_obs1___11 wound_obs1___11_.;
	format wound_obs1___12 wound_obs1___12_.;
	format wound_obs1___13 wound_obs1___13_.;
	format wound_obs1___14 wound_obs1___14_.;
	format wound_obs2___1 wound_obs2___1_.;
	format wound_obs2___2 wound_obs2___2_.;
	format wound_obs2___3 wound_obs2___3_.;
	format wound_obs2___4 wound_obs2___4_.;
	format wound_obs2___5 wound_obs2___5_.;
	format wound_obs2___6 wound_obs2___6_.;
	format wound_obs2___7 wound_obs2___7_.;
	format wound_obs2___8 wound_obs2___8_.;
	format wound_obs2___9 wound_obs2___9_.;
	format wound_obs2___10 wound_obs2___10_.;
	format wound_obs2___11 wound_obs2___11_.;
	format wound_obs2___12 wound_obs2___12_.;
	format wound_obs2___13 wound_obs2___13_.;
	format wound_obs2___14 wound_obs2___14_.;
	format wound_obs3___1 wound_obs3___1_.;
	format wound_obs3___2 wound_obs3___2_.;
	format wound_obs3___3 wound_obs3___3_.;
	format wound_obs3___4 wound_obs3___4_.;
	format wound_obs3___5 wound_obs3___5_.;
	format wound_obs3___6 wound_obs3___6_.;
	format wound_obs3___7 wound_obs3___7_.;
	format wound_obs3___8 wound_obs3___8_.;
	format wound_obs3___9 wound_obs3___9_.;
	format wound_obs3___10 wound_obs3___10_.;
	format wound_obs3___11 wound_obs3___11_.;
	format wound_obs3___12 wound_obs3___12_.;
	format wound_obs3___13 wound_obs3___13_.;
	format wound_obs3___14 wound_obs3___14_.;
	format wound_care_observati_v_11 wound_care_observati_v_11_.;
run;

proc contents data=redcap;

*proc print data=redcap;
*run;

data RIPS.ICAR_sas;
	set redcap;

run;
