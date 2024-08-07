% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{TidyStatSurv}
\alias{TidyStatSurv}
\title{Transform factor variables into dummy ones}
\usage{
TidyStatSurv(PID, OutPath = "default",TransDummyVars="default")
}
\arguments{
\item{PID}{chr. Program ID. It must be the same with the PID generated by ExpoSurv}

\item{OutPath}{chr. Output file directory, e.g. "D:/test". It should be noted that the slash symbol is "/", not "\".
If "default", the current working directory will be set.}

\item{TransDummyVars}{chr. Variables to be transformed as dummy variables. It should be noted that
there is fixed format for the entering characters separated with comma and without space,
e.g., "X1,X2,X3". If "default", all the factor variables will be transformed into dummy ones.
These variables need to be transformed as factor ones in previous transform step
using TransType function.}
}
\value{
An R6 class object containing the variable(s) after transforming the factor
variables into dummy ones.
}
\description{
Transform factor variables into dummy ones
}
\examples{
res <- InitStatSurv()
    res1 = LoadStatSurv(PID = res$PID, UseExample = "example#1")
    res2 = TidyStatSurv(PID = res$PID, OutPath = "default",TransDummyVars="default")
    res2$Expo$Data
    FuncExit(PID = res$PID)
}
\author{
Bin Wang
}
