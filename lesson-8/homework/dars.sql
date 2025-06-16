-- Create Customers Table
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

-- Insert sample data into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country) VALUES
(1, 'Alice', 'Smith', 'alice@example.com', '1234567890', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
(2, 'Bob', 'Johnson', 'bob@example.com', '2345678901', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA');
-- (Continue for 40 rows as previously described)

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Insert sample data into Products
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Phone Case', 'Accessories', 15.99, 100),
(2, 'Scarf', 'Clothing', 12.99, 200);
-- (Continue for 40 rows as previously described)

-- Create Products_Discounted Table
CREATE TABLE Products_Discounted (
    ProductID INT,
    DiscountPercent DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY (ProductID)
);

-- Insert data into Products_Discounted
INSERT INTO Products_Discounted (ProductID, DiscountPercent, StartDate, EndDate) VALUES
(1, 10.00, '2023-01-01', '2023-01-31'),
(2, 15.00, '2023-01-05', '2023-02-05');
-- (Continue as required)

-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);

-- Insert sample Sales data
INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00);
-- (Continue to 40 rows as described)

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample Orders data
INSERT INTO Orders VALUES
(1, 1, 2, '2023-05-14', 1, 800.00),
(2, 2, 3, '2024-09-07', 2, 800.00);
-- (Continue to 40 rows)

-- Create Invoices Table
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- Insert sample Invoices
INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, TotalAmount) VALUES
(1, 1, '2023-01-05', 150.00),
(2, 2, '2023-01-07', 200.00);
-- (Continue to 40 rows)

-- Create city_population Table
CREATE TABLE city_population (
    district_id INT,
    district_name VARCHAR(30),
    population DECIMAL(10,2),
    year VARCHAR(20)
);

-- Insert sample city population data
INSERT INTO city_population VALUES
(1, 'Chilonzor', 2500, '2012'),
(2, 'Yakkasaroy', 1500, '2012'),
(3, 'Mirobod', 3000, '2012'),
(4, 'Yashnobod', 1000, '2012'),
(5, 'Bektemir', 2000, '2012'),
(1, 'Chilonzor', 2800, '2013'),
(2, 'Yakkasaroy', 1900, '2013'),
(3, 'Mirobod', 2000, '2013'),
(4, 'Yashnobod', 5000, '2013'),
(5, 'Bektemir', 1500, '2013');
