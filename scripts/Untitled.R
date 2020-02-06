
devtools::install_github("wesm/feather/R")

library(feather)
library(mlr)
library(tidyverse)
library(rpart)
library(rpart.plot)
library(factorMerger)
library(h2o)

ceidg_data = read_feather('PycharmProjects/CEIDG/results/ceidg_data.feather')

ceidg_data = ceidg_data %>%
  select(
    -index,
    -NIP,
    -MainAddressCounty,
    -MainAddressVoivodeship) %>%
  mutate_if(is.character, as.factor) %>%
  mutate_at(c('IsPhoneNo',
              'IsEmail',
              'IsFax',
              'IsWWW',
              'HasPolishCitizenship',
              'ShareholderInOtherCompanies'), as.logical) %>%
  #rename(id = index) %>%
  as.data.frame()

write.csv(ceidg_data, 'ceidg_eda/data/ceidg_sample.csv',row.names = FALSE)

merged = mergeFactors(response = as.factor(ceidg_data$Survived),
                      factor = ceidg_data$PKDMainDivision,
                      family = 'binomial',
                      method = 'fast-adaptive')


save(ceidg_data, file = 'ceidg_eda/data/ceidg_data.RData')

ceidg_data %>%
  group_by(PKDMainSection) %>%
  summarise(avg_success = mean(Survived), n = n()) %>%
  arrange(-avg_success)

h2o.init()

df <- h2o.importFile("ceidg_eda/data/ceidg_sample.csv")

# h2o.describe(df)



splits <- h2o.splitFrame(df, ratios = 0.8, seed = 42)

train <- splits[[1]]
test <- splits[[2]]

y <- "Survived"

train[, y] = as.factor(train[, y])
train[, 'PKDMainDivision'] <- as.factor(train[, 'PKDMainDivision'])
train[, 'PKDMainGroup'] <- as.factor(train[, 'PKDMainGroup'])
train[, 'PKDMainClass'] <- as.factor(train[, 'PKDMainClass'])

test[, y] = as.factor(test[, y])
test[, 'PKDMainDivision'] <- as.factor(test[, 'PKDMainDivision'])
test[, 'PKDMainGroup'] <- as.factor(test[, 'PKDMainGroup'])
test[, 'PKDMainClass'] <- as.factor(test[, 'PKDMainClass'])



test_df <- as.data.frame(test)

aml <- h2o.automl(y = y,
                  training_frame = train,
                  # validation_frame  = train,
                  leaderboard_frame = test,
                  max_runtime_secs = 600,
                  seed = 24,
                  balance_classes = TRUE)


