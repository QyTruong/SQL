-- Cau 16
use Northwind
go

select Orders.OrderID, Customers.CompanyName, Employees.LastName, Orders.OrderDate, Orders.ShipCountry, Orders.ShippedDate, Orders.Freight
from Customers
	inner join Orders
		on Customers.CustomerID = Orders.CustomerID
	inner join Employees
		on Orders.EmployeeID = Employees.EmployeeID
where
	(Orders.ShipCountry = 'USA' and Orders.Freight > 300) or (Orders.ShipCountry = 'Argentina' and Orders.Freight < 5);