N <- 1000000 # inputs
counter <- 0

# i is not an index, it is cycling through the 100 numbers

for(i in rnorm(N)){
  if (i > -1 & i < 1) {
    counter <- counter + 1
  }
}
counter / N

# compare to 0.682