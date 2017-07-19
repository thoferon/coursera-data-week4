# Data generation

Here are the steps taken to generate the data in `tidy.txt` from the ones coming
from the UCI as described in README.md.

For the test and train sets, hereafter called `TYPE`, the script proceeds this
way:

* Values are read from `TYPE/X_TYPE.txt` with the columns specified in
  `features.txt`.
* Values' columns are filtered to only take columns containing `std()` or
  `mean()`.
* Subjects are read from `TYPE/subject_TYPE.txt`.
* Activities are read from `TYPE/y_TYPE.txt` and translated from an ID to a
  string based on the contents of `activity_labels.txt`.
* These three data frames' rows correspond to the same recordings so they are
  concatenated intro one data frame. (column-wise)

The resulting test and train data frames are then concatenated (row-wise) as
they contain data of the same format and nature.

For each triple `(subject, activity, variable)` where variable is one the
filtered column, the average is computed and added to a new data frame. This
final data frame is then written to `tidy.txt`.

# Columns

* `subject` is the ID assigned to the person whose activity has been recorded.
* `activity` is the activity the subject was performing when the data have been
  recorded. This is labeled as `WALKING`, `WALKING_UPSTAIRS`,
  `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING` which are
  self-explanatory.
* `variable` is the name of the variable from the UCI data set as described in
  the next section.
* `average` is the mean value of all the recordings matching the triple
  `(subject, activity, variable)`.

# Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* `tBodyAcc-XYZ`
* `tGravityAcc-XYZ`
* `tBodyAccJerk-XYZ`
* `tBodyGyro-XYZ`
* `tBodyGyroJerk-XYZ`
* `tBodyAccMag`
* `tGravityAccMag`
* `tBodyAccJerkMag`
* `tBodyGyroMag`
* `tBodyGyroJerkMag`
* `fBodyAcc-XYZ`
* `fBodyAccJerk-XYZ`
* `fBodyGyro-XYZ`
* `fBodyAccMag`
* `fBodyAccJerkMag`
* `fBodyGyroMag`
* `fBodyGyroJerkMag`

The set of variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation
