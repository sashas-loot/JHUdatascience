library(tidyverse)

best <- function(state, disease) {
  
  di <<- disease
  di <<- sub(" ", "_", di)
  names(outcome) <- gsub('\\.', '_', names(outcome))
  
  if (state %in% outcome$State && any(grepl(di, names(outcome), ignore.case = TRUE))) {

    print(paste("searching", "for", "best", "hospital", "for", di, "in", state))
    my_state <- outcome[outcome$State == state,]
    my_data <- my_state %>% select(contains(c( "Hospital_Name", di)))
    prefinal <- my_data[,1:2]
    final <<- with(prefinal, prefinal[order((as.numeric(prefinal[,2])),prefinal[,1]),])
    print(final[1,1])
    
  } else if (state %in% outcome$State && !any(grepl(di, names(outcome), ignore.case = TRUE))) {
    
    stop("invalid outcome")
    
  } else if (!state %in% outcome$State && any(grepl(di, names(outcome), ignore.case = TRUE))) {
    
    stop("invalid state")
    
  } else {
    
    stop("invalid state and outcome")
    
  }
  
  
  
}