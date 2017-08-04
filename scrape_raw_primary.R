# Scrape 2016 North Dakota statewide election results
# To modify, just change date, urls, and offices to fit
# Order of urls and offices must match

library(httr)
library(readxl)

nd_save <- function(url, office, date){
  httr::GET(url, httr::write_disk(paste0(date,
                                         "__nd__primary__",
                                         office,
                                         "__precinct.xls"),
                                  overwrite = TRUE))
}

date <- "20160614"

statewide_offices <- c("republican__senate", "democratic__senate", "libertarian__senate",
                       "republican__house", "democratic__house", "libertarian__house",
                       "republican__governor", "democratic__governor", "libertarian__governor",
                       "republican__state_auditor", "democratic__state_auditor", "libertarian__state_auditor",
                       "republican__state_treasurer", "democratic__state_treasurer", "libertarian__state_treasurer",
                       "republican__insurance_commissioner", "democratic__insurance_commissioner", "libertarian__insurance_commissioner")

precinct_urls <- c("http://results.sos.nd.gov/ResultsExport.aspx?rid=9380&osn=110&pty=REP&name=United%20States%20Senator&cat=CTYALL&eid=291", # president
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9380&osn=110&pty=DEM&name=United%20States%20Senator&cat=CTYALL&eid=291", # us_senate
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9380&osn=110&pty=LIB&name=United%20States%20Senator&cat=CTYALL&eid=291", # us_house
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9381&osn=120&pty=REP&name=Representative%20in%20Congress&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9381&osn=120&pty=DEM&name=Representative%20in%20Congress&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9381&osn=120&pty=LIB&name=Representative%20in%20Congress&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9177&osn=220&pty=REP&name=Governor%20and%20Lt.%20Governor&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9177&osn=220&pty=DEM&name=Governor%20and%20Lt.%20Governor&cat=CTYALL&eid=291", # governor
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9177&osn=220&pty=LIB&name=Governor%20and%20Lt.%20Governor&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9178&osn=240&pty=REP&name=State%20Auditor&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9178&osn=240&pty=DEM&name=State%20Auditor&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9178&osn=240&pty=LIB&name=State%20Auditor&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9179&osn=250&pty=REP&name=State%20Treasurer&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9179&osn=250&pty=DEM&name=State%20Treasurer&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9179&osn=250&pty=LIB&name=State%20Treasurer&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9180&osn=270&pty=REP&name=Insurance%20Commissioner&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9180&osn=270&pty=DEM&name=Insurance%20Commissioner&cat=CTYALL&eid=291",
          "http://results.sos.nd.gov/ResultsExport.aspx?rid=9180&osn=270&pty=LIB&name=Insurance%20Commissioner&cat=CTYALL&eid=291")

mapply(nd_save, date = date, url = precinct_urls, office = statewide_offices)


