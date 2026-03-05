source("constants.R")
library("data.table") #for %like% operator
library(tidyr)
library(ggplot2)



read_in.file <- function(){
    all.data <- read.csv(DATA, sep = ",", skip=HEADER_LENGTH) #skipping header rows
    all.data <- drop_na(all.data) #dropping invalid data, (essentially to drop footer)
    return(all.data)
}

read_in.product <- function(all.data, product){
    product.data <- all.data[all.data[[1]] %like% product,]
    product.price <- as.numeric(product.data[-1]) #getting product prices as a list, removing product name in first cell
    months <- c(1:length(product.price)) #creating months list
    product.data <- data.frame(months = months, product.price = product.price) #creating a product df of its own, consisting of months and product prices
    return(product.data)
}

calculate.correlation_estimators <- function(product.data){
    print("Computing correlation indicators...")
    cat("Covariance: ", cov(product.data[[1]], product.data[[2]]), "\n")
    cat("Correlation: ", cor(product.data[[1]], product.data[[2]]))
}


generate.linear_model <- function(product.data){
    calculate.correlation_estimators(product.data)
    product.linear_model <- lm(product.data[[2]] ~ product.data[[1]])
    print(summary(product.linear_model))

    plot <- ggplot(product.data, aes(x = months, y = product.price)) +
        geom_point() +
        geom_smooth(method = "lm") +
        ggtitle(paste(PRODUCT, "Price across Months")) +
        xlab("Month") +
        ylab("Price") +
        theme_bw()

    print(plot)
}

generate.quadratic_model <- function(product.data){
    calculate.correlation_estimators(product.data)
    product.data["month_squared"] <- product.data[1]^2

    #fit quadratic regression model
    product.quadratic_model <- lm(product.data[[2]] ~ product.data[[1]] + product.data[[3]])
    summary(product.quadratic_model)

    plot <- ggplot(product.data, aes(x = months, y = product.price)) +
        geom_point() +
        geom_smooth(method = "lm", formula = y ~ x + I(x^2), se = FALSE) +
        ggtitle(paste(PRODUCT, "Price across Months")) +
        xlab("Month") +
        ylab("Price") +
        theme_bw()
    
    print(plot)
}

generate.generalized_model <- function(product.data){
    calculate.correlation_estimators(product.data)

    product.generalized_model <- glm(product.data[[2]] ~ product.data[[1]],
            family = gaussian(link = "identity"), data = product.data)

    plot <- ggplot(product.data, aes(x = months, y = product.price)) +
        geom_point() +
        geom_smooth(method = "glm", formula = y ~ x, se = FALSE) +
        ggtitle(paste(PRODUCT, "Price across Months")) +
        xlab("Month") +
        ylab("Price") +
        theme_bw()
    
    print(plot)
}

