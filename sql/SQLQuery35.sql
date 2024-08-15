use Northwind
go

select
	c.*
from Customers as c
	inner join Orders as o
		on c.CustomerID = o.CustomerID
	inner join [Order Details] as od
		on o.OrderID = od.OrderID
where od.Quantity is NULL;