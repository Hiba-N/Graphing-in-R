
args <- commandArgs(trailingOnly= TRUE)

if(length(args) != 1 || args not %in% allowed_arguments){
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