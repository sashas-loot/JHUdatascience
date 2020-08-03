source("best.R")
library(tidyverse)

rankhospital <- function(state, disease, num) {
  
  outcome <- read_csv("outcome-of-care-measures.csv")
  rank <- num
  di <<- disease
  
  if (num == "best") {
    
    best(state, disease)
    
  } else if (num == "worst") {
    
    my_state <- outcome[outcome$State == state,]
    my_data <- my_state %>% select(contains(c( "Hospital Name", di)))
    prefinal <- my_data[,1:2]
    final <- with(prefinal, prefinal[order(as.numeric(unlist(prefinal[,2])),prefinal[,1], 
                                           decreasing = TRUE),])
    print(final[1,1])
    
  } else if (num == rank) { 
    
    my_state <- outcome[outcome$State == state,]
    my_data <<- my_state %>% select(contains(c("Hospital Name", di)))
    prefinal <- my_data[,1:2]
    final <- with(prefinal, prefinal[order(as.numeric(unlist(prefinal[,2])),prefinal[,1]),])
    print(final[num,1])
    
  }
    
    
    
}