# Introduction

The name of the script to be used to run the 5 steps project is "project_script.R".

Script steps:
* First, all the data is stored in the same working  directory. Thus will be easier manipulating the data. So we can now set the directory where we will be working.
* Read the required files into R.
* Ceate the data set by merging Train and Test data.
* Name the columns
* Get the mean values
* Create final table.


# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* Finally, `averages_data` contains the relevant averages which will be later stored in a `Samsung.txt` file.
