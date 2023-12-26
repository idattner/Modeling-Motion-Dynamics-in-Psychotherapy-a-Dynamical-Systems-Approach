
# Shiny Dynamics - Interactive ODE Solver and Visualizer

## Overview
Shiny Dynamics is an R-based Shiny application developed by Itai Dattner as part of the research for the paper: "Modeling Motion Dynamics in Psychotherapy: a Dynamical Systems Approach". This application is designed to solve and visualize systems of ordinary differential equations (ODEs), offering an interactive platform for understanding motion energy dynamics in psychotherapy sessions.

## Research Background
This app accompanies the paper which introduces a novel mechanistic modeling and statistical framework for analyzing motion energy dynamics within psychotherapy sessions. The methodology transforms raw motion energy data into an interpretable narrative of therapist-patient interactions, providing unique insights into these dynamics. The approach is exemplified through case studies and an extensive analysis of one therapist's sessions over four years, distinguishing between trait-like and state-like dynamics. This research marks a significant advancement in the quantitative understanding of motion dynamics in psychotherapy.

## Features
- **ODE Solver**: Uses `deSolve` for numerical ODE solving.
- **Interactive UI**: Built with `shiny` for dynamic user interaction.
- **Graphical Output**: Utilizes `ggplot2` for visualizing ODE solutions.

## Requirements
- R
- `deSolve`
- `shiny`
- `ggplot2`
- `reshape2`

## Usage
1. Install all required libraries.
2. Run `shiny_dynamics.R` in an R environment.
3. Set ODE parameters in the Shiny app.
4. Observe real-time solution visualizations.

## License
Licensed under the Apache License 2.0. Proper attribution is required. See [LICENSE](LICENSE).

## Citation
If you use this application in your research, please cite:  
Itai Dattner. (Year). Modeling Motion Dynamics in Psychotherapy: a Dynamical Systems Approach. [Journal/Conference Name], [Volume], [Page numbers].

## Author
Itai Dattner
