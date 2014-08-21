Codebook for the Getting and Cleaning Data project
==================================================

The generated dataset includes 180 instances represented by 68 features, described below.
Overall, the data results from aggregating (averaging) measurements obtained from the sensors of a cell phone (Samsung) of individuals while performing different activities.

## Subject

The first column of the dataset represents the subject whose measurements were taken, represented by an integer index.

## Activity

The second column represents the activity performed by the subject when the measurements were taken.
This is a categorical (nominal) variable, represented by an R factor, with six different values (levels):
*Walking*, *Walking Upstairs*, *Walking downstairs*, *Sitting*, *Standing*, *Laying*.

## Aggregated measurements 

The remaining 66 features represent an aggregation of some of the original features, averaged by subject and by activity.
The features selected represent the mean and standard deviation (std) of the values from the initial sampled variables, in the three axes (X, Y, Z) and considering time and frequency (*t* and *f* in the start of the name).

The measurements include:
* BodyAcc
* GravityAcc
* BodyAccJerk
* BodyGyro
* BodyGyroJerk
* BodyAccMag
* GravityAccMag
* BodyAccJerkMag
* BodyGyroMag
* BodyGyroJerkMag

More details on the meaning of these measurements can be found on the original site:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)