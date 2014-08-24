GetAndCleanDataCourseProject README.md
======================================

This is work summitted for the course project assignment.

Files included, listed here in no particular order include
  * README.md       - A guide to the repo
  * TidyData.txt    - the end result data file
  * CodeBook.md     - A guide to the contents of TidyData.txt
  * run_analysis.R  - The R source code that wroter TidyData.txt

I've chosen to not include raw data files or documentation. It can be found [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The project required we create one R script called run_analysis.R that does the following. 
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The remainder summarizes the steps taken to transform the raw data into tidy data by stepping through the run_analysis.R process at a high level. You will find many more specific detail comments in the source code itself.
  1. Loads 6 files into separate data frames. Studied how the data could be merged.
  2. Created separate sequences vectors for the train and test data frame groups an added as an id column to all data frames.
  3. Merged the three files in each group into a single data frame using added id column
  4. Stacked the combined train and target data frames into a single data frame. ###At this point requirement number 1 was complete.###
  5. For extra credit, removed large dataframes that were no longer needed and did garbage collection to free up memory
  6. Merged an activity description colunmn onto the data frame. ###At this point requirement number 3 was complete.###
  7. Dropped all columns not needed in the TidyData output, retaining only the subject, activity description, and measures described with *mean* or *std* phrasing. ###At this point requirement number 2 was complete.###
  8. Replaced generic column names with names derived from the raw data meta data. To make them prettier, empty parenthesis were removed, filled parenthesis and commas were replaced with underscores. ###At this point requirement number 4 was complete.###
  9. Melted and recast ther data into a tidy data frame with the mean of each measure summarized for each subject and activity.
  10. Wrote out the tidy data frame to TidyData.txt file
  
I learned a lot from this project and feel it necessary to defend one shortcut taken. Instead of using R to handle the activity descriptions and column names, I extracted and manipulated them using notepad and excel and hardcoded them into the source code. My position is that this is metadata and not data so
  * Unlikely to change in other tests of the equipment
  * If metadata did change there's a high probability that other parts of the script would need change
And to be fully open
  * Doing so took 10 minutes instead of 2 hours I'd be programming
  * And finally, other work in the script demonstrates that I could be successful had I determined to pull activity descriptions and column names from the raw data documentation using R.
  * 
  
#Thanks for your review

