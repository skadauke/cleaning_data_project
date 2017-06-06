# Human Activity Recognition Using Smartphones - Tidy Dataset

These are the files for the Course Project for the Coursera Getting and Cleaning Data Course. 

## The Human Activity Recognition Using Smartphones Study

The study that produced the data in this repository aimed at using data from a smartphone's linear and gyroscopic accelerometers to predict whether the a person is sitting, standing, laying down, or walking straight ahead, upstairs, or downstairs. The original study can be found [here](https://www.icephd.org/sites/default/files/IWAAL2012.pdf). The authors deposited their data at the UCI Machine Learning Repository:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## The Tidy Data

This repository contains the following files and folders:

1. `raw_data/`: a folder with the Human Activity Recognition Using Smartphones (HAR) data downloaded from the UCI Machine Learning Repository.
2. `tidy_data/`: a folder containing `har.csv` and `har_means.csv` which tabulate the mean and standard deviation of each "feature" reported in the raw data.  
3. `CodeBook.md`: a markdown document describing the meaning of each column in the `har.csv` and `har_means.csv` files
4. `run_analysis.R`: an R script which was used to generated the files in the tidy_data folder using files in the raw_data folder.

The `run_analysis.R` scripts performs the following steps:

1. Creates a data frame `har` by merging the data used for training and testing the model  in the study, as well as columns specifying the subject and activity, from the following files:
```
raw_data/UCI HAR Dataset/train/subject_train.txt
raw_data/UCI HAR Dataset/train/y_train.txt
raw_data/UCI HAR Dataset/train/X_train.txt
raw_data/UCI HAR Dataset/test/subject_test.txt
raw_data/UCI HAR Dataset/test/y_test.txt 
raw_data/UCI HAR Dataset/test/X_test.txt
```
2. Generates meaningful and syntactically correct column names for the data frame derived from `raw_data/UCI HAR Dataset/features.txt`.
3. Extracts only the measurement columns on the mean and standard deviation for each measurement.
4. Modifies the activity column to describe the activity instead of reporting a number.
5. Creates a second data frame `har_means` in which the average of each variable is calculated for each subject and each activity.
6. Writes the `har` and `har_means` data frames to `har.csv` and `har_means.csv`.

## Reference

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012