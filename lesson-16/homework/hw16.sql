
CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);

--Easy Tasks

--1)Create a numbers table using a recursive query from 1 to 1000.

WITH CTE_RESULT AS (
					SELECT 1 AS Number 
					UNION ALL
					SELECT Number + 1
					FROM CTE_RESULT
					WHERE Number < 1000 )
					SELECT * FROM CTE_RESULT
					OPTION ( MAXRECURSION 0 )

--2)Write a query to find the total sales per employee using a derived table.(Sales, Employees)

SELECT 
      e.FirstName,
	  e.LastName,
	  e.DepartmentID,
	  (
	  SELECT SUM( SalesAmount )
	  FROM Sales s
	  WHERE e.EmployeeID = s.EmployeeID ) AS Result
	  FROM Employees e

--3)Create a CTE to find the average salary of employees.(Employees)

WITH CTE_RESULT AS (
                    SELECT AVG(Salary) AS Avg_Salary_Of_Employees
					FROM Employees )
					SELECT * FROM CTE_RESULT

--4)Write a query using a derived table to find the highest sales for each product.(Sales, Products)

SELECT 
	  p.CategoryID,
	  p.ProductName,
	  (
	  SELECT MAX( SalesAmount )
	  FROM Sales s
	  WHERE p.ProductID = s.ProductID ) AS Result
	  FROM Products p

--5)Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.

WITH CTE_RESULT AS (
					SELECT 1 AS Number
					UNION ALL
					SELECT Number * 2
					FROM CTE_RESULT
					WHERE Number * 2 < 1000000 )
					SELECT * FROM CTE_RESULT

--6)Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)

WITH CTE_RESULT AS (
					SELECT EmployeeID,COUNT(*) AS EmployeeSales
					FROM Sales
					GROUP BY EmployeeID )
					SELECT 
						  e.FirstName,
						  e.LastName,
						  c.EmployeeSales
					FROM CTE_RESULT c
					INNER JOIN Employees e ON c.EmployeeID = e.EmployeeID


--7)Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)

WITH CTE_RESULT AS (
					SELECT 
					      p.ProductID,
						  p.ProductName,
						  SUM( s.SalesAmount ) AS TotalSales
				    FROM Products p
					INNER JOIN Sales s ON p.ProductID = s.ProductID
					GROUP BY  p.ProductID,p.ProductName )
					SELECT * FROM CTE_RESULT
					WHERE TotalSales > 500

--8)Create a CTE to find employees with salaries above the average salary.(Employees)

WITH CTE_RESULT AS (
                    SELECT * FROM Employees e1
					WHERE Salary > ( SELECT AVG(Salary) FROM Employees e2 ))
					SELECT * FROM CTE_RESULT

--Medium Tasks

--1)Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)

SELECT TOP 5 e.FirstName,e.LastName,COUNT( s.SalesID ) AS TotalSales
FROM Employees e
INNER JOIN Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY e.FirstName,e.LastName
ORDER BY TotalSales DESC


--2)Write a query using a derived table to find the sales per product category.(Sales, Products)

SELECT 
SUM(B.ProductSales) AS ProductSales,
A.CategoryID
FROM Products AS A 
JOIN 
(SELECT
  ProductID,
  SUM(SalesAmount) as ProductSales
  FROM Sales
  GROUP BY ProductID) AS B
ON A.ProductID = B.ProductID
GROUP BY A.CategoryID


--3)Write a script to return the factorial of each value next to it.(Numbers1)

DECLARE @MAXFACT INT = ( SELECT MAX(Number) FROM Numbers1 );

WITH CTE_RESULT AS (
                    SELECT 0 AS Number, 1 AS Fact
					UNION ALL
					SELECT Number + 1,Fact * (Number + 1)
					FROM CTE_RESULT
					WHERE Number < @MAXFACT )
					

SELECT 
		n.Number,
		c.Fact
		FROM Numbers1 n
		INNER JOIN CTE_RESULT c ON n.Number = c.Number
		ORDER BY n.Number


                    
--4)This script uses recursion to split a string into rows of substrings for each character in the string.(Example)

WITH CTE_RESULT AS (
    SELECT ID,
           1 AS Position,
           SUBSTRING(String,1,1) AS Result,
           String  
    FROM Example

    UNION ALL

    SELECT c.ID,
           c.Position + 1,
           SUBSTRING(c.String, c.Position + 1, 1),
           c.String  
    FROM CTE_RESULT c
    WHERE c.Position < LEN(c.String)
)
SELECT ID, Position, Result
FROM CTE_RESULT
ORDER BY ID, Position
OPTION (MAXRECURSION 0);

