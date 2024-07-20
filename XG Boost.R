# using xg boost in R
library(xgboost)
# we are going to use agaricus data set provided in the package for classification purpose.
#here this data consists of information on mushrooms, it contains 1 dependent variables with 2 classes edible and poisonous and the independent variables are features of these mushrooms
# independent variables are stored in spares matrix and dependent variable is stored in a label
#the following procedure is adopted
# load the xgboost
#load the data
# load the train and test data 
#run the xgboost algorithm on train data
#cross validate the model on the test data
# in xgboost algorithm we use kfold and finally compare whether the  model is overfitting or not
#extracting trai and test data from agaricus data set
data(agaricus.train,package = "xgboost")
data(agaricus.test,package = "xgboost")
str(agaricus.train)
#obj: classify the mushrooms into poisonous and edible
#arguments in the model
#ivs input as spares matrix
#dv; a numeric vector of 0 and 1 values
#for classification we use : 'binary:logistic'
# for regression we use 'reg;linear'
train=agaricus.train
test=agaricus.test
mod=xgboost(data=train$data,label=train$label,nrounds = 2,objective= 'binary:logistic',eval_metric='error')
mod=xgboost(data=train$data,label=train$label,nrounds = 10,objective= 'binary:logistic',eval_metric='error')
# 5 fold cross validation 
mod.cv=xgb.cv(data=train$data, nfold=5,label = train$label,nrounds = 8,objective='binary:logistic',eval_metric='error')
# after 8 iteration the model achieved optimum train and test error are same
mod.cv=xgb.cv(data=train$data, nfold=5,label = train$label,nrounds = 5,objective='binary:logistic',eval_metric='auc')
