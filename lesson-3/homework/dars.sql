


---1  BULK INSERT bu nima va nima maqsadda ishlatiladi?
--Ta’rif: BULK INSERT SQL Server’da tashqi fayllardan (odatda .txt, .csv) katta miqdordagi ma’lumotlarni jadvalga tez yuklash uchun ishlatiladi.
--Maqsad: Ma’lumotlarni qo‘lda kiritmasdan, avtomatik ravishda fayldan jadvalga yuklash.

--2
--.txt
--.csv
--.xml
--.json

--3 Products jadvalini yaratish:
create database Products


CREATE TABLE Products (
          ProductID INT PRIMARY KEY,
           ProductName VARCHAR(50),
          Price DECIMAL(10,2)
);
---Products jadvaliga 3 ta yozuv qo‘shish:
         SELECT * FROM Products
             INSERT INTO Products VALUES(1,'Olim',5.00);
             INSERT INTO Products VALUES (2,'Bekjon',6.00);
          INSERT INTO Products  VALUES (2,'ALI',7.00);


   --5 

  --- NULL va NOT NULL o‘rtasidagi farq:
---NULL – qiymat yo‘qligini bildiradi (nomalum yoki mavjud emas).
---NOT NULL – bu ustunda har doim qiymat bo‘lishi kerakligini bildiradi.




--6ProductName ustuniga UNIQUE cheklovi qo‘shish:

             ALTER TABLE Products
               ADD CONSTRAINT  UQ_ProductName UNIQUE(ProductName);
             SELECT * FROM Products

--8 Products jadvaliga CategoryID ustuni qo‘shish:
         ALTER TABLE Products
         ADD CategoryID INT;


--- 9 Categories jadvalini yaratish:
             CREATE TABLE CategoryES(
             CategoryID INT PRIMARY KEY,
             CategoryNAME VARCHAR(50) UNIQUE
);


--10 IDENTITY ustunining vazifasi:
--IDENTITY avtomatik tarzda ketma-ket sonlarni yaratadi (masalan, ID uchun).
--Misol: ProductID INT IDENTITY(1,1) – 1dan boshlaydi, har safar 1ga oshadi.



--MeAdile

---BULK INSERT yordamida mahsulotlar ma’lumotini fayldan yuklash:
               BULK INSERT Products
               FROM "C:\Users\MSI\Desktop\SQL.txt"
               WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = 'ENTER\n');

---Products jadvaliga FOREIGN KEY qo‘shish:

             ALTER TABLE Products

                 ADD CONSTRAINT FK_Category
                 FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

--PRIMARY KEY va UNIQUE KEY o‘rtasidagi farq:  
--PRIMARY KEY: ustun unikal bo‘lishi shart va NULL bo‘lmasligi kerak.
--UNIQUE: ustun unikal bo‘lishi kerak, lekin bitta yoki bir nechta NULL qiymatlar bo‘lishi mumkin.


---Price > 0 bo‘lishi uchun CHECK cheklovi:
              ALTER table Products
              ADD CONSTRAINT  CHK_Price check (Price>0);


--Products jadvaliga Stock ustuni qo‘shish:
                  ALTER TABLE Products 
                  ADD Stock INT NOT NULL DEFAULT 0;

---ISNULL funksiyasidan foydalanish:

                     SELECT ProductNAME ,ISNULL(Price, 0) AS  SafePrice FROM Products;

---FOREIGN KEY cheklovining vazifasi:

---Bu jadval orasidagi bog‘lanishni ta’minlaydi.

---Masalan, mahsulotning CategoryIDsi Categories jadvalidagi mavjud CategoryIDga to‘g‘ri kelishi kerak.


                    Drop  Table  Products

---Murakkab darajadagi topshiriqlar


--Customers jadvali va CHECK (Age ≥ 18):
              Create table Customers(
              CustomerID INT PRIMARY KEY,
              NAME VARCHAR (50) ,
              AGE INT CHECK (AGE>=18)
);

--IDENTITY ustunli jadval (100 dan boshlanib, 10 ga oshadi):
                 CREATE TABLE InvoiceNumbers(
                   InvoiceNumberID INT IDENTITY(100,10) PRIMARY KEY ,
                     Description VARCHAR (100)
 );

 ---OrderDetails jadvalida COMPOSITE PRIMARY KEY:

               CREATE TABLE OrderDetails(
               OrderID INT ,
               ProductID INT,
               Quantity INT,
               PRIMARY KEY (OrderID, ProductID)
   );

--4   ---COALESCE va ISNULL farqi:
---ISNULL – faqat bitta qiymatni tekshiradi va almashtiradi.
--COALESCE – bir nechta qiymat ichidan birinchi NULL bo‘lmaganini tanlaydi.


--5 Employees jadvali: PRIMARY KEY (EmpID), UNIQUE KEY (Email):

               CREATE TABLE Employees (
               EmpID INT  PRIMARY KEY,
               Name VARCHAR (50),
               Email VARCHAR (100) UNIQUE
 );

 --FOREIGN KEY ON DELETE/UPDATE CASCADE bilan:

bekjon TABLE Products
 ADD CONSTRAINT FK_Prod_Cat
  FOREIGN KEY (CategoryID)
   REFERENCES Categories(CategoryID)
    ON DELETE CASCADE
     ON UPDATE CASCADE;
