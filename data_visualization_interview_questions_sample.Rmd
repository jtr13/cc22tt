# Data visualization interview questions sample

Yifan Zhu and Yuqi Shao

## Abstract

Data visualization is important for data scientists to efficiently understand big-data, define features, and interpret their findings, especially for communicating with non-technical audiences. Visualization tools such as dashboards containing multiple metrics could convey and monitor critical information, which help the executive team to make business decisions in the workplace. As current Master of Science students in Data Science, we should be equipped with data interpretation and visualization techniques. The motivation of the following content is to prepare the data visualization questions we may encounter during Data Scientist or Data Analyst interviews, and to develop a basic framework from start to end. 

The content has been designed into two parts. 1. Data manipulation. Before importing into any tools, data should be prepared into an analytical format of data in order to be analyzed. Data preprocessing and transformation is always prioritized for any projects. Some issues should be carefully considered. For example, missing data, sparse data, outliers and normalization; 2. Tools and Libraries. After data processing, we should clarify the questions we are interested in and investigate our data using multiple methods. Therefore, some questions regarding tools and libraries are prepared. 

By analyzing and reflecting on our own interview process, we learned how to better structure the answer from the evaluator’s perspective. We did the question bank initially by writing down questions we've been asked in the interview process and then starting to put them into categories, which is a lengthy process that made it less efficient and sometimes missed some questions during the work. If doing this process again, we could begin by categorizing the knowledge areas and question types, which will create a more comprehensive framework to organize our ideas better. Also, we initially try to make interview sample answers to be as close to reality as possible, and we later realize some wording in actual interviews may confuse readers as it is conversational. So we reworded the answer to only include the most relevant points. 


## Data Manipulation 

#### Question: What is tidy data?
Answer: tidy data is a standard way of mapping the meaning of a dataset to its structure. Each variable forms a column; each observation forms a row; each type of observational unit forms a table. 

#### Question: What is data modelling? 
Answer: Data modeling is the analysis of data objects that are used in a business or other context and the identification of the relationships among these data objects. Data modeling is the first step in performing object-oriented programming

#### Question: What is sparse data and what is missing data?
Answer: Sparse data contains 0’s while missing data contains null; sparse data will cause overfitting and increase time and space complexity, and the model will underestimate the importance of sparse features. Instead of dropping all missing data, we could use the interpolation method to fill those NAs or replace them with mean, mod, medium values. 

#### Question:What is an outlier? How to deal with outliers?
Answer: An outlier is an observation that lies an abnormal distance from other values in a random sample from a population. We need to define outliers based on certain metrics (e.g., standard deviation, boxplot). Instead of dropping outliers, we also need to consider transforming data. 

#### Question: What would you do with suspected or missing data?
Answer: We can prepare a data validation report to explain why the data failed. We can use strategies like deletion, single imputation, mean imputation, median imputation, mode imputation, etc.

#### Question: What process of transforming raw data into a visualization?
Answer: First of all, we need to gather stakeholder’s input and unstructured the goal of visualization. Then we should deal with the raw data by the procedure of data collection, data cleaning (De-dupping, missing values, standardization), chart type selection, and data preparation (formatting, converting, grouping/aggregating).


## Tools and Library 

#### Question: List several R libraries that can be used for data visualisation

Answer: ggplot2, Lattice, highcharter, Leaflet, RColorBrewer, Plotly, sunburstR, RGL


#### Question: How do you choose a suitable visualization method in terms of color, shape, measure, and orientation? 

Answer: Before choosing an appropriate visualization method, we need to consider various variables that affect the way data is presented. Color, shape, measure, and orientation are all critical variables to consider. For example, different colors can help differentiate different datasets; different shapes can help recognize different types of data. Measure and orientation are also critical because they can affect the way to read and understand data. 

#### Question: What is the difference between “analytics” and “data visualization”?

Answer: “Analytics” is very broad and can be referred to any analytic methods and data interpretation. “Data visualization” is more specific and focuses on visual representations by showing patterns and relationships between data points to help people better understand data.

#### Question: What does “KISS” stand for? How does this relate to data visualization?
Answer: “KISS” is short for “Keep It Simple, Stupid,” which is the design goal to create simple, easily interpreted visualizations and avoid complexity.  

#### Question: What are stages of visualization?
Answer: There are mainly four stages of data visualization: exploratory, descriptive, predictive, and explanatory, which give business insights into how they can visualize their data. 

#### Question: How can you visualize more than three dimensions in a single chart?
Answer: There is no standardized way of doing it because we can do so in many different ways. For example, using charts with multiple axes like pie charts or heat maps; or using animation sequences to show changes over time.

#### Question: What is depth cueing in visualization?
Answer: It is a concept of using color, texture, and size to create a sense of depth in a 2 dimensional image, which is implemented by blending objects into the background with the increasing distance from viewers. Depth cueing can be used in different applications. For example, one can show one object is closer than another by making it bigger and darker; or one can give two colors to represent two different data points. 

#### Question: What is Row-Level Security?
Answer: Row-Level security is when each row or columns in the table has its own permission setting that protects the database. 

#### Question: Is excel a data visualization tool?
Answer: No, Excel is spreadsheet software used to create charts, tables, graphs, and pivot tables. It  provides many features for data analysis and visualization, but it is not a data visualization tool.
 
