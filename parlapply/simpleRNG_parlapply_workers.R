# Load libraries
library(parallel)

# Define a test function. In this case,
# generate 10000000 random numbers
testFunction = function(i) {
  summary(rnorm(10000000))
}

inputs <- 1:2000

# Define cluster nodes
workers <- c( rep("localhost",8))

# Benchmark parLapply
system.time({
  cl <- makeCluster(workers,type="PSOCK")
  clusterExport(cl, "inputs")
  resultsParallel <- parLapply(cl, inputs, testFunction)
  stopCluster(cl)
})
