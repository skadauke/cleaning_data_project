###
### run_analysis.R
###

# This script converts the Human Activity Recognition Using Smartphones
# Dataset, Version 1.0, into a tidy dataset for downstream analyses.
#
# The original dataset may be found here:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Load readr for reading data, dplyr for data wrangling, and stringr for 
# regular expressions
library(readr)
library(dplyr)
library(stringr)

# Create a data frame that combines the subject and activity labels as well as 
# the data from both the training and test set.

subjects_train <- "raw_data/UCI HAR Dataset/train/subject_train.txt"
activities_train <- "raw_data/UCI HAR Dataset/train/y_train.txt" 
signals_train <- "raw_data/UCI HAR Dataset/train/X_train.txt"

har_train <- cbind(
    read_table(subjects_train, col_names = FALSE),
    read_table(activities_train, col_names = FALSE),
    read_table(signals_train, col_names = FALSE)
)

subjects_test <- "raw_data/UCI HAR Dataset/test/subject_test.txt"
activities_test <- "raw_data/UCI HAR Dataset/test/y_test.txt" 
signals_test <- "raw_data/UCI HAR Dataset/test/X_test.txt"

har_test <- cbind(
    read_table(subjects_test, col_names = FALSE),
    read_table(activities_test, col_names = FALSE),
    read_table(signals_test, col_names = FALSE)
)

har <- rbind(har_train, har_test)

# Create meaningful column names for the data frame. The first columns should
# be named "subject" and "activity", and the remainder should be taken from the 
# features.txt file included with the data set. The column names in this file
# contain some syntactially problematic characters such as parentheses, commas,
# and dashes, which we will remove or convert to dots before renaming the 
# columns of our data frame.

features_file <- "raw_data/UCI HAR Dataset/features.txt"
features <- read_table2(features_file, col_names = FALSE) %>% 
    # the second column contains the column names we are interested in
    select(2) %>%   
    
    # convert from data frame to character vector
    unlist() %>%    
    
    # remove parentheses
    str_replace_all("[()]", "") %>% 
    
    # convert other non-alphanumeric characters to dots. Some names of
    # columns we are not interested in are present more than once in the
    # original description. The option unique = TRUE ensures all resulting
    # elements are unique.
    make.names(unique = TRUE)

# Change column names of the data frame. The first two columns indicate
# the subject number and the activity.
names(har) <- c("subject", "activity", features)

# Remove all columns except the subject and activity identifiers and the 
# mean and standard deviation values for each measurement. The columns 
# "gravityMean", "tBodyAccMean", "tBodyAccJerkMean", "tBodyGyroMean",
# and "tBodyGyroJerkMean" should not be matched as they were derived from 
# windowing functions and not measured directly. By ensuring only columns
# with a lower-case version of the string "mean" are matched, these will be
# excluded. Likewise, we want to exclude columns with column name "meanFreq".

har <- har %>%
    select(subject, activity, matches("mean|std", ignore.case = FALSE)) %>%
    select(-matches("meanFreq"))

# Make the activity column into an unordered factor, with the following factor
# levels and corresponding labels:
#
#   1 walking
#   2 walking_upstairs
#   3 walking_downstairs
#   4 sitting
#   5 standing
#   6 laying

activity_labels = c("walking", "walking_upstairs", "walking_downstairs",
                    "sitting", "standing", "laying")
har <- har %>%
    mutate(activity = factor(activity, labels = activity_labels))

# Create a second tidy data set with the average of each variable for each
# subject and activity.

har_means <- har %>%
    group_by(subject, activity) %>%
    summarize_all(mean)

# Write the tidy data files named har.csv (for Human Activity Recognition
# Using Smartphones) and har_means.csv as comma-separated value files.
# Place them into a directory tidy_data, which will be created if necessary.

if (!file.exists("tidy_data")) {
    dir.create("tidy_data")
}

write.table(har, "tidy_data/har.txt", row.names = FALSE)
write.table(har_means, "tidy_data/har_means.txt", row.names = FALSE)

