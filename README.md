Data_Cleaning_Project
===================================================================================
-----------------------------------------------------------------------------------
This dataset is a modified version of an original dataset provided by:
=
> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
> Reyes-Ortiz. Human Activity Recognition on Smartphones using a
> Multiclass Hardware-Friendly Support Vector Machine. International
> Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
> Spain. Dec 2012

A extracted, modified description of the original dataset is provided below:
=
> Experiments were carried out with a group of 30 volunteers within an
> age bracket of 19-48 years. Each person performed six activities
> (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,
> LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using
> its embedded accelerometer and gyroscope, we captured 3-axial linear
> acceleration and 3-axial angular velocity at a constant rate of 50Hz.
> The experiments have been video-recorded to label the data manually.
> The obtained dataset has been randomly partitioned into two sets,
> where 70% of the volunteers was selected for generating the training
> data and 30% the test data.

Creation of modified dataset:
==================================
This modified dataset consists of measurements for 30 subjects while engaged in 6 different activities (see CodeBook for activity descriptions).  The dataset is obtained by executing the R script "run_analysis.R" which merges two datasets ("test" and "train") from the original study, provides descriptive names for both the activities as well as numerous Time and Frequency measurements captured through Accelerometer and Gyroscope tools by the original researchers.

For clarity, variables were renamed with abbreviations converted to full words (e.g. t = time, f = frequency, std dev = standard deviation) using CamelCase due to the longer length of variable names

**Note:  Before running the R Script run_analysis.R the user must ensure:**

 1. Working Directory includes these files:  x_test.txt, y_test.txt, subject_test.txt, x_train.txt, y_train.txt, subject_train.txt, features.txt
 2. The "plyr" package must have been loaded

Each record includes data for the following variables:
======================================

- Subject - identifies the subject number among the 30 subjects in the dataset
- Activity - identifies the activity measured for the subject (e.g. walking, standing, etc.)
- 66 Measurement Variables - each variable provides the subject's average measurement for each activity of the original Mean and Standard Deviation Measurements from the original dataset

The dataset includes the following files:
=========================================

- 'CodeBook.md': Provides a table of the 68 variable names in the final dataset along with variable type and description of variable contents

- 'run_analysis.R': R script to create the final dataset as a modification of the original datasets
