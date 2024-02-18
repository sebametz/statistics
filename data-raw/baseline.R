library(tidyverse)

baseline <- read_csv("data-raw/baseline.csv",
                 col_types = cols(
                   dob = col_date(format = "%d/%m/%Y"),
                   rec_date = col_date(format = "%d/%m/%Y"),
                   wd_date = col_date(format = "%d/%m/%Y")
                 ), show_col_types = FALSE)

# write_csv(baseline, "data-raw/baseline.csv")
# save(baseline, file = "data/baseline.rda")

usethis::use_data(baseline, overwrite = TRUE)
