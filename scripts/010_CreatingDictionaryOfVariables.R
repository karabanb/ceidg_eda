
#### LIBRAIRES #########################################################################################################

library(devtools)
# install_github('statisticspoland/R_Package_to_API_BDL')
library(tidyverse)
library(bdl)

options(bdl.api_private_key = "5ad46533-33c8-4678-4466-08d7a8e15899")

#### CREATING DICTIONARY OF BDL VARIABLES ##############################################################################


df_subjects <- get_subjects() 

df_subjects <- df_subjects %>%
  unnest(cols = 'children')

## -------------------------------

df_subjects_child = data.frame() 
n = 1

for (Id in df_subjects$children) {
  
  subject_child <- get_subjects(Id)
  df_subjects_child = bind_rows(df_subjects_child, subject_child)
  
  print(paste(Id, n, '/', nrow(df_subjects)))
  Sys.sleep(20)
  
}


## -------------------------------


df_variables = data.frame()
n = 1

for (variables in id_to_collect) {
  
  variable = get_variables(variables)
  df_variables = bind_rows(df_variables, variable)
  
  print(paste(variables, ': ', n, '/', length(id_to_collect)))
  n <- n+1
  
  Sys.sleep(30)
}


