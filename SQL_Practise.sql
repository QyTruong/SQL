use NORTHWND
go

-- Bài 1
select *
from Customers, Orders;

-- Bài 2
select *
from Customers
	inner join Orders
		on Customers.CustomerID = Orders.CustomerID;

-- Bài 3
select 
	c.CustomerID, c.CompanyName, c.ContactName,
	c.Address, c.Country, c.City
from Customers as c
where c.Country = 'France' or c.City = 'London'
order by c.Country asc;

-- Bài 4
select 
	c.CustomerID, c.CompanyName, c.ContactName,
	c.Address, c.Country, c.City, c.ContactTitle
from Customers as c
where 
	(c.Country = 'USA' and c.ContactTitle = 'Sales Manager')
	or (c.Country = 'Mexico' and c.ContactTitle = 'Owner')
order by c.Country desc;

-- Bài 5
select
	c.CustomerID, c.CompanyName, c.ContactName,
	c.Address, c.Country, c.City, c.ContactTitle
from Customers as c
where 
	(c.Country = 'USA' and c.ContactTitle = 'Manager')
	or not (c.Country = 'Mexico' and c.ContactTitle = 'Owner')

-- Bài 6
select 
	o.OrderID, o.OrderDate,
	c.CompanyName, e.LastName
from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where 
	o.OrderDate between '1997-06-01' and '1997-06-30';
		
-- Bài 7
select 
	o.OrderID, o.OrderDate,
	c.CompanyName, e.LastName
from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where
	o.OrderDate between '1997-02-01' and '1997-02-28';

-- Bài 8
select 
	o.OrderID, o.OrderDate,
	c.CompanyName, e.LastName
from Customers as c
	inner join Orders as o
		on o.CustomerID = c.CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where
	MONTH(o.OrderDate) = 4;

-- Bài 9
select 
	o.OrderID, o.OrderDate,
	c.CompanyName, e.LastName
from Customers as c
	inner join Orders as o
		on o.CustomerID = c.CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where 
	YEAR(o.OrderDate) % 2 = 0;

-- Bài 10
select 
	o.OrderID, o.OrderDate,
	c.CompanyName, e.LastName
from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where
	DAY(o.OrderDate) in (5,13,14,23);

-- Bài 11
select 
	o.OrderID, o.OrderDate,
	c.CompanyName, o.Freight
from Customers as c
	inner join Orders as o
		on o.CustomerID = c.CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where 
	(o.ShipCountry = 'UK') and (e.EmployeeID = 2) and (YEAR(o.OrderDate) in ('1997'));

-- Bài 12
select 
	p.ProductID, p.ProductName,
	s.CompanyName, c.CategoryName
from Suppliers as s
	inner join Products as p
		on s.SupplierID = p.SupplierID
	inner join Categories as c
		on c.CategoryID = p.CategoryID
where 
	p.ProductName like 'Ch%';

-- Bài 13
select 
	p.ProductID, s.CompanyName,
	p.UnitPrice, p.UnitsInStock,
	p.Discontinued
from Suppliers as s
	inner join Products as p
		on s.SupplierID = p.SupplierID
	inner join Categories as c
		on p.CategoryID = c.CategoryID
where
	(p.Discontinued = 1) and (p.UnitsInStock > 0);

-- Bài 14
select	
	c.CompanyName, c.ContactName,
	c.Country, c.Phone, c.Fax
from Customers as c
where c.Country not in ('USA');

-- Bài 15
select
	c.CompanyName, c.ContactName, c.Country,
	c.Phone, c.Fax
from Customers as c
where c.Country not in 
		('Brazil', 'Italy', 'Spain', 'Venezuela', 'UK');
	
-- Bài 16
select 
	o.OrderID, c.CompanyName, e.LastName,
	o.OrderDate, o.ShipCountry, o.ShippedDate,
	o.Freight
from Customers as c
	inner join Orders as o
		on c.CustomerID = o .CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where
	(o.ShipCountry = 'USA') and (o.Freight > 300)
	or (o.ShipCountry = 'Argentina') and (o.Freight < 5);

-- Bài 17
select 
	o.OrderID, c.CompanyName, e.LastName,
	o.OrderDate, o.RequiredDate, o.ShipCountry,
	o.Freight
from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where o.OrderDate = GETDATE() or o.RequiredDate = GETDATE();

-- Bài 18
select 
	o.OrderID, OrderDate, c.CompanyName,
	e.LastName, o.Freight, o.Freight*(1+0.1) as NewFrieght
from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID
	inner join Employees as e
		on o.EmployeeID = e.EmployeeID
where 
	(MONTH(o.OrderDate) in ('4')) and (YEAR(o.OrderDate) in ('1997'));

-- Bài 19
select 
	o.OrderID, p.ProductID, od.UnitPrice,
	od.Quantity, CalMoney.ThanhTien, od.Discount,
	CalMoney.TienGiamGia,
	CalMoney.ThanhTien-CalMoney.TienGiamGia as [TienPhaiTra]
from Products as p
	inner join 
	(
		select 
			od.OrderID, od.ProductID,
			od.Quantity*od.UnitPrice as [ThanhTien],
			(od.Quantity*od.UnitPrice)*od.Discount as [TienGiamGia]
		from [Order Details] as od
	) CalMoney
		on CalMoney.ProductID = p.ProductID
	inner join [Order Details] as od
		on CalMoney.OrderID = od.OrderID and CalMoney.ProductID = od.ProductID
	inner join Orders as o
		on od.OrderID = o.OrderID
where YEAR(o.OrderDate) in ('1997');

-- Bài 20
select 
	o.OrderID, p.ProductID, od.UnitPrice,
	od.Quantity, Calmoney.ThanhTien, od.Discount,
	Calmoney.TienGiamGia,
	Calmoney.ThanhTien-Calmoney.TienGiamGia as [TienPhaiTra]
from Products as p
	inner join
	(
		select
			od.OrderID, od.ProductID,
			od.Quantity*od.UnitPrice as [ThanhTien],
			(od.Quantity*od.UnitPrice)*od.Discount as [TienGiamGia]
		from [Order Details] as od
	) Calmoney
		on Calmoney.ProductID = p.ProductID
	inner join [Order Details] as od
		on Calmoney.ProductID = od.ProductID and Calmoney.OrderID = od.OrderID
	inner join Orders as o
		on o.OrderID = od.OrderID
where od.Discount > 0 and (Calmoney.ThanhTien-Calmoney.TienGiamGia < 50);

-- Bài 21
select 
	p.ProductID, p.ProductName, s.CompanyName,
	p.UnitPrice, p.UnitsInStock,
	p.UnitPrice*p.UnitsInStock as [TriGia]
from Suppliers as s
	inner join Products as p
		on s.SupplierID = p.SupplierID
where (p.Discontinued = 1) and (p.UnitsInStock > 0);

-- Bài 22
select 
	(e.TitleOfCourtesy + SUBSTRING(e.LastName,1,1) + ' ' + e.FirstName) as [HoTen],
	e.HireDate, e.Title, e.BirthDate, e.HomePhone
from Employees as e
where YEAR(e.HireDate) <= '1993';

-- Bài 23
select 
	COUNT(*) as [SoSanPham], MAX(p.UnitPrice) as [DonGiaCaoNhat],
	MIN(p.UnitPrice) as [DonGiaThapNhat], AVG(p.UnitPrice) as [DonGiaTrungBinh]
from Products as p;

-- Bài 24
select
	CategoryID,
	COUNT(*) as [SoSanPham], MAX(p.UnitPrice) as [DonGiaCaoNhat],
	MIN(p.UnitPrice) as [DonGiaThapNhat], AVG(p.UnitPrice) as [DonGiaTrungBinh]
from Products as p
group by CategoryID;

-- Bài 25
select COUNT(od.Quantity) as [TongSoDonHang]
from Orders as o
	inner join [Order Details] as od
		on o.OrderID = od.OrderID
where o.ShipCountry in ('Belgium', 'Canada', 'UK');
	

-- Bài 26
select o.ShipCountry, COUNT(od.Quantity)
from Orders as o
	inner join [Order Details] as od
		on o.OrderID = od.OrderID
where o.ShipCountry in ('Belgium', 'Canada', 'UK')
group by ShipCountry;

-- Bài 27
select p.CategoryID, AVG(p.UnitPrice) as [DonGiaTrungBinh]
from Products as p
group by p.CategoryID
having AVG(p.UnitPrice) > 30;

-- Bài 28
select p.CategoryID, AVG(p.UnitPrice) as [DonGiaTrungBinh]
from Products as p
where p.UnitPrice > 30
group by p.CategoryID;

-- Bài 29
select c.CategoryName, SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) as DoanhSo
from Categories as c
	inner join Products as p
		on c.CategoryID = p.CategoryID
	inner join [Order Details] as od
		on p.ProductID = od.ProductID
	inner join Orders as o
		on od.OrderID = o.OrderID
where YEAR(o.OrderDate) in ('1996')
group by c.CategoryName;

-- Bài 30
select *
from Customers as c
	inner join Orders as o
		on o.CustomerID = c.CustomerID
	inner join [Order Details] as od
		on o.OrderID = od.OrderID

-- Bài 31
select top 39 p.ProductID, p.ProductName, p.UnitPrice
from Products as p
order by p.UnitPrice desc;

-- Bài 32
select 
	top 50 percent
	p.ProductID, p.ProductName, p.UnitPrice
from Products as p
order by p.UnitPrice desc;

-- Bài 33
select 
	c.CustomerID, c.CompanyName, 
	MuaNhieuNhat.SoluongDonHang
from Customers as c
	inner join 
	(
		select
			top 10
			o.CustomerID,
			COUNT(o.CustomerID) as [SoluongDonHang]
		from orders as o
		group by CustomerID
		order by [SoluongDonHang] desc
	) MuaNhieuNhat
		on MuaNhieuNhat.CustomerID = c.CustomerID;
		
-- Bài 34
select c.*
from Customers as c
where c.CustomerID in 
	(
		select distinct o.CustomerID
		from Orders as o
	);

-- Bài 35
select c.*
from Customers as c
where c.CustomerID not in 
	(
		select distinct o.CustomerID
		from Orders as o
 	);

-- Bài 36
select *
into Customers1
from Customers;

-- Bài 37
drop table if exists Customers1
select top 20 *
into Customers1
from Customers as c
where c.Country in ('USA', 'UK');

-- Bài 38
select *
from Customers1
delete from Customers1
where Customers1.Country in ('USA');

-- Bài 39
insert into Customers1 ([CustomerID],[CompanyName],[ContactName],[Address],[City],[Region],[PostalCode],[Country],[Phone],[Fax])
values ('HGNG','ABC','Mr(s)','hello', 'MyCity', 'Region132', 'NULL', 'DongLao', '(099)333333','NULL');

-- Bài 40
update Customers1
set ContactName = N'Lê Thanh Bình', City = N'Hà Nội', Phone = '0111222333'
where CustomerID = 'HGNG';

-- Bài 41
update Customers1
set Country = 'Anh'
where Country = 'UK';

-- Bài 42
delete from Customers1;

-- Bài 43
drop table Customers1;

