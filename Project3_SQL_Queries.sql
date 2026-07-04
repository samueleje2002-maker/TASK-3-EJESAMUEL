/*
===========================================
Project 3: SQL Data Analysis
Dataset: Ecommerce Orders
Database: ecommerce
Table: orders

Author: Eje Samuel
===========================================
*/


-- Part 1: Basic SELECT Queries

-- 1. Display all records
SELECT *
FROM orders;

### 2. Display only selected columns
SELECT OrderID, Product, Quantity, TotalPrice
FROM orders;

### 3. Display unique products
SELECT DISTINCT Product
FROM orders;

## Part 2: WHERE Clause

### 4. Orders with Quantity greater than 3
SELECT *
FROM orders
WHERE Quantity > 3;

### 5. Orders paid by Credit Card
SELECT *
FROM orders
WHERE PaymentMethod = 'Credit Card';

### 6. Delivered Orders
SELECT *
FROM orders
WHERE OrderStatus = 'Delivered';

### 7. Orders with TotalPrice greater than 500
SELECT *
FROM orders
WHERE TotalPrice > 500;
## Part 3: ORDER BY

### 8. Highest Total Price
SELECT *
FROM orders
ORDER BY TotalPrice DESC;

### 9. Lowest Total Price
SELECT *
FROM orders
ORDER BY TotalPrice ASC;

### 10. Products sorted alphabetically
SELECT Product
FROM orders
ORDER BY Product;

## Part 4: COUNT()

### 11. Total number of orders

SELECT COUNT(*) AS TotalOrders
FROM orders;

### 12. Number of customers

SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM orders;

## Part 5: SUM()

### 13. Total Revenue

SELECT SUM(TotalPrice) AS TotalRevenue
FROM orders;

### 14. Total Quantity Sold

SELECT SUM(Quantity) AS TotalQuantitySold
FROM orders;

## Part 6: AVG()

### 15. Average Unit Price

SELECT AVG(UnitPrice) AS AverageUnitPrice
FROM orders;

### 16. Average Total Price

SELECT AVG(TotalPrice) AS AverageOrderValue
FROM orders;

## Part 7: GROUP BY

### 17. Orders by Payment Method

SELECT PaymentMethod,
       COUNT(*) AS NumberOfOrders
FROM orders
GROUP BY PaymentMethod;

### 18. Total Sales by Product

SELECT Product,
       SUM(TotalPrice) AS Sales
FROM orders
GROUP BY Product
ORDER BY Sales DESC;

### 19. Average Price by Product

SELECT Product,
       AVG(UnitPrice) AS AveragePrice
FROM orders
GROUP BY Product;

### 20. Orders by Status

SELECT OrderStatus,
       COUNT(*) AS Orders
FROM orders
GROUP BY OrderStatus;

### 21. Total Quantity by Product

SELECT Product,
       SUM(Quantity) AS TotalQuantity
FROM orders
GROUP BY Product
ORDER BY TotalQuantity DESC;

## Part 8: Combining WHERE + GROUP BY

### 22. Revenue from Delivered Orders

SELECT SUM(TotalPrice) AS DeliveredRevenue
FROM orders
WHERE OrderStatus = 'Delivered';

### 23. Credit Card Orders

SELECT PaymentMethod,
       COUNT(*) AS Orders
FROM orders
WHERE PaymentMethod = 'Credit Card'
GROUP BY PaymentMethod;

### 24. Products with Revenue above 1000

SELECT Product,
       SUM(TotalPrice) AS Revenue
FROM orders
GROUP BY Product
HAVING SUM(TotalPrice) > 1000;

## Part 9: Business Insights

### 25. Top 5 Most Expensive Orders

SELECT OrderID,
       Product,
       TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 5;

### 26. Top 5 Cheapest Orders

SELECT OrderID,
       Product,
       TotalPrice
FROM orders
ORDER BY TotalPrice ASC
LIMIT 5;

### 27. Customers Who Bought More Than One Item

SELECT CustomerID,
       SUM(Quantity) AS TotalItems
FROM orders
GROUP BY CustomerID
ORDER BY TotalItems DESC;

### 28. Referral Source Performance

SELECT ReferralSource,
       COUNT(*) AS Orders,
       SUM(TotalPrice) AS Revenue
FROM orders
GROUP BY ReferralSource
ORDER BY Revenue DESC;

### 29. Coupon Usage

SELECT CouponCode,
       COUNT(*) AS TimesUsed
FROM orders
GROUP BY CouponCode;

### 30. Average Cart Size

SELECT AVG(ItemsInCart) AS AverageCartSize
FROM orders;

-- 31.Calculate Revenue by Product
SELECT Product,
       SUM(TotalPrice) AS Total_Revenue
FROM orders
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- 32.Calculate Total Revenue
SELECT SUM(TotalPrice) AS Total_Revenue
FROM orders;

-- 33.Count Total Orders
SELECT COUNT(*) AS Total_Orders
FROM orders;

-- 34.Count Orders by Payment Method
SELECT PaymentMethod,
       COUNT(*) AS Number_of_Orders
       FROM orders
       GROUP BY PaymentMethod
       ORDER BY Number_of_Orders DESC;