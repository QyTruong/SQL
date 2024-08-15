use Northwind
go

select c.CategoryName, SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) as [DoanhSo]
from Categories as c
	inner join Products as p
		on c.CategoryID = p.CategoryID
	inner join [Order Details] as od
		on p.ProductID = od.ProductID
	inner join Orders as o
		on od.OrderID = o.OrderID
where YEAR(o.OrderDate) in ('1996')
group by c.CategoryName