# Load data
airline = read.csv( "AirlineDataAll.csv", header=TRUE)

# for approach

dayCount <- integer(7)

forTime <- system.time({
  for( i in 1:7 ){
    dayCount[i] <- sum( airline$DayOfWeek == i )
  }
})

dayCount
forTime[3]

# foreach serial approach

library(foreach)

foreachTimeSerial <- system.time({
 dayCount <- foreach( i = 1:7, .combine='c') %do% {
   sum( airline$DayOfWeek == i )
 }
})

dayCount
foreachTimeSerial[3]

# foreach parallel approach

# Load library doParallel
library(doParallel)

# Register foreach backend
registerDoParallel(cores=8)

foreachTimeParallel <- system.time({
 dayCount <- foreach( i = 1:7, .combine='c') %dopar% {
   sum( airline$DayOfWeek == i )
 }
})

#dayCount
foreachTimeParallel[3]

# mclapply approach

library(parallel)

dayCountFunction <- function( day ){
   sum( airline$DayOfWeek == day )
}

mclapplyTime <- system.time({
   dayCount <- mclapply(1:7, dayCountFunction, mc.cores=8)
})

unlist(dayCount)
mclapplyTime[3]
