source("constants.R")
library("data.table") #for %like% operator
library(tidyr)



read_in.file <- function(){
    all.data <- read.csv(DATA, sep = ",", skip=HEADER_LENGTH) #skipping header rows
    all.data <- drop_na(all.data) #dropping invalid data, (essentially to drop footer)
    return(all.data)
}

read_in.bacon <- function(all.data){
    bacon.data <- all.data[all.data[[1]] %like% "Bacon",]
    bacon.price <- as.numeric(bacon.data[-1]) #getting bacon prices as a list, removing bacon name in first cell
    print(bacon.price)
    months <- c(1:length(bacon.price)) #creating months list
    bacon.data <- cbind(months, bacon.price) #creating a bacon df of its own, consisting of months and bacon prices
    View(bacon.data)
}

data <- read_in.file()
read_in.bacon(data)