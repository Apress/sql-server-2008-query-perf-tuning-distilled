IF(SELECT OBJECT_ID('spBasicSalesInfo')) IS NOT NULL
  DROP PROC dbo.spBasicSalesInfo
GO
CREATE PROC dbo.spBasicSalesInfo
@ProductID INT
,@CustomerId INT
AS
SELECT  soh.SalesOrderNumber
       ,soh.OrderDate
       ,sod.OrderQty
       ,sod.LineTotal
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
WHERE   soh.CustomerID = @CustomerId
        AND sod.Productid = @ProductId

