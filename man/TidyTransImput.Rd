% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{TidyTransImput}
\alias{TidyTransImput}
\title{Missing data imputation.}
\usage{
TidyTransImput(PID,OutPath = "default",Vars,Method)
}
\arguments{
\item{PID}{chr. Program ID. It must be the same with the PID generated by initial functions.}

\item{OutPath}{chr. Output file directory, e.g. "D:/test". It should be noted that
the slash symbol is "/", not "\". If "default", the current working directory will be set.}

\item{Vars}{Variables to be imputed. Available options include:
"all.x", all exposure variables;
Users can also choose available variables
by selecting "Other" option, and copy the variables by clicking "Available vars".
It should be noted that there is fixed format for the entering characters
separated with comma and without space, e.g., "X1,X2,X3".}

\item{Method}{Methods used for imputation. Available options include "lod" or "cart" methods.
For "lod" method, limit of detection (LOD) should be included in the "Vocabulary" file.}
}
\value{
An R6 class object containing variable(s) with imputation.
}
\description{
Missing data imputation.
}
\examples{
res = InitStatTidy()
    res1 = LoadStatTidy(PID=res$PID, UseExample="example#1")
    res2 = TidyTransImput(PID=res$PID, Vars="all.x", Method="lod")
    FuncExit(PID = res$PID)
}
\author{
Bin Wang
}
