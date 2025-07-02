# SQL Mini Project: Countries Living Expenses Analysis

This project contains 10 SQL questions and solutions based on a dataset named `countries_living_expenses`.  
The dataset includes information about countries, their regions, cost of living, savings percentage, tax rates, average monthly income, and more.

## Project Overview
The goal is to analyze the dataset by answering common real-world queries related to cost of living, savings, taxes, and income across countries and regions.

## Dataset Overview
The dataset `countries_living_expenses` includes the following columns:
- `Country` — Name of the country  
- `Region` — Region it belongs to (e.g., Europe, Asia)  
- `Year` — Year of data collection  
- `Cost_of_Living` — Monthly average cost of living  
- `Average_Monthly_Income` — Average income per month  
- `Savings_Percentage` — Percent of income saved  
- `Tax_Rate` — Tax rate in percent

## How to Run
1. Load the dataset into a MySQL database (table: `countries_living_expenses`)
2. Run the following SQL queries in MySQL Workbench


### Question 1  
**List all distinct countries and the number of records per country.**

```sql
SELECT
    Country, COUNT(*) AS Country_records
FROM
    countries_living_expenses
GROUP BY Country;
```sql


### Question 2
**Find the average cost of living by region.**

```sql
SELECT 
    Region, ROUND(AVG(Cost_of_Living), 2) AS Average_Cost
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Region;
```sql


