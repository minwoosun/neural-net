# scale the data using column max
# neural nets work better when the values are [0,1]
iris_matrix <- iris[,1:4] %>% 
  unname %>% 
  as.matrix

colmax <- apply(iris_matrix,2,max)

for (i in 1:4){
  iris_matrix[,i] <- iris_matrix[,i]/colmax[i]
}

# split between training and testing data
set.seed(5)
n <- dim(iris_matrix)[1]
rows <- sample(1:n, 0.8*n)
train <- iris_matrix[rows,]
test <- iris_matrix[-rows,]

# set aside original data frame
train_org <- iris[rows,]
test_org <- iris[-rows,]

# one hot encoding for training set
# train_Species <- as.integer(iris[rows,]$Species)

train_Species <- iris[rows,]$Species %>%
  as.integer %>% 
  as.matrix

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

# one hot encoding for testing set
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

