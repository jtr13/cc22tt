# Time Series: ITSMR Cheat Sheet

Qinqi Zhang and Yanqing Wang

# Introduction:

This Cheatsheet is about the ITSMR package in R. It contains functions for modeling and forecasting time series data. A time series is a set of observations with each one being recorded at a specific time. Forecasting time series have different methods, such as recursive prediction algorithms, the Durbin-Levinson algorithm, and the innovations algorithm. For instance, this ITSMR package contains functions of computing ACVF, ACF & PACF, checking causality & invertibility, visualization, etc. It also includes five methods for estimating ARMA parameters: Yule-Walker, Burg, Hannan-Rissanen, maximum likelihood, and the innovations method while in all functions, the innovations algorithm is used to compute the variance of the White Noise process.

# Motivation:

Introduction to Time Series and Forecasting by Peter J. Brockwell and Richard A. Davis introduces an application ISTM2000 which also models, forecasts and visualizes time series data in tsm format. Unfortunately, although this application is very powerful and convenient, only the Windows system can operate this application. R language has no constraints in computer systems and it is popularized when analyzing data. Therefore, the ITSMR package in R language is discovered and might be able to become a substitution for users without Windows systems. The time series data in the txt file is accepted for this package. Similar to ISTM2000, it also has pre-loaded datasets but the number of datasets is less than that of the ITSM2000 application. The ITSMR package has main functions in time series and forecasting. Moreover, a cheat sheet of this ITSMR package is created for further discovery, bringing an introduction to its functions and related concepts.




Link: https://github.com/CommunityContributionGroup/CC/blob/main/ITSMR_Cheat_Sheet.pdf
