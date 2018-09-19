# Example:  Max row element
# Source: https://www.r-bloggers.com/apply-vs-for/

# Create random matrix
x <- matrix(rnorm(4000*40000), ncol=4000)

# Benchmark for
forTime <- system.time({
  mx <- rep(NA, nrow(x))
  for(i in 1:nrow(x)){
    mx[i] <- max(x[i,])
  }
})

forTime[3]
