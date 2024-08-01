-- Cau 22
use Northwind
go

select 
	(e.TitleOfCourtesy + e.LastName + e.FirstName) as [Ho Ten], e.HireDate, e.Title,
	e.BirthDate, e.HomePhone
from Employees as e
where YEAR(e.HireDate) < '1993'