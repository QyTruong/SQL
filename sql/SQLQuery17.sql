-- Cau 17
use Northwind
go

select 
	Orders.OrderID, Customers.CompanyName, Employees.LastName, Orders.OrderDate, Orders.RequiredDate, Orders.ShipCountry, Orders.Freight
from Customers
	inner join Orders
		on Customers.CustomerID = Orders.OrderID
	inner join Employees
		on Orders.EmployeeID = Employees.EmployeeID
where 
	Orders.OrderDate = GETDATE() or Orders.RequiredDate = GETDATE();