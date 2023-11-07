#Script to plot the logistic growth data

#Add the data to the file window, and use file choose to read it in
file.choose()
growth_data <- read.csv("/cloud/project/experiment2.csv")

#Inastall required packages
install.packages("ggplot2")
library(ggplot2)

head(growth_data)

#Plot the time against populaiton size to see the data
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

# We can use log10(N) to take away the sigmoidal shape and linearise the growth period, this will allow us to get a value for r as the gradient!
ggplot(aes(t,log10(N)), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
