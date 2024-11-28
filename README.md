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
This project is structured into two distinct parts, each focusing on a critical aspect of data analysis.

1. **Data Cleaning**:
   The initial stage focuses on preparing the dataset for analysis.
   Key tasks include:
      - Creating a staging table to safeguard the original raw data.
      - Removing duplicate rows despite the absence of a primary key column.
      - Standardizing data by correcting errors (e.g., typos) and addressing `NULL` values.

   The SQL queries for this stage are available in the `Data_Cleaning.sql` file.


3. **Exploratory Data Analysis (EDA)**:
   The second stage delves into analyzing the cleaned data to extract insights about layoffs across companies, industries, and time periods:

      - Companies: Identify the organizations with the largest layoffs and quantify their scale.
      - Industries: Assess which industries experienced the most significant layoffs.
      - Timings: Analyze the timing of major layoffs and track how layoff numbers evolved over time.

   The SQL queries for this stage are available in the `Exploratory_Data_Analysis.sql` file.



## Results
The SQL queries result in the following insights and are divided into three main analyses: product performance, sales trends, and customer behavior, each offering distinct insights into the factors driving business outcomes:

 1. **Companies**
      - Approximately 5% of companies experienced a complete workforce layoff.
      - Larger companies accounted for higher absolute numbers of layoffs.
      - Organizations with the highest total layoffs were predominantly in the Post-IPO stage.
        

2. **Industries**
      - Retail and Consumer have been the highest impacted industry by layoffs; Manufacturing is the less impacted
      - Aerospace had the biggest layoff with 57% and Manfacturing the less with 5%.
      - 


3. **Timings**
      - Demographics & Preferences: Insights into unique customer types, payment methods, gender distribution, and the highest-spending customer type.

        

## Replication
To replicate this Layoff data project, please follow the steps outlined below.

1. **Set up MySQL Environment**:
   - Install MySQL Workbench (or any other preferred MySQL client).
   - Ensure MySQL server is running and accessible.

2. **Download and Prepare Data**:
   - Download the `LayoffData.csv`.
   - Ensure the dataset is clean and properly formatted for MySQL import.

3. **Create Database and Tables**:
   - Create a new database in MySQL: `CREATE DATABASE` world_layoffs;
   - Create the `layoffs` table using the schema provided in the Data section of the project.
   - Import the data from the CSV file into the `layoffs` table using the LOAD DATA INFILE statement or MySQL Workbench's import functionality.

4. **Data Cleaning**:
   - Run SQL queries from the `Data_Cleaning.sql` file to clean the data (e.g., removing duplicates, standardise data, handling NULLs).

5. **Exploratory Data Analysis (EDA)**:
   - Run the analysis queries from the following files:
      - `Exploratory_Data_Analysis.sql` – To gain insights about layoffs across companies, industries, and timings.
   - Check the results of each analysis using SELECT statements and aggregate functions to answer interesting business questions.

7. **Analyze and Interpret Results**:
   - Review the insights generated from each analysis (Company, Industry and Timings).


If you made any improvements, feel free to contribute back or share findings via GitHub issues, pull requests, or README documentation.
