#Question 1:
#List all distinct countries and the number of records per country.
SELECT
    Country, COUNT(*) AS Country_records
FROM
    countries_living_expenses
GROUP BY Country;

#Question 2:
#Find the average cost of living by region.
SELECT 
    Region, ROUND(AVG(Cost_of_Living), 2)
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Region;

#Question 3:
#Get all records where the savings percentage is above 20%.
SELECT 
    *
FROM
    countries_living_Expenses
WHERE
    Savings_Percentage > 20
ORDER BY savings_percentage DESC;
    
#Question 4: 
#List all countries with a tax rate above the global average.
SELECT 
    *
FROM
    countries_living_expenses
WHERE
    Tax_Rate > (SELECT 
            AVG(Tax_Rate)
        FROM
            countries_living_expenses);

#Question 5:
#What are the top 5 most expensive countries by average cost of living?
SELECT 
    Country, ROUND(AVG(Cost_of_Living), 2) AS Avg_Living_cost
FROM
    countries_living_expenses
GROUP BY Country
ORDER BY AVG(Cost_of_Living) DESC
LIMIT 5;

#Question 6:
#Calculate the average monthly income, cost of living, and savings % for each
#region
SELECT 
    Region,
    ROUND(AVG(Average_Monthly_Income), 2) AS Average_Monthly_Income,
    ROUND(AVG(Cost_of_Living), 2) AS Average_living_cost,
    ROUND(AVG(Savings_Percentage), 2) AS Average_Savings_Percentage
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Average_Monthly_Income;

#Question 7:
#Which region has the highest tax burden on average
SELECT 
    Region, ROUND(AVG(Tax_Rate), 2) AS Average_Tax_Rate
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Average_Tax_Rate DESC
LIMIT 1;

#Show All Regions Sorted by Tax Burden
SELECT 
    Region, ROUND(AVG(Tax_Rate), 2) AS Average_Tax_Rate
FROM
    countries_living_expenses
GROUP BY Region
ORDER BY Average_Tax_Rate DESC;

#Question 8:
#Identify the top 5 countries with the best savings-to-tax ratio.
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

#Question 9:
#Identify countries with low income but high cost of living
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

#Question 10:
#Find the year when each country had its highest savings percentage.

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





