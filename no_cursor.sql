IF (SELECT  OBJECT_ID('dbo.spTotalLoss')
   ) IS NOT NULL 
    DROP PROC dbo.spTotalLoss;
GO
CREATE PROC dbo.spTotalLoss
AS 
    SELECT  CASE --Determine status based on below computation
                 WHEN SUM(MoneyLostPerProduct) > 5000 THEN 'We are bankrupt!'
                 ELSE 'We are safe!'
            END AS Status
    FROM    (--Calculate total money lost for all discarded products
             SELECT SUM(wo.ScrappedQty * p.ListPrice) AS MoneyLostPerProduct
             FROM   Production.WorkOrder AS wo
                    JOIN Production.ScrapReason AS sr
                    ON wo.ScrapReasonID = sr.ScrapReasonID
                    JOIN Production.Product AS p
                    ON wo.ProductID = p.ProductID
             GROUP BY p.ProductID
            ) DiscardedProducts;
GO
