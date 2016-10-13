--Transaction 1 from Connection 1
DECLARE @Price INT ;
BEGIN TRAN NormailizePrice
SELECT  @Price = Price
FROM    dbo.MyProduct AS mp
WHERE   mp.ProductID = 1 ;
  /*Allow transaction 2 to execute*/
WAITFOR DELAY '00:00:10'
IF @Price > 10 
    UPDATE  dbo.MyProduct
    SET     Price = Price - 10
    WHERE   ProductID = 1 ;
COMMIT
GO

--Transaction 2 from Connection 2
BEGIN TRAN ApplyDiscount
UPDATE  dbo.MyProduct
SET     Price = Price * 0.6 --Discount = 40%
WHERE   Price > 10 ;
COMMIT
