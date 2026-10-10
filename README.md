# Ecological Niche Modeling of Bees Across the Tropics-to-Tundra Region

This repository contains R scripts and occurrence data supporting the ecological niche modeling (ENM) analyses associated with the manuscript **“Contrasting evolutionary histories underlie bee diversity hotspots from Neotropical rainforests to Arctic tundra.”**

## Code Authors

- Angela Nava-Bolaños, Luis Osorio-Olvera and Jorge Soberón

*In memory of Luis Osorio-Olvera, whose scientific contributions were fundamental to the development of the ecological niche modeling analyses documented in this repository.*

## Methods

Ecological niche models were developed using minimum-volume ellipsoids (MVEs), implemented in R with the `ntbox` package. The analytical workflow includes the preparation of species-specific occurrence and environmental background datasets, environmental predictor selection, model calibration, evaluation, and selection. Selected ellipsoids were projected into geographic space to generate continuous environmental suitability maps and binary potential distribution maps.

## Code and Data

The repository contains two R scripts:

- **`R/01_enm_t2t_occs.R`** — Preparation of species-specific occurrence and environmental background datasets for ecological niche modeling.
- **`R/02_enm_t2t_ellip.R`** — Calibration, evaluation, selection, and geographic projection of minimum-volume ellipsoid models.

The `data/` directory contains the cleaned bee occurrence dataset (`cleaned_inG_26_06_24_ANB_latlong.csv`) used in these analyses.

## Related Repositories

- **Geographic range polygons:** [polygonBees](https://github.com/efishy/polygonBees)
- **Phylogenetic diversity and macroecological analyses:** [Bees_T2T](https://github.com/MaelDore/Bees_T2T)

## Citation

If you use the code or data provided in this repository, please cite the associated manuscript:

*Contrasting evolutionary histories underlie bee diversity hotspots from Neotropical rainforests to Arctic tundra.*

Full bibliographic details and the article DOI will be added upon publication.

## License

The R code is distributed under the MIT License (see `LICENSE`). Reuse of occurrence data is subject to applicable source-specific conditions.
