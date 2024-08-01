-- Cau 5
use Northwind
go

select 
		Customers.CustomerID, Customers.CompanyName, Customers.ContactName,
		Customers.Address, Customers.Country, Customers.City, Customers.ContactTitle
from Customers
where
	(Customers.ContactTitle = 'Manager' and Customers.Country = 'USA') or
	not (Customers.ContactTitle = 'Owner' and Customers.Country = 'Mexico')
order by Customers.Country;