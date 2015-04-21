## Put comments here that give an overall description of what your
## functions do

#1/ if cache exist and "argument" is the same get stashed "result"

#2/ else compute "result" and stash "argument" + "result"




## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    mcache <<- list(mArgument<-'tbd',mResult<-'tbd')    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ix <- solve(x)
    for(arg in ...){
        #tbd
    }
}


test <- function(){
    #tbd
}