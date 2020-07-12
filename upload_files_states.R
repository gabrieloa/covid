rm(list = ls())

results_directory<- paste0(getwd(), "/results/")

source(paste0(results_directory,'states_functions.R'))

### Loading necessary packages
require(httr)
require(chron)
require(dplyr)

set_states<- c("AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO",
               "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR",
               "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO")

for(i in 1:length(set_states)){
  file_country<-readRDS(paste0(results_directory,'file_',set_states[i],'.RDS'))
  file_country<-upload_country(file_country)
  saveRDS(file_country,file=paste0(results_directory,'file_',set_states[i],'.RDS'))
}
