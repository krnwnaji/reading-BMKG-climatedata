# Load required libraries
library(dplyr)
library(readxl)
library(tidyverse)

# Specify file paths (replace with actual paths)
data_directory <- "2023/"
output_file <- "Riau_Region2020-2023.csv"

# Initialize an empty data frame to store merged data
merged_data <- data.frame()

# Iterate through station directories
for (station_dir in list.dirs(data_directory, recursive = FALSE)) {
  tryCatch(
    {
      # List Excel files within the station directory
      station_files <- list.files(station_dir, pattern = "*.xlsx$", full.names = TRUE, recursive = TRUE)
      
      # Process each Excel file
      for (file_path in station_files) {
        # Read data from Excel file
        station_data <- read_xlsx(file_path, trim_ws = TRUE, skip = 8) %>%
          # Filter for non-missing values in "ddd_car" column
          filter(!is.na(ddd_car)) %>%
          # Add a column indicating the station name
          mutate(station = basename(station_dir)) %>%
          # Parse date format
          mutate(date = as.Date(Tanggal, format = "%d-%m-%Y"))
        
        # Append processed data to the merged dataset
        merged_data <- bind_rows(merged_data, station_data)
        
        # Print progress messages
        message(paste("File processed:", file_path))
        message("Process complete")
      }
    },
    error = function(e) {
      message("An Error Occurred:")
      message(e)
      traceback()  # Print call stack for debugging
    },
    warning = function(w) {
      message("A Warning Occurred:")
      message(w)
    }
  )
}

# Save merged data to CSV
write.csv(merged_data, file = output_file, append = FALSE)
