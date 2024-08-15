use Northwind
go

select 
	top 50 percent
	p.ProductID,
	p.ProductName,
	p.UnitPrice
from Products as p
order by p.UnitPrice desc;