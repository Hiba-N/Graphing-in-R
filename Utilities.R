source("constants.R")

#  Create a function which loads the data above and extracts the "bacon" row and puts it into a data frame.
# The function should also create a column which contains the months. 
# The months should be indicated by month number, starting at 1, 
# but not repeating (1 through the maximum number of months). 
# You may hard-code the name of the file. Note that this file is a bit of a mess, 
# you will need to add additional flags to your read.csv call to get the data into memory. 
# Also note that the as.numeric function can be used to convert a data frame row into a vector.

read_in.file <- function(){
    all.data <- read.csv(DATA, sep = ",", skip=HEADER_LENGTH) #skipping header rows
    #View(all.data) #sanity check
    all.data <- drop_na(all.data) #dropping invalid data, (essentially to drop footer)
    #View(all.data) # sanity check
    return(all.data)
}

read_in.bacon <- function(){
    
}

read_in.file()