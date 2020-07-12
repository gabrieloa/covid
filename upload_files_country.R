rm(list = ls())

results_directory<- paste0(getwd(), "/results/")

source(paste0(results_directory,'country_functions.R'))

### Loading necessary packages
require(httr)
require(chron)
require(dplyr)

set_countries<- c("Argentina", "Australia", "Belgium", "Bolivia", "Brazil", 
                  "Canada", "Chile", "China", "Colombia", "Ecuador", "France",
                  "Germany", "Greece", "India", "Ireland", "Italy", "Japan", 
                  "Korea,-South", "Mexico", "Netherlands","New-Zealand", 
                  "Norway", "Peru", "Paraguay", "Poland", "Portugal", "Russia",
                  "South-Africa", "Spain","United-Kingdom", "Uruguay", "Sweden",
                  "Switzerland", "US", "Turkey", "Venezuela") 

for(i in 1:length(set_countries)){
  file_country<-readRDS(paste0(results_directory,'file_',set_countries[i],'.RDS'))
  file_country<-upload_country(file_country)
  saveRDS(file_country,file=paste0(results_directory,'file_',set_countries[i],'.RDS'))
}
