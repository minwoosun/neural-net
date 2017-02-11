########################
### BACK PROPAGATION ###
########################

# using gradient descent to minimize the cost function

# set our lamda (small steps)
lamda <- 0.01

# 10000 iterations of gradient descent:
cost_tracker <- rep(NA, 10000)
for(i in 1:10000){
  # take current weights and calculate y-hat
  Z2 <- train %*% W1
  A2 <- sigmoid(Z2 + (B1 %*% rep(1,dim(train)[1]) %>% t))
  Z3 <- A2 %*% W2
  Y_hat <- sigmoid(Z3 + (B2 %*% rep(1,dim(train)[1]) %>% t))
  cost_tracker[i] <- cost(train_y, Y_hat)
  
  # calculate the gradient at the current y-hat
  d3 <- (-(train_y - Y_hat) * sigmoidprime(Z3 + (B2 %*% rep(1, 120) %>% t)))
  d2 <- d3 %*% t(W2) * sigmoidprime(Z2 + (B1 %*% rep(1, 120) %>% t))
  grad_w2 <- t(A2) %*% d3
  grad_w1 <- t(train) %*% d2
  grad_b2 <- rep(1, dim(train)[1]) %*% d3
  grad_b1 <- rep(1, dim(train)[1]) %*% d2
  
  # update weights based on the gradient
  W1 <- W1 - lamda * grad_w1
  B2  <- B2  - lamda * t(grad_b2)
  W2 <- W2 - lamda * grad_w2
  B1  <- B1  - lamda * t(grad_b1)
  
  # repeat
}

# # visualize the descent:
# plot(cost_tracker, 
#      type="l", 
#      xlab = "Iteration", 
#      ylab = "Cost")
