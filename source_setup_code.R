#######################################################################################
#
#
#   SOURCE CODE: Header code to install and load packages, set directory paths, print session info
#   
#
#######################################################################################



# ======================  SET SEED & PROJECT DETAILS  ====================

set.seed(seed_number)

project_name <- project_details$project_name

# output and workspaces sub-directory (e.g. for original analysis, revisions, accepted versions, etc)
output_version_date <- project_details$output_version_date
workspace_version_date <- project_details$workspace_version_date



# =================================  INSTALL and LOAD PACKAGES =================================


list.of.packages <- package_details

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

if(length(new.packages)) install.packages(new.packages)

lapply(list.of.packages, library, character.only=TRUE)



# =================================  SET DIRECTORY PATHS  ================================

# ---- Parent working directory, depending on workstation (usually the Git folder) ----

if (cluster) parentwd <- c("/users1/samf") # BTO cluster
if (!cluster) {
  if (!Mac) parentwd <- paste("C:/Users/samf/Documents/Git")
  if (Mac) parentwd <- paste("/Volumes/m3_bitlocker_disk2s1_/BTO PC Documents/Git")
}

# ---- Create sub-directories ----

projectwd <- file.path(parentwd, project_name)
codewd <- file.path(projectwd, "code")
datawd <- file.path(projectwd, "data", sep="/")

if (is.null(output_version_date)) {
  top_outputwd <- NULL
  outputwd <- file.path(projectwd, "output")
} else {
  top_outputwd <- file.path(projectwd, "output")
  outputwd <- file.path(projectwd, "output", output_version_date)
}

if (is.null(output_version_date)) {
  top_workspacewd <- NULL
  workspacewd <- file.path(projectwd, "workspaces")
} else {
  top_workspacewd <- file.path(projectwd, "workspaces")
  workspacewd <- file.path(projectwd, "workspaces", workspace_version_date)
}

# create sub-directories if they don't exist (invisible() suppresses [[i]] NULL output from lapply)
dirs <- c(codewd, datawd, top_outputwd, top_workspacewd, outputwd, workspacewd)
lapply(dirs, function(x) {
  if (!dir.exists(x)) dir.create(x)
}) %>% invisible

options(digits=6)


# ================================  SESSION INFO  ===============================

# creates new session info .txt
# session info is captured in the most recent run of the code
# if using version control, then can see what the session_info was on each day you ran some code

session_info_file <- file.path(projectwd, "session_info.txt")
if (!file.exists(session_info_file)) file.create(session_info_file)

# get last modified timestamp
file_date_last_modified <- file.info(session_info_file)$mtime %>% format(., "%d-%b-%Y")

# today's date
today_date <- format(Sys.Date(), "%d-%b-%Y")

# update session_text only if the file was last modified previous to today's date
if(!file_date_last_modified %in% today_date) {
  sink(session_info_file)
  cat("\n# =============== Session info ==================\n", sep="\n")
  cat("# ----  Date: ", today_date, " --------\n\n")
  print(sessionInfo())
  sink()
}

