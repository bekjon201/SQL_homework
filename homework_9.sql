create database lesson_9
go
use lesson_9


select COUNT(*)  from Customers;


select count (DISTINCT Country) from Customers;



select count (*) 
from   Orders o
join  Customers c on o.CustomerID = c.CustomerID
where  c.Country = 'France';


select count (*)
from Orders o
join  Employees e ON o.EmployeeID = e.EmployeeID
WHERE e.FirstName = 'Nancy';


select count (*)
FROM [Order Details] od
join Orders o  on  od.OrderID = o.OrderID
join Customers c ON o.CustomerID = c.CustomerID
where  c.ContactName like '%Thomas%';


SELECT o.OrderID
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Brazil' AND o.OrderDate < '1997-01-01';

SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Products p
RIGHT JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;


SELECT COUNT(*) 
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Brazil' AND o.OrderDate < '1997-01-01';