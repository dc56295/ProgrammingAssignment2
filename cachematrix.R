## makeCacheMatrix will provide the arguments 
## necessary for cacheSolve. 

makeCacheMatrix <- function(x = matrix()) {
  a<-NULL
  set <- function(b) {
    x <<- b
    a <<- NULL
  }
  get <- function()x
  setinverse <- function(solve) a <<- solve
  getinverse <- function() a
  list(set=set, get=get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}

## cacheSolve will take the arguments to provide
## the inverse.

cacheSolve <- function(x, ...) {
  a <- x$getinverse()
  if(!is.null(a)) {
    message("Getting Cached Data:-")
    return(a)
  }
  a <- solve(x$get(), ...)
  x$setinverse(a)
  a
}


