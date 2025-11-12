# GLM R workshop IMAS 2025

2025-11-12

Prof Anthony Richardson, A/Prof Chris Brown

Notes written during the workshop

Notes available at: https://mathmarecol.github.io/RWorkshop/UTas_day2_linearModelling.html

## Directories and files

### Patterns

The Patterns folder contains prompts. All prompts were run with VSCode and Github Copilot in an appropriate mode. 


### Project Structure

```
LinearModelling.Rproj          # R project file
readme.md                      # This documentation file
AGENTS.md                      # Instructions for AI agents
.gitignore                     # Git ignore file
Patterns/                      # Prompts used with LLM assistants
Data/                          # Data directory containing CSV files
├── ConsistencyData.csv        # Consistency dataset
├── CopepodData.csv           # Copepod dataset
├── grasses.csv               # Grasses dataset
├── shark1.csv                # Shark dataset
└── ZooBiomass.csv            # Zooplankton biomass dataset
Scripts/                       # R scripts directory
├── linear-model.R            # Linear modeling script
└── model-selection.R         # Model selection script
```

## File Descriptions

### PATTERNS 

#### readme-setup.md  
Project documentation setup pattern that creates README files. Documents directory structure, catalogs all project files, describes datasets with detailed variable definitions, and provides context for variable interpretation and usage.

#### linear-model-summary.md
Interactive linear regression analysis pattern that creates documentation for a simple linear model. Generates a Quarto document with formatted summary tables using `kable`, predictive plots using `marginaleffects` package, and statistical interpretation for non-experts. Includes model verification/diagnostic plots, suggestions for model improvements (transformations, GLM alternatives), outlier and leverage point analysis, and sensitivity analyses.

#### stepwise-model-selection.md
Interactive backwards stepwise model simplification workflow using ZooBiomass data with log10(Biomass) response. Starts with full 3-way interaction model (`Depth * Zone * Region`) and uses interactive checkpoint system for joint human and agent decision-making. Includes model diagnostics at each step, renders documents for review between steps, systematic term removal with F-ratio testing, and final predictive plots using `marginaleffects`.


### Data Files

#### ConsistencyData.csv
Marine biological studies consistency meta-analysis dataset with 5 variables and 1,701 observations:
- **Index** (integer): Unique observation identifier
- **Consistency** (binary): 0 = inconsistent with expected climate impacts, 1 = consistent with expected climate impacts
- **Taxa** (categorical): Marine organism groups (Bony fish, Non-bony fish, Benthic crustacea, Benthic algae, Benthic molluscs, Zooplankton, Seabirds, Phytoplankton, Larval bony fish, Benthic cnidarians)  
- **Latitude** (categorical): Climate zones (Temperate, Subtropical, Tropical, Polar)
- **Obstype** (categorical): Type of biological observation (Distribution, Abundance, Phenology, Community change, Demography, Calcification)

#### CopepodData.csv
Marine copepod monitoring data from Australian National Reference Stations with 211 variables and multiple years of sampling:
- **Project/StationName/StationCode/Coordinates**: Station metadata (NRS Darwin, NRS Yongala)
- **TripCode**: Unique sampling trip identifier
- **SampleTime_UTC/Local**: Temporal sampling information
- **Year/Month/Day/Time**: Date-time components
- **Depth** (numeric): Sampling depth in meters
- **Environmental variables**: SST (Sea Surface Temperature), Chla (Chlorophyll-a), Salinity, SOI (Southern Oscillation Index)
- **Biomass/AshFreeBiomass** (numeric): Total copepod biomass measurements  
- **Species abundance columns** (numeric): Count data for ~200 copepod species (e.g., Acartia danae, Calanus australis)

#### grasses.csv  
Experimental plant ecology dataset examining grass species response to soil conditions with 3 variables and 90 observations:
- **pH** (categorical): Soil acidity level (low, mid, high) - experimental treatment
- **Biomass** (numeric): Plant biomass measurement (likely dry weight in grams)
- **Species** (integer): Number of grass species present in experimental plot

#### shark1.csv
Shark sighting/encounter time series data with 5 variables and 724 observations:
- **Sightings** (integer): Number of shark sightings recorded per observation period
- **Year** (integer): Year of observation (2005-2011) 
- **Month** (integer): Month of observation (1-12)
- **DayOfYr** (integer): Julian day of year (1-365)
- **DayFromStart** (integer): Sequential day number from start of study period

#### ZooBiomass.csv
Marine zooplankton biomass study comparing mining impact sites with 6 variables and 200 observations:
- **Region** (categorical): Impact assessment (Mine vs Reference sites)
- **Zone** (categorical): Distance from shore (Inshore vs Offshore)  
- **TimeOfDay** (categorical): Sampling time (Day vs Night)
- **Depth** (numeric): Sampling depth in meters
- **Temperature** (numeric): Water temperature in degrees Celsius
- **Biomass** (numeric): Zooplankton biomass measurement (likely mg/m³ or similar units)

**Scripts:**
- `linear-model.R` - Contains linear modeling examples and exercises
- `model-selection.R` - Contains model selection techniques and comparisons 



