# SQL Mini Project: Countries Living Expenses Analysis

This project contains 10 SQL questions and solutions based on a dataset named `countries_living_expenses`.  
The dataset includes information about countries, their regions, cost of living, savings percentage, tax rates, average monthly income, and more.

## Project Overview
The goal is to analyze the dataset by answering common real-world queries related to cost of living, savings, taxes, and income across countries and regions

### Question 1  
**List all distinct countries and the number of records per country.**

```sql
SELECT
    Country, COUNT(*) AS Country_records
FROM
    countries_living_expenses
GROUP BY Country;

#Question 2
**Find the average cost of living by region.**

```sql
SELECT 
    Region, ROUND(AVG(Cost_of_Living), 2)
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Region;



