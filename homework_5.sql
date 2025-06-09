---Employees jadvalidan eng yuqori 5 xodimni tanlang:

SELECT TOP 5 * FROM Employees;

-- Bu so‘rov Employees jadvalidan birinchi 5 ta yozuvni tanlaydi. Odatda bu tartiblangan ma’lumotlar bilan birga ishlatiladi.

--Products jadvalidan yagona (takrorlanmas) Category qiymatlarini tanlang:

SELECT DISTINCT Category FROM Products;

---DISTINCT faqat takrorlanmas qiymatlarni ko‘rsatadi.

--SELECT * FROM Products WHERE Price > 100;
SELECT * FROM Products WHERE Price > 100;

--Izoh: WHERE yordamida Price > 100 shartini qo‘llab filtrlanmoqda.

--Ismi 'A' harfi bilan boshlanadigan mijozlarni ko‘rsatish:

SELECT * FROM Customers WHERE FirstName LIKE 'A%';
--Izoh: LIKE operatori A% bilan boshlanadigan matnlarni izlaydi.


--Products jadvalidagi natijalarni Price bo‘yicha o‘sish tartibida saralash:

SELECT * FROM Products ORDER BY Price ASC;

--Izoh: ORDER BY bilan saralash; ASC – o‘sish tartibida.

--Maoshi 90000 yoki undan yuqori va bo‘limi 'HR' bo‘lgan xodimlarni ko‘rsatish:

SELECT * FROM Employees WHERE Salary >= 95000 AND Department = 'HR';

--Izoh: Bir nechta shartlarni AND bilan birlashtirish.

select * from (Email,'noemail@example.com') AS Email FROM Employees;


--Izoh: ISNULL yordamida NULL qiymatni default qiymat bilan almashtirish.


--Narxi 10$ va 100$ oralig‘ida bo‘lgan mahsulotlarni ko‘rsatish:
SELECT * FROM Products where  price  BETWEEN   70 AND 100;

--Izoh: BETWEEN ikkita qiymat orasidagi ma’lumotlarni olib keladi.


--Category va ProductName ustunlari bo‘yicha yagona qiymatlarni tanlash:

SELECT DISTINCT Category, ProductName FROM Products;


---Yuqoridagi so‘rovga ProductName bo‘yicha kamayish tartibida saralash qo‘shish:

SELECT DISTINCT Category, ProductName FROM Products ORDER BY ProductName DESC;


---Products jadvalidan eng qimmat 15 mahsulotni ko‘rsatish:

SELECT TOP 10 * FROM Products ORDER BY Price DESC;


--Xodimlarda FirstName yoki LastName ustunlaridan birinchi bo‘sh bo‘lmaganini ko‘rsatish:

SELECT COALESCE (FirstName, LastName) 
AS  Name FROM Employees;


---Izoh: COALESCE birinchi NULL bo‘lmagan qiymatni qaytaradi.
select distinct ategory, Price from Products;


--Yoshi 90–100 orasida yoki bo‘limi 'Marketing' bo‘lgan xodimlar:

select * from  Employees where (Age  between 90 and 100) or Department = 'Marketing';


---Xodimlar jadvalidan 11-20 qatorlarni ko‘rsatish (Salary bo‘yicha kamayish tartibida):

SELECT * FROM Employees ORDER BY Salary 
DESC OFFSET 10 ROWS FETCH NEXT 15 ROWS ONLY;


--Narxi 1000 dan kam va zaxirasi 50 dan ko‘p bo‘lgan mahsulotlar (Stock bo‘yicha saralangan):

select * from Products where Price  <=7000 and Stock > 50 order by Stock asc;


--Nomi ichida 'e' harfi bor mahsulotlar:


SELECT * FROM Employees WHERE Department IN  ('HR', 'IT', 'Finance');


---Customers jadvalidagi natijalarni City bo‘yicha o‘sish va PostalCode bo‘yicha kamayish tartibida saralash:

SELECT * FROM Customers ORDER BY City ASC ,  Postalcode DESC;

---Eng ko‘p sotilgan TOP 5 mahsulot (SalesAmount bo‘yicha)

select  top 5 * from  Products order by  Saleamount DESC;


---FirstName va LastName ustunlarini birlashtirib, FullName sifatida chiqarish: