use Northwind
go

select
	c.CompanyName, 
	o.Freight, 
	SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) as [TongTienHang],
	SUM(o.Freight)/SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) as [TyLeCuoc]
from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID
	inner join [Order Details] as od
		on o.OrderID = od.OrderID
where YEAR(o.OrderDate) in ('1997')
group by c.CompanyName, o.Freight