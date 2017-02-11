library(dplyr)

# Load the cost function, sigmoid activation
# function, and the derivative of sigmoid function
source("1_functions.R")

# Split iris to train and test set
set.seed(5)
source("2_data_prep.R")

# Select values for the nodes
input_size <- 4
hidden_size <- 2
output_size <- 3

# Train neural net using iris training data
source("3_forward_propagation.R")

# Use gradient descent to minimize the cost function
# w.r.t. all the weight and bias matrices
source("4_back_propagation.R")

# Apply neural net on the test set to see
# how well it predicts
Z2 <- test %*% W1
A2 <- sigmoid(Z2 + t(B1 %*% rep(1,dim(test)[1])))
Z3 <- A2 %*% W2
Y_hat <- sigmoid(Z3 + t(B2 %*% rep(1,dim(test)[1])))

predicted <- ifelse(round(Y_hat)[,1] == 1, "setosa", 
                    ifelse(round(Y_hat)[,2] == 1, "versicolor", 
                           ifelse(round(Y_hat)[,3] == 1, "virginica", NA)))

# Check confusion matrix
table(test_org$Species, predicted)
