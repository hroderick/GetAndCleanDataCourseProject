#Code Book for TidyData.txt

##Attribute Columns

**Subject_ID** 
* description : this is the id number of various participants in the study
* sources     : subject_test.txt, subject_train.txt
* values      : discrete integers, 1 through 30, with omissions possible
 
**Activity_Description** 
* description : This is a category of the observed activity when measurement was taken  
* sources     : y_test.txt, y_train.txt, activity_labels.txt 
* values      : discrete strings - WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS, SITTING
,  STANDING, LAYING
 

## Measure Columns


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

 
**tBodyAcc_mean_X** 
* description :   
* sources     :  
* values      :  
 
**tBodyAcc_mean_Y** 
* description :   
* sources     :  
* values      :  
 
**tBodyAcc_mean_Z** 
* description :   
* sources     :  
* values      :  
 
**tBodyAcc_std_X** 
* description :   
* sources     :  
* values      :  
 
**tBodyAcc_std_Y** 
* description :   
* sources     :  
* values      :  
 
**tBodyAcc_std_Z** 
* description :   
* sources     :  
* values      :  
 
**tGravityAcc_mean_X** 
* description :   
* sources     :  
* values      :  
 
**tGravityAcc_mean_Y** 
* description :   
* sources     :  
* values      :  
 
**tGravityAcc_mean_Z** 
* description :   
* sources     :  
* values      :  
 
**tGravityAcc_std_X** 
* description :   
* sources     :  
* values      :  
 
**tGravityAcc_std_Y** 
* description :   
* sources     :  
* values      :  
 
**tGravityAcc_std_Z** 
* description :   
* sources     :  
* values      :  
  
**tBodyAccJerk_mean_X** 
* description :   
* sources     :  
* values      :  
 
**tBodyAccJerk_mean_Y** 
* description :   
* sources     :  
* values      :  
 
**tBodyAccJerk_mean_Z** 
* description :   
* sources     :  
* values      :  
 
**tBodyAccJerk_std_X** 
* description :   
* sources     :  
* values      :  
 
**tBodyAccJerk_std_Y** 
* description :   
* sources     :  
* values      :  
 
**tBodyAccJerk_std_Z** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyro_mean_X** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyro_mean_Y** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyro_mean_Z** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyro_std_X** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyro_std_Y** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyro_std_Z** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroJerk_mean_X** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroJerk_mean_Y** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroJerk_mean_Z** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroJerk_std_X** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroJerk_std_Y** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroJerk_std_Z** 
* description :   
* sources     :  
* values      :  
 
**tBodyAccMag_mean** 
* description :   
* sources     :  
* values      :  
 
**tBodyAccMag_std** 
* description :   
* sources     :  
* values      :  
 
**tGravityAccMag_mean** 
* description :   
* sources     :  
* values      :  
 
**tGravityAccMag_std** 
* description :   
* sources     :  
* values      :  
 
**tBodyAccJerkMag_mean**  
* description :   
* sources     :  
* values      :  
 
**tBodyAccJerkMag_std** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroMag_mean** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroMag_std** 
* description :   
* sources     :  
* values      :  
  
**tBodyGyroJerkMag_mean** 
* description :   
* sources     :  
* values      :  
 
**tBodyGyroJerkMag_std** 
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_mean_X** 
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_mean_Y** 
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_mean_Z** 
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_std_X** 
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_std_Y**  
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_std_Z** 
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_meanFreq_X** 
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_meanFreq_Y** 
* description :   
* sources     :  
* values      :  
 
**fBodyAcc_meanFreq_Z** 
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_mean_X** 
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_mean_Y** 
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_mean_Z** 
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_std_X  
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_std_Y** 
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_std_Z** 
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_meanFreq_X** 
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_meanFreq_Y** 
* description :   
* sources     :  
* values      :  
 
**fBodyAccJerk_meanFreq_Z** 
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_mean_X** 
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_mean_Y** 
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_mean_Z**
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_std_X**
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_std_Y**
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_std_Z**
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_meanFreq_X**
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_meanFreq_Y**
* description :   
* sources     :  
* values      :  
 
**fBodyGyro_meanFreq_Z**
* description :   
* sources     :  
* values      :  
 
**fBodyAccMag_mean**
* description :   
* sources     :  
* values      :  
 
**fBodyAccMag_std**
* description :   
* sources     :  
* values      :  
 
**fBodyAccMag_meanFreq**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyAccJerkMag_mean**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyAccJerkMag_std**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyAccJerkMag_meanFreq**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyGyroMag_mean**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyGyroMag_std**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyGyroMag_meanFreq**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyGyroJerkMag_mean**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyGyroJerkMag_std**
* description :   
* sources     :  
* values      :  
 
**fBodyBodyGyroJerkMag_meanFreq**
* description :   
* sources     :  
* values      :  
 
**angle_tBodyAccMean_gravity**
* description :   
* sources     :  
* values      :  
 
**angle_tBodyAccJerkMean_gravityMean**
* description :   
* sources     :  
* values      :  
  
**angle_tBodyGyroMean_gravityMean**
* description :   
* sources     :  
* values      :  
 
**angle_tBodyGyroJerkMean_gravityMean**
* description :   
* sources     :  
* values      :  
 
**angle_X_gravityMean**
* description :   
* sources     :  
* values      :  
 
**angle_Y_gravityMean** 
* description :   
* sources     :  
* values      :  
 
**angle_Z_gravityMean**
* description :   
* sources     :  
* values      :  
 
