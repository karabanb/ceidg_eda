
#### LIBRAIRES #########################################################################################################

library(devtools)
# install_github('statisticspoland/R_Package_to_API_BDL')
library(tidyverse)
library(bdl)

#### GATHERING DATA ####################################################################################################

subjects <- get_subjects(parentId = 'G203')
variables <- search_variables("", subjectId = 'P2822')

## Number of Natural Persons Conducting Economic Avtivity

no_of_np <- get_data_by_variable(varId = '152710', unitLevel = 0)
no_of_np$val_mln <- round(no_of_self_emp$val/10^6, 2)

## Number of New Entries of Natural Persons Conducting Economic Activity

no_of_new_np <- get_data_by_variable(varId = '153362', unitLevel = 0)

## Number of Removed Entries of Natural Persons Conducting Economic Activity

no_of_rem_np <- get_data_by_variable(varId = '153390', unitLevel = 0)


  
