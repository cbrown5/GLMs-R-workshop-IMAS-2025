# Chris Brown 
#Linear models

library(tidyverse)

dat <- read_csv("Data/ZooBiomass.csv")

head(dat) 

m1 <- lm(Biomass ~ Depth, data = dat) # Read this as "Biomass as a function of Depth"

summary(m1)