use Northwind
go

select 
	top 10
	c.CustomerID,
	c.CompanyName,
	od.Quantity as [SoLuongDonHang]
from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID
	inner join [Order Details] as od
		on o.OrderID = od.OrderID
order by od.Quantity desc;