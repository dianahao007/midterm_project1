# Midterm Project 1 – Exploratory Analysis of F75 Nutrition Trial Data

**Authors:** Zixuan Hao, Chishan Sha, Jie Zhao, Yuyao Zhang  
**Course:** DATA 550 – Midterm Project 1  
**Last Updated:** November 20, 2025

---

## Project Overview

Severe acute malnutrition (SAM) remains a major contributor to childhood morbidity and mortality.  
The dataset used in this project comes from a **double-blind randomized controlled trial** evaluating whether a **modified therapeutic milk formula (mF75)**—lactose-free and lower in carbohydrates—improves early clinical outcomes compared with the standard WHO **F75** formula.

This project performs a **simple exploratory analysis** of a subset of the trial data, including:
- Describing baseline characteristics of enrolled children  
- Exploring MUAC (Mid-Upper Arm Circumference) patterns  
- Examining caregiver characteristics  
- Summarizing child nutritional recovery  
- Producing visualizations and summary tables  

The goal is *not* to replicate the trial’s clinical findings, but to practice **collaborative coding**, **GitHub workflows**, and **reproducible data analysis**.

---

## Project Structure


- **code/**  
  - `muac_arm_analysis.R` — MUAC by sex and summary statistics  
  - `caregiver_analysis.r` — Caregiver categories and characteristics  
  - `child_muac_recovery.R` — MUAC change and recovery indicators  
  - `f75_code1.R` — Importing data  
  - `f75_code2_render.R` — Script that renders the final report (Report.Rmd)

- **data/**  
  - `f75_interim.csv` — Main dataset from the trial  
  - `f75_codebook.xlsx` — Data dictionary  

- **output/**  
  - Contains all generated tables, figures, and CSV outputs  
  - (Example: `muac_summary_stats.csv`, visualization outputs, etc.)

- **Report.Rmd**  
  - Main R Markdown file that integrates all outputs into a final report  

- **Makefile**  
  - Automates running analyses and rendering the report  

- **Midterm_Project1.Rproj**  
  - RStudio project file  

- **README.md**  
  - Documentation and build instructions  

---

## Makefile Workflow

The project uses a **Makefile** to ensure reproducibility.

### **Build the full report**
`make`

This automatically:
1. Runs all analysis scripts in `code/`  
2. Generates tables and figures in `output/`  
3. Renders the final HTML report using `f75_code2_render.R`

## Data Source

**Primary Study:**  
Bandsma et al. (2019).  
*A reduced-carbohydrate and lactose-free formulation for stabilization among hospitalized children with severe acute malnutrition: A double-blind, randomized controlled trial.*  
**PLOS Medicine**.  
PMID: **30807589** | PMCID: **PMC6390989** | DOI: **10.1371/journal.pmed.1002747**

### Dataset Used  
- `f75_interim.csv` — Contains the first 6 months of interim trial data  
- `f75_codebook.xlsx` — Data dictionary describing variables in the dataset  




