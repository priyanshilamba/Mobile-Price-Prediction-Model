library(DescTools)
library(dplyr)
library(dvmisc)
library(Hmisc)
library(moments)
library(purrr)
library(rstatix)
library(regclass)
library(lm.beta)
library(ggplot2)
library(caret)
library(rpart.plot)
library(naivebayes)
library(randomForest)

M<- MobilePrices
str(M)
M<- as.data.frame(M)

M[,-c(1,3,6,7,8,9,10,11,12,13,14,15,16)]<-lapply(M[,-c(1,3,6,7,8,9,10,11,12,13,14,15,16)],factor)

#checking missing value
map(M,~sum(is.na(.)))

#No missing values in data

#checking normality
skewness<-lapply(M[,c(1,3,6,7,8,9,10,11,12,13,14,15,16)],skewness)
skewness
kurtosis<-lapply(M[,c(1,3,6,7,8,9,10,11,12,13,14,15,16)],kurtosis)
kurtosis


boxplot(M$battery_power,M$clock_speed, M$int_memory)
boxplot(M$m_dep, M$mobile_wt, M$n_cores)
boxplot(M$pc, M$px_height, M$px_width)
boxplot (M$sc_h, M$sc_w, M$talk_time)

#Only 1 outlier found 
boxplot(M$px_height)


#storing outliers in variable named outpx_height
outpx_height<-boxplot(M$px_height)$out
length(outpx_height)

#Replacing outliers values with NA
M[M$px_height %in% outpx_height, "px_height"] = NA

#Imputing NA values with median 
M[11]<-impute(M[11], fun = median)

#checking if outliers are gone
boxplot(M$px_height)

##############################################################################################################

M1<-M
str(M1)



#Data partition
set.seed(100)
Train <- createDataPartition(M1$price_range, p=0.8, list=FALSE)
training <- M1[ Train, ]
testing <- M1[ -Train, ]

#Model 1
Model1 <- train(price_range~., data=training, method="naive_bayes")

# prediction for test data
pred_price_range<-predict(Model1, newdata = testing)

#fitness metrics for validation
confusionMatrix(pred_price_range, testing$price_range, positive="No")


##############################################################################################################

#Decision Trees
Model2<-train(price_range~.,data = training , method = "rpart")
rpart.plot(Model2$finalModel)
pred_price_range2<-predict(Model2 , newdata = testing)
confusionMatrix(pred_price_range2, testing$price_range)


#################################################################################

#Random Forest
Model3<- train(price_range~., data=training, method="rf")
Model3$finalModel
varImp(Model3)
pred_price_range3<-predict(Model3, newdata = testing)
confusionMatrix(pred_price_range3, testing$price_range)

