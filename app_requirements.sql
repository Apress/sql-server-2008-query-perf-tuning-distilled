IF (SELECT  OBJECT_ID('dbo.spTotalLoss_CursorBased')
   ) IS NOT NULL 
    DROP PROC dbo.spTotalLoss_CursorBased;
GO
CREATE PROC dbo.spTotalLoss_CursorBased
AS --Declare a T-SQL cursor with default settings, i.e. fast
--forward-only to retrieve products that have been discarded
    DECLARE ScrappedProducts CURSOR
        FOR SELECT  wo.ScrappedQty
                   ,p.ListPrice
            FROM    Production.WorkOrder AS wo
                    JOIN Production.ScrapReason AS sr
                    ON wo.ScrapReasonID = sr.ScrapReasonID
                    JOIN Production.Product AS p
                    ON wo.ProductID = p.ProductID;
--Open the cursor to process one product at a time
    OPEN ScrappedProducts;

    DECLARE @MoneyLostPerProduct MONEY = 0
       ,@TotalLoss MONEY = 0;

--Calculate money lost per product by processing one product
--at a time
    DECLARE @UnitsScrapped SMALLINT
       ,@ListPrice MONEY;
    FETCH NEXT FROM ScrappedProducts INTO @UnitsScrapped, @ListPrice;
    WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @MoneyLostPerProduct = @UnitsScrapped * @ListPrice;
  --Calculate total loss
            SET @TotalLoss = @TotalLoss + @MoneyLostPerProduct;
            FETCH NEXT FROM ScrappedProducts INTO @UnitsScrapped, @ListPrice;
        END

--Determine status
    IF (@TotalLoss > 5000) 
        SELECT  'We are bankrupt!' AS Status;
    ELSE 
        SELECT  'We are safe!' AS Status;

--Close the cursor and release all resources assigned to the cursor
    CLOSE ScrappedProducts;
    DEALLOCATE ScrappedProducts;
GO
