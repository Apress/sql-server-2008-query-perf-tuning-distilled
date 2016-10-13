DECLARE @n INT
SELECT  @n = COUNT(*)
FROM    Sales.SalesOrderDetail AS sod
WHERE   sod.OrderQty = 1
IF @n > 0 
    PRINT 'Record Exists'
  
IF EXISTS ( SELECT  sod.*
            FROM    Sales.SalesOrderDetail AS sod
            WHERE   sod.OrderQty = 1 ) 
    PRINT 'Record Exists'

