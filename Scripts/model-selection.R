library(tidyverse)
library(MASSExtra) # To simplify models
library(gglm) # To visualise model diagnostics
library(MuMIn) # To use the dredge function
library(marginaleffects) # To plot model outputs

dat <- read_csv("Data/ZooBiomass.csv")
glimpse(dat)

table(dat$Region)
table(dat$Zone)
table(dat$TimeOfDay)
table(dat$Depth)

m1 <- lm(log10(Biomass) ~ Depth * Zone * Region, data = dat)
#log10(Biomass) ~ 1 + Depth + Zone + Region + Depth:Zone + Depth:Region + 
 # Zone:Region + Depth:Zone:Region
summary(m1)

# Do diagnostics at the start, so you can correct model issues
plot(m1, 2)
plot(m1, 1)

#Do again at the end to check its still valid. 

drop_term(m1)
# same as comparing full model:
#log10(Biomass) ~ 1 + Depth + Zone + Region + Depth:Zone + Depth:Region + 
# Zone:Region + Depth:Zone:Region
#
#to this model:
#
#log10(Biomass) ~ 1 + Depth + Zone + Region + Depth:Zone + Depth:Region + 
# Zone:Region 

summary(m1)
m2 <- update(m1, ~. - Depth:Zone:Region)
summary(m2)

drop_term(m2)
# F ratio say sto drop depth:region because not significant
# AIC also says same thing becuase AIC gets lower if we drop it

m3 <- update(m2, ~. - Depth:Region)
summary(m3)

drop_term(m3)

m4 <- update(m3, ~. -Zone:Region)
drop_term(m4)

#most parsimonious model 
# log10(Biomass) ~ Depth + Zone + Region + Depth:Zone

# all code above can be summarized like this, for the F ratio test: 
m5 <- step(m1, test = "F")
summary(m5)

# all code above can be summarized like this, for the AIC ratio test: 
m5 <- step(m1)
summary(m5)

