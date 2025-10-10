--1)Combine Two Tables

Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

SELECT firstName,lastName,city,state
FROM Person  p
LEFT JOIN Address a ON a.personId=p.personId

--2)Employees Earning More Than Their Managers

Create table Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

SELECT e1.Name AS EmployeeName
FROM Employee e1 
LEFT JOIN Employee e2 ON e1.managerId=e2.id
WHERE e1.Salary>e2.Salary

--3)Duplicate Emails
CREATE TABLE Person (ID INT PRIMARY KEY,Email VARCHAR(50))  
INSERT INTO Person (ID,Email) VALUES (1,'a@b.com'),(2,'c@d.com'),(3,'a@b.com')  

SELECT DISTINCT p1.Email
FROM Person p1
INNER JOIN Person p2 ON p1.Email=p2.Email
AND p1.ID<>p2.ID 

--4)Delete Duplicate Emails

CREATE TABLE Person (ID INT PRIMARY KEY,Email VARCHAR(50)) 
INSERT INTO Person (ID,Email) VALUES (1,'john@example.com '),(2,' bob@example.com'),(3,'john@example.com ') 

WITH DuplicateCTE AS (
					SELECT ID,Email,
					ROW_NUMBER() OVER (PARTITION BY Email ORDER BY ID ASC) AS Labelling FROM Person)
			DELETE FROM Person WHERE ID IN (SELECT ID FROM DuplicateCTE WHERE Labelling>1);

--5)Find those parents who has only girls.

CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

SELECT DISTINCT g.ParentName
FROM girls g
LEFT JOIN boys b ON g.ParentName=b.ParentName
WHERE b.ParentName IS NULL

--6)Total over 50 and least

SELECT orderid,custid, SUM(freight) AS TotalFreight,MIN(freight) AS MinFreight FROM Sales.Orders
GROUP BY orderid,custid
HAVING SUM(freight)>50

--7)Carts

CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

SELECT c1.Item,c2.Item
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2 ON c1.Item=c2.Item

--8)Customers Who Never Order

Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

SELECT c.Name
FROM Customers c
LEFT JOIN Orders o ON o.customerId=c.id
WHERE o.customerId IS NULL

--9)Students and Examinations

Create table Students (student_id int, student_name varchar(20))
Create table Subjects (subject_name varchar(20))
Create table Examinations (student_id int, subject_name varchar(20))
Truncate table Students
insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')
Truncate table Subjects
insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')
Truncate table Examinations
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')

SELECT s.student_id,s.student_name,su.subject_name,COUNT(s.student_name) AS attended_exams
FROM Students s
INNER JOIN Examinations e ON e.student_id=s.student_id
INNER JOIN Subjects su ON su.subject_name=e.subject_name
GROUP BY s.student_id,s.student_name,su.subject_name
ORDER BY s.student_id,subject_name







