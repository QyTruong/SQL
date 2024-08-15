use Northwind
go

select c.CategoryID, c.CategoryName, AVG(p.UnitPrice) as DonGiaTrungBinh
from Products as p
	inner join Categories as c
		on p.CategoryID = c.CategoryID
where p.UnitPrice > 30
group by c.CategoryID, c.CategoryName;
