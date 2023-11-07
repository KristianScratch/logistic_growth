#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment2.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}



N0 <-  1916.90598679 #this is gained from e^7.5584677
  
r <- 0.0303057 #plug in the value for r
  
K <- 1.000e+09 #

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  scale_y_continuous(trans='log10')


