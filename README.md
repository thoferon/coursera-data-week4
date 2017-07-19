This is a programming assignment for "Getting and Cleaning Data" [1], a part of
the Data Science specialisation on Coursera.

It contains a script `run_analysis.R` which gets the data and processes them
into a tidy data set. More information is available in `CodeBook.md` about the
format of the resulting data set. (generated in `tidy.txt`)

The data comes from a publication about recognising human activities based on
Smartphone data [2] and are downloaded by `run_analysis.R` from the following
adress.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Running the script

You can run the script to generate the tidy data set with the following
commands assuming you have R installed on your computer.

```
cd /path/to/repo
R --no-save < run_analysis.R
```

# Reading in the tidy set

After running the script, a file `tidy.txt` should have been created. You can
read the data in R like this:

```
averages <- read.table("tidy.txt")
```

The file `CodeBook.md` describes the variables in this file and how they have
been generated.

# References

[1] Getting and Cleaning Data, Coursera (https://www.coursera.org/learn/data-cleaning/home)
[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
