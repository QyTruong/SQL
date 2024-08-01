-- Cau 21
use Northwind
go

select p.ProductID, p.ProductName, s.CompanyName, p.UnitPrice, p.UnitsInStock, (p.UnitPrice * p.UnitsInStock) as TriGia
from Suppliers as s
	inner join Products as p
		on s.SupplierID = p.SupplierID
where p.Discontinued = 1 and p.UnitsInStock > 0;