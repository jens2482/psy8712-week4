# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim ('../data/week4.dat', delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(import_tbl)
wide_tbl <- separate(import_tbl, qs, into = c("q1", "q2", "q3", "q4"), sep = "-")
wide_tbl [, 5:8] <- sapply(wide_tbl[, 5:8],as.integer)
wide_tbl$datadate <- as.POSIXct (wide_tbl$datadate, format = "%b %d, %Y HH:MM:SS") 