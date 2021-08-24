# 
# remotes::install_github("mrcaseb/nflfastR")
library(DBI)
library(RSQLite)
library(nflfastR)
library(tidyverse)
library(furrr)
library(Rcpp)

update_db()

connection <- dbConnect(SQLite(), "./pbp_db")
connection
dbListTables(connection)
pbp_db <- dplyr::tbl(connection, "nflfastR_pbp")

# DBI::dbWriteTable(con_dbi, name = "mtcars1", value = mtcars)

#names function to pull from list
c.names <- function(x) {
  x %>% 
    head() %>% 
    as.data.frame() %>% 
    names()
}


#dbDisconnect()




