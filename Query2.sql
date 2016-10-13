
SELECT  p.[Name] AS ProductName
       ,SUM(pod.OrderQty) AS OrderQty
       ,SUM(pod.ReceivedQty) AS ReceivedQty
       ,SUM(pod.RejectedQty) AS RejectedQty
FROM    Purchasing.PurchaseOrderDetail AS pod
        JOIN Production.Product AS p
        ON p.ProductID = pod.ProductID
GROUP BY p.[Name]
HAVING (SUM(pod.RejectedQty)/SUM(pod.ReceivedQty)) > .08