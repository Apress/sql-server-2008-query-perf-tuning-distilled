sp_create_plan_guide 
@name = N'MyGoodSQLGuide',
@stmt = N'SELECT  soh.SalesOrderNumber
       ,soh.OrderDate
       ,sod.OrderQty
       ,sod.LineTotal
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
WHERE   soh.CustomerID >= @0',
@type = N'SQL',
@module_or_batch = NULL,
@params = N'@0 int',
@hints = N'OPTION (OPTIMIZE FOR (@0 = 1))'

