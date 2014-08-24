## This document include two functions, which will allow you to make a cache
## when you want to make a inverse calculating for a target matrix
## The functions are as below:
##    makeCacheMatrix(x):
##          x should be a matrix which could be invertible,it will
##          return a list to present a cache-able matrix
##    cacheSolve(y):
##          y should be a cache-able matrix created by 
##          the function makeCacheMatrix(x), it will return the inverse of 
##          the matrix or calculate the inverse if the user didn't calculate
##          it before
##
## Here is a example:
##  > y <- matrix(1:4, nrow = 2)
##  > z <- makeCacheMatrix(y)
##  > cacheSolve(z)
##  The inversed matrix has not been calculated
##  Data succesfully loaded
##  Calculating inverse
##  Succesfully calculated
##  Succesfully Cached
##  [,1] [,2]
##  [1,]   -2  1.5
##  [2,]    1 -0.5
##  > cacheSolve(z)
##  getting cached data
##  [,1] [,2]
##  [1,]   -2  1.5
##  [2,]    1 -0.5

## Thanks to the program in https://github.com/rdpeng/ProgrammingAssignment2
## Actually, for a fresh-man programmer, the best way for learning coding
## is imitation, not creation


## In the function makeCacheMatrix we set a list to represent the 
## matrix we need to cache it's inverse
## In the list here are 4 functions:
##   set: initialize the matrix to be a pre-cached one
##   get: return the value of the target matrix x
##   setinverse: initialize(or update) the inverse of the target matrix
##   getinverse: get the inverse of the target matrix
##   if the matrix hasn't been calculated its inverse, i will be NULL
makeCacheMatrix <- function(x = matrix()) {
  
    i <- NULL 
    #i indicate inverse, set it NULL at beginning    
    set <- function(y) {
        x <<- y
        i <<- NULL
      }
    # set can change the target matrix for the current list, like z$set(y)
  get <- function() 
    {
        x
    }
    #get() can return the matrix from the list
  setinverse <- function(inverse) 
  {
    i <<- inverse
  }
    #setinverse() can update the cache for the matrix
  getinverse <- function()
  {
    i
  }
  #getinverse() can return the inversed matrix from the list
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  #return the cache-able list represent the matrix

}


## In the function cacheSolve we will return the inverse of target matrix
## The return will be based on whether it has been calculated or not
## At beginning, we will judge whether the inverse of the target matrix has been
## calculated or not; if calculated, we will return a sentence to indicate it
## Otherwise, we will calculate the inverse of the target matrix, each procedure
## will return a sentence in order to tell the user which step is running and
## it will be helpful for user to figure out where the bug is if it happens.

cacheSolve <- function(x, ...) {
 
    i <- x$getinverse()
    #if i is not null, get the cache from the list
    
    if(!is.null(i)){
      message("getting cached data")
      return(i)
    }
    # Otherwise, calculate the inverse and return every step
    
    message("The inversed matrix has not been calculated")
    data <- x$get()
    message("Data succesfully loaded")
    message("Calculating inverse")
    i <- solve(data, ...)
    message("Succesfully calculated")
    x$setinverse(i)
    message("Succesfully Cached")
    i
 
}
