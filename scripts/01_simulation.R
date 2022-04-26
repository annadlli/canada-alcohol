# simulating some of the data that may have been seen in the actual dataset after cleaning 
# does a simple simulation, without considering the predetermined weights utilized in actual dataset

library(ggplot2)

set.seed(1007497530)

  simulation<- tibble(
    age<-sample(1:7, 20, replace = TRUE), 
    sex<-sample(0:1, 20, replace = TRUE, prob = c(0.5,0.5)),
    employment<-sample(0:1, 20, replace = TRUE),
    mental_health<-sample(1:5, 20, replace = TRUE),
    change_mental_health<-sample(1:5, 20, replace = TRUE),
    change_stress<-sample(1:5, 20, replace = TRUE),
    alcohol<-sample(1:5, 20, replace = TRUE),
    change_alcohol<-sample(-1:1, 20, replace = TRUE),
    no_drink<-sample(1:2, 20, replace = TRUE),
    stress<-sample(1:5, 20, replace = TRUE))
  colnames(simulation) <- c("age", "sex", "employment","mental_health",
                            "change_mental_health","change_stress","alcohol",
                            "change_alcohol", "no_drink", "stress")
  simulation$stress[simulation$change_stress == 1]<-0
  simulation$stress[simulation$change_stress == 2]<-0
  simulation$stress[simulation$change_stress == 3]<-1
  simulation$stress[simulation$change_stress == 4]<-1
  simulation$stress[simulation$change_stress == 5]<-1
  simulation$alcohol[simulation$alcohol == 5]<-96
  
                      
  
    
    
  
  