rm(list=ls())

## Put comments here that give an overall description of what your
## functions do

#1/ if cache list does not exist create list "mCache"
#
#2/ if cache list exist and "argument" is not the same  
#   compute and stash "argument" and "result" in list
#
#3/ else get "result" from "mCache" list




## Write a short comment describing this function

# creates a list with functions that should be used
# store and get "argument" and "result" fom the same 
# list

makeCacheMatrix <- function(x = matrix(), r = matrix()) {
    cat(">>init\n")            #debug
    mArgument <- NULL
    mResult   <- NULL
    setArg    <- function(y){mcache[['mArgument']] <<- y }
    setInv    <- function(y){mcache[['mResult']]   <<- y }
    getArg    <- function() {y <- mcache[['mArgument']] }
    getInv    <- function() {y <- mcache[['mResult']]   }
    mcache   <<- list('setArg'=setArg, 'getArg'=getArg, 
                      'setInv'=setInv, 'getInv'=getInv,
                      'mArgument'=x,   'mResult'=r)    
}


## Write a short comment describing this function

# creates a list with "functions", "argument" and "result"
# it it does not exist
#
# get stored "argument" and check if it still is the same,
# if so retreive stored "result"
#
# else compute "result" and store "argument" and "result"

cacheSolve <- function(x, ...) {
    if(!exists('mcache')){makeCacheMatrix()}
    
    y <- mcache[['getArg']]()

    if (all(dim(x)==dim(y)) && all(x==y)){
        cat(">>get <-\n")          #debug
        r <- mcache[['getInv']]()
        return(r)        
    }
    else{
        cat("\n>>set ->\n")          #debug                             
        r <- solve(x)
        mcache[['setArg']](x)
        mcache[['setInv']](r)
        return(r)
    }
}


#
#  small test case
#


testCacheSolve <- function(){
    a  <- matrix(c(1,1,-1,1),nrow=2,ncol=2)
    b  <- matrix(c(1,2,3, 4,5,6, -7,8,9),nrow=3,ncol=3)
    
    for(ii in 1:4){
        ia <- cacheSolve(a)
    }
    
    for(ii in 1:4){
        ib <- cacheSolve(b)
    }
    cat("\nTest case: a\n")
    print(ia %*% a)
    
    cat("\nTest case: b\n")
    print(round(ib %*% b,2))
    
    return(NULL)
}

testCacheSolve()    
