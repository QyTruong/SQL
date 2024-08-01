-- Cau 7
use Northwind
go

select OrderID, OrderDate,
		Customers.CompanyName, Employees.LastName
from Customers
	inner join Orders
		on Customers.CustomerID = Orders.CustomerID
	inner join Employees
		on Orders.EmployeeID = Employees.EmployeeID
where
	Orders.OrderDate between '1997-02-01' and '1997-02-28';
