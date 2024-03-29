## Code supplement to:
## Modern building structures are a landscape-level driver of bat-human exposure risk in Kenya
## Author: TJ Lunn, University of Georgia
## Published in Frontiers in Ecology and the Environment

## Notes on code:
## Building coordinates have been redacted for home owner privacy. Building(local)-level bat occupancy code will not run. Model outputs have been provided as .RDS files

library(mgcv) ## v1.9-0
library(tidyverse) ## v2.0.0

##############################################################################################
##-----------------------------------------Main text----------------------------------------##
##############################################################################################

############################################################
############ Building(local)-level bat occupancy ###########
############################################################

##---------------------------##
##----- Direct Assessment ---##
##---------------------------##
#### Buildings directly checked for signs, sighting and/or audio confirmation, or discussed occupation with owner

building_features_direct_sp <- read.csv("building_features_spatial.csv") ## spatial data redacted for home owner privacy
fit2 <- gam(occ_bin ~ building_type + roof_design + s(latitude, longitude), family=binomial(link=logit), data=building_features_direct_sp) 
summary(fit2) ##saveRDS(fit2, "building-fit-spatial.RDS")

coef <- summary(fit2)[["p.coeff"]][["building_typezmodern"]]
st.error <- summary(fit2)[["se"]][["building_typezmodern"]]
(1-exp(coef))*100 ## X% higher or lower than the reference category. exp() to convert log-odds ratio coefficient into odds-ratio
## The odds of bat occupancy was 5x higher for modern-style buildings than for other building types

coef <- summary(fit2)[["p.coeff"]][["roof_designtriangle"]]
st.error <- summary(fit2)[["se"]][["roof_designtriangle"]]
(1-exp(coef))*100 ## X% higher or lower than the reference category. exp() to convert log-odds ratio coefficient into odds-ratio
## The odds of bat occupancy was 9.6x higher for buildings with triangular roofing than for other roof types


############################################################
############### Landscape-level bat occupancy ##############
############################################################

##---------------------------##
##----- Direct Assessment ---##
##---------------------------##
#### Buildings directly checked for signs, sighting and/or audio confirmation, or discussed occupation with owner

plot_features_direct <- read.csv("plot_features_direct.csv")

fit2 <- gam(n_occ ~ n_tot + p_bldg + p_roof + s(meanPW), family=poisson(link=log), data=plot_features_direct)
summary(fit2) ##saveRDS(fit2, "plot-fit-direct-spatial.RDS")

coef <- summary(fit2)[["p.coeff"]][["p_bldg"]]
st.error <- summary(fit2)[["se"]][["p_bldg"]]
(1-exp(coef))*100 
## The number of buildings occupied by bats increased by 1.6% for every unit increase in the proportion of modern buildings

gam.check(fit2)
cor.test(plot_features_direct$n_tot, plot_features_direct$p_bldg) ## R=0.17, p=0.6399
cor.test(plot_features_direct$n_tot, plot_features_direct$p_roof) ## R=-0.04, p=0.9072
cor.test(plot_features_direct$p_bldg, plot_features_direct$p_roof) ## R=0.65, p=0.04215

##---------------------------##
### With occupancy scoring ####
##---------------------------##
#### More stringent assessment of building occupancy = roosts very likely to be actively occupied (occupation category >=4) 

plot_features_occ4 <- read.csv("plot_features_occ4.csv")
#nrow(building_features_direct_sp %>% filter(!is.na(score))) ## 1,109 buildings 

fit2 <- gam(n_occ ~ n_tot + p_bldg + p_roof + s(meanPW), family=poisson(link=log), data=plot_features_occ4)
summary(fit2) ##saveRDS(fit2, "plot-fit-occ4-spatial.RDS")

coef <- summary(fit2)[["p.coeff"]][["p_bldg"]]
st.error <- summary(fit2)[["se"]][["p_bldg"]]
(1-exp(coef))*100 
## The number of buildings occupied by bats increased by 2% for every unit increase in the proportion of modern buildings

gam.check(fit2)
cor.test(plot_features_occ4$n_tot, plot_features_occ4$p_bldg) ## R=0.21, p=0.5674
cor.test(plot_features_occ4$n_tot, plot_features_occ4$p_roof) ## R=-0.07, p=0.8395
cor.test(plot_features_occ4$p_bldg, plot_features_occ4$p_roof) ## R=0.65, p=0.04215


