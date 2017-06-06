# Code Book: Human Activity Recognition Using Smartphones Data Set

This document describes the following two tables included in this repository:

```
har.csv
har_means.csv
```

The data in these tables were derived from a study performed by [Davide Anguita et al.](https://www.icephd.org/sites/default/files/IWAAL2012.pdf) The following sections are modified from the original authors' description of the study.

## Study Design and Data Generation

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities while wearing a Samsung Galaxy S II smartphone:

- walking
- walking upstairs
- walking downstairs
- sitting
- standing
- laying

Using the smartphone's accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Several features were calculated from the pre-processed accelerometer signals: 

- The acceleration signal was separated into body and gravity acceleration signals (tBodyAcc.X/Y/Z and tGravityAcc.X/Y/Z).
- The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
- The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Data Description

Each row in `har.csv` is a feature vector as defined above.

Each row in `har_means.csv` is the average of all measurements of a specific feature from a specific subject performing a specific activity.

Measurements are normalized and bounded within [-1,1].

'.X/Y/Z' is used to denote 3-axial signals in the X, Y and Z directions.

'.mean' is used to denote the mean or standard deviation of a measurement.

**subject**: the number of the study subject (n=30)

**activity**: the activity performed. One of:

- walking
- walking_upstairs
- walking_downstairs
- sitting
- standing
- laying

**tBodyAcc.X/Y/Z.mean/std**: Body linear acceleration signal in X, Y, or Z directions in the time domain; mean or standard deviation.

**tGravityAcc.X/Y/Z.mean/std**: Gravity linear acceleration signal in X, Y, or Z directions in the time domain; mean or standard deviation.

**tBodyAccJerk.X/Y/Z.mean/std**: Derivative of body linear acceleration signal by time in X, Y, or Z directions in the time domain; mean or standard deviation.

**tBodyGyro.X/Y/Z.mean/std**: Body angular velocity signal in X, Y, or Z directions in the time domain; mean or standard deviation.

**tBodyGyroJerk.X/Y/Z.mean/std**: Derivative of body angular velocity signal by time in X, Y, or Z directions in the time domain; mean or standard deviation.

**tBodyAccMag.mean/std**: Magnitude of three-dimensional body linear acceleration signal in the time domain by Euclidean norm; mean or standard deviation.

**tGravityAccMag.mean/std**: Magnitude of three-dimensional gravity linear acceleration signal in the time domain by Euclidean norm; mean or standard deviation.

**tBodyAccJerkMag.mean/std**: Magnitude of derivative of three-dimensional body linear acceleration signal in the time domain by Euclidean norm; mean or standard deviation.

**tBodyGyroMag.mean/std**: Magnitude of three-dimensional body angular velocity signal in the time domain by Euclidean norm; mean or standard deviation.

**tBodyGyroJerkMag.mean/std**: Magnitude of derivative of three-dimensional body angular velocity signal in the time domain by Euclidean norm; mean or standard deviation.

**fBodyAcc.X/Y/Z.mean/std**: Body linear acceleration signal in X, Y, or Z directions in the frequency domain; mean or standard deviation.

**fBodyAccJerk.X/Y/Z.mean/std**: Derivative of body linear acceleration signal by time in X, Y, or Z directions in the frequency domain; mean or standard deviation.

**fBodyGyro.X/Y/Z.mean/std**: Body angular velocity signal in X, Y, or Z directions in the frequency domain; mean or standard deviation.

**fBodyAccMag.mean/std**: Magnitude of three-dimensional body linear acceleration signal in the frequency domain by Euclidean norm; mean or standard deviation.

**fBodyAccJerkMag.mean/std**: Magnitude of derivative of three-dimensional body linear acceleration signal in the frequency domain by Euclidean norm; mean or standard deviation.

**fBodyGyroMag.mean/std**: Magnitude of three-dimensional body angular velocity signal in the frequency domain by Euclidean norm; mean or standard deviation.

**fBodyGyroJerkMag.mean/std**: Magnitude of derivative of three-dimensional body angular velocity signal in the frequency domain by Euclidean norm; mean or standard deviation.