# Guide to nonparametric tests

Tseng-Han Yu




```r
library("DescTools")
```

## Introduction
This is a guide to common non-parametric tests with focus on problems with sample size of 2 and one-way data. The guide starts with two-sample inference procedures designed to detect if observations (location) of one population tend to be different from another, including the special case of two-sample paired data as well. The appropriate tests to compare the variability (scale) of the observations would also be included. For each test, there will be a summary, required assumptions, possible hypotheses, and implementation of the test conducted in R. 

## Two-Sample Inference Procedure (Difference in Location): Permutation Test 
### Summary
Permutation Test permutes the observations from two samples as it assume there is no difference between to two and compute the differences in location parameter, such as mean. The steps to obtain p-value are the following: 

1. Pool the m observations from sample 1 and the n observations from sample 2 together.   
2. Permute the observations between the samples such that m units are assigned to sample 1 and n units are assigned to sample 2. Compute the difference in means. Repeat this step (m+n)!/m!n! times.
3. The p-value is the fraction of permutations as extreme or more extreme than observed.  

Note that the number of possible ways to permute data is: (m+n)!/m!n!. If it becomes too time consuming to generate all possible permutations, we can instead take a random sample of permutations (common choice would be 1000 permutations). Furthermore, the permutation test on the difference in means has greater power for light-tailed distributions.

### Assumptions
1. The data should be two randomly selected independent samples   
2. Both population distributions are continuous (not discrete/categorical)  

### Hypotheses
The three possible sets of hypotheses are:                    
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≤ F_2(x)                                          
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≥ F_2(x)                                               
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≥ F_2(x) or F_1(x) ≤ F_2(x) for all x with a strict inequality for at least one x  
The null hypothesis implies two distributions, population 1 and population 2, are identical. Note that for alternative hypothesis Ha: F_1(x) ≤ F_2(x), it actually implies that population 1 has larger observed values than population 2 as F_1(x) and F_2(x) are distribution functions of population 1 and population 2 respectively.

### Implementation

```r
sample1 <- c(38, 50, 56, 58)
m <- length(sample1)

sample2 <- c(24, 32, 39, 47)
n <- length(sample2)

data <- c(sample1, sample2)
# inputs the data from example

# How many permutations of m assigned to sample 1 and n assigned to sample 2?
choose(m+n,m)
```

```
## [1] 70
```

```r
# Find all permutations of data for sample 1: all unique groupings of m data points
perm1 <- combn(data,m)
perm1 <- t(perm1) #transpose the data so each permuted "sample 1" is a row, rather than a column

# Find the "paired" n data observations that are not classified as sample 1, 
# and are thus grouped into sample 2, for each permutation
perm2 <- NULL
for (i in 1:choose(m+n,m)){
  perm2 <- rbind(perm2, setdiff(data, perm1[i,]))
}

# Calculate the difference in means between the groups
diffmeans <- rep(NA, choose(m+n,m))
for (i in 1:choose(m+n,m)){
  diffmeans[i] <- mean(perm1[i,]) - mean(perm2[i,])
}

# Create a table with each permutation and its difference in means 
# (not necessary to run test, but interesting to look at)
table.perms <- cbind(perm1, perm2, diffmeans)
table.perms <- table.perms[order(-diffmeans),] #sorts from largest to smallest
head(table.perms)
```

```
##                              diffmeans
## [1,] 50 56 58 47 38 24 32 39      19.5
## [2,] 50 56 58 39 38 24 32 47      15.5
## [3,] 38 50 56 58 24 32 39 47      15.0
## [4,] 56 58 39 47 38 50 24 32      14.0
## [5,] 38 56 58 47 50 24 32 39      13.5
## [6,] 50 56 58 32 38 24 39 47      12.0
```

```r
# Find the proportion of permutations that have a difference of means 
# greater than the observed difference of means
diffmeans.obs <- mean(sample1)-mean(sample2) # calculate observed difference in means
sum(diffmeans >= diffmeans.obs) # this is the total number of differences greater than or equal to observed
```

