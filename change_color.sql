BEGIN TRANSACTION;
UPDATE dbo.Product
SET Color = 'Coyote'
WHERE ProductID = 711;

SELECT p.Color
FROM dbo.Product AS p
WHERE p.ProductID = 711;

--COMMIT TRANSACTION

