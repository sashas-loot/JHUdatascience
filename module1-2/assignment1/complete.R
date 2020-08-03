complete <- function(directory, id=1:332){
      
      df <- data.frame(id = numeric(0), nobs = numeric(0))
      
      for (i in id) {
        path = paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
        my_data <- read.csv(path)
        nobs = sum(complete.cases(my_data))
        newrow = data.frame(id=i, nobs=nobs)
        df <- rbind(df, newrow)
      }
      
      df
}

