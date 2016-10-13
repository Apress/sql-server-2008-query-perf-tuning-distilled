DECLARE @query NVARCHAR(MAX)
DECLARE @param NVARCHAR(MAX)

SET @query = N'SELECT  soh.SalesOrderNumber
       ,soh.OrderDate
       ,sod.OrderQty
       ,sod.LineTotal
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
WHERE   soh.CustomerID = @CustomerId
        AND sod.Productid = @ProductId'

SET @param = N'@CustomerId INT, @ProductId INT'

EXEC sp_executesql @query, @param, @CustomerId = 29690, @ProductId = 711
