source("constants.R")
source("utilities.R")

args <- commandArgs(trailingOnly= TRUE)



generate.bacon.models <- function(args){

    all.data <- read_in.file()

    if(length(args) != 1 || args not %in% ALLOWED_ARGS){
    cat("usage example: Rscript generateModels.R 1/2/3\n")
    quit()
}

    if (args[1] == 1){
        cat("Command found: ", args[1]), "\ninitiating (1)"
    }

    if (args[1] == 2){
        cat("Command found: ", args[1]), "\ninitiating (2)"
    }

    if (args[1] == 3){
        cat("Command found: ", args[1]), "\ninitiating (3)"
    }
}

generate.bacon.models(args)