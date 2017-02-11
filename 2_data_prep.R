
# scale the data using column max
# neural nets work better when the values are [0,1]
iris_matrix <- iris[,1:4] %>% 
  unname() %>% 
  as.matrix

colmax <- apply(iris_matrix,2,max)
iris_matrix[,1] <- iris_matrix[,1]/colmax[1]
iris_matrix[,2] <- iris_matrix[,2]/colmax[2]
iris_matrix[,3] <- iris_matrix[,3]/colmax[3]
iris_matrix[,4] <- iris_matrix[,4]/colmax[4]

# split between training and testing data
set.seed(5)
n <- dim(iris_matrix)[1]
rows <- sample(1:n, 0.8*n)
train <- iris_matrix[rows,]
test <- iris_matrix[-rows,]
train_org <- iris[rows,]
test_org <- iris[-rows,]

train <- train[,1:4]

# training set
train_Species <- as.integer(iris[rows,]$Species)

train_y <- matrix(rep(0, 3*length(train_Species)),
                  nrow = length(train_Species), byrow=TRUE)
for(i in 1:length(train_Species)){
  if(train_Species[i] == 1){
    train_y[i,1] <- 1
    train_y[i,2] <- 0
    train_y[i,3] <- 0
  }
  if(train_Species[i] == 2){
    train_y[i,1] <- 0
    train_y[i,2] <- 1
    train_y[i,3] <- 0
  }
  if(train_Species[i] == 3){
    train_y[i,1] <- 0
    train_y[i,2] <- 0
    train_y[i,3] <- 1
  }
}

# testing set
test_Species <- as.integer(iris[-rows,]$Species)

test_y <- matrix(rep(0, 3*length(test_Species)),
                 nrow = length(test_Species), byrow=TRUE)
for(i in 1:length(test_Species)){
  if(test_Species[i] == 1){
    test_y[i,1] <- 1
    test_y[i,2] <- 0
    test_y[i,3] <- 0
  }
  if(test_Species[i] == 2){
    test_y[i,1] <- 0
    test_y[i,2] <- 1
    test_y[i,3] <- 0
  }
  if(test_Species[i] == 3){
    test_y[i,1] <- 0
    test_y[i,2] <- 0
    test_y[i,3] <- 1
  }
}

