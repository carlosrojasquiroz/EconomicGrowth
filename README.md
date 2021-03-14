# Economic growth
This repository houses Excel and Matlab files, which process data from Penn World Table (PWT10.0) and Maddison Project Database (MPD2020) to replicate figures and run regressions as in Acemoglu (2009) and Mankiw, Romer y Weil (1992).

If you have questions, please contact me by email at:
**carlosrojasquiroz@gmail.com**

The repository has the following files:

       PWT14032021.xlsx
       DataBaseGrowth14032021.xlsx
       GDPpc_1870_2018.mat
       GraphsGrowthSF.m
       FitSolowData.m
       ConvergenceGraphs.m
       ols.m
       ols2.m

*PWT14032021.xlsx*: data for replicating figures from Acemoglu's book. Data from PWT10.0, MPD2020 and Barro-Lee dataset. 
*Graphs_GDPpc.m*: script to generate those figures. 

*GDPpc_1870_2018.mat*: data for replicating exercises from Baumol and De Long on inconditional convergence. Data from MPD2020.
*ConvergenceGraphs.m*: script to generate those figures.

*DataBaseGrowth14032021.xlsx*: data for running regressions as in MRW's paper. I do not pretend to replicate exactly them since I use different data samples than that paper. Data from PWT10.0, MPD2020 and Barro-Lee dataset. 
*FitSolowData.m*: script to generate OLS estimates (see "TablaX" object for the results).

*ols.m* and *ols2.m*: functions to run OLS regressions (with different outputs). 
