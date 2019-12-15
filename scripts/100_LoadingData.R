
#### LIBRAIRES #########################################################################################################

library(devtools)
# install_github('statisticspoland/R_Package_to_API_BDL')
library(tidyverse)
library(bdl)

#### GATHERING DATA ####################################################################################################

subjects <- get_subjects(parentId = 'G203')
variables <- search_variables("", subjectId = 'P3254')


no_of_self_emp <- get_data_by_variable(varId = '390996', unitLevel = 0)
no_of_self_emp$val_mln <- round(no_of_self_emp$val/10^6, 2)

#### PLOTS #############################################################################################################

opacity = 0.6
color = 'darkblue'

ggplot(no_of_self_emp, aes(year, val_mln)) +
  geom_col(alpha = opacity, fill = color) +
  geom_text(aes(label =val_mln), vjust = 2, color = 'white', size = 3) +
  scale_y_continuous(labels = scales::number) +
  ylab('Natural Persons') +
  xlab('Year') +
  theme_bw()
