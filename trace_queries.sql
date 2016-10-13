SELECT  *
FROM    dbo.DatabaseLog ;
GO 60

SELECT  p.LastName + ', ' + p.FirstName
	,s.Name
FROM    Sales.Customer AS c
        JOIN Person.Person AS p
        ON c.PersonId = p.BusinessEntityId
        JOIN Sales.Store AS s
        ON s.BusinessEntityId = c.StoreId
ORDER BY s.Name ;
GO 100

SELECT  *
FROM    dbo.ufnGetContactInformation(7673) ;
GO 80

SELECT  soh.AccountNumber,
        sod.LineTotal,
        sod.OrderQty,
        sod.UnitPrice,
        p.Name
FROM    Sales.SalesOrderHeader soh
        JOIN Sales.SalesOrderDetail sod
        ON soh.SalesOrderID = sod.SalesOrderID
        JOIN Production.Product p
        ON sod.ProductID = p.ProductID
WHERE   sod.LineTotal > 1000 ;
GO 

SELECT  soh.AccountNumber,
        sod.LineTotal,
        sod.OrderQty,
        sod.UnitPrice,
        p.Name
FROM    Sales.SalesOrderHeader soh
        JOIN Sales.SalesOrderDetail sod
        ON soh.SalesOrderID = sod.SalesOrderID
        JOIN Production.Product p
        ON sod.ProductID = p.ProductID
GO 55

