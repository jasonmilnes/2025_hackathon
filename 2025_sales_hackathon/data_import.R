# Set the target working directory relative to the user's home directory
target_wd <- file.path("~", "2025_hackathon", "2025_sales_hackathon")
if(getwd() != target_wd) {
  setwd(target_wd)
}

# Set the personal library path (adjusts automatically for each user)
user_lib <- file.path("~", "R", "x86_64-pc-linux-gnu-library", "4.4")
.libPaths(c(user_lib, .libPaths()))

# Create the user library folder if it doesn't exist
if (!dir.exists(user_lib)) {
  dir.create(user_lib, recursive = TRUE)
}

# Install required packages if not already installed
packages <- c("readr", "dplyr")
new_packages <- packages[!(packages %in% installed.packages()[, "Package"])]
if (length(new_packages)) {
  install.packages(new_packages, lib = user_lib)
}

# Load libraries from the personal library
suppressMessages({
  library(readr, lib.loc = user_lib)
  library(dplyr, lib.loc = user_lib)
})

# Import datasets using paths relative to the target working directory
df_500_companies <- read_csv("500_companies.csv")
df_job_postings_geocoded  <- read_csv("data_science_job_postings_geocoded.csv")
df_spotify_songs <- read_csv("most_streamed_spotify_songs_2024.csv")
df_nfl_scores    <- read_csv("spreadspoke_scores.csv")

