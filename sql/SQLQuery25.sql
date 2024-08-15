use Northwind
go

select COUNT(od.Quantity) as [TongSoDonHang]
from Orders as o
	inner join [Order Details] as od
		on o.OrderID = od.OrderID
where o.ShipCountry in ('Belgium', 'Canada', 'UK');
