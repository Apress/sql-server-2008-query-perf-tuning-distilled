SELECT  p.*
FROM    SalesLT.Product p
        JOIN SalesLT.ProductCategory pc
        ON p.ProductCategoryID = pc.ProductCategoryID
        