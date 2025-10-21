# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Clean 1940 Linked-1940 Data 
# Author: Thelonious Goerz

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rm(list = ls())
# Set up working directory 
setwd("./untracked_data/processed")
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Load packages
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
library(readr)
library(magrittr)
library(tidyverse)
library(ipumsr)
library(data.table)
library(readxl)
# Load Data 
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = fread("census_numident_linked.csv",nrows = 10000)
# Crosswalk 
cw = read_excel("../crosswalks/icpsrcnt.xls")

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Process Data 

data %>% 
  # Make Identifiers Concordant With 1940 ICPSR Codes 
mutate(race = case_when(
  RACE == 1 ~ "White",
  RACE == 2 ~ "Black", 
  RACE %i% c(4,5,6) ~ "Asian",
  RACE == 7 ~ "Other",
  RACE %in% c(8,9) ~ "Multiracial",
  RACE == 3 ~"AIAN"
),
sex = ifelse(sex ==1,"Male","Female")
)
