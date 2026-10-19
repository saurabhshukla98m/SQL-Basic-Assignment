-- =====================================================
-- PROJECT       : RetailDB_1
-- PROJECT TITLE : Customer, Product & Order Analysis
-- TOPIC         : SQL Basic Queries
-- CREATED BY    : Saurabh Shukla
-- EMAIL         : saurabhshukla98m@gmail.com
-- TOOL          : MySQL Workbench
-- DATABASE      : RetailDB_1
-- =====================================================

-- =====================================================
-- STEP 1: CREATE DATABASE
-- =====================================================

CREATE DATABASE IF NOT EXISTS RetailDB_1;
 -- Select the database
 USE RetailDB_1;
 
 -- =====================================================
 -- STEP 2: CREATE CUSTOMERS TABLE
 -- =====================================================
 
CREATE TABLE IF NOT EXISTS Customers ( 
customer_id INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(100), 
email VARCHAR(150) UNIQUE, 
city VARCHAR(50), 
signup_date DATE 
);

-- =====================================================
-- STEP 3: CREATE PRODUCTS TABLEIF NOT EXISTS
-- =====================================================

 CREATE TABLE IF NOT EXISTS Products ( 
product_id INT AUTO_INCREMENT PRIMARY KEY, 
product_name VARCHAR(100), 
category VARCHAR(50), 
price DECIMAL(10,2) 
); 

-- =====================================================
-- STEP 4: CREATE ORDERS TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS Orders ( 
order_id INT AUTO_INCREMENT PRIMARY KEY, 
customer_id INT, 
product_id INT, 
order_date DATE, 
quantity INT, 
total_amount DECIMAL(10,2), 
payment_mode VARCHAR(50), 
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id), 
FOREIGN KEY (product_id) REFERENCES Products(product_id) 
); 


-- =====================================================
-- STEP 5: LOAD DATA INTO TABLES
-- =====================================================

-- Importing Customers data from CSV file using MySQL Workbench
-- Importing Products data from CSV file using MySQL Workbench
-- Importing Orders data from CSV file using MySQL Workbench


-- =====================================================
-- STEP 6: VERIFY IMPORTED DATA
-- =====================================================

SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;

-- =====================================================
-- STEP 7: SQL ASSIGNMENT QUERIES
-- =====================================================

-- Q1. Fetch all customers from the database
SELECT * FROM customers;

-- 2. Only customer names and cities
SELECT NAME, city FROM customers;

-- 3. Customers who live in Mumbai
SELECT * FROM customers WHERE city = 'Mumbai';

-- 4. Orders placed after 1st August 2024
SELECT * FROM orders
WHERE order_date > '2024-08-01';

-- 5. Products priced greater than 5000
SELECT * FROM Products
WHERE price > 5000;

-- 6. Count of custommers
SELECT COUNT(*) AS total_customers FROM Customers;

-- 7. Update Rohit Kumar's city to Hyderabad
UPDATE Customers
SET city = 'Hyderabad'
WHERE name = 'Rohit Kumar';

-- 8. Delete order with ID = 5
DELETE FROM Orders
WHERE order_id = 5;

-- 9. Product names with original price and 10% increased price
SELECT product_name,
       price AS original_price,
       price * 1.10 AS increased_price
FROM Products;

-- 10. Unique cities
SELECT DISTINCT city FROM Customers;

-- 11. First 3 customers who signed up
SELECT * FROM Customers
ORDER BY signup_date ASC
LIMIT 3;

-- 12. Skip first 2 customers, fetch next 3
SELECT * FROM Customers
ORDER BY signup_date ASC
LIMIT 3 OFFSET 2;

-- 13. Products priced between 2000 and 6000
SELECT * FROM Products
WHERE price BETWEEN 2000 AND 6000;

-- 14. Customers from Mumbai OR Chennai
SELECT * FROM Customers
WHERE city = 'Mumbai' OR city = 'Chennai';

-- 15. Customers NOT from Delhi
SELECT * FROM Customers
WHERE city <> 'Delhi';

-- 16. Orders NOT paid by UPI
SELECT * FROM Orders
WHERE payment_mode <> 'UPI';

-- 17. Average order amount
SELECT AVG(total_amount) AS avg_order_amount FROM Orders;

-- 18. Highest order amount
SELECT MAX(total_amount) AS highest_order_amount FROM Orders;

-- 19. Lowest product price
SELECT MIN(price) AS lowest_price FROM Products;

-- 20. Total money spent across all orders
SELECT SUM(total_amount) AS total_spent FROM Orders;

-- =====================================================
-- STEP 8: PROJECT CONCLUSION
-- =====================================================

/*
CONCLUSION:

This project demonstrates the use of basic SQL queries
to manage and analyze customer, product, and order data.

Key concepts covered:
1. Database and table creation.
2. Retrieving data using SELECT.
3. Filtering data using WHERE.
4. Sorting and limiting records.
5. Aggregate functions such as COUNT, AVG, MAX, MIN, SUM.
6. Updating customer information.
7. Deleting specific order records.
8. Calculating increased product prices.
9. Identifying unique cities and filtering payment modes.

LEARNING OUTCOME:

This project helped me understand basic SQL operations,
data retrieval, filtering, sorting, and aggregation using
MySQL Workbench.

=========================================================
END OF PROJECT
=========================================================
*/




