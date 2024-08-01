--Cau 2
use Northwind
go

select*
from Customers
	inner join Orders
		on Customers.CustomerID = Orders.CustomerID;