SELECT  p.ProductID
FROM    Production.Product AS p
        JOIN Production.ProductSubcategory AS ps
        ON p.ProductSubcategoryID = ps.ProductSubcategoryID
        JOIN Production.ProductCategory AS pc
        ON ps.ProductCategoryID = pc.ProductCategoryID
where   pc.[Name] = 'Bikes'
        and ps.[Name] = 'Touring Bikes'
        