-- Orders placed after 2022 with customer names
SELECT 
    o.OrderID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) > 2022;

-- . Employees in Sales or Marketing department
SELECT 
    e.FirstName + ' ' + e.LastName AS EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');

--  Top earning employee in each department
SELECT 
    d.DepartmentName,
    e.FirstName + ' ' + e.LastName AS TopEmployeeName,
    e.Salary AS MaxSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

--  Highest salary for each department
SELECT 
    d.DepartmentName,
    MAX(e.Salary) AS MaxSalary
FROM Departments d
JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

--  Customers from USA who ordered in 2023
SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND YEAR(o.OrderDate) = 2023;

--  Total orders per customer
SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

--  Products supplied by Gadget Supplies or Clothing Mart
SELECT 
    p.ProductName,
    s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');

--  Most recent order per customer (include customers with no orders)
SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

-- 🟠 Medium-Level Tasks

--  Customers with orders > 500
SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    o.OrderID,
    o.TotalAmount AS OrderTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 500;

--  Sales in 2022 OR sales > 400
SELECT 
    p.ProductName,
    s.SaleDate,
    s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2022 OR s.SaleAmount > 400;

--  Total sales amount per product
SELECT 
    p.ProductName,
    SUM(s.SaleAmount) AS TotalSalesAmount
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;

--  Employees in HR department with salary > 60000
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'HR' AND e.Salary > 60000;

--  Products sold in 2023 with stock > 100
SELECT 
    p.ProductName,
    s.SaleDate,
    p.StockQuantity
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
WHERE YEAR(s.SaleDate) = 2023 AND p.StockQuantity > 100;

-- Employees in Sales department or hired after 2020
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.HireDate
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR YEAR(e.HireDate) > 2020;

--  Orders by USA customers with address starting with 4 digits
SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    o.OrderID,
    c.Address,
    o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND c.Address LIKE '[0-9][0-9][0-9][0-9]%';

--  Product sales for Electronics category OR sale amount > 350
SELECT 
    p.ProductName,
    p.Category,
    s.SaleAmount
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
WHERE p.Category = 'Electronics' OR s.SaleAmount > 350;

--  Product count per category
SELECT 
    p.Category AS CategoryName,
    COUNT(*) AS ProductCount
FROM Products p
GROUP BY p.Category;

--  Orders by Los Angeles customers with amount > 300
SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.City,
    o.OrderID,
    o.TotalAmount AS Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Los Angeles' AND o.TotalAmount > 300;

--  Employees in HR/Finance OR with 4+ vowels in name
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('HR', 'Finance')
   OR LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(e.Name), 'a',''), 'e',''), 'i',''), 'o',''), 'u','')) <= LEN(e.Name) - 4;

--  Products with sales quantity > 100 and price > 500
SELECT 
    p.ProductName,
    s.QuantitySold,
    p.Price
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.QuantitySold > 100 AND p.Price > 500;

-- 
Employees in Sales or Marketing earning > 60000
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing') AND e.Salary > 60000;

