# (PART) Interview Prep

# Ten interview questions and answers

Mengsu Alan Yang and Zhe Wang

## Forward

The following cheatsheet is created to help fellow classmates with internship search in the current strong-headwind job market environment.
Don't give up! You can do it! Happy hunting.

## Questions and Answers

### Q1. What is the difference between R and Python?

Answer: Both model building and the Data Science libraries are similar and comparable.
Model Interpretability: R has better model interpretability compared to python (easier for humans to understand, important when reporting to management).
Production: Python programming is good for production, while R falls short.
Community Support: R has better community support than Python.
Data Visualization: R has better data visualization libraries than python.
Learning curve: The learning curve for python is not as steep to R, so R has a higher technical barrier to entry.

### Q2. What are R packages?

Answer: Packages are collections of data, functions, and documentation that extends the capabilities of base R [1]. There are more than 10,000 packages stored in the CRAN repository and that number is still increasing [3]! Packages such as ggplot2, tibble, tidyr, and dplyr are all part of an opinionated collection known as "tidyverse." One can install a package by calling install.packages() with the name of the package in quotes as the argument of the function.

### Q3. What are the advantages of using R?

Answer: One strength of R lies in the fact that it is open source, and therefore it is freely available for and distribute. R support data wrangling needs and is able to create high quality and highly manipulatible graphs and plots with ggplot2. R is also platform independent and highly compatible [2] and runs on all operating systems. The language is great for statistics and has a lot of Statistician buy-in and therefore has great community support. When needed, R is also capable of supporting Machine Learning operations.

### Q4. What are the disadvantages of using R?

Answer: For beginners, R is a complication language and has a steep learning curve. It lacks a standard GUI and RStudio must be used, which is inferior to Python Jupyter Notebooks in organization and work flow. R is not good for big data; it consumes high memory and has a slower run time than Python and MATLAB [3]. R falls short in security as the language does not have basic security measures. Many functionalities are spread across many different packages, which are inconsistent in quality, functionality, and documentation.

### Q5. What is the difference between matrix and data frames?

Answer: A data structure is a special way of organizing data in a computer so that it can be used effectively. The idea is to reduce the spatial and temporal complexity of different tasks. The two most important data structures in R are Matrix and Dataframe, which look the same but differ in nature.

The matrix in R --
It is a homogeneous collection of data sets arranged in a two-dimensional rectangular organization. It is an am*n array with similar data types. It is created using vector input. It has a fixed number of rows and columns. You can perform many arithmetic operations on R matrices, such as addition, subtraction, multiplication, and division.

Dataframes in R --
It is used to store data tables. It can contain multiple data types in multiple columns called fields. It's a list of equal length vectors. It's a generalized form of the matrix. It's like a table in an Excel worksheet. It has column and row names. Row names are unique and there are no empty columns. The data stored must be a number, character, or factor type. DataFrame is heterogeneous.

### Q6. What is the difference between library() and require()?

Answer: library() and require() can be used to attach and load installed additional packages. Installed packages are identified with the help of a "DESCRPTION" file that contains Build:field. The name of the package that needs to be loaded using library() and require() must match the name of the package's "DESCRPTION" file.

require() is designed to be used inside functions because it gives a warning message and returns a logical value, such as FALSE if the requested package is not found and TRUE if 
the package is loaded.

The library() by default returns an error if the requested package does not exist.

### Q7. What types of data files can be read and exported in R?

Answer: Data import and output in R programming means that we can read data from external files, and write data to external files, and can access those files from outside the R environment. File formats like CSV, XML, xlsx, JSON, and web data like HTML tables can be imported into the R environment to be read and manipulated for data analysis [4]; data present in the R environment can be stored in external files in the same file formats.

### Q8. How many data structures does R have?

Answer: R has six types of basic data structures. We can organize these data structures according to their dimensions(1d, 2d, nd). We can also classify them as homogeneous or heterogeneous (can their contents be of different types or not).

1. Vector
2. List
3. Matrix
4. Data frame
5. Array
6. Factor

### Q9. What is the difference between pivot_wider() and pivot_longer()?

Answer: pivot_longer() makes datasets longer vertically by increasing the number of rows and decreasing the number of columns; every row becomes an observation. Length is a relative term, and you can only say (e.g.) that dataset A is longer than dataset B. pivot_longer() is commonly needed to tidy wild-caught datasets as they often optimize for ease of data entry or ease of comparison rather than ease of analysis. 

pivot_wider() is the opposite of pivot_longer(): it makes a dataset wider by increasing the number of columns and decreasing the number of rows. It’s relatively rare to need pivot_wider() to make tidy data, but it’s often useful for creating summary tables for presentation, or data in a format needed by other tools.

### Q10. Why do people use ggplot2?

Answer: ggplot2 is a plotting package that provides helpful commands to create complex plots from data in a data frame. It provides a more programmatic interface for specifying what variables to plot, how they are displayed, and general visual properties following the Grammar of Graphics. Therefore, we only need minimal changes if the underlying data change or if we decide to change from a bar plot to a scatterplot. This helps in creating publication quality plots with minimal amounts of adjustments and tweaking.

## References

[1] Wickham, Hadley, and Garrett Grolemund. *R For Data Science: Import, Tidy, Transform, Visualize and Model Data*, O'Reilly, Pozostate, 2017.

[2] Intellipaaat. “R Programming Interview Questions.” *YouTube*, 3 Jan. 2021, https://www.youtube.com/watch?v=lyFDNkbsQuE&amp;ab_channel=Intellipaat. 

[3] Simplilearn. “What Is R: Overview, Its Applications and What Is R Used For.” *Simplilearn.com*, Simplilearn, 3 Oct. 2022, https://www.simplilearn.com/what-is-r-article.

[4] “R Programming Language - Introduction.” *GeeksforGeeks*, 15 Aug. 2021, https://www.geeksforgeeks.org/r-programming-language-introduction/. 
