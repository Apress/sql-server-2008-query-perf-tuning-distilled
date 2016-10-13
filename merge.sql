
SELECT  pm.*
FROM    production.ProductModel pm
        JOIN production.ProductModelProductDescriptionCulture pmpd
        ON pm.ProductModelID = pmpd.ProductModelID