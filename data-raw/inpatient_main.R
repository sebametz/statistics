library(tidyverse)

inpatient_main <- read_csv("data-raw/inpatient_main.csv",
                     col_types = cols(
                       admidate = col_date(format = "%d/%m/%Y"),
                       disdate = col_date(format = "%d/%m/%Y")
                     ), show_col_types = FALSE)

# write_csv(baseline, "data-raw/inpatient_main.csv")
# save(inpatient_main, file = "data/inpatient_main.rda")

usethis::use_data(inpatient_main, overwrite = TRUE)
