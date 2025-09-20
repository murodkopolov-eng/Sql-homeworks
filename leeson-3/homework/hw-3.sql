--1)Define and explain the purpose BULK INSERT in SQL Server.

BULK INSERT:With the help of BULK INSERT we will be able to import or load large amount of data from other file into SQL Servis in the short preiod of time.
The pupose of BULK INSERT:
1.Efficent loading:Instead of inserting row one by one using INSERT INTO,BULK INSERT cal load thousands or millions of data in a single operation,which is much faster.
2.Importing Extarnal Data:This format allows you to import variety of data from extarnal files into SQL Servis tables.

--2)List four file formats that can be imported into SQL Server.

1.CSV (Comma-Separated Values)

2.TXT (Text files, usually delimited)

3.XML (Extensible Markup Language)

4.JSON (JavaScript Object Notation)

--3)Create a table Products with columns: ProductID INT PRIMARY KEY,ProductName VARCHAR(50),Price DECIMAL(10,2))

create table Products (ProductID INT PRIMARY KEY,ProductName VARCHAR(50),Price DECIMAL(10,2))
SELECT * FROM Products

--4)Insert three records into the Products table using INSERT INTO.

INSERT INTO Products VALUES (1,'KITKAT','10000.00')
SELECT * FROM Products
INSERT INTO Products VALUES (2,'MARS','9000.00')
INSERT INTO Products VALUES (3,'BOUNTY','12000.00')
SELECT * FROM Products

--5)Explain the difference between NULL and NOT NULL.

NULL is the format that means there is no a value namely it means there is no data on the column of the table that we have created.For example PhoneNumber NULL there will not be a data about the number.
NOT NULL is the format that there has to be a data on the table namely it means there has not to be a empty place on the table.For example FirstName NOT NULL then it is necessary to give a data to column.

--6)Add a UNIQUE constraint to the ProductName column in the Products table.

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName)

--7)Write a comment in a SQL query explaining its purpose.

The purpose of SQL(Structured Query Language) is to manage and manipulate data in arelational databases.It serves as a standart language that allows to users to update,store,retrive,delete data,define database structures, and control access to information. 

--8)Add a CategoryID column to the Products table.

ALTER TABLE Products
ADD CategoryID INT
SELECT * FROM Products

--9)Create table Categories with CategoryID with PRIMARY KEY and CategoryName as UNIQUE.

CREATE TABLE Categories (CategoryID INT PRIMARY KEY,CategoryName VARCHAR(50) UNIQUE)
SELECT * FROM Categories

--10)Explain the purpose of the IDENTITY column in SQL Server.

The purpose of the IDENTITY column in SQL Server is to automatically generate unique,sequential numeric values for a column when new rows are inserted into a table

--11)Use BULK INSERT to import data from a text file into the Products table.

BULK INSERT Products 
FROM 'C:\Users\Hp\Downloads\products.csv'
WITH (
FIRSTROW=2,
FIELDTERMINATOR=',',
ROWTERMINATOR='\n'
)

--12)Create a FOREIGN KEY in the Products table that Categories table.

ALTER TABLE Products
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

--13)Explain the differences between PRIMARY KEY and UNIQUE KEY.

UNIQUE KEY is a function that only accepts a unique data for each row this means no two rows that can have the same value(s) for column(s) designated as a UNIQUE KEY.
PRIMARY KEY if this function written for the structure of table that means that on the table the value will not be repeated.For examole CustomerID=1 i added like this column to my table then i cannot write ColumnID=1 again.

--14)Add a CHECK constraint to the Products table ensuring Price>0

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK(Price>0)

--15)Modify the Products table to add a column Stock(INT,NOT NULL)

ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0

--16)Use the ISNULL function to replace NULL values in Price column with 0.


SELECT ISNULL (PRICE, 0) as price FROM Products

--17)Describe the pupose and usage of FOREIGN KEY constraints in SQL Server.

A FOREIGN KEY in SQL Server is a constraint used to enforce referential integrity between two tables.
The purposes of FOREIGN KEY:
1.Support Cascading Actions (Optional):Can automatically update or delete related rows on the table(using ON UPDATE or ON DELETE actions)
2.Maintain Data Integrity:I will explain about it with example this function ensures that a value in the child table exists in the parent table.
3.Prevent Orphan Records:Stops inserting or updating data in the child table if the corresponding parent record does not exist.
4.Define relationships between tables.

--18)Write a cript to create a Customers table with CHECK constraint ensuring Age>=18

CREATE TABLE Customers (CustomerID INT PRIMARY KEY,
                        FirstName VARCHAR(50),
						LastName VARCHAR(50),
						Age INT,
						CONSTRAINT CHK_Customers_Age CHECK(Age>=18))
SELECT * FROM Customers

--19)Create a table with an IDENTITY column starting at 100 and incrementing by 10.

CREATE TABLE MAABSTD (ID INT IDENTITY(100,12) PRIMARY KEY,FirstName VARCHAR(100),LastName VARCHAR(100),Grade INT)
SELECT * FROM MAABSTD

--20)Write a query to create composite PRIMARY KEY in a new table OrderDetails.

CREATE TABLE OrderDetails (ProductID INT,OrderID INT,ProductName VARCHAR(50),Quantity INT,Price DECIMAL(10,2), CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID))

--21)Explain the use of COALESCE and ISNULL functions for handling NULL values.

ISNULL:Purpose: ISNULL replaces a NULL value in a specific expression with a designated replacement value namely if iam going to look for someones data on the row of table ISNULL helps me to find values but this function only find thow of them.Syntax: ISNULL ( check_expression , replacement_value )
COALESCE:Purpose: COALESCE evaluates multiple expressions in order and returns the first non-NULL expression encountered. If all expressions are NULL, it returns NULL.This function is build different compared to ISNULL because with the help of COALESCE we can find unlimited version of data.Syntax: COALESCE ( expression1, expression2, ..., expressionN )

--22)Create a table Employees with both Primary KEY on EmpID and Unique KEY on Email.

CREATE TABLE Employees (EmpID INT PRIMARY KEY,FirstName VARCHAR(100) NOT NULL,LastName VARCHAR(100) NOT NULL,Email VARCHAR(100) UNIQUE)
SELECT * FROM Employees

--23)Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.

CREATE TABLE Custimers (CustomerID INT PRIMARY KEY,CustomerName VARCHAR(100))

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



