CREATE PROCEDURE dbo.spr_ShoppingCart
@ShoppingCartId VARCHAR(50)
AS
--provides the output from the shopping cart including the line total
SELECT  sci.Quantity
       ,p.ListPrice
       ,p.ListPrice * sci.Quantity AS LineTotal
       ,p.[Name]
FROM    Sales.ShoppingCartItem AS sci
        JOIN Production.Product AS p
        ON sci.ProductID = p.ProductID
WHERE   sci.ShoppingCartID = @ShoppingCartId ;
GO

CREATE PROCEDURE dbo.spr_ProductBySalesOrder
@SalesOrderID INT
AS
/*provides a list of products from a particulare sales order, 
and provides line ordering by modifieddate but ordered by product name*/
SELECT  ROW_NUMBER() OVER (ORDER BY sod.ModifiedDate) AS LineNumber
       ,p.[Name]
       ,sod.LineTotal
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
        JOIN Production.Product AS p
        ON sod.ProductID = p.ProductID
WHERE   soh.SalesOrderID = @SalesOrderID
ORDER BY p.[Name] ASC ;
GO

CREATE PROCEDURE dbo.spr_PersonByFirstName
@FirstName NVARCHAR(50)
AS
--gets anyone by first name from the Person table
SELECT  p.BusinessEntityID
       ,p.Title
       ,p.LastName
       ,p.FirstName
       ,p.PersonType
FROM    Person.Person AS p
WHERE   p.FirstName = @FirstName ;
GO

CREATE PROCEDURE dbo.spr_ProductTransactionsSinceDate
@LatestDate DATETIME
,@ProductName NVARCHAR(50)
AS
--Gets the latest transaction against all products that have a transaction
SELECT  p.NAME
       ,th.ReferenceOrderID
       ,th.ReferenceOrderLineID
       ,th.TransactionType
       ,th.Quantity
FROM    Production.Product AS p
        JOIN Production.TransactionHistory AS th
        ON p.ProductID = th.ProductID
           AND th.TransactionID = (SELECT TOP (1)
                                            th2.transactionId
                                   FROM     Production.TransactionHistory th2
                                   WHERE    th2.productid = p.productid
                                   ORDER BY th2.transactionid DESC
                                  )
WHERE th.TransactionDate > @LatestDate
AND p.NAME LIKE @ProductName;
GO

CREATE PROCEDURE dbo.spr_PurchaseOrderBySalesPersonName 
@LastName NVARCHAR(50)
AS 
    SELECT  poh.PurchaseOrderID
           ,poh.OrderDate
           ,pod.LineTotal
           ,p.[Name] AS ProductName
           ,e.JobTitle
           ,per.LastName + ', ' + per.FirstName AS SalesPerson
    FROM    Purchasing.PurchaseOrderHeader AS poh
            JOIN Purchasing.PurchaseOrderDetail AS pod
            ON poh.PurchaseOrderID = pod.PurchaseOrderID
            JOIN Production.Product AS p
            ON pod.ProductID = p.ProductID
            JOIN HumanResources.Employee AS e
            ON poh.EmployeeID = e.BusinessEntityID
            JOIN Person.Person AS per
            ON e.BusinessEntityID = per.BusinessEntityID
    WHERE   per.LastName LIKE @LastName
    ORDER BY per.LastName
           ,per.FirstName
