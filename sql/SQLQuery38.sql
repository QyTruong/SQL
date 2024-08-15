use Northwind
go

select *
from Customers1
delete from Customers1
where Customers1.Country in ('USA');

