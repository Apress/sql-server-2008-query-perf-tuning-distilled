
SELECT  soh.SalesOrderID
	,soh.OrderDate
FROM    Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod
ON soh.SalesOrderID = sod.SalesOrderID
WHERE   DATEPART(yy, soh.OrderDate) = 2002
        AND DATEPART(mm, soh.OrderDate) = 4


SELECT  soh.SalesOrderID
	,soh.OrderDate
FROM    Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail AS sod
ON soh.SalesOrderID = sod.SalesOrderID
WHERE   soh.OrderDate >= '4/1/2002'
        AND soh.OrderDate < '5/1/2002'


UPDATE STATISTICS Sales.SalesPersonQuotaHistory

CREATE INDEX IX_Test ON Sales.SalesOrderHeader(OrderDate)


