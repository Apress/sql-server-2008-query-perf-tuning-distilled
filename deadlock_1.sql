BEGIN TRAN
UPDATE  Purchasing.PurchaseOrderHeader
SET     Freight = Freight * 0.9 -- 10% discount on shipping
WHERE   PurchaseOrderID = 1255 ;


UPDATE  Purchasing.PurchaseOrderDetail
SET     OrderQty = 4
WHERE   ProductID = 448
        AND PurchaseOrderID = 1255 ;

--rollback

