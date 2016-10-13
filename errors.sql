DBCC freeproccache
GO
INSERT  INTO Purchasing.PurchaseOrderDetail
        (PurchaseOrderID
        ,DueDate
        ,OrderQty
        ,ProductID
        ,UnitPrice
        ,ReceivedQty
        ,RejectedQty
        ,ModifiedDate)
VALUES  (
         1066
        ,'1/1/2009'
        ,1
        ,42
        ,98.6
        ,5
        ,4
        ,'1/1/2009'
        );
GO
SELECT  p.[Name]
       ,c.[Name]
FROM    Production.Product AS p
       ,Production.ProductCategory AS c;
GO
