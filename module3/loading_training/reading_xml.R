library(XML)
library(httr)

url <- "http://www.w3schools.com/xml/simple.xml"

download.file(url, destfile = "menu.xml")
doc <- xmlTreeParse("menu.xml", useInternalNodes = TRUE)

rootNode <- xmlRoot(doc)
xmlName(rootNode)

