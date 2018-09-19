# Load libraries
library(lme4)
library(parallel)

# Define function
f <- function(i) {
  lmer(Petal.Width ~ . - Species + (1 | Species), data = iris)
}

# Benchmark non-parallel version
system.time(save1 <- lapply(1:100, f))