library(parallel)

# Define a test function. In this case,
# generate 10000000 random numbers
testFunction = function(i) {
  summary(rnorm(10000000))
}

# Define a test input
inputs <- 1:2000

# Benchmark testFuncion against inputs using single core
system.time({
  results <- lapply(inputs, testFunction)
})
