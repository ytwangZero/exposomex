### Welcome to ExposomeX platform to expedite the discovery of “Exposure-Biology-Disease” nexus!
Exposome has become the hotspot of next-generation health studies. To date, there is no available effective platform to standardize the analysis of exposomic data. In ExposomeX, we aim to propose one new framework of exposomic analysis and build up one novel integrated platform to expediate the discovery of “Exposure-Biology-Disease” nexus. In ExposomeX, we have built up one integrated platform for exposomic analysis. In total, 
We have developed **SIX** major functions including exposome database search (E-DB), biological link (E-BIO), statistical analysis (E-STAT), mass spectrometry data processing (E-MS), meta-analysis (E-META), and data visualization (E-VIZ). Here, we provide R package "exposomex" to conduct the data analysis. Users can also install part of the packages, i.e., the **15** R packages including StatTidy (tidy data), StatDesc (statistical desicription), EViz (data visualization), EDb (data base), StatMO (multi-omic data), StatCros (cross-section data), StatMedt (mediation effect), StatPanel (panel data), StatSurv (survival analysis), StatMix (mixture effect), EMS (non-targeted analysis), EBio (biological link), StatIP (statistical link), and EMeta (meta-analysis). User can also use these packages by web-interaction, see: http://www.exposomex.cn. In sum, we have proposed a novel framework for standardized exposomic analysis, which can be accessed using both R and online interactive platform. All the modules will keep updating. Please see the user tutorials at: http://www.exposomex.cn/#/toturial. Also, the manuscript about this platform has been submitted in the biorxiv preprint website: https://www.biorxiv.org/content/10.1101/2022.11.23.517586v1. 

Credits should be given to the core development members for their significant contributions to the individual 14 R packages including Bin Wang (StatTidy, EDb, StatCros, StatMix, StatPanel, and StatIP), Mingliang Fang (EMS and EBio), Yanqiu Feng (StatDesc), Ning Gao (EViz), Guohuan Zhang and Yuting Wang (StatMO), Mengyuan Ren (StatMedt), Changxin Lan (StatSurv), and Weinan Lin (EMeta). Special credits to Changxin Lan for making the codes into R packages of all modules, Ning Gao for providing help to most of the visualization funcitons, and Weinan Lin for tidying the IDs of chemicals, proteins, and diseases. The other contributors are acknowledged at http://www.exposomex.cn/#/about.
  
Wish you enjoy the packages!
  
Welcome to contact ExposomeX development team by E-mail: exposomex@gmail.com

Co-founders: Bin Wang (Peking University, binwang@pku.edu.cn) and Mingliang Fang (Fudan University, mlfang@fudan.edu.cn). 

2022-11-27



### **Quick start** 

devtools::install_github("ExposomeX/exposomex", force = TRUE)

library(exposomex)

**Note:**  The template excel files of the imput data can be downloaded from the website https://github.com/ExposomeX/data_template. Or you can use our example data by setting UseExample = "example#1"

- **Provide exposomic chemical search**

    res = InitEDB()

    res1 = LoadEDB(PID=res$PID,
                   UseExample="example#1")

    res2 = EDBNode(PID=res$PID,
                   OutPath = "default",
                   Class = "GO",
                   Nodes = "default")
    res2

    res3 = EDBLink(PID=res$PID,
                   OutPath ="default",
                   ClassA = "Exposure",
                   ClassB = "Protein",
                   LinkFrom = "default",
                   LinkTo = "default")
    res3

    FuncExit(PID = res$PID)
    
    
- **Calculate the association**
  
    res = InitStatCros()

    res1 <- LoadStatCros(PID=res$PID,
                         UseExample = "example#1")

    res2 <- TidyStatCros(PID=res$PID,
                         OutPath="default",
                         TransDummyVars="default")
  
    res21 <- TidyTransScale(PID=res$PID,
                          OutPath="default",
                          Vars="all.x",
                          Method="normal")

    res3 = CrosAsso(PID=res$PID,
                    OutPath = "default",
                    Linear = T,
                    EpiDesign = "cohort",
                    VarsY = "Y2",
                    VarsX = res2$Expo$Voca$SerialNo[20:30], 
                    VarsN = "single.factor" ,
                    VarsSel = F,
                    VarsSelThr = 0.1,
                    Covariates = "all.c",
                    Family = "binomial",
                    RepMsr = F,
                    Corstr = "ar1")
 
    res3$Y2_single.factor_cohort_binomial

    FuncExit(PID = res$PID)
    
    
- **Build multi-omic prediction model**
    
    res = InitStatMO()

    res1 = LoadStatMO(PID = res$PID,
                      UseExample="example#1")

    res2 = TidyStatMO(PID=res$PID,
                    OutPath = "default",
                    Vars = "",
                    To = "")
 
    res3 = MulOmicsCros(PID=res$PID,
                       OutPath = "default",
                       OmicGroups = "proteome,chemical",
                       VarsY = "Y1",
                       VarsC = "all.c",
                       TuneMethod = "default",
                       TuneNum = 20,
                       RsmpMethod = "cv",
                       Folds = 5,
                       Ratio = 0.67,
                       Repeats = 5,
                       VarsImpThr = 0.85,
                       SG_Lrns ="lasso,rf")
    res3$MulOmics$SGplot

    FuncExit(PID = res$PID)


- **Find the biological link in protein-protein interaction mode**

    res = InitEBIO()

    res1 = LoadEBIO(PID=res$PID,
                    UseExample="example#1")
    res1$Expo$Data

    res2 = EBIOConvToExpoID(PID = res$PID,
                            OutPath = "default")
    res2 

    res3 = EBIOBiolink(PID = res$PID,
                       OutPath = "default",
                       Mode = "EPPD",
                       MetBiospec = "blood")
    res3$Edges
    res3$Nodes

    FuncExit(PID = res$PID)


- **Pool the effect value by meta-analysis**

    res = InitEMETA()

    res1 = LoadEMETA(PID = res$PID,
                    UseExample = "example#1")

    res2 = MetaAsso(PID = res$PID)

    res2$MetaEffect_References

    res2$MetaEffect_Plot

    FuncExit(PID = res$PID)
    
