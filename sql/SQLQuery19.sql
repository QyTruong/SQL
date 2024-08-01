-- Cau 19
use Northwind
go

select 
	Another.OrderID, p.ProductName,
	od.UnitPrice, od.Quantity,
	Another.ThanhTien,
	od.Discount,
	Another.TienGiam,
	Another.ThanhTien - Another.TienGiam as [Tien Phai Tra]
from Products as p
	inner join
	(
		select 
			od.OrderID,
			od.ProductID,
			od.Quantity * od.UnitPrice as [ThanhTien],
			(od.Quantity * od.UnitPrice) * od.Discount as [TienGiam]
		from [Order Details] as od
	) Another
		on Another.ProductID = p.ProductID
	inner join [Order Details] as od
		on Another.OrderID = od.OrderID
		and another.ProductID = od.ProductID
	inner join Orders as o
		on od.OrderID = o.OrderID
where 
	o.OrderDate between '1997-01-01' and '1997-12-31';

	

