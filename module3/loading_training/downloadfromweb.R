setwd("~/Desktop/r/module3/loading_training/")

url <- "https://opendata.zitsh.de/data/zit/Statusliste_Schulen_2020-03-01.csv"
download.file(url , destfile = "statuslisteSchulen.csv", method = "curl")
dowloadDate <- date()

schulen_data <- read.table("statuslisteSchulen.csv", sep = "\t", header = TRUE, fill = TRUE)