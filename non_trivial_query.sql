SELECT  soh.SalesOrderNumber
       ,sod.OrderQty
       ,sod.LineTotal
       ,sod.UnitPrice
       ,sod.UnitPriceDiscount
       ,p.[Name] AS ProductName
       ,p.ProductNumber
       ,ps.[Name] AS ProductSubCategoryName
       ,pc.[Name] AS ProductCategoryName
FROM    Sales.SalesOrderHeader AS soh
        JOIN Sales.SalesOrderDetail AS sod
        ON soh.SalesOrderID = sod.SalesOrderID
        JOIN Production.Product AS p
        ON sod.ProductID = p.ProductID
        JOIN Production.ProductModel AS pm
        ON p.ProductModelID = pm.ProductModelID
        JOIN Production.ProductSubcategory AS ps
        ON p.ProductSubcategoryID = ps.ProductSubcategoryID
        JOIN Production.ProductCategory AS pc
        ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE   soh.CustomerID = 29658