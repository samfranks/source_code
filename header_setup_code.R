#######################################################################################
#
#   Project: PROJECT_NAME_HERE
#   BTO project code: BTOXXX

#   Description: WHAT DOES THIS BIT OF CODE DO?

#   Name: YOUR NAME HERE
#   Start date: WHEN DID YOU START THE PROJECT?
#   Notable update dates: ANY NOTABLE UPDATE DATES? E.G. MAJOR ANALYTICAL REVISION
#   Manuscript title (if applicable): n/a
#   Publication details (if applicable): n/a
#
#######################################################################################



# ======================   Variables to pass to setup code source  ===========

# Header code to install and load packages, set directory paths, set seed, capture session info

# Fill in hashed out details, as given in this example:
# project_details <- list(project_name="eurasian_african_bird_migration_atlas", output_version_date="2019-12", workspace_version_date="2019-12")
# package_details <- c("sf","tidyverse","birdring","data.table","mapview","leaflet","tmap","spData","RColorBrewer","viridisLite","lubridate","geojsonio","htmlwidgets","js","htmltools","ezknitr","gganimate","magick","plotly")
# seed_number <- 1

# Fill in your project's details here:
# project_details <- list(project_name, output_version_name, workspace_version_name)
# package_details <- c("package name 1", "package name 2")
# sead_number <- 1



# =======================    Run source setup code   =================

# header code source:
# 1. sets working directories
# 2. loads required packages
# 3. prints session info to file
# 4. sets seed for reproducibility

# should run on either PC or Mac if using an R project (your project directory includes the .Rproj file) - uses relative paths
# source_code directory should be kept in the same parent directory as your project
source(file.path("../source_code", "source_setup_code_rproj.R"))

# # if not using an R project, use the below source file instead
# # you will need to customise the file path of the parent working directory (here, 'Git' is the parent directory, and source_code is the equivalent of the project directory)
# source(file.path("C:/Users/samf/Documents/Git/source_code", "source_setup_code.R"))


# project directories created:
# parentwd = Git
# projectwd = e.g. eurasian_african_bird_migration_atlas
# codewd = directory containing code, functions, source, etc
# datawd = directory containing data
# outputwd = directory containing outputs and results (within the appropriate version date)
# workspacewd = directory containing workspace files (.rds, .rda, .RData; within the appropriate version date)
# topoutputwd = top level output directory
# topworkspacewd= top level workspace directory


# =====================  Logic & control statements  ======================

## Any logic or control statements that determine code pathways go here



# =================================  Load functions =================================

## Load any functions here







