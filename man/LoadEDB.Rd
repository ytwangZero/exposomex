% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{LoadEDB}
\alias{LoadEDB}
\title{Load data file for EDB module}
\usage{
LoadEDB(PID, UseExample = "default", DataPath=NULL)
}
\arguments{
\item{PID}{chr. Program ID. It must be the same with the PID generated by EDB}

\item{UseExample}{chr. Method of uploading data. If "default", user should upload their own data files,
or use "example#1" provided by this module.}

\item{DataPath}{chr. Input directory of data file, e.g. "D:/test/eg_data_biolink.xlsx". It should be
noted that the slash symbol is "/", not "\".}
}
\value{
An R6 class object containing the input data.
}
\description{
Load data file for EDB module
}
\examples{
res <- InitEDB()
   res1 = LoadEDB(PID = res$PID, UseExample = "example#1")
   FuncExit(PID = res$PID)
}
\author{
Tianxiang Wu, Bin Wang (corresponding author)
}
