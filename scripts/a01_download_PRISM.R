pacman::p_load("prism",
               "tidyverse")

prism_set_dl_dir("untracked_data/datafiles/prism_data/")

#Define variables (ppt, tmax, tmin, tmean), years, months
vars <- c("ppt", "tmax", "tmin", "tmean") # Precipitation, max temp, min temp, and mean temp, we may as well download it all.
years <- 1895:1940      # years of interest
months <- 1:12          # January - December

# Loop through variables and download monthly data
for (v in vars) {
  cat("Downloading variable:", v, "\n")
  get_prism_monthlys(
    type = v,
    years = years,
    mon   = months)
}


options(prism.path = NULL)

