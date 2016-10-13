SELECT  p.*
FROM    Production.Product p
        JOIN Production.ProductModelProductDescriptionCulture pmpd
        ON p.ProductID = pmpd.ProductModelID

