

x <- rnorm(5)
x

#R specific programming loop using the vectors, iterating i as a vector
for (i in x){
  print(i)
}
  
print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])


#conventional programming loop, iterating j as a number
for (j in 1:5){
  print(x[j]) 
}


#--------------

N <- 100
a <- rnorm(N)
b <- rnorm(N)


#Vectorised approach, when N increase, this is so much faster than below method
c <- a * b

#De-vectorised approach
d <- rep(NA,N) #creating an empty array, just to allocate memory
for (i in 1:N){
  d[i] <- a[i] * b[i]
}


