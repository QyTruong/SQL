-- Cau 20
use Northwind
go

select
	Another.OrderID, p.ProductName,
	od.UnitPrice, od.Quantity,
	Another.ThanhTien,
	od.Discount,
	Another.TienGiam,
	Another.TienPhaiTra
from Products as p
	inner join 
	(
		select 
			od.OrderID,
			od.ProductID,
			od.Quantity * od.UnitPrice as ThanhTien,
			(od.Quantity * od.UnitPrice) * od.Discount as TienGiam,
			od.Quantity * od.UnitPrice - (od.Quantity * od.UnitPrice) * od.Discount as TienPhaiTra
			
		from [Order Details] as od
	) Another
		on Another.ProductID = p.ProductID
	inner join [Order Details] as od
		on Another.OrderID = od.OrderID
		and Another.ProductID = od.ProductID
where
	(od.Discount > 0) and (Another.TienPhaiTra < 50);