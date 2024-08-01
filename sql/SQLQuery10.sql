-- Cau 10
use Northwind
go

select 
	OrderID, OrderDate,
	Customers.CompanyName, Employees.LastName
from Customers
	inner join Orders
		on Customers.CustomerID = Orders.CustomerID
	inner join Employees
		on Orders.EmployeeID = Employees.EmployeeID
where 
	day(Orders.OrderDate) in (5,13,14,23);