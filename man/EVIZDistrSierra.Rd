% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{EVIZDistrSierra}
\alias{EVIZDistrSierra}
\title{Plot distribution sierra}
\usage{
EVIZDistrSierra(PID,OutPath,Vars, ...)
}
\arguments{
\item{PID}{chr. Program ID. It must be the same with the PID generated by InitEVIZ.}

\item{OutPath}{chr. Output file directory. e.g. "D:/test". It should be noted that the slash symbol is "/", not "\".
If "default", the current working directory will be set.}

\item{Vars}{chr. Variables to be visualized(e.g."X4,X5,X6,X7,X8,X9,X10").Available options include:
"all.x", all independent variables;
or input a character string specifying the variables,separated by comma "," without space(e.g."X4,X5,X6,X7,X8,X9,X10").
No more than 50 variables be entered is recommended (< 20 variables).}

\item{Brightness}{chr. Visualization brightness. Available options include "light" and "dark".}

\item{Palette}{chr. Visualization palette. Available options include "default1", "default2"
and several journal preference styles (i.e., cell, nature, science, lancet, nejm, and jama).}
}
\value{
A list containing one plot.
(1) "light_default1": the whole dataset visualization result.
}
\description{
Visualize data via sierra plot.
}
\details{
The sierra plot is used to visualize the kernel density
estimation of data.
}
\examples{
res = InitEVIZ()
    res1 = LoadEVIZ(PID = res$PID, UseExample = "example#1")
    res2 = EVIZDistrSierra(PID=res$PID,Vars = "X14,X15,X16,X17,X18,X19,X20",Brightness = "light",Palette = "default1")
}
\author{
Ning Gao,Bin Wang(corresponding author)
}
