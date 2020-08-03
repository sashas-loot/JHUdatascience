library(data.table)

pollutantmean <- function(directory, pollutant, id=1:332){
    
    means <- c()
  
    for (monitor in id)  {      
        path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
        file <- read.csv(path)
        my_data <- file[pollutant]
        means <- c(means, my_data[!is.na(my_data)])
        }
    
    mean(means)
  
}