-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Customers;

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);
-- Drop existing tables if they exist
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Orders;

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT NULL,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2)
);

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, TotalAmount) VALUES
(102, 15, 2, '2023-05-14', 1, 800.00),
(205, 8, 3, '2024-09-07', 2, 800.00),
(311, 22, 4, '2022-11-22', 1, 250.00),
(421, 33, 5, '2021-03-30', 3, 150.00),
(523, 40, NULL, '2025-07-19', 1, 30.00),
(610, 19, 7, '2022-08-25', 2, 300.00),
(728, 14, 8, '2024-06-10', 1, 200.00),
(812, 27, 9, '2021-12-04', 4, 40.00),
(915, 6, 10, '2023-02-18', 1, 10.00),
(1003, 31, NULL, '2025-09-27', 2, 360.00),
(1108, 12, 12, '2023-10-11', 1, 500.00),
(1205, 29, 13, '2024-04-03', 1, 25.00),
(1354, 4, 14, '2022-07-29', 2, 60.00),
(1411, 9, 15, '2021-01-22', 3, 135.00),
(1533, 23, NULL, '2025-11-15', 1, 80.00),
(1622, 36, 17, '2022-10-08', 1, 60.00),
(1710, 1, 18, '2023-06-21', 2, 40.00),
(1845, 20, 19, '2021-09-13', 5, 50.00),
(1908, 37, 20, '2025-03-05', 2, 50.00),
(2042, 10, 21, '2024-08-14', 1, 60.00),
(2157, 13, 22, '2022-12-01', 1, 100.00),
(2268, 35, 23, '2023-09-09', 1, 15.00),
(2349, 7, 24, '2021-07-18', 2, 180.00),
(2481, 17, NULL, '2025-06-23', 3, 15.00),
(2594, 5, 26, '2023-03-12', 4, 100.00),
(2633, 26, 27, '2022-04-07', 1, 450.00),
(2782, 39, 28, '2024-11-30', 1, 600.00),
(2845, 24, 29, '2021-02-25', 1, 500.00),
(2903, 2, 30, '2025-05-28', 2, 240.00),
(3011, 16, 31, '2023-08-20', 1, 350.00),
(3152, 21, 32, '2022-01-17', 1, 450.00),
(3227, 38, 33, '2025-09-10', 1, 40.00),
(3368, 11, 34, '2021-04-04', 2, 100.00),
(3419, 3, 35, '2024-07-15', 3, 120.00),
(3551, 18, 36, '2022-10-31', 1, 60.00),
(3684, 32, 37, '2023-12-22', 1, 35.00),
(3749, 28, 38, '2021-06-06', 2, 110.00),
(3872, 25, NULL, '2025-02-01', 1, 40.00),
(3911, 30, 40, '2023-11-26', 3, 120.00),
(4057, 22, 1, '2024-03-09', 1, 1200.00);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT NULL,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert sample data into Payments table
INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(501, 102, '2023-05-15', 800.00, 'Credit Card'),
(502, 205, '2024-09-08', 800.00, 'PayPal'),
(503, 311, '2022-11-23', 250.00, 'Bank Transfer'),
(504, NULL, '2024-01-05', 500.00, 'Cash'),
(505, 421, '2021-03-31', 150.00, 'Credit Card'),
(506, 610, '2022-08-26', 300.00, 'Debit Card'),
(507, 728, '2024-06-11', 200.00, 'PayPal'),
(508, NULL, '2023-12-20', 75.00, 'Bank Transfer'),
(509, 915, '2023-02-19', 10.00, 'Cash'),
(510, 1003, '2025-09-28', 360.00, 'Credit Card'),
(511, 1108, '2023-10-12', 500.00, 'PayPal'),
(512, 1205, '2024-04-04', 25.00, 'Debit Card'),
(513, 1354, '2022-07-30', 60.00, 'Credit Card'),
(514, NULL, '2024-02-17', 1200.00, 'Wire Transfer'),
(515, 1411, '2021-01-23', 135.00, 'Bank Transfer'),
(516, NULL, '2023-06-29', 150.00, 'PayPal'),
(517, 1622, '2022-10-09', 60.00, 'Cash'),
(518, 1710, '2023-06-22', 40.00, 'Debit Card'),
(519, 1845, '2021-09-14', 50.00, 'Credit Card'),
(520, NULL, '2025-01-18', 95.00, 'Bank Transfer');

-- ============================================
-- Drop Existing Tables if Present
-- ============================================
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Categories;

-- ============================================
-- Create Suppliers Table
-- ============================================
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Email VARCHAR(150)
);

