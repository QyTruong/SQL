-- Cau 12
use Northwind
go

select Products.ProductID, Products.ProductName, Suppliers.CompanyName, Categories.CategoryName
from Suppliers
	inner join Products
		on Suppliers.SupplierID = Products.SupplierID
	inner join Categories
		on Products.CategoryID = Categories.CategoryID
where 
	Products.ProductName like 'ch%';

		