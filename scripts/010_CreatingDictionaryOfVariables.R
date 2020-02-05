
#### LIBRAIRES #########################################################################################################

# library(devtools)
# install_github('statisticspoland/R_Package_to_API_BDL')
library(tidyverse)
library(bdl)

options(bdl.api_private_key = "5ad46533-33c8-4678-4466-08d7a8e15899")

#### CREATING DICTIONARY OF BDL VARIABLES ##############################################################################


## -- Dictionary of groups

df_categories <- get_subjects() 

# df_groups <- df_categories %>%
#   unnest(cols = 'children')

## -- Dictionary of groups

groups_ids = unlist(df_categories$id)
df_groups = data.frame()

for (id in groups_ids) {
  group = get_subjects(id)
  df_groups = bind_rows(df_groups, group)
  
  Sys.sleep(1)
}


## Dictionary of subgroups -------------------------------

subgroups_ids = unlist(df_groups$children)

df_subgroups = data.frame() 
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

for (variables in df_subjects_child$id) {
  
  variable = get_variables(variables)
  df_variables = bind_rows(df_variables, variable)
  
  print(paste(variables, ': ', n, '/', nrow(df_subjects_child)))
  n <- n+1
  
  Sys.sleep(30)
}

## --------------------------------

# save(df_subjects, df_subjects_child, df_variables, file = 'data/010_CategoriesAndVariables.RData')

bdl_dictionary = df_subjects %>%
  inner_join(df_subjects_child, by = c('children' = 'parentId')) %>%
  inner_join(df_variables ,by = c('id.y' = 'subjectId')) %>%
  rename(kategoria = name.x,
         id_kategoria = id.x,
         )

  


