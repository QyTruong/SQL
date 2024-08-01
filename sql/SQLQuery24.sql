-- Cau 24
use Northwind
go

select CategoryID, COUNT(*) as SoLuong, MAX(p.UnitPrice) as DonGiaCaoNhat, MIN(p.UnitPrice) as DonGiaThapNhat, AVG(p.UnitPrice) as DonGiaTrungBinh
from Products as p
group by CategoryID;