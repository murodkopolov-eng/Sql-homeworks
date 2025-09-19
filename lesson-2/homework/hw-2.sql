--Basic-Level Tasks(10)

--1)Create a table Employees with columns:EmpID INT,Name (VARCHAR(50)),AND Salary (DECIMAL(10,2)).

CREATE TABLE Employees (ID INT,Name VARCHAR(50),Salary DECIMAL(10,2)) 
SELECT * FROM Employees

--2)Insert there records into the Employees table using different INSERT INTO aproaches(single-row insert and multiple-row insert)

INSERT INTO Employees VALUES (1,'Murod','15000.00')
INSERT INTO Employees VALUES (2,'Xojinazar','16000.00')
INSERT INTO Employees VALUES (3,'Otabek','17000.00')
select * from Employees

--3)Update the Salary of an employee to 7000 where EmpID=1

UPDATE Employees
SET Salary=7000
WHERE ID=1
SELECT * FROM Employees

--4)Delete a record from the Employees table where EmpID=2

DELETE Employees
WHERE ID=2
SELECT * FROM Employees

--5)Give a brief definition for difference between DELETE,TRUNCATE, and DROP.

--First of all i will explain about the DELETE function with example,for example i created a table which is named Employees then i would like to remove the employee whereID=1 from the list in this situation we can use DELETE.
--With the help of TRUNCATE we can remove all the records which are available on the table that we have created.
--DROP this function deletes all the details with tables or databases.For example i would like to delete my table fully which is named Employees the to complete this process i will  work with DROP function cause it deleres everything with files.

--6)Modify the Name column in the Employees table to VARCHAR(100)

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100)
SELECT * FROM EMployees

--7)Add a new column Department (VARCHAR(50)) to the Employees table.

ALTER TABLE Employees
ADD Department VARCHAR(50)
SELECT * FROM Employees

--8)Change the data type of Salary column to FLOAT

ALTER TABLE Employees
DROP COLUMN Salary
SELECT * FROM Employees
ALTER TABLE Employees
ADD FLOAT VARCHAR(50)
SELECT * FROM Employees

--9)Create another table Departments with columns DepartmentID(INT IDENTITY (1,1),PRIMARY KEY) and Deparartname VARCHAR(50)).

CREATE TABLE Departments (ID INT IDENTITY (1,1) PRIMARY KEY,Name VARCHAR(50))
SELECT * FROM Departments

--10)Remove all the records from Employees table without deleting its structure.

TRUNCATE TABLE Employees
SELECT*FROM Employees

--11)Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data)

CREATE TABLE Departments (ID INT IDENTITY (1,1) PRIMARY KEY,Name VARCHAR(100),OrganizedDATE DATE,Boss VARCHAR(100),Assistence VARCHAR(100))
SELECT * FROM Departments
INSERT INTO Departments VALUES ('Mudofaa vazirligi','1992-07-06','Shuhrat G’ayratjonovich Xolmuhammedov','Hamdam Aliqulovich Qarshiyev')
SELECT * FROM Departments
INSERT INTO Departments VALUES ('Transport vazirligi','2000-04-25','Hamdam Hamdamov Hamdamovich','Hamid Hamdamov Hamidovich')
 SELECT * FROM Departmens
 INSERT INTO Departments VALUES ('Madaniyat vazirligi','1995-09-12','Gulora Hamdamovna SHavkatovich','Dilnoza Egamberginiva Bahodirovich')
 SELECT * FROM Departments
 INSERT INTO Departments VALUES ('Sport vazirligi','1996-12-31','Isroil Madrimov','GGG')
  SELECT * FROM Departments
  INSERT INTO Departments VALUES ('Energetika vazirligi','1995-08-31','Flash','Ambulance')
   SELECT * FROM Departments

--12)Update the Department of all employees where Salary>5000 to 'Management'.

ALTER TABLE Departments
ADD Salary VARCHAR(50)
SELECT * FROM Departments
UPDATE Departments
SET Salary=(5500)
WHERE ID=1
UPDATE Departments
SET Salary=5600
WHERE ID=2
UPDATE Departments
SET Salary=5700
WHERE ID=3
UPDATE Departments
SET Salary=5800
WHERE ID=4
UPDATE Departments
SET Salary=5900
WHERE ID=5
SELECT * FROM Departments

--13)Write a query that removes all employees but keeps the table structure intact 

DELETE TABLE Employees


--14)Drop the Department column from the Employees table

ALTER TABLE Employees
DROP COLUMN Department 
SELECT * FROM Employees

--15)Rename the Employees table to StaffMembers using SQL commands.

EXEC sp_rename 'Employees','StaffMembers'
SELECT * FROM StaffMembers

--16)Write a query to completely remove the Departments table from the database.

DROP TABLE Departments
select * from Departments

--17)Create a table named Products with at least 5 columns,including:ProductID(Primary Key),ProductName (VARCHAR),Category (VARCHAR),Price (DECIMAL)

CREATE TABLE Products (
    ID INT PRIMARY KEY, 
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2) DEFAULT 50000.00,
    MadeDate DATE)

	
--18)Add a CHECK constraint to ensure Price is always greate than 0.

ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price>0)


--19)Modify the table to add StockQuantity column with a default value of 50.

ALTER TABLE Products
ADD  StockQuantity INT
SELECT * FROM Products

--20)Rename Category to ProductCategory.

EXEC sp_rename 'Products.Category','ProductCategory','COLUMN'
SELECT * FROM Products

--21)Insert 5 records into the Products table using standart INSERT INTO queries.

INSERT INTO Products (ID,ProductName,ProductCategory,Price,MadeDate) VALUES (1,'HP','Laptop','22000.00','2025-01-15')
select * from Products

--22)Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
  
   SELECT * INTO Products_Backup FROM Products 

   --23)Rename the Products table to Inventory.


EXEC sp_rename 'Products','Inventory'
SELECT * FROM Inventory

--24)Alter the Inventory table to change the data type of Price from Decimal(10,2) to FLOAT.

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT

--25)Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.

ALTER TABLE Inventory
ADD ProductCode INT IDENTITY (1000,5)
SELECT * FROM Inventory



