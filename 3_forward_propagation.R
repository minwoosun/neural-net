###########################
### FORWARD PROPAGATION ###
###########################

# weight matrix and bias matrix 1
W1 <- matrix(runif(input_size * hidden_size), nrow = input_size, ncol = hidden_size)
B1 <- matrix(runif(hidden_size), ncol = 1)

Z2 <- train %*% W1

# apply the sigmoid function to the matrix Z_2
A2 <- sigmoid(Z2 + (B1 %*% rep(1,dim(train)[1]) %>% t))

# weight matrix 2 and bias matrix 2
W2 <- matrix(runif(hidden_size * output_size), nrow = hidden_size, ncol = output_size)
B2 <- matrix(runif(output_size), ncol = 1)

# bias matrix 2

# multiply the A matrix by the weight matrix
Z3 <- A2 %*% W2

# applying the sigmoid function to the Z_3 matrix produces our Y-hats
Y_hat <- sigmoid(Z3 + (B2 %*% rep(1,dim(train)[1]) %>% t))
