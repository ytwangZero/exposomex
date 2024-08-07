% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exposomex.R
\name{CrosAsso}
\alias{CrosAsso}
\title{Association analysis}
\usage{
CrosAsso = function(PID, OutPath = "default",Linear = T, EpiDesign = "cross.sectional",
    VarsY, VarsX = "all.cx",VarsN = "single.factor",VarsSel = F,VarsSelThr = 0.1,
    Covariates = "all.c",Family,RepMsr = F,Corstr = "ar1")
}
\arguments{
\item{PID}{chr. Program ID. It must be the same with the PID generated by StatCros}

\item{OutPath}{chr. Output file directory, e.g. "D:/test". It should be noted that the slash symbol is "/", not "\".
If "default", the current working directory will be set.}

\item{Linear}{lgl. T (or TRUE) and F (or FALSE). Whether the relationship between variables is linear}

\item{EpiDesign}{chr. Epidemiological design of the study, including "cohort" "case.control"
and "cross.sectional". It doesn’t affect the modeling, but the format of the output file.
For the three designs, the effect values are usually indicated by RR (relative risk) of cohort,
OR (odds ratio) of case-control, and beta value of cross-sectional.}

\item{VarsY}{chr. Outcome variable used for modeling. Only one variable can be entered.}

\item{VarsX}{chr. Exposure variable used for modeling. The default option is
"all.x" (All exposure variables are included). Users can also choose available variables.
It should be noted that there is fixed format for the entering characters
separated with comma and without space, e.g., "X1,X2,X3"}

\item{VarsN}{chr. Choose the single factor or multiple factor model.
Available options include "single.factor" and "multiple.factor"}

\item{VarsSel}{lgl. T (or TRUE) and F (or FALSE). Whether to select the significant variable for the final model.
Available options.}

\item{VarsSelThr}{num. If "VarsSel" = T, provide the selection threshold
of the P-value. Three value can be chosen, i.e. 0.05, 0.1, and 0.2.}

\item{Covariates}{chr. Covariates used for modeling. The default option is
"all.c" (All covariates are included).}

\item{Family}{chr. The link function for the regression model according the data type of outcomes,
including "gaussian" for continuous variable, "binomial" for binary variable,
and "poisson" for counting variable}

\item{RepMsr}{lgl.  T (or TRUE) and F (or FALSE). Whether existing repeated measurement of the subjects.
Available options.}

\item{Corstr}{chr. If "RepMsr" = T, the generalized estimating equations (GEE) will be used.
For GEE, three correlation structure options are "exchangeable" "ar1" "unstructured".}
}
\value{
A list containing the association analysis results.
}
\description{
Association analysis for cross-sectional data
}
\examples{
res <- InitStatCros()
   res1 = LoadStatCros(PID = res$PID, UseExample = "example#1")
   res2 = TidyStatCros(PID = res$PID, OutPath = "default",TransDummyVars="default")
   res3 = CrosAsso(PID=res$PID, Linear = TRUE, EpiDesign = "cohort",
   VarsY = "Y1", VarsX = "X5,X6,X7,X8,X9,X10,X11", VarsN = "single.factor" ,
   VarsSel = FALSE, VarsSelThr = 0.1, Covariates = "all.c", Family = "gaussian",
   RepMsr = FALSE,Corstr = "ar1")
   FuncExit(PID = res$PID)
}
\author{
Bin Wang
}
