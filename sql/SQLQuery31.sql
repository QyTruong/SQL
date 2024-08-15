use Northwind
go

select
	top 39
	p.ProductID,
	p.ProductName,
	p.UnitPrice
from Products as p
order by p.UnitPrice desc;