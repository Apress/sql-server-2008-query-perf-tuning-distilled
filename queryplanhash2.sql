SELECT  p.[Name],
        tha.TransactionDate,
        tha.TransactionType,
        tha.Quantity,
        tha.ActualCost
FROM    Production.TransactionHistoryArchive tha
        JOIN Production.Product p
        ON tha.ProductID = p.ProductID
WHERE   p.ProductID = 712 ;
