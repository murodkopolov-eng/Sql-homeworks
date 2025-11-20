CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')

--1.Compute Running Total Sales per Customer

SELECT
	  sale_id,
	  customer_id,
	  customer_name,
	  product_category,
	  product_name,
	  order_date,
	  SUM( total_amount ) OVER ( PARTITION BY customer_id ORDER BY order_date ASC ) AS RunningTotal
FROM sales_data

--2.Count the Number of Orders per Product Category

SELECT product_category,COUNT( * ) AS Number_Of_Orders_Per_Category
FROM sales_data
GROUP BY product_category

--3.Find the Maximum Total Amount per Product Category

SELECT product_category,MAX( total_amount ) AS max_total_amount_per_category
FROM sales_data
GROUP BY product_category

--4.Find the Minimum Price of Products per Product Category

SELECT product_category,MIN( total_amount ) AS min_total_amount_per_category
FROM sales_data
GROUP BY product_category

--5.Compute the Moving Average of Sales of 3 days (prev day, curr day, next day)

SELECT 
      *,
	  AVG( total_amount ) OVER ( ORDER BY order_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING ) AS Result
FROM sales_data

--6.Find the Total Sales per Region

SELECT region,SUM( total_amount ) AS total_amount_per_region
FROM sales_data
GROUP BY region

--7.Compute the Rank of Customers Based on Their Total Purchase Amount

SELECT 
      customer_id,
	  customer_name,
	  SUM( total_amount ) AS TotalAmount,
	  RANK() OVER ( ORDER BY SUM( total_amount ) ASC ) AS Result
FROM sales_data
GROUP BY customer_id,customer_name

--8.Calculate the Difference Between Current and Previous Sale Amount per Customer
 
SELECT 
      *,
	  LAG( total_amount ) OVER ( ORDER BY customer_id ASC ) AS PreviousTotalAmount,
	  total_amount - LAG( total_amount ) OVER ( ORDER BY customer_id ASC ) AS difference
FROM sales_data

--9.Find the Top 3 Most Expensive Products in Each Category

GO
WITH CTE_RESULT AS (
					SELECT 
					      *,
						  ROW_NUMBER() OVER ( PARTITION BY product_category ORDER BY unit_price DESC ) AS Top3ExpensiveProducts
						  FROM sales_data )
						  SELECT product_name,product_category,unit_price,Top3ExpensiveProducts FROM CTE_RESULT
						  WHERE Top3ExpensiveProducts <= 3 

--10.Compute the Cumulative Sum of Sales Per Region by Order Date

SELECT 
      *,
	  SUM( total_amount ) OVER ( PARTITION BY region ORDER BY order_date ) AS Result
FROM sales_data

--11.Compute Cumulative Revenue per Product Category

SELECT 
      product_category,
	  order_date,
	  total_amount,
	  SUM( total_amount ) OVER ( PARTITION BY product_category ORDER BY order_date ) AS Result
FROM sales_data

--12.Here you need to find out the sum of previous values. Please go through the sample input and expected output.

-- 1. JADVALNI YARATISH
-- Agar jadval mavjud bo'lsa, uni o'chiradi (agar kerak bo'lsa)
IF OBJECT_ID('dbo.SampleTable') IS NOT NULL
    DROP TABLE dbo.SampleTable;

-- Asosiy jadvalni yaratish
CREATE TABLE dbo.SampleTable (
    ID INT PRIMARY KEY
);

-- 2. MA'LUMOT KIRITISH
-- Namuna Input ma'lumotlarini kiritish
INSERT INTO dbo.SampleTable (ID) VALUES
(1),
(2),
(3),
(4),
(5);

SELECT 
      *,
	  SUM( ID ) OVER ( ORDER BY ID ROWS UNBOUNDED PRECEDING ) AS SumPreValues
FROM dbo.SampleTable

--13.Sum of Previous Values to Current Value

CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);

SELECT 
      *,
	  SUM( Value ) OVER ( ORDER BY Value ROWS BETWEEN 1 PRECEDING AND CURRENT ROW ) AS  Result
FROM OneColumn

--14.Find customers who have purchased items from more than one product_category

GO
WITH CTE_RESULT AS (
					SELECT 
					      customer_id,
						  COUNT( DISTINCT product_category ) AS UniqueCategoryCount
						  FROM sales_data 
						  GROUP BY customer_id )
SELECT * FROM CTE_RESULT
WHERE UniqueCategoryCount > 1
      
--15.Find Customers with Above-Average Spending in Their Region

GO
WITH CTE_RESULT AS (
					SELECT
					      customer_id,
						  customer_name,
						  total_amount,
						  region,
						  AVG( total_amount ) OVER ( PARTITION BY region ) AS AvgTotalAmountPerRegion
						  FROM sales_data )
						  SELECT * FROM CTE_RESULT
						  WHERE total_amount > AvgTotalAmountPerRegion

