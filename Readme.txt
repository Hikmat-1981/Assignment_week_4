
Here are the steps how I started running a run_analyis.R file step by step

# Before I start doing assignment-- I need 2 install required packages --
# Now I am getting data -- that is download and load it in R memory --
# Here I am 2 assign a name 2 the file 2 be downloaded 
# Check 2 see if directory exists-- if not I am gonna create one --
# The I download the file into file name under ./data directory
# Now 2 unzip the file into same directory where <zipFile> is contained --

# Now reading the data files and tables --
# Now I am reading the data for test directory --
# Now reading activity labels into R memory --
# Now reading features table into memory --
# Now I need 2 merge training and the test sets to create one data set
# Since new table does not have column/variable names I need 2 assign them a value --
# Now, 2 get the measurements on the mean and standard deviation --
# Here I am getting chr vectors that contain name only four shown below --
# Here I need 2 use descriptive activity names to name the activities in the data set--
# Now,I need  label the data set with descriptive variable/columns names --
# That way merged table is much more understandable for users --


# Here I am grouping <humanActivity> table by 2 subject and activity columns --
# Then using summarise_each() command taking mean of all columns --
# Lastly, I need to write the file up into <tidy_data.txt> file before submission --