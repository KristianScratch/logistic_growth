### Script to plot a graph which compares the Logistic and exponential growth curves

# For this, make sure. you have the required packages
install.packages("ragg")
library(ragg)
install.packages("ggplot2")
library(ggplot2)

# Makes. rue the data is read in

growth_data <- read.csv("data/experiment2.csv")

#First lets define all the useful parameters

N0 <-  1916.90598679 
r <- 0.0303057 
K <- 1.000e+09

#Then lets create the logistic model

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#And the exponential model

Expo_fun <- function(t) {
  
  N <- N0 * (exp(r*t))
  
  return(N)
}

# Then Plot the original data with both models. 
  
comparing_models_plot <- ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") + #Include the Logistic model (red)
  
  geom_function(fun=Expo_fun, colour="blue") + #And the exponential model (blue)
  
  geom_point() +
  
  coord_cartesian(ylim = c(0, 1.5e+09), xlim = c(0, 1000)) + # This is to set the axis so the shapes of the models are more easily comparable
  
  scale_color_manual(name='Model Key',
                     breaks=c('Exponential', 'Logistic'),
                     values=c('Exponential'='blue', 'Logistic'='red'))+ # This is to add a Key of the two models, but it dont work :(
  theme(legend.position="bottom") 
  
#We can view it In R via:
comparing_models_plot

#Save this graph so It can be easily accessed in the Github Repository

agg_png("figures/Comparing_Models_PLOT.png", 
        width   =  30, 
        height  =  40, 
        units   =  "cm", 
        res     =  175, 
        scaling =  2.5)
Comparing_Models_plot
print(comparing_models_plot)
dev.off()

  