--16.Rank customers based on their total spending (total_amount) within each region. If multiple customers have the same spending, they should receive the same rank.

SELECT 
      *,
	  RANK() OVER ( PARTITION BY region ORDER BY total_amount DESC ) AS Result
FROM sales_data

--17.Calculate the running total (cumulative_sales) of total_amount for each customer_id, ordered by order_date.

SELECT 
      *,
	  SUM( total_amount ) OVER ( PARTITION BY customer_id ORDER BY order_date ROWS UNBOUNDED PRECEDING) AS Result
FROM sales_data

--18.Calculate the sales growth rate (growth_rate) for each month compared to the previous month.

SELECT 
      *,
	  LAG( total_amount ) OVER ( PARTITION BY MONTH( order_date ) ORDER BY total_amount ASC ) AS Previous_Total_Amount_Of_Month,
	  total_amount - LAG( total_amount ) OVER ( PARTITION BY MONTH( order_date ) ORDER BY total_amount ASC ) AS Difference
FROM sales_data

--19.Identify customers whose total_amount is higher than their last order''s total_amount.(Table sales_data)

GO
WITH CTE_RESULT AS (
					SELECT 
					      *,
						  LAG( total_amount,1 ) OVER ( PARTITION BY customer_id ORDER BY order_date ) AS PreviousTotalAmount
						  FROM sales_data )
						  SELECT * FROM CTE_RESULT
						  WHERE total_amount > PreviousTotalAmount

--20.Identify Products that prices are above the average product price

GO
WITH CTE_RESULT AS (
                    SELECT 
					      *,
						  AVG( unit_price ) OVER () AS AvgPrice
						  FROM sales_data )
						  SELECT * FROM CTE_RESULT
						  WHERE unit_price > AvgPrice

----21.In this puzzle you have to find the sum of val1 and val2 for each group and put that value at the beginning of the group in the new column. 
--The challenge here is to do this in a single select. 
--For more details please see the sample input and expected output.



CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);

GO
WITH CTE_RESULT AS (
					SELECT 
					      ID,
						  Grp,
						  Val1,
						  Val2,
						  SUM( Val1 + Val2 ) OVER ( PARTITION BY Grp ) AS TotalSUM,
						  ROW_NUMBER() OVER ( PARTITION BY Grp ORDER BY ID ) AS rwn
						  FROM MyData )
SELECT 
	  ID,
	  Grp,
	  Val1,
	  Val2,
	       CASE 
		       WHEN rwn = 1 THEN TotalSum
			   ELSE NULL
			   END AS Total
			   FROM CTE_RESULT

----22.Here you have to sum up the value of the cost column based on the values of Id. 
--For Quantity if values are different then we have to add those values.
--Please go through the sample input and expected output for details.

CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);

SELECT 
      ID,
      SUM( Cost ) AS TotalCost,
	  SUM( Quantity ) AS TotalQuantity
FROM TheSumPuzzle
GROUP BY ID

--23.From following set of integers, write an SQL statement to determine the expected outputs

CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 

GO
WITH MissingRanges AS (
    SELECT DISTINCT SeatNumber 
    FROM Seats
),
ConsecutiveGroups AS (
    SELECT
        SeatNumber,
        ROW_NUMBER() OVER (ORDER BY SeatNumber) AS RowNum,
        SeatNumber - ROW_NUMBER() OVER (ORDER BY SeatNumber) AS GroupID
    FROM 
        MissingRanges
),
BookedRanges AS (
    SELECT
        MIN(SeatNumber) AS StartSeat,
        MAX(SeatNumber) AS EndSeat
    FROM 
        ConsecutiveGroups
    GROUP BY 
        GroupID
),
GapStarts AS (
    SELECT 
        EndSeat + 1 AS GapStart
    FROM 
        BookedRanges
    WHERE 
        EndSeat < (SELECT MAX(SeatNumber) FROM Seats)
    UNION ALL
    SELECT 1 AS GapStart
    WHERE (SELECT MIN(SeatNumber) FROM Seats) > 1
)
SELECT
    gs.GapStart AS "Gap Start",
    (
        SELECT 
            MIN(s2.SeatNumber) - 1 
        FROM Seats s2 
        WHERE s2.SeatNumber > gs.GapStart
    ) AS "Gap End"
FROM 
    GapStarts gs
WHERE
    (
        (SELECT MIN(s2.SeatNumber) - 1 FROM Seats s2 WHERE s2.SeatNumber > gs.GapStart) IS NOT NULL
        OR gs.GapStart = 1
    )
ORDER BY 
    "Gap Start";




						  


					       








































