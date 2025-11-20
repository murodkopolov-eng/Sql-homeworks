--1. You must provide a report of all distributors and their sales by region. 
--If a distributor did not have any sales for a region, rovide a zero-dollar value for that day. 
--Assume there is at least one sale for each region

DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

WITH CTE_RESULT1 AS (
					SELECT DISTINCT Region FROM #RegionSales ),
CTE_RESULT2 AS (
				SELECT DISTINCT Distributor FROM #RegionSales )
SELECT 
	  A.Region,
	  B.Distributor,
	  ISNULL( C.Sales,0 )
FROM CTE_RESULT1 AS A
CROSS JOIN CTE_RESULT2 AS B
LEFT JOIN #RegionSales AS C 
ON C.Distributor = B.Distributor AND C.Region = A.Region


--2. Find managers with at least five direct reports

CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

SELECT e2.name
FROM Employee e1
LEFT JOIN Employee e2 ON e1.managerId = e2.id
GROUP BY e2.name
HAVING COUNT(e1.id) >= 5

--3. Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount

CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

WITH CTE_RESULT AS (
					SELECT 
					      o.product_id,
						  p.product_name,
						  SUM(o.unit) AS TotalUnit
				    FROM Products p
					INNER JOIN Orders o ON p.product_id = o.product_id
					WHERE YEAR(o.order_date)=2020 AND MONTH(o.order_date)=2
					GROUP BY o.product_id,p.product_name
					HAVING SUM(o.unit) >= 100 )
					SELECT * FROM CTE_RESULT

--4. Write an SQL statement that returns the vendor from which each customer has placed the most orders

WITH VendorOrders AS (
                      SELECT 
					        CustomerID,
							Vendor,
							COUNT( OrderID ) AS OrderCount
							FROM Orders 
							GROUP BY CustomerID,Vendor ),
MaxOrders AS (
              SELECT 
			        CustomerID,
					MAX( OrderCount ) AS MaxCount
					FROM VendorOrders
					GROUP BY CustomerID )
SELECT 
	  v.CustomerID,
	  v.Vendor
FROM VendorOrders v
INNER JOIN MaxOrders m ON
                         v.CustomerID = m.CustomerID
						             AND
						 v.OrderCount = m.MaxCount

--5. You will be given a number as a variable called @Check_Prime check if this number is prime then return 'This number is prime' else eturn 'This number is not prime'
DECLARE @Check_Prime INT = 91

CREATE FUNCTION dbo.PrimeNumber (@Check_Prime INT)
RETURNS NVARCHAR(50)
AS 
BEGIN

IF @Check_Prime < 2
RETURN 'This number is not prime'

IF @Check_Prime = 2
RETURN 'This number is prime'

IF @Check_Prime % 2 = 0
RETURN 'This number is not prime'

DECLARE @Devisor INT = 3
WHILE @Devisor * @Devisor <= @Check_Prime
BEGIN
IF @Check_Prime % @Devisor = 0
RETURN 'This number is not prime'
SET @Devisor = @Devisor + 2
END
RETURN 'This number is prime'
END

DECLARE @Check_Prime INT = 91
SELECT dbo.PrimeNumber(@Check_Prime) AS NumberType

--6. Write an SQL query to return the number of locations,in which location most signals sent, and total number of signal for each device from the given table.

CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');


WITH CTE_RESULT AS (
                    SELECT 
						  Device_id,
						  Locations,
						  COUNT( * ) AS Signal_Count
					 FROM Device
					 GROUP BY 
					         Device_id,
							 Locations ),
Topping AS (
            SELECT
			      Device_id,
				  COUNT( Locations ) AS No_Of_Locations,
				  SUM( Signal_Count ) AS No_Of_Signals,
		   (
		   SELECT TOP 1 Locations FROM CTE_RESULT AS A
		   WHERE A.Device_id = B.Device_id
		   ORDER BY Signal_Count DESC ) AS Max_Signal_Location
		   FROM CTE_RESULT AS B
		   GROUP BY Device_id )
SELECT * FROM Topping

SELECT * FROM Device


--7. Write a SQL to find all Employees who earn more than the average salary in their corresponding department. Return EmpID, EmpName,Salary in your output

CREATE TABLE Employee (   
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);


SELECT 
	  DISTINCT A.EmpName,
	  A.EmpID,
	  A.DeptID,
	  A.Salary
FROM Employee A
CROSS JOIN (
            SELECT B.DeptID,AVG(B.Salary) AS AvgSalary FROM Employee AS B
			GROUP BY B.DeptID ) AS B
WHERE A.DeptID <> B.DeptID
AND A.Salary > B.AvgSalary

--8. You are part of an office lottery pool where you keep a table of the winning lottery numbers along with a table of each ticket’s chosen numbers. 
--If a ticket has some but not all the winning numbers, you win $10. 
--If a ticket has all the winning numbers, you win $100. Calculate the total winnings for today’s drawing.

CREATE TABLE Numbers (
    Number INT
);

INSERT INTO Numbers (Number)
VALUES
(25),
(45),
(78);

CREATE TABLE Tickets (
    TicketID VARCHAR(10),
    Number INT
);

INSERT INTO Tickets (TicketID, Number)
VALUES
('A23423', 25),
('A23423', 45),
('A23423', 78),
('B35643', 25),
('B35643', 45),
('B35643', 98),
('C98787', 67),
('C98787', 86),
('C98787', 91);

WITH CTE_RESULT AS (
					SELECT 
					      t.TicketID,
						  COUNT( t.Number ) AS MatchingCount,
						  ( SELECT COUNT( * ) FROM Numbers ) AS TotalWinningNumbers
					FROM Tickets T
					INNER JOIN Numbers n ON t.Number = n.Number
					GROUP BY t.TicketID ),
WinningsPerTicket AS (
                     SELECT 
					       TicketID,
						            CASE
									    WHEN MatchingCount = TotalWinningNumbers THEN 100
										WHEN MatchingCount >= 1 AND MatchingCount < TotalWinningNumbers THEN 10
					 ELSE 0 
					 END AS Winnings
					 FROM CTE_RESULT )

SELECT 
    SUM(Winnings) AS TotalWinningsForDrawing
FROM 
    WinningsPerTicket;

--9.Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date.

CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

SELECT * FROM Spending




--10. Write an SQL Statement to de-group the following data.

DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);

WITH CTE_RESULT AS (
					SELECT 
					Product,
					1 AS Number,
					Quantity
					FROM Grouped
					UNION ALL
					SELECT 
					Product,
					Number + 1,
					Quantity
					FROM CTE_RESULT
					WHERE 
					Number <= Quantity )
					SELECT Product, 1 AS Quantity FROM CTE_RESULT 
					OPTION ( MAXRECURSION 0 )

















					









































