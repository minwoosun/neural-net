# cost function:
cost <- function(y,y_hat){
  0.5*sum((y - y_hat)^2)
}

# activation function:
sigmoid <- function(Z){
  1/(1 + exp(-Z))
}

# derivative of sigmoid activation function:
sigmoidprime <- function(Z){
  exp(-Z)/((1+exp(-Z))^2)
}