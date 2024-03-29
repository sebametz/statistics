% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stats.R
\name{write_smith_list}
\alias{write_smith_list}
\title{\enumerate{
\item Export smith list
}}
\usage{
write_smith_list(output_path = ".")
}
\arguments{
\item{output_path}{path to output. Default = "."}
}
\value{
Write the smith list into a tsv file smit_list.tsv
}
\description{
\enumerate{
\item Export smith list
}
}
\examples{
library(dplyr)
library(stringr)
library(readr)
data("baseline")
write_smith_list(output_path = tempdir())
}
