SELECT  soh.*
FROM    Sales.SalesOrderHeader soh
        JOIN Sales.SalesOrderDetail sod
        ON soh.SalesOrderID = sod.SalesOrderID
WHERE   soh.SalesOrderID = 71832
