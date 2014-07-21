WearableComputingProject
========================

This is a course project for the 'Getting and Cleaning data' course in Coursera.

This R program takes the raw data set and produces a tidy data set as per instructions.

Six files are read into the program, three from 'test' and three from 'train' categories. The types of files read are: subject, y (this is the activity file), and X file that has the measurements related to the respective activities. 

The goal of the project is to extract the mean and standard deviation from the measurement set (it is a 561 vector set for each subject), then get the average values of these measurements for each person and for each activity. This final data frame is the tidy data set.

The ‘features.txt’ file is used to extract the mean and standard deviation columns from the ‘X_test’ and ‘X_train’ measurement set. In this exercise, for extracting the mean values, only the names that have “mean()” in them are extracted, and those with meanFreq, etc. are all ignored.

In total, the tidy data set has 68 columns, including subject ID and their activity. The columns of the tidy data set and its descriptions are as follows. 

1. Subject: The ID of the subject/person

2. Activity: Activity of the person

Columns 3-35 represents the average value of the mean measurements of the following.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Acc-XYZ and Gyro-XYZ. These time domain signals (prefix ‘Time’ to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (BodyAcc-XYZ and GravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (BodyAccJerk-XYZ and BodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (BodyAccMag, GravityAccMag, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing BodyAcc-XYZ, BodyAccJerk-XYZ, BodyGyro-XYZ, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag. (Note the ‘Freq’ to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

3. Time.BodyAcc.Mean.X
4. Time.BodyAcc.Mean.Y
5. Time.BodyAcc.Mean.Z
6. Time.GravityAcc.Mean.X
7. Time.GravityAcc.Mean.Y
8. Time.GravityAcc.Mean.Z
9. Time.BodyAccJerk.Mean.X
10. Time.BodyAccJerk.Mean.Y
11. Time.BodyAccJerk.Mean.Z
12. Time.BodyGyro.Mean.X
13. Time.BodyGyro.Mean.Y
14. Time.BodyGyro.Mean.Z
15. Time.BodyGyroJerk.Mean.X
16. Time.BodyGyroJerk.Mean.Y
17. Time.BodyGyroJerk.Mean.Z
18. Time.BodyAccMag.Mean
19. Time.GravityAccMag.Mean
20. Time.BodyAccJerkMag.Mean
21. Time.BodyGyroMag.Mean
22. Time.BodyGyroJerkMag.Mean
23. Freq.BodyAcc.Mean.X
24. Freq.BodyAcc.Mean.Y
25. Freq.BodyAcc.Mean.Z
26. Freq.BodyAccJerk.Mean.X
27. Freq.BodyAccJerk.Mean.Y
28. Freq.BodyAccJerk.Mean.Z
29. Freq.BodyGyro.Mean.X
30. Freq.BodyGyro.Mean.Y
31. Freq.BodyGyro.Mean.Z
32. Freq.BodyAccMag.Mean
33. Freq.BodyAccJerkMag.Mean
34. Freq.BodyGyroMag.Mean
35. Freq.BodyGyroJerkMag.Mean

Columns 36-70 represents the average value of the standard deviation measurements described above. These are the counterparts of the mean value columns, i.e. these SD values are measured from the same dataset as the mean values. 

36. Time.BodyAcc.SD.X
37. Time.BodyAcc.SD.Y
38. Time.BodyAcc.SD.Z
39. Time.GravityAcc.SD.X
40. Time.GravityAcc.SD.Y
41. Time.GravityAcc.SD.Z
42. Time.BodyAccJerk.SD.X
43. Time.BodyAccJerk.SD.Y
44. Time.BodyAccJerk.SD.Z
45. Time.BodyGyro.SD.X
46. Time.BodyGyro.SD.Y
47. Time.BodyGyro.SD.Z
48. Time.BodyGyroJerk.SD.X
49. Time.BodyGyroJerk.SD.Y
50. Time.BodyGyroJerk.SD.Z
51. Time.BodyAccMag.SD
52. Time.GravityAccMag.SD
53. Time.BodyAccJerkMag.SD
54. Time.BodyGyroMag.SD
55. Time.BodyGyroJerkMag.SD
56. Freq.BodyAcc.SD.X
57. Freq.BodyAcc.SD.Y
58. Freq.BodyAcc.SD.Z
59. Freq.BodyAccJerk.SD.X
60. Freq.BodyAccJerk.SD.Y
61. Freq.BodyAccJerk.SD.Z
62. Freq.BodyGyro.SD.X
63. Freq.BodyGyro.SD.Y
64. Freq.BodyGyro.SD.Z
65. Freq.BodyAccMag.SD
66. Freq.BodyAccJerkMag.SD
67. Freq.BodyGyroMag.SD
68. Freq.BodyGyroJerkMag.SD
