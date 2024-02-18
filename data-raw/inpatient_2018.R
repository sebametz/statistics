# 5) Create a new dataset within your statistical package called inpatient_2018
# which consists of the pt_id, admission date & discharge date for all records
# from the inpatient_main table with an admission or discharge date in 2018.
# Order it by admission date.

library(tidyverse)

load("data/inpatient_main.rda")

inpatient_2018 <- inpatient_main |>
  filter( year(admidate) == 2018| year(disdate) == 2018) |>
  arrange(admidate)

# save(inpatient_2018, file = "data/inpatient_2018.rda")

usethis::use_data(inpatient_2018, overwrite = TRUE)
