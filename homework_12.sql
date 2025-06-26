
	--  Combine Two Tables
SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM 
    Person p
LEFT JOIN 
    Address a
ON 
    p.personId = a.personId;

--  Employees Earning More Than Their Managers
SELECT 
    e.name AS Employee
FROM 
    Employee e
JOIN 
    Employee m
ON 
    e.managerId = m.id
WHERE 
    e.salary > m.salary;

--  Duplicate Emails
SELECT 
    email AS Email
FROM 
    Person
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;

--  Delete Duplicate Emails
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);

-- ===============================
-- Task 1: Combine Two Tables
-- ===============================
SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM 
    Person p
LEFT JOIN 
    Address a
ON 
    p.personId = a.personId;

-- ===============================
-- Task 2: Employees Earning More Than Their Managers
-- ===============================
SELECT 
    e.name AS Employee
FROM 
    Employee e
JOIN 
    Employee m
ON 
    e.managerId = m.id
WHERE 
    e.salary > m.salary;

-- ===============================
-- Task 3: Find Duplicate Emails
-- ===============================
SELECT 
    email AS Email
FROM 
    Person
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;

-- ===============================
-- Task 4: Delete Duplicate Emails (Keep Lowest ID)
-- ===============================
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);

-- ===============================
-- Task 5: Boys and Girls Table Creation and Inserts
-- ===============================

-- Create Boys table
CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

-- Create Girls table
CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

-- Insert data into Boys
INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  

-- Insert data into Girls
INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

-- ===============================
-- Task 6: Total over 50 and Least Weight
-- ===============================
-- NOTE: This query assumes the structure of Sales.Orders table from TSQL2012
-- with at least the following columns: CustomerID, Weight, TotalAmount

SELECT 
    CustomerID,
    SUM(TotalAmount) AS TotalOver50,
    MIN(Weight) AS LeastWeight
FROM 
    Sales.Orders
WHERE 
    Weight > 50
GROUP BY 
    CustomerID;

	-- ============================================
-- Cart1 va Cart2 Jadval Solishtirish (FULL JOIN)
-- ============================================

-- Jadval mavjud bo‘lsa, o‘chirib tashlash
DROP TABLE IF EXISTS Cart1;
DROP TABLE IF EXISTS Cart2;
GO

-- Cart1 jadvalini yaratish
CREATE TABLE Cart1
(
    Item VARCHAR(100) PRIMARY KEY
);
GO

-- Cart2 jadvalini yaratish
CREATE TABLE Cart2
(
    Item VARCHAR(100) PRIMARY KEY
);
GO

-- Cart1 ga ma’lumot kiritish
INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

-- Cart2 ga ma’lumot kiritish
INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

-- ============================================
-- Kutilgan natija: FULL OUTER JOIN bilan
-- ============================================

SELECT 
    c1.Item AS [Item Cart 1],
    c2.Item AS [Item Cart 2]
FROM 
    Cart1 c1
FULL OUTER JOIN 
    Cart2 c2
ON 
    c1.Item = c2.Item;
	| Item Cart 1 | Item Cart 2 |
|-------------|-------------|
| Sugar       | Sugar       |
| Bread       | Bread       |
| Juice       | NULL        |
| Soda        | NULL        |
| Flour       | NULL        |
| NULL        | Butter      |
| NULL        | Cheese      |
| NULL        | Fruit       |

-- ========================================
-- Match1 Jadvali: Yevropa Futbol Natijalari
-- ========================================

-- Agar jadval mavjud bo‘lsa, uni o‘chirib tashlaydi
DROP TABLE IF EXISTS match1;
GO

-- Jadvalni yaratish
CREATE TABLE match1 (
    MatchID INT PRIMARY KEY,        -- Har bir o‘yinning noyob identifikatori
    Match VARCHAR(30),              -- O‘yin ishtirokchilari (masalan: Italy-Spain)
    Score VARCHAR(5)                -- Hisob (masalan: 2:0)
);
GO

-- Jadvalga ma’lumot kiritish
INSERT INTO match1 (MatchID, Match, Score) VALUES 
    (1, 'Italy-Spain',    '2:0'),
    (2, 'Spain-France',   '2:1'),
    (3, 'France-Belgium', '0:0'),
    (4, 'Belgium-Spain',  '2:2'),
    (5, 'Belgium-Italy',  '0:3'),
    (6, 'Italy-France',   '2:0');
