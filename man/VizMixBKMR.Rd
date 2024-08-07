% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{VizMixBKMR}
\alias{VizMixBKMR}
\title{Visualize the model results of Bayesian Kernel Machine Regression (BKMR)}
\usage{
VizMixBKMR(PID, OutPath = "default", VarsY, Brightness = "dark", Palette = "default1")
}
\arguments{
\item{PID}{chr. Program ID. It must be the same with the PID generated by StatMix}

\item{OutPath}{chr. Output file directory, e.g. "D:/test". It should be noted that
the slash symbol is "/", not "\". If "default", the current working directory will be set.}

\item{VarsY}{chr. Outcome variable used for modeling. Only one variable can be entered.}

\item{Brightness}{chr. Visualization brightness. Available options include "light" and "dark".}

\item{Palette}{chr. Visualization palette. Available options include "default1", "default2"
and several journal preference styles (i.e., cell, nature, science, lancet, nejm, and jama).}
}
\value{
A list containing the BKMR analysis results' plot.
}
\description{
Visualize the model results of Bayesian Kernel Machine Regression (BKMR)
}
\examples{
res <- InitStatMix()
   res1 = LoadStatMix(PID = res$PID, UseExample = "example#1")
   res2 <- TidyStatMix(PID = res$PID, LogTransM = "log10", RangeLow = 0, RangeUpp = 1)
   res3 = MixBKMR(PID = res$PID, VarsY = "Y1", VarsX = "X4,X5,X6,X7,X8,X9,X10",
   Covariates = "all.c", Family = "gaussian", Group = 'F', Iter = 2000, qfixed = 0.5,
   qsbivar = "default", qsoverall = "default", qsdiff = "default")
   res4 = VizMixBKMR(PID=res$PID, VarsY = "Y1", Brightness = "dark",
   Palette = "default1")
   FuncExit(PID = res$PID)
}
\author{
Mengyuan Ren, Bin Wang(corresponding author)
}
