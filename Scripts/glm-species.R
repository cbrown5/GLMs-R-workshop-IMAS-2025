library(tidyverse)
library(gglm)
library(DHARMa)
dat <- read_csv("Data/grasses.csv")

m1 <- glm(Species ~ Biomass + pH, data = dat, family = "poisson")
gglm(m1)


model.matrix(m1)
