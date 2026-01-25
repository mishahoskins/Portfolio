# 
#   *------------------------------------------------------------------------------
#  Program Name:  Medicare_ptD_analysis_viz.R
# Author:        Mikhail Hoskins
# Date Created:  10/21/2025
# Date Modified: 
#  Description:   Visualizations using analysis_medd.sas7bdat
# 				  				  
# 
#  Inputs:       C:\Data\Medicare Part D: working directory
#  Output:       
#  Notes:        
# 					
# ------------------------------------------------------------------------------
#  

install.packages("quantreg")
install.packages("scales")
install.packages("dplyr")


library(quantreg)
library(ggplot2)
library(haven)
library(scales)
library(dplyr)

analysis_medd <- read_sas("analysis_medd.sas7bdat", 
                          NULL)
View(analysis_medd)

#Some filters for plots

analysis_medD_filtered_plots <- analysis_medd %>%
filter(abx_tot_clms >= 10) %>%                     # filter rows
  mutate(
    den_binary_char = case_when(                        # create new character variable
      density_binary == 0 ~ "Non rural",
      density_binary == 1 ~ "Rural",
      TRUE ~ NA_character_                          
    )
  )

#create mean and median layers for density binary and specialty type
means_density_bin <- aggregate(rate ~  den_binary_char, analysis_medD_filtered_plots, mean)
med_density_bin <- aggregate(rate ~  den_binary_char, analysis_medD_filtered_plots, median)

means_type <- aggregate(rate ~  type_new, analysis_medD_filtered_plots, mean)
medians_type <- aggregate(rate ~  type_new, analysis_medD_filtered_plots, median)



#Plot #1: rurality binary
ggplot(data=subset (analysis_medD_filtered_plots, !is.na(den_binary_char)), aes(x = den_binary_char, y = rate)) +
  geom_boxplot(outlier.shape = NA, fill = "#C1CDCD", color = "black", alpha = 0.7, fatten = NULL) + 
  labs(x = "Population density of practice location", y = "Antibiotic prescribing rate per 1,000 beneficiaries", title = "Antibiotic prescribing rate and IQR by population density, North Carolina 2018–2023") +
  
  stat_summary( fun = mean,  geom = "point", shape = 20, size = 2.5,  color = "black", stroke = 0.5) +
    stat_summary(fun= median, geom = "crossbar", linetype = "dashed", linewidth=.1) +
  
  geom_text(data = means_density_bin, size=3, aes(label = scales::label_number(accuracy = 0.1)(rate), y = rate + 50)) +
    geom_text(data = med_density_bin, size=3, aes(label = scales::label_number(accuracy = 0.1)(rate), y = rate - 50)) +
  
  scale_y_continuous(limits = c(0, 2000)) +
  theme_minimal(base_size = 11) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  
    panel.grid.major.x = element_blank(),
    axis.title = element_text(face = "bold", size = 9),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold", hjust = 0.5, size = 10))





#Plot #2 specialty type
ggplot(analysis_medD_filtered_plots, aes(x = type_new, y = rate)) +
  geom_boxplot(outlier.shape = NA, fill = "#C1CDCD", color = "black", alpha = 0.7, fatten = NULL) +
  labs(x = "Specialty", y = "Antibiotic prescribing rate per 1,000 beneficiaries", title = "Antibiotic prescribing rate and IQR by specialty type, North Carolina 2018–2023") +
  
  stat_summary( fun = mean,  geom = "point", shape = 20, size = 2.5,  color = "black", stroke = 0.5) +
  
  stat_summary(fun= median, geom = "crossbar", linetype = "dashed", linewidth=.1) +
  
  geom_text(data = means_type, size=3, aes(label = scales::label_number(accuracy = 0.1)(rate), y = rate + 50)) +
  
  geom_text(data = medians_type, size=3, aes(label = scales::label_number(accuracy = 0.1)(rate), y = rate - 50)) +
  
  scale_y_continuous(limits = c(0, 2000)) +
  theme_minimal(base_size = 11) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  
    panel.grid.major.x = element_blank(),
      axis.title = element_text(face = "bold", size = 9),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold", hjust = 0.5, size = 10))







# Quick filters
analysis_medD_filtered <- subset(
  analysis_medd,
  p90_flag_spec != 1 & abx_tot_clms >= 10
)

#  Kruskal-Wallis test for more than two  (density categories). Don't need this for initial analysis
#KW_result <- kruskal.test(rate ~ density_cat, data = analysis_medD_filtered)
#print(KW_result)

#  Wilcoxon test for binary (density binary)
wilcoxon_result <- wilcox.test(rate ~ density_binary, data = analysis_medD_filtered)
print(wilcoxon_result)



# Quantile regression
model_test <- rq(rate ~ density_binary, data = analysis_medD_filtered, tau = c(0.1, 0.5, 0.9))
print(model_test)