-- Insert data into Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Email) VALUES
(1, 'Tech Distributors', 'Alice Johnson', 'alice@techdist.com'),
(2, 'Gadget Supplies', 'Bob Smith', 'bob@gadgetsupplies.com'),
(3, 'Office Essentials', 'Charlie Davis', 'charlie@officeessentials.com'),
(4, 'Furniture Hub', 'Diana Adams', 'diana@furniturehub.com'),
(5, 'Clothing Mart', 'Ethan Clark', 'ethan@clothingmart.com'),
(6, 'Car Parts', 'Tom Hanks', 'tom@carparts.com'),
(7, 'Toys', 'John Adams', 'john@toysff.com');

-- ============================================
-- Create Products Table (with FK to Suppliers)
-- ============================================
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Insert data into Products
INSERT INTO Products (ProductID, ProductName, Price, Category, StockQuantity, SupplierID) VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30, 1),
(2, 'Smartphone', 800.00, 'Electronics', 50, 1),
(3, 'Tablet', 400.00, 'Electronics', 40, 1),
(4, 'Monitor', 250.00, 'Electronics', 60, 1),
(5, 'Keyboard', 50.00, 'Accessories', 100, 2),
(6, 'Mouse', 30.00, 'Accessories', 120, 2),
(7, 'Chair', 150.00, 'Furniture', 80, 4),
(8, 'Desk', 200.00, 'Furniture', 75, 4),
(9, 'Pen', 5.00, 'Stationery', 300, 3),
(10, 'Notebook', 10.00, 'Stationery', 500, 3),
(11, 'Printer', 180.00, 'Electronics', 25, 1),
(12, 'Camera', 500.00, 'Electronics', 40, 1),
(13, 'Flashlight', 25.00, 'Tools', 200, 2),
(14, 'Shirt', 30.00, 'Clothing', 150, 5),
(15, 'Jeans', 45.00, 'Clothing', 120, 5),
(16, 'Jacket', 80.00, 'Clothing', 70, 5),
(17, 'Shoes', 60.00, 'Clothing', 100, 5),
(18, 'Hat', 20.00, 'Accessories', 50, 2),
(19, 'Socks', 10.00, 'Clothing', 200, 5),
(20, 'T-Shirt', 25.00, 'Clothing', 150, 5),
(21, 'Lamp', 60.00, 'Furniture', 40, 4),
(22, 'Coffee Table', 100.00, 'Furniture', 35, 4),
(23, 'Book', 15.00, 'Stationery', 250, 3),
(24, 'Rug', 90.00, 'Furniture', 60, 4),
(25, 'Cup', 5.00, 'Accessories', 500, 2),
(26, 'Bag', 25.00, 'Accessories', 300, 2),
(27, 'Couch', 450.00, 'Furniture', 15, 4),
(28, 'Fridge', 600.00, 'Electronics', 20, 1),
(29, 'Stove', 500.00, 'Electronics', 15, 1),
(30, 'Microwave', 120.00, 'Electronics', 25, 1),
(31, 'Air Conditioner', 350.00, 'Electronics', 10, 1),
(32, 'Washing Machine', 450.00, 'Electronics', 15, 1),
(33, 'Dryer', 400.00, 'Electronics', 10, 1),
(34, 'Hair Dryer', 30.00, 'Accessories', 100, 2),
(35, 'Iron', 40.00, 'Electronics', 50, 1),
(36, 'Coffee Maker', 50.00, 'Electronics', 60, 1),
(37, 'Blender', 35.00, 'Electronics', 40, 1),
(38, 'Juicer', 55.00, 'Electronics', 30, 1),
(39, 'Toaster', 40.00, 'Electronics', 70, 1),
(40, 'Dishwasher', 500.00, 'Electronics', 20, 1);

-- ============================================
-- Normalize Product Categories into Separate Table
-- ============================================
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName VARCHAR(50) UNIQUE
);

-- Insert Unique Categories
INSERT INTO Categories (CategoryName) VALUES 
('Electronics'),
('Accessories'),
('Furniture'),
('Stationery'),
('Tools'),
('Clothing');

