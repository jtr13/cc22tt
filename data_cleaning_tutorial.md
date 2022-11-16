# Data cleaning tutorial

Saili Myana and Sai Rithvik Kanakamedala




## Motivation
Data cleaning is an important preliminary processing step that we perform on the data before we visualize and model it. Data with errors or missing values will lead to erroneous observations. Making business decisions with inaccurate observations may lead to downfall of the company. 
For example, Will Hillier said. "It’s like creating a foundation for a building: do it right and you can build something strong and long-lasting. Do it wrong, and your building will soon collapse." 
We can't perform any visualization or machine learning analysis without first cleaning the dataset.

In this tutorial, we are going to perform step-by-step data cleaning on a real world dataset from [Zillow Research](https://www.zillow.com/research/data/){target="_blank"}. The data can be downloaded by going to list and sale prices section and selecting Median List Price(Raw, All Homes, Monthly) which contains the data of monthly listing prices of houses across the United States.  

## Observe the Dataset

It is important that we first view the dataset and understand what each column means. In our example, we are analyzing the median listing prices of houses in different cities on different dates.


```r
listing_price <- read.csv(url("https://files.zillowstatic.com/research/public_csvs/mlp/Metro_mlp_uc_sfrcondo_month.csv?t=1668571408"))
print(dim(listing_price))
```

```
## [1] 898  63
```

```r
head(listing_price)[colnames(listing_price)[1:6]] # Showing only 6 columns, remaining are similar to the date column
```

```
##   RegionID SizeRank      RegionName RegionType StateName X2018.01.31
## 1   102001        0   United States    country                255000
## 2   394913        1    New York, NY        msa        NY      489000
## 3   753899        2 Los Angeles, CA        msa        CA      709000
## 4   394463        3     Chicago, IL        msa        IL      269900
## 5   394514        4      Dallas, TX        msa        TX      318000
## 6   394692        5     Houston, TX        msa        TX      289500
```

## Check the data type of columns

The data may contain Numeric, Character, Logical, Factor or other data types. We need to check if the columns in the raw data have a suitable data type. For examples some numerical data may be stored as character and it is important to convert them into numerical before proceeding to analyse the data.

For each column of the dataset check the data type using str(dataset). This will show the data type of the column along with a few example values.


```r
str(listing_price)
```

```
## 'data.frame':	898 obs. of  63 variables:
##  $ RegionID   : int  102001 394913 753899 394463 394514 394692 395209 394856 394974 394347 ...
##  $ SizeRank   : int  0 1 2 3 4 5 6 7 8 9 ...
##  $ RegionName : chr  "United States" "New York, NY" "Los Angeles, CA" "Chicago, IL" ...
##  $ RegionType : chr  "country" "msa" "msa" "msa" ...
##  $ StateName  : chr  "" "NY" "CA" "IL" ...
##  $ X2018.01.31: num  255000 489000 709000 269900 318000 ...
##  $ X2018.02.28: num  264900 505000 725000 289000 325000 ...
##  $ X2018.03.31: num  269900 515000 730000 294900 325990 ...
##  $ X2018.04.30: num  279000 519000 750000 299900 334500 ...
##  $ X2018.05.31: num  280000 529900 750000 307000 334900 ...
##  $ X2018.06.30: num  280000 530000 750000 299900 329000 ...
##  $ X2018.07.31: num  279900 525000 749000 299000 324605 ...
##  $ X2018.08.31: num  279000 524800 729900 294900 319000 ...
##  $ X2018.09.30: num  279900 529000 729900 294450 319900 ...
##  $ X2018.10.31: num  279500 529000 725000 289000 317998 ...
##  $ X2018.11.30: num  279000 529000 719000 282000 315000 ...
##  $ X2018.12.31: num  275000 525000 715000 279000 315000 ...
##  $ X2019.01.31: num  275000 520000 699900 279000 310000 ...
##  $ X2019.02.28: num  280000 529000 719900 294900 316000 ...
##  $ X2019.03.31: num  289900 535000 729000 299900 324900 ...
##  $ X2019.04.30: num  298000 549000 749000 309000 330000 ...
##  $ X2019.05.31: num  299900 549000 750000 310000 330500 ...
##  $ X2019.06.30: num  299900 549000 759800 309400 329900 ...
##  $ X2019.07.31: num  299000 545000 759900 299995 325000 ...
##  $ X2019.08.31: num  295000 539000 758000 299000 319999 ...
##  $ X2019.09.30: num  295000 549000 759000 298000 319900 ...
##  $ X2019.10.31: num  290000 549000 759000 289900 319900 ...
##  $ X2019.11.30: num  289900 549000 769000 285000 319000 ...
##  $ X2019.12.31: num  285000 549900 769000 279900 315000 ...
##  $ X2020.01.31: num  284900 549000 765000 280000 310000 ...
##  $ X2020.02.29: num  290000 549000 779894 295000 315900 ...
##  $ X2020.03.31: num  299000 559000 795000 299900 319900 ...
##  $ X2020.04.30: num  299900 559900 789000 299000 320000 ...
##  $ X2020.05.31: num  305000 559000 799000 299900 325000 ...
##  $ X2020.06.30: num  315000 565000 819000 305000 331900 ...
##  $ X2020.07.31: num  319900 575000 830000 309000 334900 ...
##  $ X2020.08.31: num  319000 584900 829000 309000 332900 ...
##  $ X2020.09.30: num  319000 595000 829900 309900 335000 ...
##  $ X2020.10.31: num  318900 599000 835000 300000 330000 ...
##  $ X2020.11.30: num  310000 599900 849982 299900 329800 ...
##  $ X2020.12.31: num  304990 599900 849000 294900 326000 ...
##  $ X2021.01.31: num  300500 595000 849000 294900 329900 ...
##  $ X2021.02.28: num  319900 599000 849900 309900 335000 ...
##  $ X2021.03.31: num  325000 599000 850000 310000 343490 ...
##  $ X2021.04.30: num  335000 599000 874900 310000 350000 ...
##  $ X2021.05.31: num  342000 599000 878000 315000 360000 ...
##  $ X2021.06.30: num  345000 599000 885000 315000 369000 ...
##  $ X2021.07.31: num  342000 590000 869999 309900 374878 ...
##  $ X2021.08.31: num  339900 579000 850000 299900 370000 ...
##  $ X2021.09.30: num  342000 588000 850000 299900 375000 ...
##  $ X2021.10.31: num  340000 589000 859000 299000 375000 ...
##  $ X2021.11.30: num  335000 586000 850000 289999 378259 ...
##  $ X2021.12.31: num  328000 595000 859000 279900 379900 ...
##  $ X2022.01.31: num  332000 599000 889000 285000 385000 325000 450000 450000 275000 345000 ...
##  $ X2022.02.28: num  350000 619000 899869 299000 397995 ...
##  $ X2022.03.31: num  365000 629000 928944 309000 400000 ...
##  $ X2022.04.30: num  379900 647639 949900 319900 420000 ...
##  $ X2022.05.31: num  394900 649000 950000 325000 434900 ...
##  $ X2022.06.30: num  399000 649000 950000 325000 440000 ...
##  $ X2022.07.31: num  399000 629000 949000 321948 439900 ...
##  $ X2022.08.31: num  390000 625000 925000 315000 425000 ...
##  $ X2022.09.30: num  389900 629000 924900 315000 420000 ...
##  $ X2022.10.31: num  385000 644950 900000 309900 410000 ...
```
## Optional Step

We can also check if all the columns are named neatly. Using the clean_names function, we can rename all the columns with consistent format.  


```r
listing_price <- clean_names(listing_price)
colnames(listing_price)
```

```
##  [1] "region_id"   "size_rank"   "region_name" "region_type" "state_name" 
##  [6] "x2018_01_31" "x2018_02_28" "x2018_03_31" "x2018_04_30" "x2018_05_31"
## [11] "x2018_06_30" "x2018_07_31" "x2018_08_31" "x2018_09_30" "x2018_10_31"
## [16] "x2018_11_30" "x2018_12_31" "x2019_01_31" "x2019_02_28" "x2019_03_31"
## [21] "x2019_04_30" "x2019_05_31" "x2019_06_30" "x2019_07_31" "x2019_08_31"
## [26] "x2019_09_30" "x2019_10_31" "x2019_11_30" "x2019_12_31" "x2020_01_31"
## [31] "x2020_02_29" "x2020_03_31" "x2020_04_30" "x2020_05_31" "x2020_06_30"
## [36] "x2020_07_31" "x2020_08_31" "x2020_09_30" "x2020_10_31" "x2020_11_30"
## [41] "x2020_12_31" "x2021_01_31" "x2021_02_28" "x2021_03_31" "x2021_04_30"
## [46] "x2021_05_31" "x2021_06_30" "x2021_07_31" "x2021_08_31" "x2021_09_30"
## [51] "x2021_10_31" "x2021_11_30" "x2021_12_31" "x2022_01_31" "x2022_02_28"
## [56] "x2022_03_31" "x2022_04_30" "x2022_05_31" "x2022_06_30" "x2022_07_31"
## [61] "x2022_08_31" "x2022_09_30" "x2022_10_31"
```
## Check for duplicate data

Next, we check if there are any duplicate rows in the dataset and remove the repeated rows using the distinct function in the dplyr package.


```r
listing_price <- distinct(listing_price)
```


## Remove empty rows and columns
We need to remove all the empty rows and columns as they dont contain any useful information. This can be done using the remove_empty function from the janitor package.


```r
listing_price <- remove_empty(listing_price, which = c("rows", "cols"), quiet = FALSE)
```

## Converting messy data into tidy data

The data we have currently is messy. As a good practice, we can convert this data into tidy format where every column is a variable and every every row is an observation. 


```r
tidy_df <- listing_price %>% pivot_longer(cols=colnames(listing_price)[6:60], names_to="date", values_to = "listing_price") 
head(tidy_df)
```

```
## # A tibble: 6 × 10
##   region…¹ size_…² regio…³ regio…⁴ state…⁵ x2022…⁶ x2022…⁷ x2022…⁸ date  listi…⁹
##      <int>   <int> <chr>   <chr>   <chr>     <dbl>   <dbl>   <dbl> <chr>   <dbl>
## 1   102001       0 United… country ""       390000  389900  385000 x201…  255000
## 2   102001       0 United… country ""       390000  389900  385000 x201…  264900
## 3   102001       0 United… country ""       390000  389900  385000 x201…  269900
## 4   102001       0 United… country ""       390000  389900  385000 x201…  279000
## 5   102001       0 United… country ""       390000  389900  385000 x201…  280000
## 6   102001       0 United… country ""       390000  389900  385000 x201…  280000
## # … with abbreviated variable names ¹​region_id, ²​size_rank, ³​region_name,
## #   ⁴​region_type, ⁵​state_name, ⁶​x2022_08_31, ⁷​x2022_09_30, ⁸​x2022_10_31,
## #   ⁹​listing_price
```
## Check for missing values
We check if our data contains missing values using the is.na() function. We can find the number of missing values in the dataset by calculating sum(is.na(data)). 

```r
sum(is.na(tidy_df))
```

```
## [1] 1074
```

## Handling missing values

There are multiple ways to handle missing values.

1) We can omit the rows that contain missing values.


