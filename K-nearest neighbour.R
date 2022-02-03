# Installing Packages
#install.packages("e1071")

#install.packages("class")

library(e1071)
library(caTools)
library(class)
	  
# Loading data
data = read.csv("diabetes.csv")
head(data)
	  
# Splitting data into train
# and test data
split <- sample.split(data, SplitRatio = 0.7)
train_cl <- subset(data, split == "TRUE")
test_cl <- subset(data, split == "FALSE")
	  
# Feature Scaling
train_scale <- scale(train_cl[, 1:9])
test_scale <- scale(test_cl[, 1:9])
	  
# Fitting KNN Model 
# to training dataset
classifier_knn <- knn(train = train_scale, test = test_scale, cl = train_cl$Outcome, k = 1)
classifier_knn
  
# Confusiin Matrix
cm <- table(test_cl$Outcome, classifier_knn)
cm

# Model Evaluation - Choosing K
# Calculate out of Sample error
misClassError <- mean(classifier_knn != test_cl$Outcome)
print(paste('Accuracy =', 1-misClassError))
