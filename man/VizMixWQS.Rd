% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{VizMixWQS}
\alias{VizMixWQS}
\title{Visualize results of weighted quantile sum regression (WQS) model}
\usage{
VizMixWQS(PID, OutPath = "default", VarsY, Brightness  = "dark", Palette = "default1")
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
A list containing the WQS analysis results' plot.
}
\description{
Visualize results of weighted quantile sum regression (WQS) model
}
\examples{
res <- InitStatMix()
   res1 = LoadStatMix(PID = res$PID, UseExample = "example#1")
   res2 <- TidyStatMix(PID = res$PID, LogTransM = "log10", RangeLow = 0, RangeUpp = 1)
   res3 = MixWQS(PID=res$PID, VarsY = "Y1", VarsX = "all.x",Covariates = "all.c",
   Family = "gaussian", VarStrat = "none", RatioValidat = 0.3, q = 10, b=100,
   b1_pos = 'F', b1_constr = 'F')
   res4 = VizMixWQS(PID = res$PID, VarsY = "Y1", Brightness = "dark",
   Palette = "default1")
   FuncExit(PID = res$PID)
}
\author{
Mengyuan Ren, Bin Wang(corresponding author)
}
