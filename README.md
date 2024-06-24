### Welcome to ExposomeX platform to expedite the discovery of “Exposure-Biology-Disease” nexus!
Exposome has become the hotspot of next-generation health studies. To date, there is no available effective platform to standardize the analysis of exposomic data. In ExposomeX, we aim to propose one new framework of exposomic analysis and build up one novel integrated platform to expediate the discovery of “Exposure-Biology-Disease” nexus. In ExposomeX, we have built up one integrated platform for exposomic analysis. In total, we have developed **SIX** major modules, which include exposomic mass spectrometry data processing (E-MS), statistical analyses of “chemicals-endogenous omics-diseases” interaction (E-STAT), exposome database search (E-DB), meta-analysis of chemical-diseases (E-META), biological explanation of chemical-diseases (E-BIO) and visualization of multiple dimension data (E-VIZ). Here, we provide R package "exposomex" to conduct the data analysis. Users can also install part of the packages, i.e., the **15** R packages including extidy (tidy data), exstat (statistical desicription), exviz (data visualization), exdb (data base), exmo (multi-omic data), excros (cross-section data), exmedt (mediation effect), expanel (panel data), exsurv (survival analysis), exmix (mixture effect), exnta (non-targeted analysis), exbiolink (biological link), exstatlink (statistical link), and exmeta (meta-analysis). User can also use these packages by web-interaction, see: http://www.exposomex.cn. In sum, we have proposed a novel framework for standardized exposomic analysis, which can be accessed using both R and online interactive platform. All the modules will keep updating. Please see the user tutorials at: http://www.exposomex.cn/#/toturial. Also, the manuscript about this platform has been submitted in the biorxiv preprint website: https://www.biorxiv.org/content/10.1101/2022.11.23.517586v1. 

Credits should be given to the core development members for their significant contributions to the individual 14 R packages including Bin Wang (extidy, exdb, excros, exmix, expanel, and exstatlink), Mingliang Fang (exnta and exbiolink), Yanqiu Feng (exstat), Ning Gao (exviz), Guohuan Zhang and Yuting Wang (exmo), Mengyuan Ren (exmedt), Changxin Lan (exsurv), and Weinan Lin (exmeta). Special credits to Changxin Lan for making the codes into R packages of all modules, Ning Gao for providing help to most of the visualization funcitons, and Weinan Lin for tidying the IDs of chemicals, proteins, and diseases. The other contributors are acknowledged at http://www.exposomex.cn/#/about.
  
Wish you enjoy the packages!
  
Welcome to contact ExposomeX development team by E-mail: exposomex@gmail.com

Co-founders: Bin Wang (Peking University, binwang@pku.edu.cn) and Mingliang Fang (Fudan University, mlfang@fudan.edu.cn). 

2022-11-27



### **Quick start** 

devtools::install_github("ExposomeX/exposomex", force = TRUE)

library(exposomex)

**Note:**  The template excel files of the imput data can be downloaded from the website https://github.com/ExposomeX/data_template. Or you can use our example data by setting UseExample = "example#1"

- **Convert chemical name to CAS.RN**

    res <- InitDb()

    res1 = LoadDb(PID = res$PID, 
                  UseExample = "example#1")
    
    res2 = ExpoConv(PID = res$PID,
                    From = "chemical",
                    To = "cas.rn",
                    Keys = "default")
    res2
    
    
- **Calculate the association**

    res <- InitCros()
    
    res1 = LoadCros(PID = res$PID,
                    UseExample = "example#1")
    
    res2 = TransScale(PID = res$PID, 
                      Group = "T", 
                      Vars = "all.x", 
                      Method = "normal")
    
    res3 = CrosAsso(PID = res$PID,
                    EpiDesign = "cross.sectional", 
                    VarsY = "Y1",
                    VarsX = "X5,X6,X7,X8,X9,X10,X11", 
                    VarsN = "single.factor",
                    VarsSel = FALSE, 
                    VarsSelThr = 0.1, 
                    IncCova = TRUE, 
                    Family = "gaussian")
    res3$Y1_single.factor_cross.sectional_gaussian
    
    res4 = VizCrosAsso(PID = res$PID,
                       VarsY = "Y1",
                       VarsN ="single.factor",
                       Layout = "forest",
                       Brightness = "dark",
                       Palette = "default1")
    res4$Y1_single.factor_forest_dark_default1 
    
    
- **Build multi-omic prediction model**
    
    res <- InitMO()
    
    res1 <- LoadMO(PID = res$PID, 
                   UseExample = "example#1")
    
    res2 <- MulOmicsCros(PID = res$PID, 
                         OmicGroups = "immunome,metabolome,proteome",
                         VarsY = "Y1", 
                         VarsC = "all.c", 
                         TuneMethod = "default", 
                         TuneNum = 5, 
                         RsmpMethod = "cv",
                         VarsImpThr = 0.85,
                         SG_Lrns ="enet,rf")
    res2$SGModel_summary
    
    res3 <- VizMulOmicCros(PID = res$PID, 
                           VarsY = "Y1", 
                           NodeNum =100,
                           EdgeThr= 0.45,
                           Layout = "force-directed",
                           Brightness = "light",
                           Palette = 'default1')
    res3$Networkplot$EN


- **Find the biological link in protein-protein interaction mode**

    res = InitBioLink()
    
    res1 = LoadBioLink(PID = res$PID,
                       UseExample = "example#1")
    
    res2 = ConvToExpoID(PID = res$PID)
    res2
    
    res3 = BioLink(PID = res$PID, 
                   Mode = "PPI", 
                   ChemCas = "default",
                   ChemInchikey = "default",
                   DiseaseID = "default",
                   MetabolomeID = "default",
                   MetBiospec = "blood", 
                   ProteomeID = "default")
    res3
    
    res4 = VizBioLink(PID = res$PID, 
                      Mode = 'PPI', 
                      Layout = "force-directed",
                      Brightness = "dark", 
                      Palette = "default1")
    res4


- **Pool the effect value by meta-analysis**

    res = InitMeta()
    
    res1 = LoadMeta(PID = res$PID,
                    UseExample = "example#1")
    
    res2 = MetaEffect(PID = res$PID)
    
    res2$MetaEffect_References
    
    res2$MetaEffect_Plot
    
