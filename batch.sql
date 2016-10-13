DECLARE @id INT = 1
SELECT  pod.*
FROM    Purchasing.PurchaseOrderDetail AS pod
        JOIN Purchasing.PurchaseOrderHeader AS poh
        ON poh.PurchaseOrderID = pod.PurchaseOrderID
WHERE   poh.PurchaseOrderID >= @id


SELECT pod.*
FROM Purchasing.PurchaseOrderDetail AS pod
JOIN Purchasing.PurchaseOrderHeader AS poh
ON poh.PurchaseOrderID = pod.PurchaseOrderID
WHERE poh.PurchaseOrderID >=1

