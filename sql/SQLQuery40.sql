use Northwind
go

update Customers1
set ContactName = 'Lê Thanh Bình', City = N'Hà N?i', Phone = '0111222333'
where Customers1.CustomerID = 'HGNG';

