IF(SELECT OBJECT_ID('dbo.spCustomerList')) IS NOT NULL
  DROP PROC dbo.spCustomerList
GO
IF(SELECT OBJECT_ID('dbo.spCustomerList')) IS NOT NULL
  DROP PROC dbo.spCustomerList
GO
CREATE PROCEDURE dbo.spCustomerList
@CustomerId INT
AS
SELECT  soh.SalesOrderNumber
       ,soh.OrderDate
       ,sod.OrderQty
       ,sod.LineTotal
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
WHERE   soh.CustomerID >= @CustomerId
GO


sp_create_plan_guide 
@name = N'MyGuide',
@stmt = N'SELECT  soh.SalesOrderNumber
       ,soh.OrderDate
       ,sod.OrderQty
       ,sod.LineTotal
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
WHERE   soh.CustomerID >= @CustomerId',
@type = N'OBJECT',
@module_or_batch = N'dbo.spCustomerList',
@params = NULL,
@hints = N'OPTION (OPTIMIZE FOR (@CustomerId = 1))'


EXEC dbo.spCustomerList @CustomerId = 7920 WITH RECOMPILE;
EXEC dbo.spCustomerList @CustomerId = 30118 WITH RECOMPILE;
