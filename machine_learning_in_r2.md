# R machine learning workflow tutorial

Tongli Su, Yifan Lu



### Motivation
Our project demonstrates the standard workflow of a machine learning prediction task in R with the ‘caret’ package. The project could serve as a cheat sheet to carry out simple machine learning prediction tasks for people who are unfamiliar with the essential steps of machine learning tasks. When conducting a machine learning study, our tutorial could be used as a quick guide for R implementation and a reference to check if any of the necessary steps is missing. Most simple machine learning tasks could be done by just copy-pasting the code sections on our cheat sheet with some minor tweaks on the parameters. 

In completing the project, we reviewed and familiarized with the standard machine learning workflow and strengthened our knowledge in R implementation of machine learning tasks. Both my teammate and I were CS major in college, so we are familiar with machine learning, but neither of us has done machine learning projects in R before. Therefore, we explored the functions in ‘caret’ package and learned the implementation of each step in machine learning workflow, from data processing to model evaluation.


### Machine Learning in R
Machine learning is one of the most popular tools to unveil information carried by a dataset. Well-established machine learning packages make the task of making prediction with machine learning models a simple and standarized process. In this blog post, we will go through the steps in carrying out a machine learning prediction task, and provide example with the 'caret' package in R programming language.

Steps in carrying out a machine learning prediction task:

1. Data pre-processing

2. Feature engineering

3. Feature selection

4. Model selection

5. Hyperparameter tuning

6. Model evaluation

### Import Packages and Example Dataset

```r
library(ggplot2)
library(dplyr)
library(tidyr)
library(carData)
library(caret)
df <- Salaries
head(df)
```

```
##        rank discipline yrs.since.phd yrs.service  sex salary
## 1      Prof          B            19          18 Male 139750
## 2      Prof          B            20          16 Male 173200
## 3  AsstProf          B             4           3 Male  79750
## 4      Prof          B            45          39 Male 115000
## 5      Prof          B            40          41 Male 141500
## 6 AssocProf          B             6           6 Male  97000
```

### Preprocessing
Data preprocessing includes transforming the data into desired form for model input, and scale the data for models sensitive to the scale (most regression models do). One common trick to tackle categorical data is to transform them to binary variables. This can be done in many ways, including one-hot encoding, target encoding, and ordinal encoding. Here we demonstrate using one-hot encoding to transform categorical features. One-hot encoding works by assigning a binary variable to each class of a categorical features. Therefore, the number of new binary variables created equals to the dimension of the orignal categorical variable. For example, if a feature 'Gender' has 'Male' and 'Female', then one-hot encoding will transform it to two variables 'is_Male' and 'is_Female'. 

```r
# transform categorical features to binary features with one-hot encoding
dummy <- dummyVars(" ~ .", data=df)
newdata <- data.frame(predict(dummy, newdata = df)) 
head(newdata)
```

```
##   rank.AsstProf rank.AssocProf rank.Prof discipline.A discipline.B
## 1             0              0         1            0            1
## 2             0              0         1            0            1
## 3             1              0         0            0            1
## 4             0              0         1            0            1
## 5             0              0         1            0            1
## 6             0              1         0            0            1
##   yrs.since.phd yrs.service sex.Female sex.Male salary
## 1            19          18          0        1 139750
## 2            20          16          0        1 173200
## 3             4           3          0        1  79750
## 4            45          39          0        1 115000
## 5            40          41          0        1 141500
## 6             6           6          0        1  97000
```

Example Preprocessing Methods:

dummyVars: this function helps transform the input to one hot encoding format

findCorrelation: this function takes a correlation matrix as a input and help decide which predictor to be removed to solve colinearity.

findLinearCombos: this function uses QR decomposition to enumerate linear combiantions.


### Data Splitting
Before training a machine learning model, we need to split the dataset to train and test as a standard measure. Sometimes if the dataset is large enough, we might split it to development set and test set. Then, the development set can be further divided to train set and validation set. However, in most cases, we just split the data into train set and test set, then use more data-efficient methods such as k-fold cross validation or leave-one-out cross validation to validate the model.

```r
X = df
trainIndex <- createDataPartition(df$salary, p = .8, #the proportion of train set
                                  list = FALSE) #do not return as a list
#Train-test split                             
train <- df[ trainIndex,]
test  <- df[-trainIndex,]
```

Example Splitting Methods:

createDataPartition: this function can be used to create splits of the data.