```r
data <- na.omit(data) # we can also use na.exclude(data)
```

2) We can replace the missing value with a previous value in the column.
(This may be the best way to replace missing values in the case when a group of rows are given the same value for a column and written only once)


```r
for (i in colnames(data)){
data %>% fill(all_of(i), .direction = 'up')
}
```

3) We can replace the missing value with the average of the column.


```r
data <- na.aggregate(data) # Replace NA in all columns with column mean
```


4) Or we can replace them with the average of the values prior and post to the missing value depending on the context. 

There are more advanced methods to predict the missing values like Regression techniques, which can be used if needed. Depending on the dataset, we can select the method that is most appropriate.

In our dataset, we have two appropriate ways of dealing with missing values.

1) We can remove the cities with missing values. This will remove 95 of the 898 cities. This can be done by omitting the rows containing NA before tidying the data.

2) We can remove the dates where the particular city does not have a price listed. This can be done by converting the data into tidy format and then omitting the rows with missing values. We are choosing this way, as omitting the dates where price is unavailable is good enough for our analysis.


```r
tidy_df <- na.omit(tidy_df)
```




## Removing Outliers (Optional)

In case outliers are changing the trends in the data, we may want to analyse by removing the outliers. This can be done by finding the Z scores as shown below and having a threshold for the Z score to filter out the outliers.  

In our dataset, this is not required, as we aim to visualize the house prices as they are.


```r
#For numeric columns of data only
df <- data[names(dplyr::select_if(data,is.numeric))]
z_scores <- as.data.frame(sapply(df, function(df) (abs(df-mean(df))/sd(df))))
head(z_scores)

no_outliers_data <- data[!rowSums(z_scores>3), ] #removing rows with z-scores greater than 3
dim(no_outliers_data) #to check final dimensions of data
```



Now the dataset is ready to be analyzed. We can also model the data using some Machine Learning models as it doesn't contain any missing values or corrupted data.

## Conclusion
Through this tutorial, we discovered different ways in which data can be messy. We thought about what could be wrong in the column names, what could be wrong in their data types, how to deal when some data is missing and what to do when there are unwanted outliers. Through this journey, we learnt to question if there is anything unexpected in the data and how to convert it to desired format. We will think of these data cleaning steps for any dataset we encounter in the future, and implement the requisite steps. 
