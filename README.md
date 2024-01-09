# Reading and Merging BMKG Monthly Climate Datasets

This R script automates the process of reading multiple Excel files containing monthly climate data from the BMKG (Badan Meteorologi, Klimatologi, dan Geofisika) and merges them into a single, comprehensive dataset.

Key Features:

Consolidates data from multiple stations and files: Handles diverse data sources efficiently.
Reads Excel files with readxl: Leverages specific functionality for Excel files.
Filters missing values: Ensures data quality for analysis.
Adds station information: Tracks data origin for context.
Parses date formats: Enables chronological analysis.
Handles varying column lengths: Accommodates potential inconsistencies.
Incorporates error handling: Gracefully manages unexpected issues.
Provides informative progress messages: Tracks execution status.
Outputs merged data as a CSV file: Facilitates further analysis and sharing.
Libraries Used:

dplyr
readxl
tidyverse
Usage:

Update file paths: Adjust data_directory and output_file variables to match your data structure.
Ensure libraries: Install required libraries using install.packages().
Run the script: Execute the code to merge and save the dataset.