-- Replace Category names in Products with Category IDs
UPDATE P
SET P.Category = C.CategoryID
FROM Products P
JOIN Categories C ON P.Category = C.CategoryName;

-- Convert Category column type to INT
ALTER TABLE Products
ALTER COLUMN Category INT NULL;

-- (Optional Fix) If needed, update any unmatched value
UPDATE Products
SET Category = 10
WHERE Category = 4;

-- ============================================
-- Students and Courses with Many-to-Many Enrollments
-- ============================================
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Major VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Instructor VARCHAR(100)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert Students
INSERT INTO Students (StudentID, Name, Age, Major) VALUES
(1, 'Alice Johnson', 20, 'Computer Science'),
(2, 'Bob Smith', 21, 'Mathematics'),
(3, 'Charlie Brown', 22, 'Physics'),
(4, 'David Wilson', 19, 'Engineering'),
(5, 'Emma Davis', 20, 'Biology'),
(6, 'Frank Moore', 23, 'Business'),
(7, 'Grace Taylor', 21, 'Mathematics'),
(8, 'Henry Anderson', 20, 'Economics'),
(9, 'Isabella Thomas', 22, 'Chemistry'),
(10, 'Jack White', 19, 'Computer Science'),
(11, 'Karen Harris', 20, 'Mathematics'),
(12, 'Liam Martin', 21, 'Engineering'),
(13, 'Mia Clark', 22, 'Biology'),
(14, 'Noah Lewis', 20, 'Physics'),
(15, 'Olivia Walker', 19, 'Business'),
(16, 'Paul Hall', 22, 'Computer Science'),
(17, 'Quinn Young', 21, 'Economics'),
(18, 'Rachel King', 20, 'Chemistry'),
(19, 'Samuel Allen', 23, 'Engineering'),
(20, 'Taylor Scott', 21, 'Mathematics'),
(21, 'Ursula Green', 20, 'Biology'),
(22, 'Victor Adams', 22, 'Physics'),
(23, 'Wendy Baker', 19, 'Business'),
(24, 'Xavier Cooper', 20, 'Computer Science'),
(25, 'Yvonne Nelson', 21, 'Mathematics'),
(26, 'Zachary Carter', 22, 'Engineering'),
(27, 'Amelia Wright', 20, 'Biology'),
(28, 'Benjamin Mitchell', 19, 'Physics'),
(29, 'Charlotte Perez', 22, 'Business'),
(30, 'Daniel Roberts', 21, 'Economics'),
(31, 'Eleanor Stewart', 20, 'Chemistry'),
(32, 'Frederick Reed', 23, 'Engineering'),
(33, 'Gabriella Howard', 21, 'Mathematics'),
(34, 'Harrison Bell', 20, 'Biology'),
(35, 'Ivy Collins', 22, 'Physics'),
(36, 'Jason Murphy', 19, 'Business'),
(37, 'Kylie Foster', 21, 'Computer Science'),
(38, 'Lucas Jenkins', 20, 'Economics'),
(39, 'Madeline Perry', 22, 'Chemistry'),
(40, 'Nathan Griffin', 19, 'Engineering');

INSERT INTO Courses (CourseID, CourseName, Instructor) VALUESMore actions
(1, 'Math 101', 'Dr. Adams'),
(2, 'Physics 101', 'Dr. Brown'),
(3, 'Biology 101', 'Dr. Carter'),
(4, 'Computer Science 101', 'Dr. Davis'),
(5, 'Business 101', 'Dr. Evans');



INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1), (2, 1), (7, 1), (11, 1), (20, 1), (25, 1), (33, 1),
(3, 2), (9, 2), (14, 2), (22, 2), (28, 2), (35, 2),
(5, 3), (13, 3), (21, 3), (27, 3), (34, 3),
(10, 4), (16, 4), (24, 4), (30, 4), (37, 4),
(6, 5), (15, 5), (23, 5), (29, 5), (36, 5);



DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00),
(4, 4, 4, '2023-01-04', 300.00),
(5, 5, 5, '2023-01-05', 350.00),
(6, 6, 6, '2023-01-06', 400.00),
(7, 7, 7, '2023-01-07', 450.00),
(8, 8, 8, '2023-01-08', 500.00),
(9, 9, 9, '2023-01-09', 550.00),
(10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00),
(12, 2, 2, '2023-01-12', 200.00),
(13, 3, 3, '2023-01-13', 250.00),
(14, 4, 4, '2023-01-14', 300.00),
(15, 5, 5, '2023-01-15', 350.00),
(16, 6, 6, '2023-01-16', 400.00),
(17, 7, 7, '2023-01-17', 450.00),
(18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00),
(20, 10, 10, '2023-01-20', 600.00),
(21, 1, 2, '2023-01-21', 150.00),
(22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00),
(24, 4, 5, '2023-01-24', 300.00),
(25, 5, 6, '2023-01-25', 350.00),
(26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00),
(28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00),
(30, 10, 1, '2023-01-30', 600.00),
(31, 1, 2, '2023-02-01', 150.00),
(32, 2, 3, '2023-02-02', 200.00),
(33, 3, 4, '2023-02-03', 250.00),
(34, 4, 5, '2023-02-04', 300.00),
(35, 5, 6, '2023-02-05', 350.00),
(36, 6, 7, '2023-02-06', 400.00),
(37, 7, 8, '2023-02-07', 450.00),
(38, 8, 9, '2023-02-08', 500.00),
(39, 9, 10, '2023-02-09', 550.00),
(40, 10, 1, '2023-02-10', 600.00);
(1, 1, 1, '2021-01-01', 150.00),
(2, 2, 2, '2022-03-15', 200.00),
(3, 3, 3, '2024-06-10', 250.00),
(4, 4, 4, '2025-07-21', 300.00),
(5, 5, 5, '2021-11-09', 350.00),
(6, 6, 6, '2023-04-25', 400.00),
(7, 7, 7, '2024-02-14', 450.00),
(8, 8, 8, '2022-10-31', 500.00),
(9, 9, 9, '2025-01-08', 550.00),
(10, 10, 10, '2021-08-19', 600.00),
(11, 1, 1, '2023-03-11', 150.00),
(12, 2, 2, '2024-12-05', 200.00),
(13, 3, 3, '2022-09-18', 250.00),
(14, 4, 4, '2025-05-22', 300.00),
(15, 5, 5, '2021-06-30', 350.00),
(16, 6, 6, '2024-01-15', 400.00),
(17, 7, 7, '2022-02-07', 450.00),
(18, 8, 8, '2023-07-13', 500.00),
(19, 9, 9, '2021-12-29', 550.00),
(20, 10, 10, '2025-03-20', 600.00),
(21, 1, 2, '2023-10-10', 150.00),
(22, 2, 3, '2022-11-25', 200.00),
(23, 3, 4, '2024-04-09', 250.00),
(24, 4, 5, '2021-07-17', 300.00),
(25, 5, 6, '2023-12-02', 350.00),
(26, 6, 7, '2022-08-08', 400.00),
(27, 7, 8, '2025-06-11', 450.00),
(28, 8, 9, '2024-09-26', 500.00),
(29, 9, 10, '2021-05-05', 550.00),
(30, 10, 1, '2023-02-18', 600.00),
(31, 1, 2, '2022-01-20', 150.00),
(32, 2, 3, '2025-04-30', 200.00),
(33, 3, 4, '2021-03-04', 250.00),
(34, 4, 5, '2023-06-27', 300.00),
(35, 5, 6, '2024-11-19', 350.00),
(36, 6, 7, '2022-05-23', 400.00),
(37, 7, 8, '2025-08-16', 450.00),
(38, 8, 9, '2021-04-12', 500.00),
(39, 9, 10, '2023-09-03', 550.00),
(40, 10, 1, '2024-07-07', 600.00);
```
