# these functions are for making inversion of matrices more cost-efficient if the same 
# matrices get inversed more than once

# makeCacheMatrix creates 4 functions which are given back as a list; furthermore
# its stores a matrix and cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) s <<- solve #calculate the inverse
  getInverse <- function() s
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


# first checks for a cached inverse in x (makeCacheMatrix) , if it's non existent
# it computes it with setInverse from makeCacheMatrix

cacheSolve <- function(x, ...) {
    s <- x$getInverse()
    if(!is.null(s)) {
      message("getting cached data")
      return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setInverse(s)
    s
}
