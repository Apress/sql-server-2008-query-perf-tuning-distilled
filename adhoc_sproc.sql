DECLARE @n VARCHAR(3)
SET @n = '776'
DECLARE @sql VARCHAR(MAX)
SET @sql = 'SELECT * FROM Sales.SalesOrderDetail sod '
    + 'JOIN Sales.SalesOrderHeader soh '
    + 'ON sod.SalesOrderID=soh.SalesOrderID ' 
    + 'WHERE  sod.ProductID=''' + @n
    + ''''
--Execute the dynamic query using EXECUTE statement

EXECUTE (@sql)
