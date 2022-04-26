#### Preamble ####
# Purpose: Clean the survey data downloaded from Statistics Canada
# Author: Anna Li
# Data: 25 April 2021
# Contact: annadl.li@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(readxl)
library(tidyverse)
# Read in the raw data. 
raw_data <- read_excel("inputs/data/raw_data.xlsx")


# keep variables of interest

coviddata<- raw_data %>% select(AGEGRP,SEX, PEMPSTC, 
                            STRESS, ME_05, ME_10, ME_15, ALC_10C, 
                            ALC_20, ALC_05)


#eliminate skipped and not stated responses
coviddata<- coviddata[!(coviddata$ALC_10C == 99),]
coviddata<- coviddata[!(coviddata$ALC_20 == 6 |coviddata$ALC_20 == 9),]
coviddata<- coviddata[!(coviddata$ALC_20 == 3),]


coviddata<- coviddata[!(coviddata$ALC_05 == 9),] #used to keep those who don't drink

coviddata<- coviddata[!(coviddata$ME_05 == 9),]
coviddata<- coviddata[!(coviddata$ME_10 == 9),]
coviddata<- coviddata[!(coviddata$ME_15 == 9),]
coviddata<- coviddata[!(coviddata$PEMPSTC == 9),]
coviddata<- coviddata[!(coviddata$STRESS == 9),]

#recode variables
coviddata$SEX[coviddata$SEX == 1]<-0 #male
coviddata$SEX[coviddata$SEX == 2]<-1 #female

coviddata$STRESS[coviddata$STRESS == 1]<-0 #not stressed
coviddata$STRESS[coviddata$STRESS == 2]<-1 #stressed

coviddata$ALC_05[coviddata$ALC_05 == 1]<-0 #drinks
coviddata$ALC_05[coviddata$ALC_05 == 2]<-1 #doesn't drink

coviddata$PEMPSTC[coviddata$PEMPSTC == 4]<-0 #not employed
coviddata$PEMPSTC[coviddata$PEMPSTC == 1]<-1 #employed and is working
coviddata$PEMPSTC[coviddata$PEMPSTC == 2]<-1 #employed and non-COVID absent
coviddata$PEMPSTC[coviddata$PEMPSTC == 3]<-1 #employed and absent due to COVID 

#rerank from poor to excellent 
coviddata$ME_05[coviddata$ME_05 == 5]<-6 #PLACEHOLDER FOR NOW, poor to 6
coviddata$ME_05[coviddata$ME_05 == 1]<-5 # excellent to 5
coviddata$ME_05[coviddata$ME_05 == 6]<-1 # poor to 1
coviddata$ME_05[coviddata$ME_05 == 2]<-6 # very good to 6
coviddata$ME_05[coviddata$ME_05 == 4]<-2 #fair to 2
coviddata$ME_05[coviddata$ME_05 == 6]<-4 #very good to 4

coviddata$ME_10[coviddata$ME_10 == 5]<-6 #PLACEHOLDER FOR NOW, poor to 6
coviddata$ME_10[coviddata$ME_10 == 1]<-5 # excellent to 5
coviddata$ME_10[coviddata$ME_10 == 6]<-1 # poor to 1
coviddata$ME_10[coviddata$ME_10 == 2]<-6 # very good to 6
coviddata$ME_10[coviddata$ME_10 == 4]<-2 #fair to 2
coviddata$ME_10[coviddata$ME_10 == 6]<-4 #very good to 4

#rerank other variables
coviddata$ALC_20[coviddata$ALC_20 == 2]<--1 #decreased
coviddata$ALC_20[coviddata$ALC_20 == 4]<-0 #stayed the same


#rename variables

colnames(coviddata)<-c("age_group", "sex", "employment","stress",
                       "mental_health","change_mental_health", 
                       "change_stress","alcohol", "change_alcohol","no_drink")

write_csv(coviddata, "inputs/data/cleaned_data.csv")



         