```
## [1] 3
```

```r
sum(diffmeans >= diffmeans.obs)/choose(m+n,m) # this is the proportion of differences greater than or equal to observed (p-value)
```

```
## [1] 0.04285714
```

## Two-Sample Inference Procedure (Difference in Location): Wilcoxon Rank-Sum Test 
### Summary
The Wilcoxon Rank-Sum Test is a version of the permutation test applied to the data ranks rather than the actual data values.
The steps to obtain the p-value would be the following:  

1. Pool the m observations from sample 1 and the n observations from sample 2 together. Rank them from smallest (1) to largest (m+n).  
2. Permute the observations between the samples such that m units are assigned to sample 1 and n units are assigned to sample 2. Compute the sum of ranks for sample 1, W, which is the test statistic for this test. Repeat this step (m+n)!/m!n! times.
3. The p-value is the fraction of rank sums as extreme or more extreme than observed.  

Note that the number of possible ways to permute data is: (m+n)!/m!n!. If it becomes too time consuming to generate all possible permutations, we can instead take a random sample of permutations (common choice would be 1000 permutations). Furthermore, the Wilcoxon Rank-Sum Test has greater power for heavy-tailed and skewed distributions.

### Assumptions
1. The data should be two randomly selected independent samples  
2. Both population distributions are continuous (not discrete/categorical).  
3. The two populations have equal variance or spread.  

### Hypotheses
The three possible sets of hypotheses are:                    
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≤ F_2(x)                                          
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≥ F_2(x)                                               
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≥ F_2(x) or F_1(x) ≤ F_2(x) for all x with a strict inequality for at least one x  
The null hypothesis implies two distributions, population 1 and population 2, are identical. Note that for alternative hypothesis Ha: F_1(x) ≤ F_2(x), it actually implies that population 1 has larger observed values than population 2 as F_1(x) and F_2(x) are distribution functions of population 1 and population 2 respectively.

### Implementation

```r
sample1 <- c(38, 50, 56, 58)
sample2 <- c(24, 32, 39, 47)

### RANKING DATA ###

data<-c(sample1, sample2)

ranks<-rank(data, ties.method="average")
# The rank function returns the ranks in order of the original data.
# You need to specify ties.method="average" if there are ties.

rbind(data, ranks)
```

```
##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
## data    38   50   56   58   24   32   39   47
## ranks    3    6    7    8    1    2    4    5
```

```r
# the output is just to visualize how the ranking works

### WILCOXON RANK-SUM TEST ###

wilcox.test(sample1, sample2, alternative="greater")
```

```
## 
## 	Wilcoxon rank sum exact test
## 
## data:  sample1 and sample2
## W = 14, p-value = 0.05714
## alternative hypothesis: true location shift is greater than 0
```

```r
# The options for alternative are "less", "greater", or "two.sided":
# "less" refers to the lower tail test
# "greater" refers to the upper tail test

# The test statistic returned (W) is not the Wilcoxon Rank-Sum Test statistic, 
# but actually the Mann-Whitney Test statistic.

# The p-value, however, is correct.
```

## Two-Sample Inference Procedure (Difference in Location):     Mann-Whiteney Test 
### Summary
Mann-Whitney Test focuses on each pair of observations: (x_i, y_j) with x_i being all the observations from population 1 and with y_j being all the observations from population 2. The Mann-Whitney test statistic is number of pairs for which x_i > y_j. The steps to calculate p_value are the following:

1. Pool the m observations from sample 1 and the n observations from sample 2 together.  
2. Permute the observations between the samples such that m units are assigned to sample 1 and n units are assigned to sample 2. Compute the test statistic, U. Repeat this step (m+n)!/m!n! times.
3. The p-value is the fraction of permutations as extreme or more extreme than observed.  

Note that the number of possible ways to permute data is: (m+n)!/m!n!. If it becomes too time consuming to generate all possible permutations, we can instead take a random sample of permutations (common choice would be 1000 permutations). Furthermore, it is proven that the Mann-Whitney test statistic is linearly related, and thus equivalent, to the Wilcoxon test statistic, meaning that both test statistics will result in the same p-value and conclusion. 

