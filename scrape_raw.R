# Scrape 2016 North Dakota statewide election results
# To modify, just change date, urls, and offices to fit
# Order of urls and offices must match

library(httr)
library(readxl)

nd_save <- function(url, office, date){
  httr::GET(url, httr::write_disk(paste0(date,
                                         "__nd__general__",
                                         office,
                                         "__precinct.xls"),
                                  overwrite = TRUE))
}

date <- "20161108"

statewide_offices <- c("president", "us_senate", "us_house", "governor", "state_auditor", "state_treasurer")

precinct_urls <- c("http://results.sos.nd.gov/ResultsExport.aspx?rid=10696&osn=100&pty=&name=President%20&%20Vice-President%20of%20the%20United%20States&cat=CTYALL", # president
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=10685&osn=110&pty=&name=United%20States%20Senator&cat=CTYALL", # us_senate
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=10635&osn=120&pty=&name=Representative%20in%20Congress&cat=CTYALL", # us_house
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=10610&osn=220&pty=&name=Governor%20and%20Lt.%20Governor&cat=CTYALL", # governor
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=10636&osn=240&pty=&name=State%20Auditor&cat=CTYALL", # state_auditor
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=10683&osn=250&pty=&name=State%20Treasurer&cat=CTYALL") # state_treasurer

mapply(nd_save, date = date, url = precinct_urls, office = statewide_offices)


