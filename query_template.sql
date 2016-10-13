DECLARE @my_templatetext NVARCHAR(MAX)
DECLARE @my_parameters NVARCHAR(MAX)
EXEC sp_get_query_template @templatetext = N'SELECT  soh.SalesOrderNumber
       ,soh.OrderDate
       ,sod.OrderQty
       ,sod.LineTotal
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
WHERE   soh.CustomerID >= 30118', 
	@templatetext = @my_templatetext OUTPUT,
    @parameters = @my_parameters OUTPUT;

SELECT  @my_templatetext;
SELECT  @my_parameters;