### Assumptions
1. A random sample is selected from each population, and the two populations are independent of each other    
2. Two populations are assumed to be similar in shape  
3. Both population distributions are continuous (not discrete/categorical)  

### Hypotheses
The three possible sets of hypotheses are:                    
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≤ F_2(x)                                          
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≥ F_2(x)                                               
Ho: F_1(x) = F_2(x) vs. Ha: F_1(x) ≥ F_2(x) or F_1(x) ≤ F_2(x) for all x with a strict inequality for at least one x  
The null hypothesis implies two distributions, population 1 and population 2, are identical. Note that for alternative hypothesis Ha: F_1(x) ≤ F_2(x), it actually implies that population 1 has larger observed values than population 2 as F_1(x) and F_2(x) are distribution functions of population 1 and population 2 respectively.

### Implementation
Because of the equivalence to the Wilcoxon Rank-Sum Test, we can use the very same function in R for both tests. 

```r
sample1 <- c(38, 50, 56, 58)
sample2 <- c(24, 32, 39, 47)

wilcox.test(sample1, sample2, alternative="greater")
```

```
## 
## 	Wilcoxon rank sum exact test
## 
## data:  sample1 and sample2
## W = 14, p-value = 0.05714
## alternative hypothesis: true location shift is greater than 0
```

```r
# The options for alternative are "less", "greater", or "two.sided":
# The test statistic returned by R is actually the Mann-Whitney Test’s U, not W for the Wilcoxon Rank-Sum Test.
```

## Two-Sample Paired Data Inference Procedure (Difference in Location): Wilcoxon Signed-Rank Test 
### Summary
Signed ranks are a method of ranking matched pairs data while accounting for the positive or negative nature of the differences.
Method: 

1. Take the absolute value of each difference and rank them from smallest to largest.  
2. Assign + and – signs to the ranks based on the sign of the observed difference.  

The Wilcoxon Signed-Rank Test modifies the Wilcoxon Rank-Sum Test to the signed ranks. The test statistic is SR+, the sum of the positive signed ranks. The Wilcoxon Signed-Rank Test is a also permutation-based procedure. The steps to obtain p-value are the following:  

1. For the n pairs, obtain the 2^n possible assignments of plus and minus signs to the ranks of the absolute differences.  
2. For each of the 2^n permutations in step 1, compute SR+, the sum of the positive signed ranks.  
3. The p-value is the fraction of rank sums as extreme or more extreme than observed  

Note that the Wilcoxon Signed-Rank Test would be the ideal test to conduct when the differences are skewed or heavy-tailed.

### Assumptions
1. Two samples need to be dependent observations of the cases, and the differences between two samples are independent with its distribution being symmetric.    
2. Both population distributions are continuous (not discrete/categorical).  
3. Both dependent measurements to be at least of ordinal scale.

### Hypotheses
The two possible sets of hypotheses are:                    
Ho: F(x) = 1 - F(-x) vs. Ha: F(x) ≤ 1 - F(-x)                                          
Ho: F(x) = 1 - F(-x) vs. Ha: F(x) ≥ 1 - F(-x)                                              
The null hypothesis implies the population distribution is symmetric about zero. Note that for the first alternative hypothesis Ha: F(x) ≤ 1 - F(-x), it indicates that the population distribution has greater probability above zero (the differences are predominantly positive). On the other hand, the second alternative hypothesis: Ha: F(x) ≥ 1 - F(-x) would indicate that the population distribution has greater probability below zero (the differences are predominantly negative).

### Implementation

```r
pre<-c(1180, 1210, 1300, 1080, 1120, 1240, 1360, 980)
post<-c(1230, 1280, 1310, 1140, 1150, 1200, 1340, 1100)
diff<-post-pre
wilcox.test(diff, alternative="greater")
```

```
## 
## 	Wilcoxon signed rank exact test
## 
## data:  diff
## V = 30, p-value = 0.05469
## alternative hypothesis: true location is greater than 0
```

