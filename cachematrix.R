## Functions to cache the inverse of matrix


## Function to create a matrix object to can cache its inverse

makeCacheMatrix <- function(x = matrix()){
  
  ## set inverse value to NULL
  i <- NULL
 
  set <- function( matrix ) 
  {
    m <<- matrix
    i <<- NULL
  }
  
  ## Get the matrix
  get <- function() 
  {
    m
  }
 
  setInverse <- function(inverse) 
  {
    i <<- inverse
  }
  
  ## Get the inverse of the matrix
  getInverse <- function() 
  {
    i
  }
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

}


## The function checks if the inverse of the matrix already exists in cache and returns it. If the inverse does not 
## exist then it calculates the inverse


cacheSolve <- function(x, ...) {
 
  ## Returns the inverse of 'x'       
  m <- x$getInverse()
  
  ## Return from cache
  if( !is.null(m) ) {
    message("retrieving from cache")
    return(m)
  }
  
  ## Get the matrix from object
  data <- x$get()
  
  ## Calculate the inverse 
  m <- solve(data) 
  
  ## Set the inverse to the object
  x$setInverse(m)
  
  ## Return the matrix
  m
}
}
