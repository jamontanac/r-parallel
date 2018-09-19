library(parallel)

# Detect number of available cores
numCores <- detectCores()
numCores

# Define a test function. In this case,
# generate 10000000 random numbers
testFunction = function(i) {
  summary(rnorm(10000000))
}

# Define a test input
inputs <- 1:2000

# Benchmark testFunction against inputs using all available cores
system.time({
  results <- mclapply(inputs, testFunction, mc.cores = numCores)
})
