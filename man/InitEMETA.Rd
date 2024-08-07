% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{InitEMETA}
\alias{InitEMETA}
\title{Initialize EMETA Module}
\usage{
InitEMETA()
}
\value{
An R6 class object.
}
\description{
Initialize EMETA module, the first step to start EMETA Module.
}
\details{
EMETA module mainly provides users preliminary information retrieval and screening for meta-analysis. Run InitEMETA to get a unique PID for following steps.
}
\examples{
res = InitEMETA()
   FuncExit(PID = res$PID)
}
\author{
Weinan Lin, Bin Wang (corresponding author)
}
