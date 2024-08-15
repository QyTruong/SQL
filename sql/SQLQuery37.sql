use Northwind
go

drop table if exists Customers1

select top 20*
into Customers1
from Customers
where Customers.Country in ('USA', 'UK');

