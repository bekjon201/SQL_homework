--create database Homework_lesson_2 
 create database Homework_lesson_2
 go
use Homework_lesson_2 

create database Employees
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
SELECT * FROM EMPLOYEES

-- 2. Insert three records using different approaches
-- Single-row insert
INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Alice', 6000.00);
-- Bir nechta  qator  qo‘shish
INSERT INTO Employees(EmpID, Name , Salary )
VALUES
(2,'Vali',5000.00),
(3,'Ali',6000.00);

--3 1-chi xodimning ish haqini 7000 ga yangilash:

UPDATE Employees

set Salary =7000
WHERE EmpID = 1;

SELECT * FROM Employees

DELETE FROM  Employees(
WHERE =2;

SELECT * FROM Employees

--5 . DELETE — Shart asosida ma'lumotlarni o‘chiradi, ROLLBACK qilish mumkin.
--TRUNCATE — Barcha ma'lumotlarni tozalaydi, lekin jadval qoladi, ROLLBACK qilish mumkin emas.
--DROP — Jadvalning o‘zini butunlay o‘chiradi, strukturasi ham yo‘qoladi.

-- .6
ALTER TABLE Employees
ALTER COLUMN NAME VARCHAR (100);

--7 

ALTER TABLE Employees
ADD Department VARCHAR(50);


--8

ALTER TABLE Employees
ALTER COLUMN SALARY FLOAT;

SELECT * FROM EMPLOYEES

CREATE TABLE Departments(
DepartmentsID INT PRIMARY KEY,
DepartmentsNAME VARCHAR (50)
);
--10 
TRUNCATE TABLE Employees
SELECT * FROM EMPLOYEES


--- Insert five records into the Departments table using `INSERT INTO SELECT
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'IT' UNION ALL
SELECT 2, 'Marketing' UNION ALL
SELECT 3, 'HR' UNION ALL
SELECT 4, 'Sales' UNION ALL
SELECT 5, 'Finance';

SERT INTO Employees (EmpID, Name, Salary, Department)
VALUES 
(1, 'Ali', 7000, NULL),
(2, 'Vali', 4500, NULL),
(3, 'Dilnoza', 8000, NULL);

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

TRUNCATE TABLE Employees;



ALTER TABLE Employees
DROP COLUMN Department;


EXEC sp_rename 'Employees', 'StaffMembers';

DROP TABLE Departments;

CREATE TABLE Products(

ProductsID INT PRIMARY KEY,
ProductsNAME VARCHAR(100),
Category VARCHAR(50),
    Price DECIMAL(10,2),
     Description VARCHAR (225)
   );

   ALTER TABLE  Category
   ADD CONSTRAINT  chk_Price CHECK (Price > 0);


   ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;



EXEC sp_rename 'Product.Category', 'ProductCategory','COLUMN';

--- hord ni 5 da 10 gacha qoldi