GO

-- ================================================
-- Customers who never placed an order
-- ================================================

-- Jadval mavjud bo‘lsa, o‘chiriladi
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
GO

-- Customers jadvalini yaratish
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
GO

-- Orders jadvalini yaratish
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT FOREIGN KEY REFERENCES Customers(id)
);
GO

-- Customers jadvaliga ma’lumot kiritish
INSERT INTO Customers (id, name) VALUES 
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');
GO

-- Orders jadvaliga ma’lumot kiritish
INSERT INTO Orders (id, customerId) VALUES 
(1, 3),
(2, 1);
GO

-- ================================================
-- Mijozlardan hech qachon buyurtma bermaganlarini chiqarish
-- ================================================

SELECT 
    name AS Customers
FROM 
    Customers
WHERE 
    id NOT IN (
        SELECT customerId FROM Orders
    );

	-- ================================================
-- Customers va Orders jadvallarini yaratish va ma’lumot kiritish
-- ================================================

-- Customers jadvalini yaratish
CREATE TABLE Customers (
    id INT,
    name VARCHAR(255)
);

-- Orders jadvalini yaratish
CREATE TABLE Orders (
    id INT,
    customerId INT
);

-- Customers jadvalidagi mavjud ma’lumotlarni tozalash
TRUNCATE TABLE Customers;

-- Customers jadvaliga ma’lumot kiritish
INSERT INTO Customers (id, name) VALUES (1, 'Joe');
INSERT INTO Customers (id, name) VALUES (2, 'Henry');
INSERT INTO Customers (id, name) VALUES (3, 'Sam');
INSERT INTO Customers (id, name) VALUES (4, 'Max');

-- Orders jadvalidagi mavjud ma’lumotlarni tozalash
TRUNCATE TABLE Orders;

-- Orders jadvaliga ma’lumot kiritish
INSERT INTO Orders (id, customerId) VALUES (1, 3);
INSERT INTO Orders (id, customerId) VALUES (2, 1);

-- ==================================================
-- Exam Attendance Report: Students x Subjects matrix
-- ==================================================

-- Jadval mavjud bo‘lsa, uni o‘chiradi
DROP TABLE IF EXISTS Examinations;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Students;
GO

-- Students jadvali
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);
GO

-- Subjects jadvali
CREATE TABLE Subjects (
    subject_name VARCHAR(255) PRIMARY KEY
);
GO

-- Examinations jadvali
CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(255)
);
GO

-- Students jadvaliga ma’lumot kiritish
INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');
GO

-- Subjects jadvaliga ma’lumot kiritish
INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');
GO

-- Examinations jadvaliga ma’lumot kiritish
INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');
GO

-- =============================================
-- Har bir talaba har bir fan bo‘yicha nechta imtihonda qatnashgan
-- =============================================
SELECT 
    s.student_id,
    s.student_name,
    subj.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects subj
LEFT JOIN 
    Examinations e
    ON s.student_id = e.student_id AND subj.subject_name = e.subject_name
GROUP BY 
    s.student_id, s.student_name, subj.subject_name
ORDER BY 
    s.student_id, subj.subject_name;

	-- ==========================================
-- Exam Data Setup: Students, Subjects, Exams
-- ==========================================

-- Jadvalni yaratish
CREATE TABLE Students (
    student_id INT,
    student_name VARCHAR(20)
);

CREATE TABLE Subjects (
    subject_name VARCHAR(20)
);

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(20)
);

-- Jadvaldagi mavjud ma’lumotlarni tozalash
TRUNCATE TABLE Students;

-- Ma’lumot kiritish: Students
INSERT INTO Students (student_id, student_name) VALUES 
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

-- Subjects jadvalidagi ma’lumotlarni tozalash
TRUNCATE TABLE Subjects;

-- Ma’lumot kiritish: Subjects
INSERT INTO Subjects (subject_name) VALUES 
('Math'),
('Physics'),
('Programming');

-- Examinations jadvalidagi ma’lumotlarni tozalash
TRUNCATE TABLE Examinations;

-- Ma’lumot kiritish: Examinations
INSERT INTO Examinations (student_id, subject_name) VALUES 
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');