## Two-Sample Paired Data Inference Procedure (Difference in Location): Sign Test 
### Summary
Sign Test uses the fact that as x = 0, the null hypothesis Ho: F(x) = 1 - F(-x) would then be F(0) = 1 - F(0) = 0.5 since the total probability of the cdf function is equal to 1. Let SN+ denote the number of observations (differences) greater than 0. In this case SN+ is a binomially distributed random variable as: 
1. There are n differences sampled.
2. Because we use random sampling, the n differences sampled are independent.  
3. Each observation Di is either larger than zero (“success”) or less than zero (“failure”).  
4. If Ho is true (zero really is the median), then the probability of success p is equal to 0.5.  

Thus, p-value can be obtained by:
– Upper tail: P(SN+ ≥ SN+obs) -> 1 - pbinom(SN+obs – 1, n, 0.5)
– Lower tail: P(SN+ ≤ SN+obs) -> pbinom(SN+obs, n, 0.5)

Note that the Sign Test would also be the ideal test to conduct when the differences are skewed or heavy-tailed, but it generally has low power for small-to-moderate sample sizes.

### Assumptions
1. Two samples need to be dependent observations of the cases, and the differences are assumed to be independent.
2. Both populations are sampled independently.  
3. Both population distributions are continuous (not discrete/categorical).  
4. Both dependent measurements to be at least of ordinal scale.

### Hypotheses
The two possible sets of hypotheses are:                    
Ho: F(x) = 1 - F(-x) vs. Ha: F(x) ≤ 1 - F(-x)                                          
Ho: F(x) = 1 - F(-x) vs. Ha: F(x) ≥ 1 - F(-x)                                              
The null hypothesis implies the population distribution is symmetric about zero. Note that for the first alternative hypothesis Ha: F(x) ≤ 1 - F(-x), it indicates that the population distribution has greater probability above zero (the differences are predominantly positive). On the other hand, the second alternative hypothesis: Ha: F(x) ≥ 1 - F(-x) would indicate that the population distribution has greater probability below zero (the differences are predominantly negative).

### Implementation

```r
pre<-c(1180, 1210, 1300, 1080, 1120, 1240, 1360, 980)
post<-c(1230, 1280, 1310, 1140, 1150, 1200, 1340, 1100)
diff<-post-pre
signtest_stats = sum(diff>0)

# Upper tail: P(SN+ ≥ SN+obs) -> pbinom(SN+obs – 1, n, 0.5)
1 - pbinom(signtest_stats-1, 8, 0.5)
```

```
## [1] 0.1445312
```

## Two-Sample Data Inference Procedure (Difference in Scale): Siegel-Tukey Test 
### Summary
Siegel-Tukey Test is a rank-based procedure to detect differences in scale. Siegel-Tukey test applies a scoring procedure that places lower scores on the more extreme observations and higher scores on the middle observations should detect such differences in scale. The steps of Siegel-Tukey Test is the following:  

1. Sort the observations from smallest to largest.  
2. Assign the smallest observation a rank of 1, the largest observation a rank of 2, the second largest observation a rank of 3, the second smallest observation a rank of 4, the third smallest observation a rank of 5, and so on.  
3. Apply the Wilcoxon Rank-Sum Test to these “ranks.” 

Note that we could easily perform the test by starting the alternating pattern of ranking observations with the largest instead of the smallest. While this may likely yield a slightly different value of the Wilcoxon statistic, the decision reached by the test will generally be the same, making the test quite arbitrary. Furthermore, if the two populations have different location parameters, we cannot use Siegel-Tukey Test when we are trying to detect differences in scale between two samples as the assumption is violated. It is also more powerful for larger sample sizes and when the distributions are skewed, heavy-tailed distributions.

### Assumptions
1. Two random (independent) samples are generated.  
2. Both population distributions are continuous.  
3. Both populations share the same location parameter.  

### Hypotheses
The three possible sets of hypotheses are:                    
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 ≤ 𝜎2                                          
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 ≥ 𝜎2    
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 != 𝜎2 

