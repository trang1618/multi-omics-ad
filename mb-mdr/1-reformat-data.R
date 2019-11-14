# Get data from simulated-data
# Move 'Class' to first column
# Put these files in reformated-data

library(dplyr)
library(data.table)

data_dir <- here::here('data')
# filename <- list.files(data_dir, pattern = '*.txt')
filenames <- list.files(data_dir, pattern = '*.csv')

for (filename in filenames) {
  paste(data_dir, filename, sep = '/') %>%
    fread() %>%
    select(phenotype, everything()) %>%
    select(-ID) %>%
    replace(., is.na(.),-9) %>% # recode NAs as -9 for MB-MDR
    fwrite(here::here(
      'mb-mdr', 
      'reformatted-data', 
      gsub('.csv', '.txt', filename)), sep = '\t') 
}


# outcomes <- paste(data_dir, fileout, sep = '/') %>%
#   fread() %>%
#   dplyr::select(phenotype, everything())

# mydat %>%
#   fwrite(here::here('mb-mdr', 'reformatted-data', filename), sep = '\t')
