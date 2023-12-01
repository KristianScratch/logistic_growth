#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment2.csv")

#Custom Function to make a logistic model if we specify the NO, r, and K.

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

# We can specify these values manually based on the analyisis in "plot_data.R" and "fit_linear_model.R".

N0 <-  1916.90598679 #this is gained from e^7.5584677
  
r <- 0.0303057 #plug in the value for r
  
K <- 1.000e+09 #Plug in the value we estimate for K.

#We can then use the same ggplot to plot the data as before, but add the Logistic model function we just created, now that we have defined the parameters.

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +

  scale_y_continuous(trans='log10')


