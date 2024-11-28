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


CREATE TABLE `layoffs` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
