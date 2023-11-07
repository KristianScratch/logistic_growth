#Script to estimate the model parameters using a linear approximation

install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("/cloud/project/experiment2.csv")
head(growth_data)

#Case 1. K >> N0, t is small
# we start by trying to figure out the r by assuming we are far away from carrying capacity (t is small)
#t is small can just be 

data_subset1 <- growth_data %>% filter(t<240) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

# the gradient here is (r) 0.0303057
# the starting pop is show as the intercept but in ln(No), so No is e^  7.5584677

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>1000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

#here we have made a linear regression for the flat line at K, so the intercept id the N at K
# = 1.000e+09
