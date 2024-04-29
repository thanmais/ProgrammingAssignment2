# Create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x) {
  # Initialize an empty cache for storing the inverse
  cache <- NULL
  
  # Setter function to set the matrix and calculate its inverse
  set <- function(y) {
    x <<- y  # Assign the matrix to the global environment
    cache <<- NULL  # Clear the cache
  }
  
  # Getter function to retrieve the matrix
  get <- function() {
    x
  }
  
  # Function to compute and cache the inverse
  cacheSolve <- function() {
    if (!is.null(cache)) {
      # If the inverse is already cached, return it
      message("Retrieving cached inverse.")
      return(cache)
    } else {
      # Otherwise, calculate the inverse using solve()
      message("Calculating inverse.")
      inv <- solve(x)
      cache <<- inv  # Cache the inverse
      return(inv)
    }
  }
  
  # Return a list of functions
  list(set = set, get = get, cacheSolve = cacheSolve)
}

# Example usage:
# Create a matrix
A <- matrix(c(1, 2, 3, 4), nrow = 2)

# Create a cache matrix object
cacheMatrix <- makeCacheMatrix(A)

# Get the matrix
cacheMatrix$get()

# Calculate and cache the inverse
cacheMatrix$cacheSolve()

# Retrieve the cached inverse
cacheMatrix$cacheSolve()
