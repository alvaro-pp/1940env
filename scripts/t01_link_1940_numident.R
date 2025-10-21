# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Link 1940 Census to Mortality Records 
# Author: Thelonious Goerz

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Set up working directory 
setwd("./untracked_data/raw")
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Load packages
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
library(readr)
library(magrittr)
library(tidyverse)
library(ipumsr)
library(data.table)

# Load Data 
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ddi <- read_ipums_ddi("usa_00017.xml")
census <- read_ipums_micro(ddi)

numident = fread("censoc_numident_v3.csv")

siblings_e = fread("censoc_numident_sibs_exact_match_v2.csv")
siblings_f = fread("censoc_numident_sibs_flexible_match_v2.csv")

geography = fread("censoc_numident_geography_supplement_v1.csv")

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Link 
data = census %>% 
  left_join(.,numident, by = "HISTID") %>% 
  left_join(.,siblings_e, by = "HISTID") %>% 
  left_join(.,siblings_f, by = "HISTID") %>% 
  left_join(.,geography, by = "HISTID")


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Save 
write_csv(data,"../processed/census_numident_linked.csv")
