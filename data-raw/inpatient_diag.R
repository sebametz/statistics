library(tidyverse)

inpatient_diag <- read_csv("data-raw/inpatient_diag.csv",
                          show_col_types = FALSE)

# write_csv(baseline, "data-raw/inpatient_main.csv")
# save(inpatient_diag, file = "data/inpatient_diag.rda")

usethis::use_data(inpatient_diag, overwrite = TRUE)
