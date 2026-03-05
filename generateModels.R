source("constants.R")
source("utilities.R")

args <- commandArgs(trailingOnly= TRUE)
args <- as.numeric(args) #ensuring args are numeric as per choices allowed

generate.model <- function(args){

    if(length(args) != 1 || !(args %in% ALLOWED_ARGS)){ #check to ensure only one arg is given and is valid
    cat("usage example: Rscript generateModels.R 1/2/3\n")
    quit()
}

    all.data <- read_in.file() #reading in file as dataframe, and cleaning file of all meta data
    product.data <- read_in.product(all.data, PRODUCT) #subsetting to dataframe, of concerned product only

    if (args[1] == 1){
        cat("Command found: ", args[1], "\ninitiating (1)")
        generate.linear_model(product.data) #function for linear model

    }

    if (args[1] == 2){
        cat("Command found: ", args[1], "\ninitiating (2)")
        generate.quadratic_model(product.data) #function for quadratic model
    }

    if (args[1] == 3){
        cat("Command found: ", args[1], "\ninitiating (3)")
        generate.generalized_model(product.data) #function for generalized model
    }
}

generate.model(args) #main function