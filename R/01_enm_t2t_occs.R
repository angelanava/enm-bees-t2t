
# ============================================================
# Bee Ecological Niche Modeling: Occurrence and Background Data
# ============================================================
#
# Authors: Angela Nava-Bolaños, Luis Osorio-Olvera,
#          Jorge Soberón
#
# Description:
# Prepares species-specific occurrence and background datasets
# for ecological niche modeling using environmental raster data.
# #
# Input:
#   - cleaned_inG_26_06_24_ANB_latlong.csv
#   - Environmental raster layers (.tif)
#
# Output:
#   - occs_bg/<species>_occ_swd.csv
#   - occs_bg/<species>_bg_swd.csv
#
# Main package: ntbox
# ============================================================
################

rm(list = ls())
library(ntbox)
library(raster)
library(dplyr)
library(furrr)
library(maptools)
library(parallel)

# Set a work directory
setwd("C:/Users/enm_bees")

# Load cleaned occurrence records and group them by species.
pol <- rio::import("data/cleaned_inG_26_06_24_ANB_latlong.csv")
polL <- pol %>% split(.$species)

# Load environmental predictors used for background sampling.
cp <- list.files("D:/Bios/5km/t2t/",pattern = ".tif$",full.names = T,recursive = T)
capas <- raster::stack(cp)
n_capas <- names(capas)
if(!dir.exists("occs_bg")) dir.create("occs_bg")

# Process species in parallel using a number of workers.
plan("multisession", workers=20)
swd_sps <- seq_along(polL) %>% furrr::future_map(function(x){
  bd <- polL[[x]]
  sp::coordinates(bd) <- ~ longitude + latitude
  raster::crs(bd) <- raster::crs(capas)
  bb <- raster::buffer(bd,500000) # Define the background region within 500 km of occurrences.
    cc <- raster::mask(raster::crop(capas,bb),bb)
   cc <- raster::stack(cc)
  nd <- length(na.omit(cc[[1]][]))
  ngb <- ifelse(nd > 100000,100000,nd)
  # Generate species-specific occurrence and background
  occ_bg <-   ntbox::swd_format(env_layers = cc,
                                nbg = ngb,
                                occs_points = polL[[x]],
                                sp_name = polL[[x]]$species[1],
                                longitude = "longitude",
                                latitude = "latitude",
                                random_seed = 123,
                                parallel = FALSE,
                                ncores = 11)
  sp_name <- gsub(" ","_",occ_bg$occs_swd$sp_name[1])
  
  # Export occurrence and background tables for model calibration.
  rio::export(occ_bg$occs_swd,
              file = file.path("occs_bg",
                               paste0(sp_name,"_occ_swd.csv")))
  rio::export(occ_bg$bg_swd,
              file = file.path("occs_bg",
                               paste0(sp_name,"_bg_swd.csv")))
  removeTmpFiles(h=0.1)
 
  return()
},.progress = TRUE,.options = furrr_options(seed = NULL))
