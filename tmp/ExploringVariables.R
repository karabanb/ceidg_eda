
library(bdl)

sub = get_subjects()

subjects = unnest(sub,cols = 'children') %>%
  unnest(cols = 'levels') %>%
  filter(levels == 6) %>%
  select(name, children)

bdl::get_subjects('G172') %>% unnest('levels')

df = data.frame()

for (sub in subjects$children){
  l = get_subjects(sub)
  df = rbind(df, l)
  print(sub)
  Sys.sleep(10)
  }
  
df_unnested <- unnest(df, levels)

df_vars = data.frame()
n = 137

for (subject in df_unnested$id[138:nrow(df_unnested)]){
  var = get_variables(subject)
  df_vars = bind_rows(df_vars, var)
  n = n +1
  print(subject)
  print(paste(n, 'of', nrow(df_unnested)))
  Sys.sleep(10)
}

p1411_6_2016 = get_variables('P1411',unitLevel = 6,year = 2016)
