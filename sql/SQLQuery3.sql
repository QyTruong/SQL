--Cau 
use Northwind
go

select 
	Customers.CustomerID, Customers.CompanyName, Customers.ContactName,
	Customers.Address, Customers.Country, Customers.City
from Customers
where Customers.Country = 'France' or Customers.City = 'London'
order by customers.Country;