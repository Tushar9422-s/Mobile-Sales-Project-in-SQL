create database project;
use project;
select * from mobiles;
-- Select all data:



SELECT * FROM mobiles;
-- 1.Find the total profit for each brand:


SELECT Brand, SUM(Profit) AS TotalProfit
FROM mobiles
GROUP BY Brand;
-- 2.Find all sales made by a specific salesperson:

SELECT *
FROM mobiles
WHERE SalespersonName = 'Timothy Montgomery';
-- 3.Count the number of sales per country:

SELECT Country, COUNT(*) AS SalesCount
FROM mobiles
GROUP BY Country;
-- 4.Find the average age of customers for each payment method:
SELECT PaymentMethod, AVG(Age) AS AverageAge
FROM mobiles
GROUP BY PaymentMethod;
-- Get the highest-priced mobile sold:

SELECT *
FROM mobiles
WHERE Price = (SELECT MAX(Price) FROM mobiles);
-- 5.List all sales in a specific city:

SELECT *
FROM mobiles
WHERE City = 'Kennethville';
-- 6.ind the top 5 most profitable transactions:

SELECT *
FROM mobiles
ORDER BY Profit DESC
LIMIT 5;
-- 7.Count the number of transactions per gender:

SELECT Gender, COUNT(*) AS TransactionCount
FROM mobiles
GROUP BY Gender;
-- 8.Find the total sales amount by store location:

SELECT StoreLocation, SUM(Price) AS TotalSales
FROM mobiles
GROUP BY StoreLocation;
-- 7.9et all customers who made purchases with a specific payment method:

SELECT CustomerName, PaymentMethod
FROM mobiles
WHERE PaymentMethod = 'Credit Card';
-- 10.Calculate profit percentage for each transaction:

SELECT TransactionID, (Profit / Price) * 100 AS ProfitPercentage
FROM mobiles;
-- 11.Find the number of sales for each brand by country:

SELECT Country, Brand, COUNT(*) AS SalesCount
FROM mobiles
GROUP BY Country, Brand;
-- 12.Filter transactions based on date:

SELECT *
FROM mobiles
WHERE DateOfSale BETWEEN '2024-01-01' AND '2024-12-31';
-- 13.List all models sold in a specific store location:

SELECT DISTINCT Model
FROM mobiles
WHERE StoreLocation = 'South Kevinfort, OH';

--  14.Find the top 3 most profitable brands across all countries:

SELECT Brand, Country, SUM(Profit) AS TotalProfit
FROM mobiles
GROUP BY Brand, Country
ORDER BY TotalProfit DESC LIMIT 3;


-- 15.FROM mobiles. Find the top 3 most profitable brands across all countries:

select Brand, Country, SUM(Profit) AS TotalProfit
FROM mobiles
GROUP BY Brand, Country
ORDER BY TotalProfit DESC
LIMIT 3;    






-- 16.Find the profit contribution percentage of each brand:

SELECT Brand, 
       SUM(Profit) AS BrandProfit,
       (SUM(Profit) * 100.0) / (SELECT SUM(Profit) FROM mobiles) AS ProfitPercentage
FROM mobiles
GROUP BY Brand;

-- 17.Identify customers who bought more than one mobile:

SELECT CustomerID, CustomerName, COUNT(*) AS TotalPurchases
FROM mobiles
GROUP BY CustomerID, CustomerName
HAVING COUNT(*) > 1;


-- 18. Get the transaction details where the profit margin exceeds 50%:

SELECT  (Profit / Price) * 100 AS ProfitMargin
FROM mobiles
WHERE (Profit / Price) * 100 > 10;
-- 19.Find duplicate transactions by the same customer on the same date:

SELECT CustomerID, CustomerName, DateOfSale, COUNT(*) AS TransactionCount
FROM mobiles
GROUP BY CustomerID, CustomerName, DateOfSale
HAVING COUNT(*) > 1;


-- 20. Get total sales and profit for each salesperson:

SELECT SalespersonName, SUM(Price) AS TotalSales, SUM(Profit) AS TotalProfit
FROM mobiles
GROUP BY SalespersonName;
-- 21. Find the number of transactions for each brand by gender:

SELECT Brand, Gender, COUNT(*) AS TransactionCount
FROM mobiles
GROUP BY Brand, Gender;
-- 22. Calculate the average profit and price for each city:

SELECT City, AVG(Profit) AS AverageProfit, AVG(Price) AS AveragePrice
FROM mobiles
GROUP BY City;
-- 23. List all customers who spent more than $1,000 in total:

SELECT CustomerID, CustomerName, SUM(Price) AS TotalSpent
FROM mobiles
GROUP BY CustomerID, CustomerName
HAVING SUM(Price) > 1000;
-- 24. Find the most common payment method for each brand:

SELECT Brand, PaymentMethod, COUNT(*) AS UsageCount
FROM mobiles
GROUP BY Brand, PaymentMethod
ORDER BY Brand, UsageCount DESC;
-- 25. Get all transactions where the profit margin is greater than 20%:

SELECT *, (Profit / Price) * 100 AS ProfitMargin
FROM mobiles
WHERE (Profit / Price) * 100 > 20;
-- 26. Identify the top-selling models in each store location:

SELECT StoreLocation, Model, COUNT(*) AS SalesCount
FROM mobiles
GROUP BY StoreLocation, Model
ORDER BY StoreLocation, SalesCount DESC;
-- 27. Count the number of distinct mobile models sold in each country:

SELECT Country, COUNT(DISTINCT Model) AS UniqueModelsSold
FROM mobiles
GROUP BY Country;
-- 28. Get the total number of transactions for each age group:

SELECT 
    CASE
        WHEN Age < 20 THEN 'Below 20'
        WHEN Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Age BETWEEN 31 AND 50 THEN '31-50'
        ELSE 'Above 50'
    END AS AgeGroup,
    COUNT(*) AS TransactionCount
FROM mobiles
GROUP BY AgeGroup;
-- 29. Find the highest profit for each combination of brand and payment method:

SELECT Brand, PaymentMethod, MAX(Profit) AS MaxProfit
FROM mobiles
GROUP BY Brand, PaymentMethod;
-- 30. List all store locations with total profit above $10,000:

SELECT StoreLocation, SUM(Profit) AS TotalProfit
FROM mobiles
GROUP BY StoreLocation
HAVING SUM(Profit) > 10000;
