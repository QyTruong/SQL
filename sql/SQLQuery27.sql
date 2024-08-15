use Northwind
go

select c.CategoryName, AVG(p.UnitPrice) as [DonGiaTrungBinh]
from Products as p
	inner join Categories as c
		on c.CategoryID = p.CategoryID
group by c.CategoryName
Having AVG(p.UnitPrice) > 30;



