# Program Name:  County_specific_ad hoc_response
# Author:        Mikhail Hoskins
# Edits:        
# Date Created:  01/23/2026
# Date Modified: 01/25/2026
# Description:   ---- specific to ---- School metrics.
#
#
# Inputs:       uses the linelist_final from Measles_metrics_25_26 and merges with exposure sites 
#        
#
#
#
# Output:       none/tblsummary
# Notes:        Use extract with LABELS, ex: THISISDATAWITH_**LABELS**.csv
#               
#
#               Annotations are at # (between /* in SAS) to help guide.


# Confine to only what we need for School specific analysis
exp_sites <- working_redcap |> 
    select(Record.ID, Repeat.Instrument, Name.of.location.where.exposure.occurred, Date.of.interview) |> 
    
    filter(Repeat.Instrument %in% c("Exposure Site")) 


# Rename and filter to specific school
spec_schl_exp <- exp_sites |>
    rename(exp_location = Name.of.location.where.exposure.occurred)|>
    filter(exp_location %in% c("***ENTER SCHOOL/FACILITY/INVESTIGATION SITE NAME"))  

#SQL merge for time
spec_merge <- sqldf("
    select
        a.*,
        b.exp_location
        
    from linelist_final a right join spec_schl_exp b
            on a.`Record.ID` = b.`Record.ID`
                    ")
# Make the interview date variable 'Missing' instead of NA for the table so we can look at what count and pct are missing

spec_merge <- spec_merge |>
    mutate(week_int = forcats::fct_explicit_na(
            factor(week_int),
            na_level = "Missing"))


location_sumstats <- spec_merge |>
    select(exp_location, interview_stat_new, immunity, ltfu_new, quarantine, curr_quarantined, active_mon, curr_active_mon, responding_county_final, week_int) |>
    tbl_summary(by = responding_county_final, missing = "no", type = list(ltfu_new~ "categorical"),
                label = list(
                    exp_location ~ "Exposure Location",
                    interview_stat_new ~ "Status of interview",
                    immunity ~ "Up to date immunity status",
                    ltfu_new ~ "Lost to follow-up",
                    quarantine ~ "Quarantined total",
                    curr_quarantined ~ "Currently quarantined",
                    active_mon ~ "Active monitoring total",
                    curr_active_mon ~ "Currently in active monitoring",
                    week_int ~ "Week of Interview"))


# Title
location_sumstats <- location_sumstats %>%
    modify_caption("Summary Stats ***LOCATION*** Cont. Trace")

location_sumstats

