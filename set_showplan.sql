USE AdventureworksLT2008
GO
SET SHOWPLAN_XML ON
GO
SELECT  soh.AccountNumber,
        sod.LineTotal,
        sod.OrderQty,
        sod.UnitPrice,
        p.Name
FROM    SalesLT.SalesOrderHeader soh
        JOIN SalesLT.SalesOrderDetail sod
        ON soh.SalesOrderID = sod.SalesOrderID
        JOIN SalesLT.Product p
        ON sod.ProductID = p.ProductID
WHERE   sod.LineTotal > 1000 ;
GO
SET SHOWPLAN_XML OFF
GO
