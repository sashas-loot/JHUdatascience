library(RMySQL)
library(DBI)

# connect to mysql server with access strings
# ucscDB <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")

# mysql command "show databases;" on ucscDB
# disconnect from server after you finished loading data
# result <- dbGetQuery(ucscDB, "show databases;"); dbDisconnect(ucscDB);

# specify db you want to access
hg19 <- dbConnect(MySQL(), user="genome", db = "hg19", host="genome-mysql.cse.ucsc.edu")

# get names of tables
allTables <- dbListTables(hg19)

# get fields of one table
fields <- dbListFields(hg19, "affyU133Plus2")

# how many rows in this table
rows <- dbGetQuery(hg19, "select count(*) from affyU133Plus2")

# read table from db 
# hg19_table <- dbReadTable(hg19, "affyU133Plus2")

# read subset from db without having to read everything
hg19_subset <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affy_mis <- fetch(hg19_subset); quantile(affy_mis$misMatches)

# fetching smaller dataframes and clearing result of query 
affyMisSmall <- fetch(hg19_subset, n=10); dbClearResult(hg19_subset);
