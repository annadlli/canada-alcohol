This repository is organized as such:

Inputs folder includes data and literature. Literature contains a few of the sources that were used, specifically the ones that are publically available to download without any licenses. Data contains 5 files. 2 files consist of the dataset that are used, with raw_data.xlsx being the original Canadian Perspectives Survey Series: Substance Use and Stigma During the Pandemic data. The original dataset, with the corresponding guidebooks and survey process documentation can be found at https://www150.statcan.gc.ca/n1/en/catalogue/45250012. The file cleaned_data.csv consists of the dataset utilized in the analysis of the paper, cleaned through utilizing the script 01-data_cleaning.R. 

Scripts folder include 2 scripts. 01-data_cleaning.R was utilized to transform the original data to the dataset utilized for the paper. 01_simulation.R provides a simple simulation of the cleaned dataset, after the elimination of null observations and chosen variables. The simulation does not utilize the weighing of the original dataset for simplicity purposes. 

The MIT License is included to provide information regarding how the repository can be utilized. The R project Canada-mentalhealth.Rproj is included to help organize the work done for this paper. 

Outputs folder includes the folder paper, which has 4 files within it. The R markdown file, canada-mentalhealth.Rmd, contains the code that was utilized to produce the final report. A copy of the knitted final report is also included in pdf format, canada-mentalhealth.pdf. A bibliography file references.bib is included for the citations of the paper. Finally a preamble-latex.tex file is included to help fixate the figures in their corresponding sections for the R markdown knitted final pdf. 
