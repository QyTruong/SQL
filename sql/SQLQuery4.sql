-- Cau 4
use Northwind
go 

select 
		Customers.CustomerID, Customers.CompanyName, Customers.ContactName,
		Customers.Address, Customers.Country, Customers.City, Customers.ContactTitle
from Customers
where ContactTitle = 'Sales Manager' or ContactTitle = 'Owner' and Country = 'USA' or Country = 'Mexico'
order by country;