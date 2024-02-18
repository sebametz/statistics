
#' 2) Return number of discharged patient
#'
#' @return A string with number of discharged patient
#' @export
#'
#' @examples
#' library(dplyr)
#' data("inpatient_main")
#' discharged()

discharged <- function(){
  # load("data/inpatient_main.rda")
  sprintf("There is/are %i record(s) with no discharge date in inpatient_main", sum(is.na(inpatient_main$disdate)))

}

#'3) Return smith list
#' @return A tibble data
#' @export
#'
#' @examples
#' library(dplyr)
#' library(stringr)
#' data("baseline")
#' df <- return_smith_list()

return_smith_list <- function() {
  # load("data/baseline.rda")
  smith_list <- baseline |>
    filter(sname == "Smith", sex == 0) |>
    mutate(full_name = str_c(fname, sname, sep = " "),
           withdrawal_status = if_else(wd_stat == 1, "withdrawn", "in study")) |>
    select(pt_id, full_name, withdrawal_status) |>
    arrange(withdrawal_status) |>
    group_by(withdrawal_status) |>
    arrange(pt_id, .by_group = T)

  return(smith_list)
}

#'4) Export smith list
#'
#' @param output_path path to output. Default = "."
#'
#' @return Write the smith list into a tsv file smit_list.tsv
#' @export
#'
#' @examples
#' library(dplyr)
#' library(stringr)
#' library(readr)
#' data("baseline")
#' write_smith_list(output_path = tempdir())
write_smith_list <- function(output_path = ".") {

  if(!dir.exists(output_path)) stop(sprintf("dir %s does not exist", output_path))

  smith_list <- statistics::return_smith_list()
  write_tsv(smith_list, file = file.path(output_path, "smith_list.tsv"), col_names = F)
}

#' 6) Duration of each admission.
#'
#' @return A tibble with a duation of hospitalisations
#' @export
#'
#' @examples
#' library(dplyr)
#' data("baseline")
#' data("inpatient_2018")
#' return_inpatient_2018_dur()
return_inpatient_2018_dur <- function(){
  # load("data/inpatient_2018.rda")
  data <- inpatient_2018 |>
    mutate(duration = difftime(disdate, admidate, units = "days"))
  return(data)
}

#' 7) Barplot frequencies
#'
#' @return A barplot of frequencies of patient hospitalisations days
#' @export
#'
#' @examples
#' library(dplyr)
#' data("baseline")
#' data("inpatient_main")
#' data("inpatient_diag")
#' data("inpatient_2018")
#' plot_freqs()
plot_freqs <- function() {
  data <- statistics::return_inpatient_2018_dur()
  freqs <- table(as.numeric(data$duration))
  barplot(freqs,
               legend.text = "Days of patient hospitalisation",
               ylab = "# of patients",
               xlab = "# of days")
}

#' first asthma record
#'
#' @return A tibble with the first hospitalisation record because of J45
#' @export
#'
#' @examples
#' library(dplyr)
#' library(stringr)
#' data("inpatient_diag")
#' data("inpatient_main")
#' df <- return_first_asthma
return_first_asthma <-  function(){
  # load("data/inpatient_diag.rda")
  # load("data/inpatient_main.rda")
  data <- inpatient_diag |>
    filter(str_detect(diag_icd10, "J45"), level %in% c(1,2)) |>
    left_join(inpatient_main) |>
    arrange(admidate) |>
    select(pt_id, admidate) |>
    distinct(pt_id, .keep_all = T)
  colnames(data)[2] <- "first_diag_date"
  return(data)
}

#' 9) Types of diagnostics
#'
#' @return Create a dataset called first_asthma_2
#' @export
#'
#' @examples
#' library(dplyr)
#' library(stringr)
#' data("baseline")
#' data("inpatient_main")
#' data("inpatient_diag")
#' df <- return_first_asthma_2()
return_first_asthma_2 <- function(){
  # load("data/baseline.rda")
  data <- statistics::return_first_asthma() |>
    left_join(baseline) |>
    mutate(type = if_else(difftime(rec_date, first_diag_date, units = "days") > 0,
                          "prevalent", "incident"))
  return(data)
}
