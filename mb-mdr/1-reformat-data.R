# Get data from simulated-data
# Move 'Class' to first column
# Put these files in reformated-data

library(dplyr)
library(data.table)

data_dir <- here::here('data')
filename <- list.files(data_dir, pattern = '*.txt')
tail(colnames(mydat))
mydat <- paste(data_dir, filename, sep = '/') %>%
  fread() %>%
  dplyr::select(phenotype, everything()) %>%
  replace(., is.na(.), -9) # recode NAs as -9 for MB-MDR

mydat %>%
  fwrite(here::here('mb-mdr', 'reformatted-data', filename), sep = '\t')
