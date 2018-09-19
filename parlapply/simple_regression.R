### lapply
library(lme4)

f <- function(i) {
  lmer(Petal.Width ~ . - Species + (1 | Species), data = iris)
}

system.time({
  save1 <- lapply(1:100, f)
})