Note that in this case, 𝜎i will be a general scale parameter, not necessarily the standard deviation.

### Implementation

```r
x<-c(16.55, 15.36, 15.94, 16.43, 16.01)
y<-c(16.05, 15.98, 16.10, 15.88, 15.91)

# install.packages("DescTools")
SiegelTukeyTest(x, y, alternative="greater")
```

```
## 
## 	Siegel-Tukey-test for equal variability
## 
## data:  x and y
## ST = 24, p-value = 0.2738
## alternative hypothesis: true ratio of scales is greater than 1
```

## Two-Sample Data Inference Procedure (Difference in Scale): Ansari-Bradley Test 
### Summary
The Ansari-Bradley Test overcomes the ambiguity of Siegel-Tukey Test by averaging the ranks obtained by doing the Siegel-Tukey ranking in both directions (starting with the largest and starting with the smallest). However, as we are now working with average ranks, we can no longer use the Wilcoxon Rank-Sum critical values to find a rejection region for the test. Instead, p-values must be obtained through permutations.

Note that if the two populations have different location parameters, we cannot use Ansari-Bradley Test when we are trying to detect differences in scale between two samples as the assumption is violated. It is also more powerful for larger sample sizes and when the distributions are skewed, heavy-tailed distributions.

### Assumptions
1. Two random (independent) samples are generated.  
2. Both population distributions are continuous.  
3. Both populations share the same location parameter.  

### Hypotheses
The three possible sets of hypotheses are:                    
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 < 𝜎2                                          
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 > 𝜎2    
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 != 𝜎2 

Note that in this case, 𝜎i will be a general scale parameter, not necessarily the standard deviation.

### Implementation

```r
x<-c(16.55, 15.36, 15.94, 16.43, 16.01)
y<-c(16.05, 15.98, 16.10, 15.88, 15.91)
ansari.test(x, y, alternative="greater")
```

```
## 
## 	Ansari-Bradley test
## 
## data:  x and y
## AB = 13, p-value = 0.2698
## alternative hypothesis: true ratio of scales is greater than 1
```

```r
# note that the test statistic is different, but the p-value is correct comparing to Siegel-Tukey Test 
```

## Two-Sample Data Inference Procedure (Difference in Scale): Test on Deviance
### Summary
The deviance is calculated by subtracting the location parameter from each observation, making observations from both samples come from distributions located at 0, where the only difference is in terms of scale. To assess the difference in scale parameters between the two populations, the test statistic will be the ratio of absolute mean differences (RMD), which is calculated using the sum of the absolute value of deviance divided by number of sample for both samples and find the ratio. Thus, large values of RMD indicate that population 1 (in the numerator) has greater variability. Small values of RMD indicate that population 2 (in the denominator) has greater variability. The steps to obtain p-value are the following: 

1. computing the estimated deviance for each observation  
2. Solve for the estimated RMD statistic  
3. Pool the m observations from sample 1 and the n observations from sample 2 together. Permute the observations between the samples such that m units are assigned to sample 1 and n units are assigned to sample 2. Compute the estimated RMD statistic. Repeat this step (m+n)!/m!n! times. 
4. The p-value is the fraction of permutations as extreme or more extreme than observed.

Note that if the two populations have different location parameters, we have to use the test on deviance when we are trying to detect differences in scale between two samples as the assumption is violated for the Siegel-Tukey and Ansari-Bradley Tests. It is also more powerful for smaller sample sizes and when the distributions are symmetric, light-tailed distributions.

### Assumptions
1. Two random (independent) samples are generated.  
2. Both population distributions are continuous.  


### Hypotheses
The three possible sets of hypotheses are:                    
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 < 𝜎2                                          
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 > 𝜎2    
Ho: 𝜎1 = 𝜎2 vs. Ha: 𝜎1 != 𝜎2 

Note that in this case, 𝜎i will be a general scale parameter, not necessarily the standard deviation.

### Implementation

