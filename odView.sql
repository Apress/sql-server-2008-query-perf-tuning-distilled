IF EXISTS ( SELECT  *
            FROM    sys.views
            WHERE   object_id = OBJECT_ID(N'[Purchasing].[IndexedView]') ) 
    DROP VIEW [Purchasing].[IndexedView]
GO
CREATE VIEW Purchasing.IndexedView
WITH SCHEMABINDING
AS  SELECT  pod.ProductID
           ,SUM(pod.OrderQty) AS OrderQty
           ,SUM(pod.ReceivedQty) AS ReceivedQty
           ,SUM(pod.RejectedQty) AS RejectedQty
           ,COUNT_BIG(*) AS [Count]
    FROM    Purchasing.PurchaseOrderDetail AS pod
    GROUP BY pod.ProductID
GO
CREATE UNIQUE CLUSTERED INDEX iv ON Purchasing.IndexedView (ProductId) ;
GO
