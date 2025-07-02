# SQL Mini Project: Countries Living Expenses Analysis

This project contains 10 SQL questions and solutions based on a dataset named `countries_living_expenses`.  
The dataset includes information about countries, their regions, cost of living, savings percentage, tax rates, average monthly income, and more.

## Project Overview
The goal is to analyze the dataset by answering common real-world queries related to cost of living, savings, taxes, and income across countries and regions.

## Dataset Overview
The dataset offers a comprehensive overview of the cost of living and average monthly income across various countries and regions from 2000 to 2023. It encompasses key economic indicators such as housing costs, tax rates, healthcare and education expenses, transportation costs, and savings rates. This data is valuable for analyzing global economic trends, comparing regional financial conditions, and supporting informed financial planning and policy decisions.

The dataset `countries_living_expenses` includes the following columns:
- `Country` — Name of the country  
- `Region` — Region it belongs to (e.g., Europe, Asia)  
- `Year` — Year of data collection  
- `Cost_of_Living` — Monthly average cost of living  
- `Average_Monthly_Income` — Average income per month  
- `Savings_Percentage` — Percent of income saved  
- `Tax_Rate` — Tax rate in percent
- `Savings_Percentage`: Monthly savings, expressed as a percentage.
- `Healthcare_Cost_Percentage`: percentage of income spent on healthcare services.
- `Education_Cost_Percentage`: percentage of income spent on educational needs.
- `Transportation_Cost_Percentage`: percentage of income spent for commute costs.

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
````
### Question 2
**Find the average cost of living by region.**

```sql
SELECT 
    Region, ROUND(AVG(Cost_of_Living), 2) AS Average_Cost
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Region;
````
### Question 3
**Get all records where the savings percentage is above 20%.**

```sql
SELECT 
    *
FROM
    countries_living_expenses
WHERE
    Savings_Percentage > 20
ORDER BY Savings_Percentage DESC;
````

### Question 4
**List all countries with a tax rate above the global average.**

```sql
SELECT 
    *
FROM
    countries_living_expenses
WHERE
    Tax_Rate > (
        SELECT AVG(Tax_Rate)
        FROM countries_living_expenses
    );
````

### Question 5
**What are the top 5 most expensive countries by average cost of living?**

```sql
SELECT 
    Country, ROUND(AVG(Cost_of_Living), 2) AS Avg_Living_Cost
FROM
    countries_living_expenses
GROUP BY Country
ORDER BY Avg_Living_Cost DESC
LIMIT 5;
````


### Question 6
**Calculate the average monthly income, cost of living, and savings % for each region.**

```sql
SELECT 
    Region,
    ROUND(AVG(Average_Monthly_Income), 2) AS Average_Income,
    ROUND(AVG(Cost_of_Living), 2) AS Average_Living_Cost,
    ROUND(AVG(Savings_Percentage), 2) AS Average_Savings
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Average_Income;
````

### Question 7
**Which region has the highest tax burden on average?.**

```sql
SELECT 
    Region, ROUND(AVG(Tax_Rate), 2) AS Average_Tax_Rate
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Average_Tax_Rate DESC
LIMIT 1;
````
Show all regions by tax burden descending:
```sql
SELECT 
    Region, ROUND(AVG(Tax_Rate), 2) AS Average_Tax_Rate
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Average_Tax_Rate DESC;
````

### Question 8
**Identify the top 5 countries with the best savings-to-tax ratio.**

```sql
SELECT 
    Country,
    ROUND(AVG(Savings_Percentage / Tax_Rate), 2) AS Average_Savings_Tax_Ratio
FROM
    countries_living_expenses
WHERE
    Tax_Rate > 0
GROUP BY Country
ORDER BY Average_Savings_Tax_Ratio DESC
LIMIT 5;
````
### Question 9
**Identify countries with low income but high cost of living.**

```sql
WITH country_averages AS (
    SELECT 
        Country,
        ROUND(AVG(Average_Monthly_Income), 2) AS Avg_Income,
        ROUND(AVG(Cost_of_Living), 2) AS Avg_Cost
    FROM countries_living_expenses
    GROUP BY Country
)
SELECT *
FROM country_averages
WHERE Avg_Income < Avg_Cost;
````
### Question 10
**Find the year when each country had its highest savings percentage.**

```sql
WITH ranked_savings AS (
    SELECT 
        Country,
        Year,
        Savings_Percentage,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY Savings_Percentage DESC) AS rnk
    FROM countries_living_expenses
)
SELECT Country, Year, Savings_Percentage
FROM ranked_savings
WHERE rnk = 1
ORDER BY Savings_Percentage DESC;
````

