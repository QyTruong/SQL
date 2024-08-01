-- Cau 14
use Northwind
go

select Customers.CompanyName, Customers.ContactName, Customers.Phone, Customers.Fax, Customers.Country
from Customers
where (not Customers.Country = 'USA');
