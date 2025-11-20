CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');

--1. Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.
--Return: ProductID, TotalQuantity, TotalRevenue

SELECT 
      s.ProductID,
	  p.ProductName,
	  SUM( s.Quantity ) AS TotalQuantity,
	  SUM( s.Quantity * p.price ) AS TotalRevenue
	  INTO #MonthlySales
FROM Products p 
INNER JOIN Sales s ON p.ProductID = s.ProductID
WHERE YEAR( s.SaleDate ) = 2025
AND
MONTH( s.SaleDate ) = 4
GROUP BY s.ProductID,p.ProductName

SELECT * FROM #MonthlySales

--2. Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.
--Return: ProductID, ProductName, Category, TotalQuantitySold

GO
CREATE VIEW vw_ProductSalesSummary
AS
SELECT 
      s.ProductID,
	  p.ProductName,
	  p.Category,
	  SUM( s.Quantity ) AS TotalQuantitySold
FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY s.ProductID,p.ProductName,p.Category

SELECT * FROM vw_ProductSalesSummary

--3. Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
--Return: total revenue for the given product ID

GO
CREATE PROCEDURE fn_GetTotalRevenueForProduct
@ProductID INT
AS
BEGIN
SELECT 
      s.ProductID,
	  SUM( p.Price * s.Quantity ) AS TotalRevenue
FROM Products p 
RIGHT JOIN Sales s ON p.ProductID = s.ProductID
WHERE p.ProductID = @ProductID
GROUP BY s.ProductID
END;
       
EXEC fn_GetTotalRevenueForProduct @ProductID = n

--4. Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

CREATE OR ALTER PROCEDURE fn_GetSalesByCategory
@Category VARCHAR(50)
AS
BEGIN 
SELECT 
      p.ProductName,
	  p.Category,
	  SUM( s.Quantity ) AS TotalQuantity,
	  SUM( p.Price * s.Quantity ) AS TotalRevenue
FROM Products p 
INNER JOIN Sales s ON p.ProductID = s.ProductID
WHERE p.Category = @Category
GROUP BY p.ProductName,p.Category
END

EXEC fn_GetSalesByCategory @Category = 'Smth'

--5. You have to create a function that get one argument as input from user and the function should return 'Yes' if the input number is a prime number and 'No' otherwise. You can start it like this:

CREATE FUNCTION dbo.fn_IsPrime(@Number INT)
RETURNS NVARCHAR(50)
AS
BEGIN
DECLARE @Devisor INT = 2
WHILE @Devisor * @Devisor <= @Number
BEGIN
IF @Number % @Devisor = 0
RETURN 'No'
SET @Devisor = @Devisor + 1
END
RETURN 'Yes'
END
DECLARE @Number INT = 11
SELECT dbo.fn_IsPrime(11) AS NumberType

--6. Create a table-valued function named fn_GetNumbersBetween that accepts two integers as input:

GO
CREATE FUNCTION fn_GetNumbersBetween(@Start INT,@End INT)
RETURNS TABLE
AS
RETURN
(
WITH CTE_RESULT AS (
					SELECT @Start AS Number
					UNION ALL
					SELECT Number + 1
					FROM CTE_RESULT
					WHERE Number < @End )
					SELECT * FROM CTE_RESULT )

SELECT * FROM fn_GetNumbersBetween(7,17)

--7. Write a SQL query to return the Nth highest distinct salary from the Employee table. If there are fewer than N distinct salaries, return NULL.

CREATE TABLE Employees (id INT,Salary INT)
INSERT INTO Employees VALUES (1,100),(2,200),(3,300)

SELECT * FROM Employees

CREATE OR ALTER FUNCTION dbo.fn_GetSalaryByRank (@numb INT)
RETURNS TABLE 
AS 
RETURN 
(
WITH CTE AS (
SELECT 
*, 
DENSE_RANK () OVER (ORDER BY  Salary DESC)AS DenseRanking
FROM employees )


SELECT DISTINCT
  CASE 
    WHEN @numb IN (SELECT DenseRanking FROM CTE ) THEN Salary 
    ELSE NULL
  END Salary
FROM CTE
WHERE @numb = DenseRanking OR @numb > (SELECT DISTINCT  MAX(DenseRanking) FROM CTE))

SELECT * FROM dbo.fn_GetSalaryByRank (11);

--8. Write a SQL query to find the person who has the most friends.
--Return: Their id, The total number of friends they have

CREATE TABLE RequestAccepted (requester_id INT,accepter_id INT, accept_date DATE)
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date)
VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09');
 
 SELECT Person_id AS ID,COUNT( Friend_id ) AS FriendNumber
FROM (
	  SELECT requester_id AS Person_id,accepter_id AS Friend_id 
	  FROM RequestAccepted
      UNION ALL
	  SELECT accepter_id AS Person_id,requester_id AS Friend_id
	  FROM RequestAccepted ) AS All_Friends
	  GROUP BY Person_id
	  ORDER BY COUNT( Friend_id ) DESC
      OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

--9. Create a View for Customer Order Summary.
--Create a view called vw_CustomerOrderSummary that returns a summary of customer orders. The view must contain the following columns:

--Column Name | Description
--customer_id | Unique identifier of the customer
--name | Full name of the customer
--total_orders | Total number of orders placed by the customer
--total_amount | Cumulative amount spent across all orders
--last_order_date | Date of the most recent order placed by the customer

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);

GO
CREATE VIEW vw_CustomerOrderSummary
AS
SELECT 
	  c.Customer_ID,
	  c.Name,
	  COUNT( o.Order_ID ) AS Total_Orders,
	  SUM( o.Amount ) AS Total_Amount,
	  MAX( o.Order_Date ) AS Last_Order_Date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.Customer_ID,c.Name

SELECT * FROM vw_CustomerOrderSummary

--10. Write an SQL statement to fill in the missing gaps. You have to write only select statement, no need to modify the table.

DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)

SELECT * FROM Gaps

SELECT ISNULL( g1.TestCase,'Alpha' ),ISNULL( g2.TestCase,'Bravo' ),ISNULL( g3.TestCase,'Charlie' )
FROM Gaps g1
INNER JOIN Gaps g2 ON g1.RowNumber = g2.RowNumber 
INNER JOIN Gaps g3 ON g2.RowNumber = g3.RowNumber

SELECT * FROM Gaps
SELECT 
    RowNumber,
    ISNULL(TestCase, 
        (SELECT TOP 1 g2.TestCase 
         FROM Gaps g2
         WHERE g2.RowNumber < g1.RowNumber 
           AND g2.TestCase IS NOT NULL
         ORDER BY g2.RowNumber DESC)
    ) AS FilledTestCase
FROM Gaps g1
ORDER BY RowNumber;









    





					
					

















