SELECT  soh.SalesOrderID
       ,soh.OrderDate
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
--WHERE soh.OrderDate >= '2002-04-01' AND soh.OrderDate < '2002-05-01'        
WHERE   DATEPART(yy, soh.OrderDate) = 2002
        AND DATEPART(mm, soh.OrderDate) = 4
