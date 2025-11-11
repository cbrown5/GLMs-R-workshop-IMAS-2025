library(tidyverse)
library(MASSExtra) # To simplify models
library(gglm) # To visualise model diagnostics
library(MuMIn) # To use the dredge function
library(marginaleffects) # To plot model outputs

dat <- read_csv("Data/ZooBiomass.csv")
glimpse(dat)