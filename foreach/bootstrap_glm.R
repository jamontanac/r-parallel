# Do bootstrap
x <- iris[which(iris[,5] != "setosa"),c(1,5)]

trials <- 10000

coeff <- NULL

ptime <- system.time({
    for( i in 1:trials ){
      ind <- sample(100, 100, replace=TRUE)
      result <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
      coeff <- rbind( coeff, coefficients(result) )
    }
})[3]

