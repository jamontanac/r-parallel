mutoutser <- function( links ){

  # Get number of rows and columns
  nr <- nrow( links )
  nc <- ncol( links )

  tot <- 0

  for( i in 1:(nr-1) ){
    tmp <- links[(i+1):nr,] %*% links[i,]
    tot <- tot + sum(tmp)
  }

  tot / nr
}

sim <- function( nr, nc ){

  lnk <- matrix( sample(0:1, (nr*nc), replace=TRUE), nrow=nr )

  system.time( mutoutser(lnk) )

}

sim( 500,500 )[3]
sim( 2000, 2000)[3]