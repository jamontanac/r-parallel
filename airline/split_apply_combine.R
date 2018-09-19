library(bigmemory)

x <- attach.big.matrix("airline.desc")

# Divide CRSDepTime by 100 and take the floor to
# get the departure hour.

depHours <- floor(x[,"CRSDepTime"]/100)

# Set the departure hours listed as 24 to 0.

depHours[depHours==24] <- 0

# Split on the hours.
hourInds <- split(1:length(depHours), depHours)

# Create a variable to hold the quantile probabilities.
myProbs <- c(0.9, 0.99, 0.999, 0.9999)

# Load foreach library
library(foreach)

# Use foreach to find the quantiles for each hour.
delayQuantiles <- foreach( hour = hourInds, .combine=cbind) %do% {
                     require(bigmemory)
                     x <- attach.big.matrix("airline.desc")
                     quantile(x[hour, "DepDelay"], myProbs,
                                                   na.rm = TRUE)
                  }

    # Clean up the column names.
colnames(delayQuantiles) <- names(hourInds)

# Plot results

library(ggplot2)
library(reshape)

dq <- melt(delayQuantiles)
names(dq) <- c("percentile", "hour", "delay")
qplot(hour, delay, data = dq, color = percentile, geom = "line")
