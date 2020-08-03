library(httr)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# download.file(url, destfile = "housing_idaho.csv", method = "curl")

my_data <- read.csv("housing_idaho.csv")

high_prices <- subset(my_data, my_data[,"VAL"] == 24)

url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

# download.file(url2, destfile = "ngas_acq.xlsx", method = "curl")

dat <- read_excel("ngas_acq.xlsx", col_names = TRUE, range = "F18:O23")

quiz <- sum(dat$Zip*dat$Ext,na.rm=T)

url3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

# data <- xmlTreeParse("restaurants.xml", useInternalNodes = TRUE)

# rootNode <- xmlRoot(data)

url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

data <- fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

print(system.time({data[, mean(pwgtp15), by=SEX]}))
print(system.time({mean(data$pwgtp15,by=data$SEX)}))
print(system.time({tapply(data$pwgtp15,data$SEX,mean)}))
print(system.time({mean(data[data$SEX==1,]$pwgtp15); mean(data[data$SEX==2,]$pwgtp15)}))
print(system.time({sapply(split(data$pwgtp15,data$SEX),mean)}))
