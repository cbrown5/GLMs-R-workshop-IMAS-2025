# GLM R workshop IMAS 2025

2025-11-12

A/Prof Chris Brown, Prof Anthony Richardson

Notes and prompting patterns written during the Centre for Marine Socioecology R workshop 2025, in Hobart, Australia. 

## How to use 

Prompting patterns used during a workshop to guide LLM coding assistants through statistical modelling. Patterns are in the `Patterns/` directory. You can use these with any AI assistant. 
For example, to use with Github Copilot in VSCode:
1. Open VSCode in this project directory
2. Open a .qmd new file in the root directory of the project
3. Read the patterns first. 
4. Copy and paste the pattern you want to use into the new file
5. Update pattern text to point to your data/files as needed
6. Start Github Copilot in "Agent mode" 
7. Run the agent on the document that has the pattern (or just paste the pattern into the chat window).
8. Work through the pattern interactively, following the instructions in the pattern.

Common issue is that the Agent is unable to properly render quarto documents with terminal command. The agent may get stuck in a loop trying to make the quarto render. Make sure you have the quarto extension installed in VSCode. its also recommended to keep the .qmd in the root directory because then it syncs with data files more easily. If you have issues, just render it manually rather than accepting the Agent's suggestion to run terminal code to render. 


## Directories and files

### Patterns

The Patterns folder contains prompts. All prompts were run with VSCode and Github Copilot in an appropriate mode. 
Read these before use. You may need to update data references or instructions depending on your use case. 


### Project Structure

```
LinearModelling.Rproj          # R project file
readme.md                      # This documentation file
AGENTS.md                      # Instructions for AI agents
.gitignore                     # Git ignore file
Patterns/                      # Prompts used with LLM assistants
Data/                          # Data directory containing CSV files
├── ConsistencyData.csv        # Consistency dataset
├── fish-coral-cover-sites.csv # Fish dataset
```

## File Descriptions

### PATTERNS 

#### readme-setup.md  
Project documentation setup pattern that creates README files. Documents directory structure, catalogs all project files, describes datasets with detailed variable definitions, and provides context for variable interpretation and usage.

#### linear-model-summary.md
Interactive linear regression analysis pattern that creates documentation for a simple linear model. Generates a Quarto document with formatted summary tables using `kable`, predictive plots using `marginaleffects` package, and statistical interpretation for non-experts. Includes model verification/diagnostic plots, suggestions for model improvements (transformations, GLM alternatives), outlier and leverage point analysis, and sensitivity analyses.

#### stepwise-model-selection.md
Interactive backwards stepwise model simplification workflow . Starts with full model  and uses interactive checkpoint system for joint human and agent decision-making. Includes model diagnostics at each step, renders documents for review between steps, systematic term removal with F-ratio testing, and final predictive plots using `marginaleffects`.


### Data Files

#### ConsistencyData.csv
Marine biological studies consistency meta-analysis dataset with 5 variables and 1,701 observations:
- **Index** (integer): Unique observation identifier
- **Consistency** (binary): 0 = inconsistent with expected climate impacts, 1 = consistent with expected climate impacts
- **Taxa** (categorical): Marine organism groups (Bony fish, Non-bony fish, Benthic crustacea, Benthic algae, Benthic molluscs, Zooplankton, Seabirds, Phytoplankton, Larval bony fish, Benthic cnidarians)  
- **Latitude** (categorical): Climate zones (Temperate, Subtropical, Tropical, Polar)
- **Obstype** (categorical): Type of biological observation (Distribution, Abundance, Phenology, Community change, Demography, Calcification)

Recommended to use for binomial GLM exercises e.g. `Consistency ~ Taxa * Latitude * Obstype`

Bibtex references for attribution

```
@article{poloczanska2013global,
  title={Global imprint of climate change on marine life},
  author={Poloczanska, Elvira S and Brown, Christopher J and Sydeman, William J and Kiessling, Wolfgang and Schoeman, David S and Moore, Pippa J and Brander, Keith and Bruno, John F and Buckley, Lauren B and Burrows, Michael T and others},
  journal={Nature climate change},
  volume={3},
  number={10},
  pages={919--925},
  year={2013},
  publisher={Nature Publishing Group UK London}
}
```

#### fish-coral-cover-sites.csv

Fish and coral cover dataset from Solomon Islands with 13 variables and observations from multiple reef sites:
- **site** (character): Unique site identifiers for joining with other datasets
- **reef.ID** (character): Unique reef identifiers
- **pres.topa** (integer): Count of Topa fish (local name for Bolbometopon muricatum - bumphead parrotfish)
- **pres.habili** (integer): Count of Habili fish (local name for Cheilinus undulatus - humphead wrasse)
- **secchi** (numeric): Horizontal secchi depth in meters - higher values indicate clearer, less turbid water
- **flow** (factor): Tidal flow strength at site ("Strong" or "Mild")
- **logged** (factor): Logging status of region ("Logged" or "Not logged")
- **coordx** (numeric): X coordinate in UTM zone 57S projection
- **coordy** (numeric): Y coordinate in UTM zone 57S projection
- **cb_cover** (integer): Number of point-intercept transect (PIT) points with branching coral cover
- **soft_cover** (integer): Number of PIT points with soft coral cover
- **n_pts** (integer): Total number of PIT points at site (denominator for calculating percent cover)
- **dist_to_logging_km** (numeric): Linear distance to nearest logging pond in kilometers

Recommended for linear modeling exercises examining relationships between fish abundance, coral cover, water quality (secchi depth), and human impacts (logging distance).

Bibtex references for attribution

```
@article{brown2018estimating,
  title={Estimating the footprint of pollution on coral reefs with models of species turnover},
  author={Brown, Christopher J and Hamilton, Richard J},
  journal={Conservation Biology},
  volume={32},
  number={4},
  pages={949--958},
  year={2018},
  publisher={Wiley Online Library}
}

@article{hamilton2017logging,
  title={Logging degrades nursery habitat for an iconic coral reef fish},
  author={Hamilton, Richard J and Almany, Glenn R and Brown, Christopher J and Pita, John and Peterson, Nathan A and Choat, J Howard},
  journal={Biological Conservation},
  volume={210},
  pages={273--280},
  year={2017},
  publisher={Elsevier}
}

```

