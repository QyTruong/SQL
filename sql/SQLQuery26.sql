use Northwind
go

select o.ShipCountry ,COUNT(*) as [SoDonHangCuaCacDH]
from Orders as o
where o.ShipCountry in ('Belgium', 'Canada', 'UK')
group by o.ShipCountry;