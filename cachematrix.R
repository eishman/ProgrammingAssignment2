## makeCachMatrix takes the 

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
## initinv is the inverse property and is initialised
    initinv <- NULL
## define the function that sets the value of the matrix 
    Set <- function(y) {
        x <<- y
        initinv <<- NULL
        }

## get function gets the value of the matrix
    Get <- function() x

##invert the set value    
    SetInverse <- function(Inverse) initinv <<- Inverse

##invert the get value
    GetInverse <- function() initinv

## returns a list with the required functions
    list(Set = Set,
         Get = Get,
         SetInverse = SetInverse,
         GetInverse = GetInverse)

}


## Using the matrix above retrieve the inverse 

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
    initinv <- x$GetInverse()
## check if matrix has already been calculated 
## if so retrieve the inverse if the matrix has not changed
    if (!is.null(initinv)) {
        return(initinv)
        }
    
    ##run get from makeCacheMatrix 
    xmat <- x$Get()
    
    initinv <- solve(xmat, ...)
    ## use setInverse from makeCacheMatrix
    x$SetInverse(initinv)
    ## return the inverse
    initinv
}
