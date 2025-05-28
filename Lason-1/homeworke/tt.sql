---1. Define the following terms:

---Data: Raw facts and figures without context. Example: 23, "John", true.

--Database: A structured collection of data stored electronically for easy access, management, and update.

--Relational Database: A type of database that stores data in tables related by keys.

--Table: A collection of related data entries arranged in rows and columns.



--2. Five key features of SQL Server:

--1 High Availability (Always On Availability Groups)

--2 Security (Encryption, Authentication, Roles)

-- 3Business Intelligence tools (SSIS, SSRS, SSAS)

-- 4Transaction Management (ACID compliance)

 --5 Data Tools Integration (with Visual Studio and SSMS)CREATE DATABASE lesson_1;

CREATE DATABASE tt;

USE tt ;

CREATE TABLE Students(

StudentID INT PRIMARY Key,
Name VARCHAR(50),
Age INT 
);

INSERT INTO Students (StudentID, Name, Age)
VALUES
(1, 'Ali', 20),
(2, 'Malika', 22),
(3, 'Sherzod', 21);


