IF(SELECT OBJECT_ID('spProductInfo')) IS NOT NULL
  DROP PROC dbo.spProductInfo
GO
CREATE PROC dbo.spProductInfo
@CategoryName NVARCHAR(50)
,@SubCategoryName NVARCHAR(50)
AS
SELECT  *
FROM    Production.Product AS p
        JOIN Production.ProductSubcategory AS ps
        ON p.ProductSubcategoryID = ps.ProductSubcategoryID
        JOIN Production.ProductCategory AS pc
        ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE   pc.[Name] = @CategoryName
        AND ps.[Name] = @SubCategoryName