```r
x<-c(16.55, 15.36, 15.94, 16.43, 16.01)
y<-c(16.05, 15.98, 16.10, 15.88, 15.91)
# first, we need to combine the data for permuting
data<-c(x, y)
m<-length(x)
n<-length(y)

# find all permutations of m observations into the "sample 1" group
x.perm <- combn(data,m)
x.perm <- t(x.perm) # want each permutation as a row in our x.perm matrix

# find the corresponding "sample 2" observations for each permutation
y.perm <- NULL
for (i in 1:choose(m+n, m)){
  y.perm <- rbind(y.perm, setdiff(data, x.perm[i,]))
}

# calculate the RMD statistic for each permutation (each pair of rows in x.perm and y.perm)
RMD <- rep(NA, choose(m+n, m))
for (i in 1:choose(m+n, m)){
  RMD[i] <- mean(abs(x.perm[i,]-median(x.perm[i,])))/mean(abs(y.perm[i,]-median(y.perm[i,])))
}

# solve for the observed RMD statistic with the original data
RMD.obs <- mean(abs(x-median(x)))/mean(abs(y-median(y)))

# solve for the p-value
sum(RMD >= RMD.obs) # use > because this is the upper tail test (would switch for different Ha)
```

```
## [1] 20
```

```r
sum(RMD >= RMD.obs)/choose(m+n, m)
```

```
## [1] 0.07936508
```

## Motivation
While conducting data analysis, it is quite common that there are some limitations regarding the data, such as small sample size or unknown distribution. This is when non-parametric tests come into play. Non-parametric tests require fewer and weaker assumptions comparing to those of parametric tests. One common assumption that is associated with parametric tests is that the data has a normal distribution, which is quite hard to meet when dealing with practical cases. Non-parametric tests can also be applied to a wider range of data types, such as ordinal and nominal data, which could be quite useful when make inferences from surveys. Nevertheless, I realized the online resources related to conducting non-parametric tests in R are either limited or not really comprehensive even though the method could be really beneficial at times. While there are some existing online resources related to conducting non-parametric tests in R, I found them to be quite disorganized and could be not as straightforward when it comes to choosing which test to conduct. That is why I decided to make a guide that would hopefully make it easier for the audience to understand which test to conduct in specific situations. In this project, as there are a lot of different non-parametric tests that could be applied with problems dealing with two samples and one-way data, I plan to just focus on those. I am also trying to help the audience to understand the logistics behind each test instead of just blindly calling functions in R. While sometimes it is easier to just call the function directly, I believe it could be quite helpful to actually understand how the tests obtain the statistics. In the guide, I include a summary, required assumptions, possible hypotheses, and implementation for each test. 

After this project, I realized some of the non-parametric tests are actually quite similar to each other. While there might be existing function that could be called to conduct the tests in R, I found out the statistics for certain tests could be obtained just using some basic functions in R. In regards to the implementations, I decided to use simpler data for the demonstration purpose and hopefully would make it easier for the audience to understand. Nevertheless, I also understand the benefits of using existing data packages as they are more practical, which is what I might do differently next time. 

## Citations  
[Nonparametric Statistics] (https://faculty.ksu.edu.sa/sites/default/files/nonparametric_statistics_a_step-by-step_approach.pdf)  
[Handbook of Parametric and Nonparametric Statistical Procedures] (https://fmipa.umri.ac.id/wp-content/uploads/2016/03/David_J._Sheskin_David_Sheskin_Handbook_of_ParaBookFi.org_.pdf)  
[wilcox.test: Wilcoxon Rank Sum and Signed Rank Tests] (https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/wilcox.test)  
[Mann-Whitney U Test: Assumptions and Example] (https://www.technologynetworks.com/informatics/articles/mann-whitney-u-test-assumptions-and-example-363425)  
[Package ‘DescTools’] (https://cran.r-project.org/web/packages/DescTools/DescTools.pdf)  
[ansari.test: Ansari-Bradley Test] (https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/ansari.test)  
[Nonparametric Tests] (https://sphweb.bumc.bu.edu/otlt/mph-modules/bs/bs704_nonparametric/bs704_nonparametric_print.html)  

