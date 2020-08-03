library(tidyverse)
library(data.table)

rankall <- function(disease, num = 1) {
  
  rank <- num
  di <- disease
  outcome <<- read.table("outcome-of-care-measures.csv", sep = ",", header = TRUE, 
                         stringsAsFactors = TRUE)
  
  names(outcome) <- gsub('\\.', '_', names(outcome))
  di <- gsub("\\ ", '_', di)

   if (!any(grepl(di, names(outcome), ignore.case = TRUE))){
      stop("disease non existent") 
     }
  
  my_data <- outcome %>% select(contains(c("State","Hospital_Name", di)))
  
  my_data <- my_data[,1:3]
  
  prefinal_df <- my_data[order(as.numeric(as.character(my_data[,3])), my_data[,2]),]
  final_df <- subset(prefinal_df, prefinal_df[,3]!="Not Available")
  names(final_df) <- c("state", "hospital", "rate")
  
  final_df <- final_df[order(final_df$state),]
  
  dt = as.data.table(final_df)
  
  if (num == "best") {
    dt[order(dt$state), list(hospital = hospital[1], best_rate = rate[1]), by=state]
  } else if (num == "worst") {
    dt[order(dt$state), list(hospital = tail(hospital, 1), best_rate = tail(rate, 1)), by=state]
  } else if (num == num) {
    dt[order(dt$state), list(hospital = hospital[num], rate = rate[num]), by=state]
  } else if (num == "") {
    stop("missing rank")
  }
  
}