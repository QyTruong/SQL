-- Cau 6
use Northwind
go

select	Orders.OrderID, Orders.OrderDate,
		Customers.CompanyName, Employees.LastName
from Customers
	inner join Orders
		on Customers.CustomerID = Orders.CustomerID
	inner join Employees
		on Orders.EmployeeID = Employees.EmployeeID
where
	Orders.OrderDate between '1997-01-01' and '1997-06-30';
