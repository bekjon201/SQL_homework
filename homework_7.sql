create database lesonl
go
use lesonl

SELECT MIN(Price) AS MinPrice FROM Products;



Копировать
Редактировать
SELECT MAX(Salary) AS MaxSalary FROM Employees;



Копировать
Редактировать
SELECT COUNT(*) AS TotalCustomers FROM Customers;


Копировать
Редактировать
SELECT COUNT(DISTINCT Category) AS UniqueCategories FROM Product;



SELECT SUM(Amount) AS TotalSales FROM Sales WHERE ProductID = 7;


SELECT AVG(Age) AS AverageAge FROM Employees;



SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;


SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;


SELECT CustomerID, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY CustomerID;

 
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;


 
SELECT p.Category, SUM(s.Amount) AS TotalSales, AVG(s.Amount) AS AverageSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;

SELECT COUNT(*) AS HREmployees
FROM Employees
WHERE DepartmentName = 'HR';


 
 
SELECT DepartmentName, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY DepartmentName;

 
SELECT DepartmentName, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName;



 
 
SELECT DepartmentName, AVG(Salary) AS AvgSalary, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;

 
 
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;

 
 
SELECT YEAR(SaleDate) AS SaleYear, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);

 
 
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales
GROUP BY CustomerID
HAVING COUNT(*) >= 3;
 
SELECT DepartmentName, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000;
 
 
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;
Customers with total sales over 1500;

 
 
SELECT CustomerID, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(Amount) > 1500;
Departments with avg salary > 65000;
 
 
SELECT DepartmentName, SUM(Salary) AS TotalSalary, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;
Total amount for orders > $50 + least purchases
(Assuming Orders table has columns: CustomerID, Freight, Amount);


 
 
SELECT CustomerID,
       SUM(CASE WHEN Freight > 50 THEN Amount ELSE 0 END) AS TotalHighWeight,
       MIN(Amount) AS LeastPurchase
FROM tsql2012.sales.orders
GROUP BY CustomerID;


 
 
SELECT 
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(Amount) AS TotalSales,
    COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2;
MIN and MAX order quantity per year



SELECT 
    YEAR(OrderDate) AS OrderYear,
    MIN(Quantity) AS MinQty,
    MAX(Quantity) AS MaxQty
FROM Orders
GROUP BY YEAR(OrderDate);