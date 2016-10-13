IF (SELECT  OBJECT_ID('dbo.spWorkOrder')
   ) IS NOT NULL 
    DROP PROCEDURE dbo.spWorkOrder;
GO
CREATE PROCEDURE spWorkOrder
AS 
    SELECT  wo.WorkOrderID
           ,wo.ProductID
           ,wo.StockedQty
    FROM    Production.WorkOrder AS wo
    WHERE   wo.StockedQty BETWEEN 500 AND 700 ;
