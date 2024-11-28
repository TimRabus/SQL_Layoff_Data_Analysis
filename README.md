# About: SQL_Layoff_Data_Analysis
This project focuses on analyzing layoff data from various companies between Q1 2020 and Q1 2023. The objective was to clean the dataset and perform exploratory data analysis (EDA) to uncover insights into layoff patterns during this period.



## Table of Contents
1. [Introduction](#introduction)
2. [Data](#data)
3. [Project Overview](#project-overview)
4. [Results](#results)
5. [Replication](#replication)




## Introduction
### Layoff Data from Q1 2020 to Q1 2023 Analysis Using SQL
This project focuses on analyzing layoff data from various companies between Q1 2020 and Q1 2023 using SQL. The objective was to clean the dataset by removing duplicates, standardizing and correcting data, handling NULL values, and eliminating unnecessary columns. Following data cleaning, exploratory data analysis (EDA) was performed to uncover key trends and insights into layoff patterns during this period.


The project focuses on:

   - Data Cleaning: Remove duplicates, standardize data, handling NULL values and eliminating unnecessary columns.
   - Exploratory Data Analysis:
      - Layoff Trends and Impact: Identification of top companies, industries, and countries affected, with key patterns over time.
      - Annual and Cumulative Analysis: Highlights major layoffs, 100% workforce reductions, and top companies by year.

The project was conducted in MySQL Workbench.



## Data
The dataset contains layoff data from various companies from the first quarter of 2020 until the first quarter of 2023, including information on company locations, industry, layoff numbers and percentage, date, company stages. The data is organized in the following schema:


### Table: `layoffs`
| Column                    | Type              | Description                             |
|---------------------------|-------------------|-----------------------------------------|
| `company`                 | TEXT              | Name of the company                     |
| `location`                | TEXT              | Location of the company                 |
| `industry`                | TEXT              | Industry of the company                 |
| `total_laid_off`          | INTEGER           | Amount of layoffs                       |
| `percentage_laid_off`     | TEXT              | Percentage of layoffs                   |
| `date`                    | TEXT              | Date of layoffs                         |
| `stage`                   | TEXT              | Company Stage                           |
| `country`                 | TEXT              | Country of the company                  |
| `funds_raised_millions`   | INTEGER           | Amount of money raised during funds     |

Sample data can be found in the `LayoffData.csv` file.




## Project Overview
This project is structured into three distinct parts, each focusing on a critical aspect of data analysis.

1. **Data Wrangling**:
   The first stage ensures the dataset is clean and ready for analysis. Key steps include:
      - Building a database, creating tables, and inserting data.
      - Handling `NULL` or missing values by setting constraints like `NOT NULL` during table creation.
      - Verifying that no `NULL` values exist in the dataset.

   The SQL queries used for the Data Wrangling step can be found in the `Data_Wrangling.sql` file.



2. **Feature Engineering**:
   New columns are created from existing data to provide deeper insights:
      - `time_of_day`: Categorizes transactions into Morning, Afternoon, or Evening, revealing sales trends throughout the day.
      - `day_name`: Extracts the day of the week (e.g., Mon, Tue), helping identify the busiest days for each branch.
      - `month_name`: Extracts the month (e.g., Jan, Feb) to determine which months drive the highest sales and profit.

   The SQL queries used for the Feature Engineering step can be found in the `Feature_Engineering.sql` file.



3. **Exploratory Data Analysis (EDA)**:
   The final stage of this project focuses on analyzing the processed data to address key business questions and uncover trends in sales performance, customer behavior, and product demand. This stage is divided into three main analyses, each performed using specific SQL queries:

   1. **Product Analysis**
      - Goal: Understand the performance of different product lines and their contributions to overall sales.
      - Query: `Product_Analysis.sql` file
     
   2. **Sales Analysis**
      - Goal: Evaluate sales trends across branches to measure the effectiveness of various sales strategies.
      - Query: `Sales_Analysis.sql` file
     
   3. **Customer Analysis**
      - Goal: Examine customer segments, purchasing trends, and profitability to identify high-value segments.
      - Query: `Customer_Analysis.sql` file





## Results
The SQL queries result in the following insights and are divided into three main analyses: product performance, sales trends, and customer behavior, each offering distinct insights into the factors driving business outcomes:

 1. **Product Analysis**
      - Sales & Performance Insights: Analysis of popular cities, branches, and dominant product lines, including revenue, sales, and ratings.
      - Customer Preferences: Gender-based product preferences and purchasing patterns.
      - Financial Trends: Month-by-month financial analysis (e.g., revenue, COGS) and branch/product performance comparisons.

2. **Sales Analysis**
      - Sales Distribution by Time & Day: Number of sales by time of day (morning, afternoon, evening) and weekday.
      - Revenue by Customer Type: Identification of the customer type generating the highest revenue.
      - Tax & VAT Insights: Analysis of cities with the highest average VAT and customer types paying the most VAT.

3. **Customer Analysis**
      - Demographics & Preferences: Insights into unique customer types, payment methods, gender distribution, and the highest-spending customer type.
      - Rating Analysis: Analysis of when and where customers give the highest average ratings (by time of day, day of the week, and branch).
      - Branch-wise Gender & Rating Distribution: Breakdown of gender and rating patterns across branches.


## Replication
To replicate this Walmart Sales project, please follow the steps outlined below.

1. **Set up MySQL Environment**:
   - Install MySQL Workbench (or any other preferred MySQL client).
   - Ensure MySQL server is running and accessible.

2. **Download and Prepare Data**:
   - Download the WalmartSalesData.csv (or your dataset).
   - Ensure the dataset is clean and properly formatted for MySQL import.

3. **Create Database and Tables**:
   - Create a new database in MySQL: `CREATE DATABASE` walmart_sales;
   - Create the sales table using the schema provided in the Data section of the project.
   - Import the data from the CSV file into the sales table using the LOAD DATA INFILE statement or MySQL Workbench's import functionality.

4. **Data Wrangling**:
   - Run SQL queries from the Data_Wrangling.sql file to clean the data (e.g., handling NULLs, ensuring no missing values, setting constraints like NOT NULL).

5. **Feature Engineering**:
   - Use SQL queries from the Feature_Engineering.sql file to create new columns (e.g., time_of_day, day_name, month_name) to enhance the dataset with additional insights.
   - Test the transformations by querying the new columns to verify correct calculations.

6. **Exploratory Data Analysis (EDA)**:
   - Run the analysis queries from the following files:
      - Product_Analysis.sql – To analyze product performance and sales trends.
      - Sales_Analysis.sql – To explore sales trends, time distribution, and tax-related insights.
      - Customer_Analysis.sql – To examine customer behavior, demographics, and purchasing patterns.
   - Check the results of each analysis using SELECT statements and aggregate functions to answer key business questions.

7. **Analyze and Interpret Results**:
   - Review the insights generated from each analysis (Product, Sales, and Customer).
   - Make sure the results align with business goals and provide actionable insights (e.g., sales trends, customer preferences).
