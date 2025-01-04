# Mobile-Sales-Project-in-SQL

Mobile Sales Project in SQL: Project Report
Introduction The Mobile Sales Project in SQL is a database management solution designed to track mobile phone sales, manage inventory, and monitor customer and financial data. The project utilizes SQL to efficiently handle data, providing insights into sales trends, customer preferences, and revenue generation. This report outlines the database structure, functionalities, and key queries implemented.

Features and Functionalities
Sales Management:
Tracks mobile sales, including product details, quantities sold, and revenue generated.
Customer Management:
Maintains customer information for tracking purchase history and preferences.
Inventory Management:
Monitors stock levels for different mobile models and provides alerts for low inventory.
Revenue and Profit Analysis:
Analyzes revenue, profit margins, and sales performance over time.

Key Tables
Mobiles:
Stores details about mobile models, prices, and stock levels.
Customers:
Maintains customer details like name, contact information, and address.
Sales:
Tracks sales transactions, linking customers to purchased mobile models.
Payments:
Logs payment information, including payment methods and amounts.

Key SQL Queries
Retrieve All Available Mobiles:
SELECT * FROM Mobiles WHERE Stock > 0;
Find Total Sales Revenue:
SELECT SUM(SaleAmount) AS TotalRevenue FROM Sales;
List Customers Who Purchased More Than Once:
SELECT CustomerID, COUNT(*) AS PurchaseCount
FROM Sales
GROUP BY CustomerID
HAVING COUNT(*) > 1;
Retrieve Sales Details With Customer and Mobile Information:
SELECT Sales.SaleID, Customers.CustomerName, Mobiles.MobileModel, Sales.Quantity, Sales.SaleAmount
FROM Sales
INNER JOIN Customers ON Sales.CustomerID = Customers.CustomerID
INNER JOIN Mobiles ON Sales.MobileID = Mobiles.MobileID;
Find Low-Stock Mobiles:
SELECT MobileModel, Stock FROM Mobiles WHERE Stock < 10;

Benefits of the System
Streamlined Sales Tracking:
Provides a centralized platform for managing sales data.
Enhanced Inventory Management:
Ensures stock levels are adequately maintained.
Customer Insights:
Enables analysis of customer behavior and preferences.
Revenue Analysis:
Tracks financial performance with detailed revenue and profit reports.

Conclusion The Mobile Sales Project in SQL showcases the power of database systems in managing retail operations. With functionalities for sales tracking, inventory management, and financial analysis, the system provides valuable insights for business decision-making. Future enhancements could include predictive analytics for demand forecasting and integration with e-commerce platforms.
