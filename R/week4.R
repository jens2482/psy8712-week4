# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim ('../data/week4.dat', delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(import_tbl)
wide_tbl <- separate(import_tbl, qs, into = c("q1", "q2", "q3", "q4","q5"), sep = "-")
wide_tbl [, 5:9] <- sapply(wide_tbl[, 5:9],as.integer)
wide_tbl$datadate <- as.POSIXct(wide_tbl$datadate, format = "%b %d %Y, %H:%M:%S") 
wide_tbl [, 5:9] <- mutate_all(wide_tbl[, 5:9],~str_replace_all(as.character(.), "0", "NA"))
wide_tbl <- subset(wide_tbl, q2 != "NA")
long_tbl <- pivot_longer (wide_tbl, cols = starts_with ("q"), names_to = "question", values_to = "response" )