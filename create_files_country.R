rm(list = ls())

results_directory_gh<- "https://github.com/thaispaiva/app_COVID19/tree/master/STpredictions/"
results_directory<- paste0(getwd(), "/results/")

source(paste0(results_directory,'country_functions.R'))

### Loading necessary packages
require(httr)
require(chron)
require(dplyr)

### List of all countries
set_countries<- c("Brazil") 

for(i in 1:length(set_countries)){
  tryCatch({
    file_country<-create_file_country(set_countries[i])
    
    saveRDS(file_country,file=paste0(results_directory,'file_',set_countries[i],'.RDS'))},
    finally=print(set_countries[i])
  )
}
