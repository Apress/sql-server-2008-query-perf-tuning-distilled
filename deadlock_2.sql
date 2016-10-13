BEGIN TRANSACTION
UPDATE  Purchasing.PurchaseOrderDetail
SET     OrderQty = 2
WHERE   ProductID = 448
        AND PurchaseOrderID = 1255 ;




--rollback