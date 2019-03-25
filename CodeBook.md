## Getting and Cleaning
### Part 1: Merging Train and Test data
Train and Test data are in different files. So, the first step is to merge these files. I used `rbind` and `cbind` to merge train and test data as well as target data and subject data. The end result of this part saved to `df: 10299 obs. of 563 variables`.

### Part 2: Extraxting mean and std
Using `grep`, I extracted all columns related to `mean` and `std`.  The end result of this part is saved to `df_p2: 10299 obs. of 88 variables` (Including Target and Subject)

### Part 3: Using Descriptive Activity Name
In this Part I merged activities table with the result of previous section. The end result of this part is saved to `df_p3: 10299 obs. of 88 variables` (Including ActivityLabel and Subject)

### Part 4: Labeling and Naming variables
I used `gsub` to substitude abbreviations and short names to more descriptive and explanatory names. Took care of `t`, `f`, `Acc`, `Gyro`, `Mag`, `BodyBody`, `-mean()-`, `-std()-`, and `-freq()-`. The end result of this part is saved to `df_p4: 10299 obs. of 88 variables` (Including ActivityLabel and Subject)

### Part 5: Tidy data and mean values
 I used `dplyr::aggregate` to group by the data by `subject` and `ActivityLabel` and calculated `mean` for each record of the group by. The end result of this part is saved to `tidy: 180 obs. of 88 variables`  
 
