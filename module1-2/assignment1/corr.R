corr <- function(directory, threshold = 0){

  cor_results <- numeric(0)
  
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  
  if(nrow(complete_cases)>0){
    for(monitor in complete_cases$id){
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
      monitor_data <- read.csv(path)
      my_data <- monitor_data[(!is.na(monitor_data$sulfate)) & 
                                      (!is.na(monitor_data$nitrate)), ]
      sulfate_data <- my_data["sulfate"]
      nitrate_data <- my_data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results
}