##############################################################################################
##---------------------------------Sensitivity analysis, SI---------------------------------##
##############################################################################################
#### Analyses repeated on a subset of data that included traditional- and modern-style houses only, and houses with triangle and flat roofing only (i.e., with structures including latrines, livestock coupes, and greenhouses removed)

############################################################
############ Building(local)-level bat occupancy ###########
############################################################

##---------------------------##
##----- Direct Assessment ---##
##---------------------------##
#### Buildings directly checked for signs, sighting and/or audio confirmation, or discussed occupation with owner

building_features_direct_sp <- read.csv("SI_building_features_spatial.csv") ## spatial data redacted for home owner privacy
fit2 <- gam(occ_bin ~ building_type + roof_design + s(latitude, longitude), family=binomial(link=logit), data=building_features_direct_sp) 
summary(fit2) ##saveRDS(fit2, "SI_building-fit-spatial.RDS")

coef <- summary(fit2)[["p.coeff"]][["building_typezmodern"]]
st.error <- summary(fit2)[["se"]][["building_typezmodern"]]
(1-exp(coef))*100 ## X% higher or lower than the reference category. exp() to convert log-odds ratio coefficient into odds-ratio
## The odds of bat occupancy is 3x higher for modern-style buildings than for other building types

coef <- summary(fit2)[["p.coeff"]][["roof_designtriangle"]]
st.error <- summary(fit2)[["se"]][["roof_designtriangle"]]
(1-exp(coef))*100 ## X% higher or lower than the reference category. exp() to convert log-odds ratio coefficient into odds-ratio
## The odds of bat occupancy is 7x higher for buildings with triangular roofing than for other roof types


############################################################
############### Landscape-level bat occupancy ##############
############################################################

##---------------------------##
##----- Direct Assessment ---##
##---------------------------##
#### Buildings directly checked for signs, sighting and/or audio confirmation, or discussed occupation with owner

plot_features_direct <- read.csv("SI_plot_features_direct.csv")
fit2 <- gam(n_occ ~ n_tot + p_bldg + p_roof + s(meanPW), family=poisson(link=log), data=plot_features_direct)
summary(fit2) ##saveRDS(fit2, "SI-plot-fit-direct-spatial.RDS")

coef <- summary(fit2)[["p.coeff"]][["p_bldg"]]
(1-exp(coef))*100
## The number of buildings occupied by bats increased by 1.5% for every unit increase in the proportion of modern buildings
coef <- summary(fit2)[["p.coeff"]][["n_tot"]]
(1-exp(coef))*100
## The number of buildings occupied by bats increased by 0.7% for every unit increase in the proportion of modern buildings


gam.check(fit2)
cor.test(plot_features_direct$n_tot, plot_features_direct$p_bldg) ## R=0.15, p=0.6752
cor.test(plot_features_direct$n_tot, plot_features_direct$p_roof) ## R=-0.05, p=0.8887
cor.test(plot_features_direct$p_bldg, plot_features_direct$p_roof) ## R=0.36, p=0.3013

##---------------------------##
### With occupancy scoring ####
##---------------------------##
#### More stringent assessment of building occupancy = roosts very likely to be actively occupied (occupation category >=4) 

plot_features_occ4 <- read.csv("SI_plot_features_occ4.csv")
fit2 <- gam(n_occ ~ n_tot + p_bldg + p_roof + s(meanPW), family=poisson(link=log), data=plot_features_occ4)
summary(fit2) ##saveRDS(fit, "SI-plot-fit-occ4-spatial.RDS")

coef <- summary(fit2)[["p.coeff"]][["p_bldg"]]
(1-exp(coef))*100
## The number of buildings occupied by bats increased by 1.6% for every unit increase in the proportion of modern buildings
coef <- summary(fit2)[["p.coeff"]][["n_tot"]]
(1-exp(coef))*100
## The number of buildings occupied by bats increased by 0.6% for every unit increase in the proportion of modern buildings

gam.check(fit2)
cor.test(plot_features_occ4$n_tot, plot_features_occ4$p_bldg) ## R=0.25, p=0.4904
cor.test(plot_features_occ4$n_tot, plot_features_occ4$p_roof) ## R=-0.05, p=0.8964
cor.test(plot_features_occ4$p_bldg, plot_features_occ4$p_roof) ## R=0.29, p=0.4191

