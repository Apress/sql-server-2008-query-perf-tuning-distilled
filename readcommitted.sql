-- While Read Committed is the default, set it to be sure
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
GO

BEGIN TRANSACTION;
SELECT  p.Color
FROM    dbo.Product AS p
WHERE   p.ProductID = 711;

--rollback transaction