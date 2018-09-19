library(parallel)
library(lme4)

# Detect number of available cores
numCores <- detectCores()
numCores

# Define a test function. In this case,
# a regression using lmer
f <- function(i) {
  lmer(Petal.Width ~ . - Species + (1 | Species), data = iris)
}

# Define a test input
inputs <- 1:100

# Benchmark testFunction against inputs using all available cores
system.time({
  results <- mclapply(inputs, f, mc.cores = numCores)
})