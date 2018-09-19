# Example:  Max row element
# Source: https://www.r-bloggers.com/apply-vs-for/

# Create random matrix
x <- matrix(rnorm(4000*40000), ncol=4000)

# Benchmark apply
applyTime <- system.time(mx2 <- apply(x, 1, max))

applyTime[3]
