% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{DescCorr}
\alias{DescCorr}
\title{Correlation analysis.}
\usage{
DescCorr(PID = res$PID, VarsX = "X5,X6,X7,X8,X9", VarsY = "Y1", VarsBy = "Y1", Method = "pearson",
   Layout = "bubble", Brightness = "dark", Palette = "nature").
}
\arguments{
\item{PID}{chr. Program ID. It must be the same with the PID generated by InitStatDesc.}

\item{OutPath}{chr. Output file directory, e.g. "D:/StatDesc/DescCorr". It should be
noted that the slash symbol is "/", not "\".If "default", the current working directory will be set.}

\item{VarsX}{chr. Target variables used for modelling. It should be noted that there is fixed format for the entering
characters separated with "," and without space, e.g. "X5,X6,X7,X8,X9".
The default values is "all.x" (all variables are included).}

\item{VarsY}{chr. Target outcome variables used for correlation analysis.}

\item{VarsBy}{chr. Variable  used to group the observation for correlation analysis.}

\item{Method}{chr.  Method for orrelation analysis. Available values include "spearman" (Spearman's rank correlation analysis)
and "pearson" (Pearson correlation analysis).}

\item{Layout}{chr. Visualization layout. Available values include "heatmap", "bubble", "matrix".}

\item{Brightness}{chr. Visualization brightness. Available values include "light" and "dark".}

\item{Palette}{chr. Visualization palette. Available values include "default1", "default2" , and 6 journal option
including "cell", "nature", "science", "lancet", "nejm" and "jama".}
}
\value{
A list object containing the results of correlation analysis between variables and  visualization of the results.
}
\description{
Perform correlation analysis between variables.
}
\examples{
res = InitStatDesc()
   res1 = LoadStatDesc(PID = res$PID, UseExample = "example#1")
   res2 = TidyStatDesc(PID = res$PID)
   res3 = DescCorr(PID = res$PID, VarsX = "X5,X6,X7,X8,X9", VarsY = "Y1", VarsBy = "Y1", Method = "spearman", Layout = "heatmap",
   Brightness = "light", Palette = "default1")
   FuncExit(PID = res$PID)
}
\author{
Yanqiu Feng, Bin Wang (corresponding author)
}
