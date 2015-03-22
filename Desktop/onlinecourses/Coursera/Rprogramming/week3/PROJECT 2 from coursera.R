makeCacheMatrix <- function(x = matrix()) {
  M <- NULL
  set <- function(y) {
    x <<- y
    M <<- NULL
  }
  get <- function() x
  setmean <- function(mean) M <<- mean
  getmean <- function() M
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

#NULL represents the null object in R: it is a reserved word.
#NULL is often returned by expressions and functions whose values are
#undefined.NULL is empty set.


rm(list=ls())

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}




