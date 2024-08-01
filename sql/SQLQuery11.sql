-- Cau 11
use Northwind
go

select
	Orders.OrderID, Orders.OrderDate, Customers.CompanyName, Orders.Freight
from Customers
	inner join Orders
		on Customers.CustomerID = Orders.CustomerID
	inner join Employees
		on Orders.EmployeeID = Employees.EmployeeID
where 
	(Orders.ShipCountry = 'UK') and (Employees.EmployeeID = '2') and YEAR(orders.OrderDate) in ('1997');
