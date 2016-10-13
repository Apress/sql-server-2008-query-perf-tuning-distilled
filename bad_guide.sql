sp_create_plan_guide 
@name = N'MyBadSQLGuide',
@stmt = N'SELECT  soh.SalesOrderNumber 
,soh.OrderDate
,sod.OrderQty
,sod.LineTotal
from    Sales.SalesOrderHeader AS soh
join Sales.SalesOrderDetail AS sod
on soh.SalesOrderID = sod.SalesOrderID
where   soh.CustomerID >= @CustomerId',
@type = N'SQL',
@module_or_batch = NULL,
@params = N'@CustomerId int',
@hints = N'OPTION (OPTIMIZE FOR (@CustomerId = 1))'
