SELECT 
      FirstName
	  ,LastName
FROM Employees
WHERE city='London';



SELECT 
       FirstName
	  ,LastName
FROM Employees
where BirthDate in (
			SELECT min(BirthDate)
			FROM Employees)
;



SELECT *
FROM Orders
where ShippedDate > RequiredDate
and (ShippedDate > ('1997-01-01 00:00:00.000')
and ShippedDate < ('1998-01-01 00:00:00.000')
)



SELECT *
FROM Orders
where ShippedDate > RequiredDate
and (ShippedDate > ('1997-01-01 00:00:00.000')
and ShippedDate < ('1998-01-01 00:00:00.000')
)




SELECT 
       FirstName
	  ,LastName
	  ,COUNT(1)
FROM Employees E
LEFT JOIN Orders O On E.EmployeeID = O.EmployeeID
where O.ShippedDate > O.RequiredDate
and (O.ShippedDate > ('1997-01-01 00:00:00.000')
and O.ShippedDate < ('1998-01-01 00:00:00.000')
)
group by 
       FirstName
	  ,LastName
order by 1 



select * from Customers where Country = 'France'

select * from Products p join Suppliers s on p.SupplierID = s.SupplierID
where s.Country != 'France'

select O.CustomerID, OD.ProductID, O.ShipCountry, s.Country, p.ProductID
from orders O 
	join [Order Details] OD on O.OrderID = OD.OrderID
	join Products p on od.ProductID = P.ProductID
	join Suppliers s on p.SupplierID = s.SupplierID
where s.Country != 'France'


select * from Products where ProductID = 60
select * from Suppliers where SupplierID = 28



select 
	c.CustomerID, c.CompanyName, c.Country
from Customers C
where Country = 'France'
AND CustomerID IN (
	select DISTINCT O.CustomerID--, OD.ProductID 
	from orders O 
		join [Order Details] OD on O.OrderID = OD.OrderID
		join Products p on od.ProductID = P.ProductID
		join Suppliers s on p.SupplierID = s.SupplierID
	where s.Country != 'France'
	)
;

----------------------------------------------
select * from Employees;

select * from Customers;

select * from Orders;




select	distinct
		--O.EmployeeID, 
		--E.FirstName, E.LastName as Employee_name, 
		E.City as EmloyeeCity,
		--C.ContactName, 
		C.City as CustomerCity,
		O.ShipCity as WhereOrderMadeTo
from Orders O
left join Employees E on O.EmployeeID = E.EmployeeID
left join Customers C on O.CustomerID = C.CustomerID
order by 1,2,3
;














