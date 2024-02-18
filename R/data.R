#' @importFrom tibble tibble
#' @import dplyr
#' @import readr
#' @import stringr
NULL

#' Baseline data table
#'
#' Information of patients
#'
#' @format A data frame with seven variables: \code{pt_id}, \code{fname},
#'   \code{sname}, \code{dob}, \code{rec_date}, \code{wd_stat} and \code{wd_date}
#'
"baseline"

#' Inpatient main data table
#'
#' Information of patients
#'
#' @format A data frame with five variables: \code{pt_id}, \code{record_id},
#'   \code{admidate}, \code{disdate} and \code{batch}
#'
"inpatient_main"

#' Inpatient diag data table
#'
#' Information of patients diagnosis
#'
#' @format A data frame with four variables: \code{record_id}, \code{arr_index},
#'   \code{level} and \code{diag_icd10}
#'
"inpatient_diag"

#' Inpatient 2018 table
#'
#' Information of patients with admision or descharge in 2018
#'
#' @format A data frame with four variables: \code{pt_id}, \code{record_id},
#'   \code{admidate}, \code{disdate} and \code{batch}
#'
"inpatient_2018"
