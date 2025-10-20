# This code downloads and stores the 2000 county shapefile from TIGRIS, which we'll use to match to the 1940 census.
# Author: Álvaro Padilla Pozo
# Date: 10/20/205


# From IPUMS:
# https://www.nhgis.org/gis-files#1980-and-earlier
# 
# 1980 and Earlier Boundaries Based on 2000 TIGER/Line Files 
# 
# Because the 2000 TIGER/Line files contain no identifiers for census areas from 1980 and earlier, 
# NHGIS researchers obtained boundary definitions for those years by consulting other sources, including 1992 
# TIGER/Line data for 1980 census tracts; maps from printed census reports for 1910-1980 census tracts and other 
# small areas; and the Map Guide to the U.S. Federal Censuses, 1790-1920, by William Thorndale and William Dollarhide 
# (Genealogical Publishing Co., Baltimore, MD, 1987), for counties and states back to 1790. Where the historical boundaries
#  follow 2000 TIGER/Line features, the original NHGIS boundary files re-use those TIGER/Line features. Elsewhere, NHGIS 
#  researchers digitized new boundaries. NHGIS boundary files based on these files are identified as "2000 TIGER/Line +"
#   in the Basis column in the Select Data grid of the Data Finder


# Load libraries
pacman::p_load("tigris",
                "sf",
               "tidyverse")
# Download county shapefile from 2000 U.S. census TIGRIS
counties_2000 <- counties(year = 2000)
glimpse(counties_2000)
# Write shapefile
st_write(counties_2000, "untracked_data/shapefiles/counties_2000.shp")
