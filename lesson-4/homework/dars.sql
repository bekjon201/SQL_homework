create database lesson_4_homework
GO
use [lesson_4_homework]

             -- Eng yuqori 5 ta xodimni tanlash:
SELECT TOP 5* FROM Employees;

             --Products jadvalidan noyob CategoryName qiymatlarini tanlash
SELECT DISTINCT CategoryName FROM Products;

             --(takroriy). Noyob Category qiymatlarini tanlash:


SELECT DISTINCT Category FROM Products;

               ---- Narxi 100 dan katta mahsulotlarni chiqarish:

SELECT * FROM Products WHERE Price > 100;


               --Ismi "A" harfi bilan boshlanadigan mijozlarni tanlash:

SELECT * FROM Customers WHERE FirstName LIKE 'A%';

               -- Mahsulotlarni narxi bo‘yicha o‘sish tartibida saralash:

SELECT * FROM Products ORDER BY Price ASC;

               --Maoshi 60000 yoki undan yuqori bo‘lgan va HR bo‘limidagi xodimlar::
SELECT * FROM Employees WHERE Salary >= 60000 AND Department = 'HR';

                --Email ustunidagi NULL qiymatlarni "noemail@example.com" bilan almashtirish:
SELECT ISNULL(Email, 'noemail@example.com') AS Email FROM Employees;


                 -- Narxi 50 va 100 oralig‘ida bo‘lgan mahsulotlar:

SELECT * FROM Products WHERE Price BETWEEN 50 AND 100;


               --Category va ProductName ustunlaridagi noyob qiymatlar:

SELECT DISTINCT Category, ProductName FROM Products;


                --Yuqoridagi natijalarni ProductName bo‘yicha kamayish tartibida saralash:

SELECT DISTINCT Category, ProductName FROM Products ORDER BY ProductName DESC;


                  ---Medium



                 --- Eng qimmat 20 ta mahsulotni tanlash:

SELECT  top 20 * from Products
order by Price desc ;


                      --FirstName yoki LastName dan birinchi NULL bo‘lmagan qiymatni ko‘rsatish:

SELECT COALESCE(FirstName, LastName) AS Name
FROM Employees;



                    --Noyob Category va Price kombinatsiyalarini chiqarish:

SELECT DISTINCT Category, Price FROM Products;


                     ----Yoshi 30–40 oralig‘ida yoki bo‘limi Marketing bo‘lgan xodimlar:
SELECT * FROM Employees

with (AGE BETWEEN 30 AND 40) OR Department = 'Marketing';

                       ---15.  11-dan 20-gacha bo‘lgan xodimlarni maosh bo‘yicha kamayish tartibida tanlash:

SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;


                        ---Narxi 1000 dan kam va zaxirasi 50 dan ko‘p mahsulotlar (zaxira bo‘yicha o‘sish tartibida):


select * FROM Products
WHERE Price <=1000 and Stock >50
ORDER BY Stock ASC;

                    --Nomi ichida e harfi bor mahsulotlar:


SELECT * FROM Products
WHERE ProductNAME  LIKE '%E%';

                    ---HR, IT yoki Finance bo‘limidagi xodimlar:


SELECT * FROM Employees
ORDER BY City ASC, PostalCode desc;

                    --- Qiyin (Advanced) darajadagi topshiriqlar

select top 5 * from Products
order by SalesAmount DESC  


                ---FirstName va LastName ni bir ustunga FullName deb birlashtirish:

select  FirstName + ' ' + LastName AS FullName
from Employees;


                 --Narxi 50 dan yuqori bo‘lgan mahsulotlar uchun noyob Category, ProductName, Price:
SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;


                    --Narxi o‘rtacha narxning 10% dan kam bo‘lgan mahsulotlar:

SELECT * FROM Products
where Price <(SELECT AVG (Price )* 0.1 FROM Products);



.                      --Yoshi 40 dan kichik va HR yoki IT bo‘limida ishlaydigan xodimlar:
SELECT * FROM Employees
WHERE AGE < 40 AND  Department IN ('HR','IT');


                     ---Emaili @gmail.com domeni bilan tugaydigan mijozlar:
 SELECT * FROM  Customers

WHERE Email LIKE '%@gmail.com%';


                        ---Maoshi Sales bo‘limidagi barcha xodimlardan ko‘p bo‘lgan xodimlar:

 SELECT * FROM Employees

 where salary >all  (
 
SELECT Salary FROM Employees WHERE Department = 'Sales'
);


                ---So‘nggi 180 kun ichida berilgan buyurtmalar:ss

SELECT * FROM Orders
where  OrderDate between DATEADD(day ,-180 ,GETDATE()) and GETDATE();s
