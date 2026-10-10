## Ecological Niche Modeling of Bees Across the Tropics-to-Tundra Region

This repository contains R scripts and occurrence data supporting the ecological niche modeling (ENM) analyses associated with the manuscript **“Contrasting evolutionary histories underlie bee diversity hotspots from Neotropical rainforests to Arctic tundra.”**

## Authors of the code

- Angela Nava-Bolaños, Luis Osorio-Olvera and Jorge Soberón
- *In memory of Luis Osorio-Olvera, whose scientific contributions were fundamental to the development of the ecological niche modeling analyses documented in this repository.*

## Methods

Ecological niche models were developed using minimum-volume ellipsoids (MVEs), implemented in R with the `ntbox` package.
The analytical workflow includes occurrence data processing, generation of species-specific environmental background samples, environmental predictor selection, model calibration, and evaluation.

## Code and Data

The repository contains two R scripts:

- **`R/01_occurrence_background_preparation.R`** — Generation of species-specific occurrence and background datasets.
- **`R/02_mve_model_calibration.R`** — Calibration, evaluation, and selection of minimum-volume ellipsoid models.

The `data/` directory contains the bee occurrence dataset provided for these analyses.

## Related Repositories

- **Geographic range polygons:** [polygonBees](https://github.com/efishy/polygonBees)
- **Phylogenetic diversity and macroecological analyses:** [Bees_T2T](https://github.com/MaelDore/Bees_T2T)

## Citation

If you use the code or data provided in this repository, please cite the associated manuscript:

Contrasting evolutionary histories underlie bee diversity hotspots from Neotropical rainforests to Arctic tundra.

Full bibliographic details and the article DOI will be added upon publication

## License

The R code is distributed under the MIT License (see `LICENSE`). Reuse of occurrence data is subject to applicable source-specific conditions.
