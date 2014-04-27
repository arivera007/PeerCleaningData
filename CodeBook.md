#Code Book for Samsung Data Project.

## Variables
### Total of 30 subjects doing each 6 different activities:


For each activity the following measurments were calculated from the raw measurments:

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

From these measurments, only the ones involving "std" and "mean" were included in the production of the final "Tidy Data". This data are the actual averages for every subject in every activity of the measurments involving std/mean. The dimension of the resulting Data Set is 180 rows by 68 Columns.
30 subjects * 6 Activities = 180 rows
66 std/mean measurments + 2 subject/description fields = 68 columns

## Data

The original data comes from the project:
Human Activity Recognition Using Smartphones Dataset
Version 1.0

and the raw data can be found at:

## Work performed
