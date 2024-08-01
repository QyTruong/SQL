-- Cau 9
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
	YEAR(Orders.OrderDate) % 2 = 0;