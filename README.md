## Ecological Niche Modeling of Bees Across the Tropics-to-Tundra Region

This repository contains R scripts and occurrence data supporting the ecological niche modeling (ENM) analyses associated with the manuscript **“Contrasting evolutionary histories underlie bee diversity hotspots from Neotropical rainforests to Arctic tundra.”**

## Authors of the code

- Angela Nava-Bolaños, Luis Osorio-Olvera and Jorge Soberón

## Methods

Ecological niche models were developed using minimum-volume ellipsoids (MVEs), implemented in R with the `ntbox` package.

The analytical workflow includes occurrence data processing, generation of species-specific environmental background samples, environmental predictor selection, model calibration, and evaluation.

Background regions were defined using 500-km buffers around species occurrence localities. Model calibration involved a 70/30 training-testing partition, correlation-based predictor screening, and model evaluation using omission rates and environmental background AUC.

## Code and Data

The repository contains three R scripts:

- **`R/01_occurrence_data_cleaning.R`** — Processing and cleaning of bee occurrence records.
- **`R/02_occurrence_background_preparation.R`** — Generation of species-specific occurrence and background datasets.
- **`R/03_mve_model_calibration.R`** — Calibration, evaluation, and selection of minimum-volume ellipsoid models.

The `data/` directory contains the bee occurrence dataset provided for these analyses.

## Requirements and Reproducibility

The analyses were conducted in R using packages including `ntbox`, `raster`, `dplyr`, `furrr`, and `rio`.

The scripts document successive stages of the ENM workflow but are not fully executable without additional inputs and local path configuration. The occurrence-cleaning script requires its original source datasets, while the background preparation and model calibration scripts require the corresponding environmental raster layers.

Environmental rasters and final geographic projections are not included in this repository.

## Related Repositories

- **Geographic range polygons:** [polygonBees](https://github.com/efishy/polygonBees)
- **Phylogenetic diversity and macroecological analyses:** [Bees_T2T](https://github.com/MaelDore/Bees_T2T)

## Citation

If you use the code or data provided in this repository, please cite the associated manuscript:

Contrasting evolutionary histories underlie bee diversity hotspots from Neotropical rainforests to Arctic tundra.

Full bibliographic details and the article DOI will be added upon publication

## License

The R code is distributed under the MIT License (see `LICENSE`). Reuse of occurrence data is subject to applicable source-specific conditions.
