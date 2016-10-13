SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Oregon';
GO
SELECT p.FirstName,p.LastName,e.MaritalStatus,e.SalariedFlag,e.Gender,e.BirthDate,e.JobTitle
FROM HumanResources.Employee AS e
JOIN Person.Person AS p
ON e.BusinessEntityID = p.BusinessEntityID
WHERE FirstName LIKE 'L%'
go
EXEC dbo.uspGetBillOfMaterials
	@StartProductID = 758, --  int
	@CheckDate = '2000-4-4' --  datetime;
GO
	
EXEC dbo.uspGetEmployeeManagers
	@BusinessEntityID = 5 --  int;
GO	
EXEC dbo.uspGetManagerEmployees
	@BusinessEntityID = 2 --  int
GO
EXEC dbo.uspGetWhereUsedProductID
	@StartProductID = 894, --  int
	@CheckDate = '2000-10-16' --  datetime
GO
SELECT p.FirstName,p.LastName,e.MaritalStatus,e.SalariedFlag,e.Gender,e.BirthDate,e.JobTitle
FROM HumanResources.Employee AS e
JOIN Person.Person AS p
ON e.BusinessEntityID = p.BusinessEntityID
WHERE FirstName LIKE 'S%'
go
DECLARE @ErrorLogID int
EXEC dbo.uspLogError
	@ErrorLogID OUTPUT
GO
EXEC dbo.uspPrintError
GO
EXEC dbo.uspSearchCandidateResumes
	@searchString = N'Manufacture', --  nvarchar(1000)
	@useInflectional = 1, --  bit
	@useThesaurus = 1, --  bit
	@language = 0 --  int
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'California'

SELECT  i.Name
       ,i.type_desc
       ,s.page_count
       ,s.record_count
FROM    sys.indexes i
        JOIN sys.dm_db_index_physical_stats(DB_ID(N'AdventureWorks2008'),
                                            OBJECT_ID(N'Production.Document'),
                                            NULL, NULL, 'DETAILED') AS s
        ON i.index_id = s.index_id
WHERE i.OBJECT_ID = OBJECT_ID(N'Production.Document')
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Nevada'
go
SELECT  p.[Name] AS ProductName
       ,SUM(pod.OrderQty) AS OrderQty
       ,SUM(pod.ReceivedQty) AS ReceivedQty
       ,SUM(pod.RejectedQty) AS RejectedQty
FROM    Purchasing.PurchaseOrderDetail AS pod
        JOIN Production.Product AS p
        ON p.ProductID = pod.ProductID
GROUP BY p.[Name]
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Utah'
GO
SELECT  p.[Name] AS ProductName
       ,SUM(pod.OrderQty) AS OrderQty
       ,SUM(pod.ReceivedQty) AS ReceivedQty
       ,SUM(pod.RejectedQty) AS RejectedQty
FROM    Purchasing.PurchaseOrderDetail AS pod
        JOIN Production.Product AS p
        ON p.ProductID = pod.ProductID
GROUP BY p.[Name]
HAVING (SUM(pod.RejectedQty)/SUM(pod.ReceivedQty)) > .08
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Colorado'
GO
SELECT  p.[Name] AS ProductName
       ,SUM(pod.OrderQty) AS OrderQty
       ,SUM(pod.ReceivedQty) AS ReceivedQty
       ,SUM(pod.RejectedQty) AS RejectedQty
FROM    Purchasing.PurchaseOrderDetail AS pod
        JOIN Production.Product AS p
        ON p.ProductID = pod.ProductID
WHERE p.[Name] LIKE 'Chain%'
GROUP BY p.[Name];
GO
SELECT * FROM dbo.ErrorLog AS el
WHERE ErrorTime = '10/5/2008'
GO
SELECT p.FirstName,p.LastName,e.MaritalStatus,e.SalariedFlag,e.Gender,e.BirthDate,e.JobTitle
FROM HumanResources.Employee AS e
JOIN Person.Person AS p
ON e.BusinessEntityID = p.BusinessEntityID
WHERE FirstName LIKE 'J%'
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Kansas'
GO
SELECT  p.ProductID,
        p.[Name],
        p.StandardCost,
        p.[Weight],
        ROW_NUMBER() OVER (ORDER BY p.Name DESC) AS RowNumber
FROM    Production.Product p
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Texas'
GO
SELECT  p.ProductID,
        p.[Name],
        p.StandardCost,
        p.[Weight]
FROM    Production.Product p;
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'California'
GO
SELECT  p.ProductID,
        p.[Name],
        p.StandardCost,
        p.[Weight]
FROM    Production.Product p
WHERE p.ProductID = 738;
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Montana'
GO
SELECT  *
FROM    HumanResources.Employee
WHERE   Gender = 'F'
AND SickLeaveHours = 59
AND MaritalStatus = 'M'
GO
SELECT  *
FROM    HumanResources.Employee WITH (INDEX (IX_Employee_Test))
WHERE   SickLeaveHours = 59
        AND Gender = 'F'
        AND MaritalStatus = 'M'
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Missouri'
GO
SELECT  *
FROM    Person.Address AS a
WHERE   City = 'Warrington'
GO
SELECT  *
FROM    Person.Address AS a
WHERE   a.PostalCode = 'WA3 7BH'
GO
SELECT  a.AddressID
       ,a.City
       ,a.PostalCode
FROM    Person.Address AS a
WHERE   a.City = 'Warrington'
        AND a.PostalCode = 'WA3 7BH'
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'Arkansas'
GO
SELECT  dl.DatabaseLogId
       ,dl.PostTime
FROM    dbo.DatabaseLog AS dl
WHERE   DatabaseLogId = 115
GO
SELECT  d.DepartmentID
       ,d.ModifiedDate
FROM    HumanResources.Department AS d
WHERE   d.DepartmentID = 10
GO
SELECT  cc.CreditCardID
       ,cc.CardNumber
       ,cc.ExpMonth
       ,cc.ExpYear
FROM    Sales.CreditCard cc
WHERE   cc.ExpMonth BETWEEN 6 AND 9
        AND cc.ExpYear = 2008
ORDER BY cc.ExpMonth
GO
SELECT  a.PostalCode
FROM    Person.Address AS a
WHERE   a.StateProvinceID = 42
GO
SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'New York'
GO
SELECT soh.* 
FROM Sales.SalesOrderHeader AS soh
WHERE soh.SalesPersonID = 276
AND soh.OrderDate BETWEEN '4/1/2002' and '7/1/2002'
GO
SELECT  soh.PurchaseOrderNumber
       ,soh.OrderDate
       ,soh.ShipDate
       ,soh.SalesPersonID
FROM    Sales.SalesOrderHeader AS soh
WHERE   PurchaseOrderNumber LIKE 'PO5%'
        AND soh.SalesPersonID IS NOT NULL;
GO

