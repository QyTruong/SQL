--Cau 8
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
	Orders.OrderDate between '1997-04-01' and '1997-04-30';