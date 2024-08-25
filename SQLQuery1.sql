SELECT *
FROM Employees

SELECT FirstName,LastName,CountryRegionName,City
FROM Employees
WHERE CountryRegionName = 'United States'

SELECT PhoneNumber,JobTitle 
FROM Employees
GROUP BY JobTitle,PhoneNumber

SELECT FirstName + ' '+ LastName AS [name], COUNT(*) AS name_count
FROM Employees
GROUP BY FirstName + ' '+ LastName;

SELECT TOP 1 FirstName, COUNT(*) AS name_count
FROM Employees
GROUP BY FirstName
ORDER BY name_count DESC

SELECT TOP 1 FirstName, COUNT(*) AS name_count
FROM Employees
GROUP BY FirstName
ORDER BY name_count ASC



SELECT TOP 5 City,COUNT(*) AS worker_count
FROM Employees
GROUP BY City
ORDER BY worker_count DESC

SELECT TOP 5 City , COUNT(*) AS unique_specialties
FROM Employees
GROUP BY City
ORDER BY unique_specialties ASC

SELECT FirstName,EmailAddress 
FROM Employees
WHERE MONTH(StartDate) = 1

SELECT YEAR(StartDate),COUNT(*) AS worker_count
FROM Employees
GROUP BY YEAR(StartDate)

SELECT YEAR(StartDate),COUNT(*) AS worker_count,CountryRegionName
FROM Employees
GROUP BY YEAR(StartDate),CountryRegionName
ORDER BY YEAR(StartDate), CountryRegionName

SELECT *
FROM Employees

UPDATE Employees
SET EndDate = h.EndDate
FROM Employees e
JOIN History h ON e.BusinessEntityID = h.BusinessEntityID
WHERE h.EndDate IS NOT NULL

SELECT YEAR(EndDate),COUNT(*) AS worker_count
FROM Employees
GROUP BY YEAR(EndDate)

SELECT FirstName,StartDate,EndDate 
FROM Employees
WHERE DAY(StartDate) - DAY(EndDate) <365