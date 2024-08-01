-- Cau 23
use Northwind
go

select COUNT(*) as SoLuong, MAX(p.UnitPrice) as DonGiaCaoNhat, MIN(p.UnitPrice) as DonGiaThapNhat, AVG(p.UnitPrice) as DonGiaTrungBinh
from Products as p
