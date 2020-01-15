# Source R code used across multiple projects

Source code frequently used which installs packages, sets all of project directories and sub-directories, sets seed and outputs a session info text file with the current date and versions of all packages.
1. Use `header_setup_code.R` as the header code for everything. It also includes an example of what I usually put as my title and associated descriptive project information.
2. This calls either `source_setup_code_rproj.R` (if you use R projects), or `source_setup_code.R` (if you don't), which does all the package installation, directory setup, etc.
