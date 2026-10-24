use kerala;
#Display all customers
SELECT * FROM Customers;

#Display customers from Kerala
SELECT * FROM Customers
WHERE State = 'Kerala';

#Display all products from Electronics category
SELECT *FROM Products
WHERE Category = 'Electronics';

# Display products with price greater than 1000
SELECT *FROM Products
WHERE Price > 1000;

#Display all completed orders
SELECT *FROM Orders
WHERE Order_Status = 'Completed';

#Sort products by price in ascending order
SELECT *FROM Products
ORDER BY Price ASC;

#Display the 5 most expensive products
SELECT *FROM Products
ORDER BY Price DESC
LIMIT 5;

 #Find the total number of customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;

# Find the total number of orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;

# Find the average product price
SELECT AVG(Price) AS Average_Price
FROM Products;

# Find the highest product price
SELECT MAX(Price) AS Highest_Price
FROM Products;

# Find the lowest product price
SELECT MIN(Price) AS Lowest_Price
FROM Products;

#Find the total quantity sold for each product
SELECT Product_ID,
       SUM(Quantity) AS Total_Quantity_Sold
FROM Order_Details
GROUP BY Product_ID;

#Find the number of customers in each state
SELECT State,
       COUNT(*) AS Customer_Count
FROM Customers
GROUP BY State;

# Find the number of products in each category
SELECT Category,
       COUNT(*) AS Product_Count
FROM Products
GROUP BY Category;

# Find the number of orders for each payment mode
SELECT Payment_Mode,
       COUNT(*) AS Order_Count
FROM Orders
GROUP BY Payment_Mode;

# Display categories having more than 3 products
SELECT Category,
       COUNT(*) AS Product_Count
FROM Products
GROUP BY Category
HAVING COUNT(*) > 3;

#Display customer name and order date
SELECT c.Customer_Name,
       o.Order_Date
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

# Display product name and quantity
SELECT p.Product_Name,
       od.Quantity
FROM Products p
JOIN Order_Details od
ON p.Product_ID = od.Product_ID;

# Display customer name, product name and quantity
SELECT c.Customer_Name,
       p.Product_Name,
       od.Quantity
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
ON o.Order_ID = od.Order_ID
JOIN Products p
ON od.Product_ID = p.Product_ID;

# Display Order ID, Customer Name and Order Status
SELECT o.Order_ID,
       c.Customer_Name,
       o.Order_Status
FROM Orders o
JOIN Customers c
ON o.Customer_ID = c.Customer_ID;

#Display product name, price and price category
SELECT Product_Name,
       Price,
       CASE
           WHEN Price >= 10000 THEN 'High'
           WHEN Price >= 5000 THEN 'Medium'
           ELSE 'Low'
       END AS Price_Category
FROM Products;

#Display customer name, age and age category
SELECT Customer_Name,
       Age,
       CASE
           WHEN Age < 18 THEN 'Young'
           WHEN Age < 60 THEN 'Adult'
           ELSE 'Senior'
       END AS Age_Category
FROM Customers;

#Display customer name, age and age category
SELECT Customer_Name,
       Age,
       CASE
           WHEN Age < 18 THEN 'Young'
           WHEN Age < 60 THEN 'Adult'
           ELSE 'Senior'
       END AS Age_Category
FROM Customers;

#Display products whose price is greater than the average product price
SELECT *
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);

# Display the product with the highest price
SELECT *
FROM Products
WHERE Price = (
    SELECT MAX(Price)
    FROM Products
);
----
#Increase the price of Electronics products by 10%
UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Electronics';

#Change the status of Order ID 5 to Completed
UPDATE Orders
SET Order_Status = 'Completed'
WHERE Order_ID = 5;

# Add an Email column to Customers table
ALTER TABLE Customers
ADD Email VARCHAR(100);

select * from customers;

# Modify the Customer_Name column
ALTER TABLE Customers
MODIFY Customer_Name VARCHAR(100);

# Delete cancelled orders
DELETE FROM Orders
WHERE Order_Status = 'Cancelled';

#Which product has the highest quantity sold?
SELECT p.Product_Name,
       SUM(od.Quantity) AS Total_Quantity_Sold
FROM Products p
JOIN Order_Details od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Total_Quantity_Sold DESC
LIMIT 1;

# Which category has the most products?
SELECT Category,
       COUNT(*) AS Product_Count
FROM Products
GROUP BY Category
ORDER BY Product_Count DESC
LIMIT 1;

# Which payment mode is used most frequently?
SELECT Payment_Mode,
       COUNT(*) AS Usage_Count
FROM Orders
GROUP BY Payment_Mode
ORDER BY Usage_Count DESC
LIMIT 1;

# Which state has the highest number of customers?
SELECT State,
       COUNT(*) AS Customer_Count
FROM Customers
GROUP BY State
ORDER BY Customer_Count DESC
LIMIT 1;

# Display products whose total quantity sold is less than 10
SELECT p.Product_Name,
       SUM(od.Quantity) AS Total_Quantity_Sold
FROM Products p
JOIN Order_Details od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_ID, p.Product_Name
HAVING SUM(od.Quantity) < 10;