-- Cau 15
use Northwind
go

select Customers.CompanyName, Customers.ContactName, Customers.Phone, Customers.Fax, Customers.Country
from Customers
where Customers.Country not in ('Brazil', 'Italy', 'Spain', 'Venezuela', 'UK');