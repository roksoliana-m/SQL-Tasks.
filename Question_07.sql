/****** Calculate the greatest, the smallest and the average age of the employees for each city******/
Select MAX((year(sysdatetime()) - year(BirthDate))) as MaxAge
, Min((year(sysdatetime()) - year(BirthDate))) as MinAge
, Avg ((year(sysdatetime()) - year(BirthDate))) as AvgAge
, City
, Count(LastName) as NumberOfEmployees
From Employees
Group by City
