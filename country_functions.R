read_confirmed_cases<-function(country){
  baseURL_confirmed<- paste0("https://github.com/thaispaiva/app_COVID19/blob/master/STpredictions/",
                             country,
                             "_n.rds?raw=true")
  results_countries_confirmed_state<- readRDS(file=url(baseURL_confirmed))
  
  return(results_countries_confirmed_state)
}

read_death_cases<-function(country){
  baseURL_deaths<- paste0("https://github.com/thaispaiva/app_COVID19/blob/master/STpredictions/", 
                          country,
                          "_d.rds?raw=true")
  results_countries_deaths_state<- readRDS(file=url(baseURL_deaths))
  return(results_countries_deaths_state)
}

create_file_country<-function(country){
  file_country<-list()
  file_country$country<-country
  
  confirmed_cases<-read_confirmed_cases(country)
  death_cases<-read_death_cases(country)
  
  file_country$confirmed<-list()
  
  file_country$death<-list()
  
  ##median
  
  cols<-c('date','med')
  
  new_names<-setNames(cols, c('date',as.character(Sys.Date())))
  
  file_country$confirmed$short_term$median<-confirmed_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$long_term$median<-confirmed_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$short_term$median<-death_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$long_term$median<-death_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  #q25
  cols<-c('date','q25')
  
  new_names<-setNames(cols, c('date',as.character(Sys.Date())))
  
  file_country$confirmed$short_term$q25<-confirmed_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$long_term$q25<-confirmed_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$short_term$q25<-death_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$long_term$q25<-death_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  #q25
  cols<-c('date','q975')
  
  new_names<-setNames(cols, c('date',as.character(Sys.Date())))
  
  file_country$confirmed$short_term$q975<-confirmed_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$long_term$q975<-confirmed_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$short_term$q975<-death_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$long_term$q975<-death_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  
  return(file_country)
}

upload_median<-function(file_country,confirmed_cases,death_cases){
  cols<-c('date','med')
  
  new_names<-setNames(cols, c('date',as.character(Sys.Date())))
  
  df_new<-confirmed_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$short_term$median<-
    file_country$confirmed$short_term$median%>%full_join(df_new,by='date')
  
  df_new<-confirmed_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$long_term$median<-
    file_country$confirmed$long_term$median%>%full_join(df_new,by='date')
  
  df_new<-death_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$short_term$median<-
    file_country$death$short_term$median%>%full_join(df_new,by='date')
  
  df_new<-death_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$long_term$median<-
    file_country$death$long_term$median%>%full_join(df_new,by='date')
  
  return(file_country)
}

upload_q25<-function(file_country,confirmed_cases,death_cases){
  cols<-c('date','q25')
  
  new_names<-setNames(cols, c('date',as.character(Sys.Date())))
  
  df_new<-confirmed_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$short_term$q25<-
    file_country$confirmed$short_term$q25%>%full_join(df_new,by='date')
  
  df_new<-confirmed_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$long_term$q25<-
    file_country$confirmed$long_term$q25%>%full_join(df_new,by='date')
  
  df_new<-death_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$short_term$q25<-
    file_country$death$short_term$q25%>%full_join(df_new,by='date')
  
  df_new<-death_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$long_term$q25<-
    file_country$death$long_term$q25%>%full_join(df_new,by='date')
  
  return(file_country)
}

upload_q975<-function(file_country,confirmed_cases,death_cases){
  cols<-c('date','q975')
  
  new_names<-setNames(cols, c('date',as.character(Sys.Date())))
  
  df_new<-confirmed_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$short_term$q975<-
    file_country$confirmed$short_term$q975%>%full_join(df_new,by='date')
  
  df_new<-confirmed_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$confirmed$long_term$q975<-
    file_country$confirmed$long_term$q975%>%full_join(df_new,by='date')
  
  df_new<-death_cases$df_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$short_term$q975<-
    file_country$death$short_term$q975%>%full_join(df_new,by='date')
  
  df_new<-death_cases$lt_predict%>%
    select(cols)%>%
    rename(new_names)
  
  file_country$death$long_term$q975<-
    file_country$death$long_term$q975%>%full_join(df_new,by='date')
  
  return(file_country)
}

upload_country<-function(file_country){
  
  country<-file_country$country
  
  confirmed_cases<-read_confirmed_cases(country)
  
  death_cases<-read_death_cases(country)
  
  file_country<-upload_median(file_country,confirmed_cases,death_cases)
  
  file_country<-upload_q25(file_country,confirmed_cases,death_cases)
  
  file_country<-upload_q975(file_country,confirmed_cases,death_cases)
  
  return(file_country)
}
