
args <- commandArgs(trailingOnly= TRUE)

allowed_arguments <- c(1,2,3)

if(length(args) != 1 || args not %in% allowed_arguments){
    cat("usage example: Rscript generateModels.R 1/2/3\n")
    quit()
}

if (args[1] == 1){

}

if (args[1] == 2){
    
}

if (args[1] == 3){
    
}