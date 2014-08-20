# to run first set the working directory to the base folder where your files are
# the structure of the files is the one provided (with subfolders for train and test data)

# Part 1 
# Merges the training and the test sets to create one data set.
#########

# reading train data ...
## ... subjects
tr_subjects = read.table("train/subject_train.txt")
dim(tr_subjects) # 7352 rows; 1 col
head(tr_subjects) 
## ... train features
x_train = read.table("train/X_train.txt")
dim(x_train) # 7352 instances; 561 features
str(x_train)
## ... classes
y_train = read.table("train/y_train.txt")
dim(y_train) # 7352 rows; 1 column
## merging all columns in a single train dataset
train_data = cbind(tr_subjects, x_train, y_train)
dim(train_data) # 7352 instances; 563 columns

# reading test data ...
## ... subjects
ts_subjects = read.table("test/subject_test.txt")
dim(ts_subjects) # 2947 rows; 1 col
head(ts_subjects) 
## ... test features
x_test = read.table("test/X_test.txt")
dim(x_test) # 2947 instances, 561 features
## ... classes
y_test = read.table("test/y_test.txt")
dim(y_test) # 2947 rows; 1 column
## merging all columns in a single test dataset
test_data = cbind(ts_subjects, x_test, y_test)
dim(test_data) # 2947 instances; 563 columns

# merging training and test datasets
all_data = rbind(train_data, test_data)
dim(all_data) 
# total of 10299 instances; 563 columns (1st is subject index, 561 features, last is class index - activity)

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement

## reading feature list
feature_list = read.table("features.txt", row.names = 1)
feature_list
length(feature_list) # 561
## determining which contain mean() and std()
mean_indexes = grep("mean()", feature_list[[1]], fixed = T)
mean_indexes
std_indexes = grep("std()", feature_list[[1]], fixed = T)
std_indexes
indexes_keep = union(mean_indexes, std_indexes) + 1
### adding one to each index since 1st index in our dataset is the subject
indexes_keep
length(indexes_keep)
## filter dataset: keep subject, class and features that are mean() and std()
index_sbj = 1
index_class = dim(all_data)[2]
filtered_data = all_data[,c(index_sbj,indexes_keep,index_class)]
dim(filtered_data) # 10299 instances; 68 features

# Part 3 - Uses descriptive activity names to name the activities in the data set
##########

## read activity labels
act_labels= read.table("activity_labels.txt")
act_labels
## create new variable - factor
index_class = dim(filtered_data)[2]
names(filtered_data)[index_class] = "Activity"
new_activity = as.factor(filtered_data$Activity)
levels(new_activity) = act_labels[[2]]
## replace variables
filtered_data$Activity = new_activity
dim(filtered_data)
head(filtered_data$Activity)

# Part 4 - Appropriately labels the data set with descriptive variable names. 
##########

feature_names = as.character(feature_list[[1]][indexes_keep-1])
feature_names
names(filtered_data) = c("Subject",feature_names,"Activity")
names(filtered_data)
head(filtered_data)

# Part 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##########
new_data =  aggregate(. ~ Subject + Activity , data = filtered_data, mean)
dim(new_data)
names(new_data)
## write resulting tidy data set
write.table(new_data,"result-tidy-data.txt", row.names = F)