--5)Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)

WITH CTE_RESULT AS (
					SELECT 
						  YEAR( SaleDate ) AS SalesYear,
						  MONTH( SaleDate ) AS SalesMonth,
						  SUM ( SalesAmount ) AS TotalSales
						  FROM Sales
						  GROUP BY YEAR( SaleDate ),MONTH( SaleDate ) )
				    SELECT 
						  SalesYear,
						  SalesMonth,
						  TotalSales,
						  LAG( TotalSales )  OVER ( ORDER BY SalesYear,SalesMonth ) AS PreviousSales,
						  TotalSales - LAG( TotalSales ) OVER ( ORDER BY SalesYear,SalesMonth ) AS SalesDifference
						  FROM CTE_RESULT

--6)Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)

SELECT 
    A.EmployeeID,
    B.Date,
    SUM(B.ProductSales) AS ProductSales
FROM Employees AS A
JOIN (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS Date,
        SUM(SalesAmount) AS ProductSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
) AS B
    ON A.EmployeeID = B.EmployeeID
GROUP BY A.EmployeeID, B.Date
HAVING SUM(B.ProductSales) > 45000;

--Difficult Tasks

--1)This script uses recursion to calculate Fibonacci numbers

WITH Fibonacci_Numbers AS (
						   SELECT 1 AS Number, 0 AS a , 1 AS b
						   UNION ALL
						   SELECT Number + 1,b,a+b
						   FROM Fibonacci_Numbers 
						   WHERE Number < 46 )
						   SELECT Number, a AS Fibonacci_Numbers FROM Fibonacci_Numbers
						   OPTION  ( MAXRECURSION 0 )

--2)Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)

SELECT * FROM FindSameCharacters
WHERE LEN(Vals) > 1
AND Vals = REPLICATE( LEFT(Vals,1),LEN(Vals))

--3)Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.(Example:n=5 | 1, 12, 123, 1234, 12345)

WITH CTE_RESULT AS (
					SELECT 1 AS Number,1 AS Value
					UNION ALL
					SELECT Number + 1,Value * 10 + (Number + 1)
					FROM CTE_RESULT
					WHERE Number < 5 )
					SELECT * FROM CTE_RESULT

--4)Write a query using a derived table to find the employees who have made the most sales in the last 6 months.(Employees,Sales)

SELECT 
      e.EmployeeID,
      e.FirstName,
	  e.LastName,
	  s.TotalSales
FROM Employees e
INNER JOIN (
            SELECT
			      EmployeeID,
				  SUM( SalesAmount ) AS TotalSales
            FROM Sales
			WHERE SaleDate >= DATEADD(MONTH,-6,GETDATE())
			GROUP BY EmployeeID ) AS s
		    ON e.EmployeeID = s.EmployeeID
			ORDER BY s.TotalSales DESC

--5)Write a T-SQL query to remove the duplicate integer values present in the string column. Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)

SELECT * FROM RemoveDuplicateIntsFromNames

;WITH Digits AS (
    SELECT 
        Pawan_slug_name,
        1 AS Position,
        SUBSTRING(Pawan_slug_name, 1, 1) AS Char
    FROM RemoveDuplicateIntsFromNames

    UNION ALL

    SELECT 
        Pawan_slug_name,
        Position + 1,
        SUBSTRING(Pawan_slug_name, Position + 1, 1)
    FROM Digits
    WHERE Position + 1 <= LEN(Pawan_slug_name)
),
Filtered AS (
    SELECT 
        Pawan_slug_name,
        Position,
        Char,
        ROW_NUMBER() OVER (PARTITION BY Pawan_slug_name, Char ORDER BY Position) AS rn
    FROM Digits
)
SELECT 
    Pawan_slug_name,
    STRING_AGG(Char, '') WITHIN GROUP (ORDER BY Position) AS CleanedString
FROM Filtered
WHERE rn = 1   
  AND NOT (Char LIKE '[0-9]' AND LEN(Char) = 1 
           AND NOT EXISTS (SELECT 1 FROM Filtered f2 
                           WHERE f2.Pawan_slug_name = Filtered.Pawan_slug_name 
                           AND f2.Char LIKE '[0-9][0-9]%')) 
GROUP BY Pawan_slug_name
OPTION (MAXRECURSION 0);













					      
















					






























					

						  






