groupKFold: this function can split data based on groups

### Train Linear Regression Model
Train linear regression model with train set.

```r
linearModel <- train(salary ~ ., data = train, 
                 method = "lm", #linear regression model
                 )
linearModel
```

```
## Linear Regression 
## 
## 320 samples
##   5 predictor
## 
## No pre-processing
## Resampling: Bootstrapped (25 reps) 
## Summary of sample sizes: 320, 320, 320, 320, 320, 320, ... 
## Resampling results:
## 
##   RMSE      Rsquared   MAE     
##   23220.35  0.4199775  17076.21
## 
## Tuning parameter 'intercept' was held constant at a value of TRUE
```

Here, we chose to use linear regression model. Caret has 238 available models. https://topepo.github.io/caret/available-models.html provides more information about model selecton.


### Cross Validation
k-fold cross validation is often used in model selection and performance evaluation. It works by splitting the train dataset into k equal-sized partitions, using k-1 partitions to train the model and then evaluate its performance on the unused one partition. This process is repeated for k times where each partition serves as the test set once. 

```r
fitControl <- trainControl(## 10-fold CV
                           method = "repeatedcv",
                           number = 10,
                           ## repeated ten times
                           repeats = 10)
linearModel2 <- train(salary ~ ., data = train, 
                 method = "lm", 
                 trControl = fitControl,
                 )
linearModel2
```

```
## Linear Regression 
## 
## 320 samples
##   5 predictor
## 
## No pre-processing
## Resampling: Cross-Validated (10 fold, repeated 10 times) 
## Summary of sample sizes: 288, 288, 288, 288, 288, 288, ... 
## Resampling results:
## 
##   RMSE      Rsquared   MAE     
##   22511.04  0.4478224  16853.59
## 
## Tuning parameter 'intercept' was held constant at a value of TRUE
```

### Make Predictions
Make predictions on the test set with trained model. 

```r
prediction <- predict(linearModel, newdata = test)
prediction
```

```
##         1         6         7         9        14        30        43        48 
## 131787.64  99591.94 135076.37 131925.12  86473.95 132572.75 138296.35 127331.75 
##        58        62        68        70        72        73        81        85 
## 100220.25  86120.59 134153.77 128607.41 133152.78 136273.92 139346.77 124808.82 
##        86        93        99       101       108       109       111       113 
## 131512.68 101133.19 138875.25 140122.23  85834.18  88288.37 118245.76  71665.78 
##       120       121       130       131       140       144       145       149 
##  65806.12 116144.93  71734.52  85902.92 117892.40  85698.49 131915.46 130757.96 
##       150       153       156       168       169       178       179       183 
##  86189.33 136568.20 131503.02 130874.70 100573.61 101761.51 137402.74  99729.42 
##       186       192       210       221       233       238       239       242 
## 133594.19 141879.36 131434.28 131503.02 125814.55  65521.50 120877.19 117735.60 
##       244       248       250       263       264       265       269       270 
## 116763.59 117892.40 126462.19 119424.00 117313.51 118570.14 119679.64 118608.78 
##       278       279       286       292       296       297       300       311 
## 119001.90 119364.92  87670.84 119070.64 119620.56 116419.89  89928.47 122044.64 
##       315       316       336       339       351       355       366       371 
## 123448.42  87171.01 131689.92 135213.85 136863.60  88996.88 119404.68  87306.69 
##       374       378       392       396       397 
## 118933.16  72294.10 121887.85 121122.05  72853.67
```

### Evaluate Performance
Model performance on the test set could be measured by various metrics. The most frequently used ones include precision, recall, F1-score, AUC score, etc. One thing worth noticing is that accuracy is often not a good metric to evaluate model performance when the dataset is highly imbalanced (has a minority class), since in that case predicting all samples to be the majority class would still produce a nice-looking accuracy score. In that case, using metrics like ROC curve and AUC score would be a better option. 

```r
postResample(pred = prediction, obs = df$salary)
```

```
##     RMSE Rsquared      MAE 
## 37519.75       NA 31582.34
```

Other measuring performance methods:

confusionMatrix: this function measures the performance of a classification algorithm by demonstrating true positives, true negatives, false positives, and false negatives of the predicted outcomes

twoClassSummary: this function measures the performance of data with two classes by showing ROC, specificity, and sensitivity.

### Citation
https://topepo.github.io/caret/
