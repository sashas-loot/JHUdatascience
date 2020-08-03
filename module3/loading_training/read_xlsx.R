library(XLConnect)
library(rJava)

tmp = tempfile(fileext = ".xlsx")
url <- "http://185.223.104.6/data/norderstedt/einwohnerzahlen_2010.xlsx"

data <- download.file(url, destfile = tmp, method = "curl", mode = "wb")

my_data <- readWorksheetFromFile(file = tmp, sheet = "GermanyPopulationData2010", header = TRUE)