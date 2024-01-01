
# Time Series Analysis in Therapy Sessions

## Description
This R script is meticulously crafted for time series analysis, targeting the evaluation and modeling of interactions in therapy sessions. Utilizing Ordinary Differential Equations (ODE), it aims to decipher the dynamics between therapists and patients. The script encompasses several key components:

### Environment Setup and Data Preprocessing:
- Clears the workspace.
- Loads essential libraries for data manipulation, ODE modeling, and visualization, such as `dplyr`, `simode`, `ggplot2`, `reshape2`, and `tidyr`.
- Sets a seed for reproducibility.

### ODE Model Configuration:
- Defines constants and parameters, specifically focusing on therapist and patient interactions.
- Specifies time intervals and segments for comprehensive analysis.

### Data Loading and Metadata Extraction:
- Reads data from text files, each correlating to a therapy session.
- Extracts crucial metadata from filenames, including participant IDs and session specifics.

### Data Segmentation and Normalization:
- Segments data based on predefined time intervals.
- Implements data normalization for subsequent analysis.

### ODE Model Estimation and Analysis:
- Applies spline smoothing to the time series data.
- Estimates ODE model parameters using the `simode` package.
- Computes mean squared errors for model performance assessment.

### Eigenvalue Analysis:
- Executes eigenvalue analysis on the estimated parameters to determine their relative significance.

### Time Series Generation and Visualization:
- Generates time series data from the ODE model.
- Prepares and plots the data, showing both model fit and aggregated motion energy for therapist and patient.
- Plots are created using `ggplot2` for clear visualization of the dynamics.

### Exporting Results:
- The final results, including ODE parameters and analysis outcomes, are saved to a CSV file.

## Usage
The script is intended for researchers and practitioners analyzing time series data in therapy sessions. Users need to have their session data in text files and follow the prescribed format for filenames and content structure. The script can be run in an R environment after adjusting the file paths and parameters as needed.

## Dependencies
- R (version specified by user)
- R packages: dplyr, simode, ggplot2, reshape2, tidyr
