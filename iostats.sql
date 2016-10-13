SET STATISTICS IO ON
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
WHERE   sod.SalesOrderId = 71856;
GO
SET STATISTICS IO OFF
GO
