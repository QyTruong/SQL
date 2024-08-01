-- Cau 13
use Northwind
go

select Products.ProductID, Suppliers.CompanyName, Products.UnitPrice, Products.UnitsInStock, Products.Discontinued
from Suppliers
	inner join Products
		on Suppliers.SupplierID = Products.SupplierID
where
	Products.Discontinued = 1 and Products.UnitsInStock > 0;