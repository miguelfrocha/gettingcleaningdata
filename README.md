gettingcleaningdata
===================

This repository includes the solution to the project of the coursera course Getting and Cleaning Data.

This project is based on a dataset collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available from the UCI Machine Learning repository:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The file *run_analysis.R* includes all the relevant code for data pre-processing being divided into 5 parts:

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

In this file, the code is fully commented to allow to easily understand all steps.

The resulting tidy dataset produced by this pipeline is given in the file *result-tidy-data.txt*.
This includes the variables listed and explained in the codebook (*CodeBook.md*).

