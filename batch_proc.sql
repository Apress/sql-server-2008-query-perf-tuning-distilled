CREATE PROCEDURE spProductDetails
(
@id INT
)
AS
SELECT  pod.*
FROM    Purchasing.PurchaseOrderDetail AS pod
        JOIN Purchasing.PurchaseOrderHeader AS poh
        ON poh.PurchaseOrderID = pod.PurchaseOrderID
WHERE   poh.PurchaseOrderID >= @id