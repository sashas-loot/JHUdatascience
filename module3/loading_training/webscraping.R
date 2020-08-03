library(httr)


url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

html <- GET(url)
content <- content(html,as="text")
content2 <- htmlParse(content, asText = TRUE)