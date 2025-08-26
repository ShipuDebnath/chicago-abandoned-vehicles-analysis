# Chicago Abandoned Vehicles Analysis

## Overview
This project analyzes abandoned vehicles in Chicago, focusing on days parked, ward distributions, vehicle makes, and spatial locations. It generates histograms, density plots, boxplots, interactive visualizations, and maps to identify patterns.

## Dependencies
- R (>= 4.0)
- Packages: `tidyverse`, `leaflet`, `scales`, `plotly`, `lubridate`
- Install: `install.packages(c("tidyverse", "leaflet", "scales", "plotly", "lubridate"))`

## Data
- Source: `Abandoned_Vehicles_Map` dataset (e.g., .csv with vehicle data)
- Location: `/data/abandoned_vehicles.csv` (include file or link to source)
- Processed data: `/data/abandoned_vehicles_processed.csv`

## Usage
1. Clone the repository: `git clone https://github.com/your-username/chicago-abandoned-vehicles-analysis.git`
2. Open R and set the working directory to the repo folder.
3. Load data (e.g., `Abandoned_Vehicles_Map <- read.csv("data/abandoned_vehicles.csv")`).
4. Run the script: `source("scripts/abandoned_vehicles_analysis.R")`
5. Outputs:
   - Plots in `plots/` (e.g., histograms, interactive maps as HTML)

## Key Findings
- Days parked distribution shows peaks and outliers.
- Common wards (45, 36, 11) have varying abandonment durations.
- Spatial map highlights locations of abandoned vehicles.
