--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
--GO

DECLARE @Fund MONEY = 100
   ,@Bonus MONEY
   ,@NumberOfEmployees INT
BEGIN TRAN PayBonus
SELECT  @NumberOfEmployees = COUNT(*)
FROM    dbo.MyEmployees
WHERE   GroupID = 10
  /*Allow transaction 2 to execute*/
WAITFOR DELAY '00:00:10'
IF @NumberOfEmployees > 0 
    BEGIN
        SET @Bonus = @Fund / @NumberOfEmployees
        UPDATE  dbo.MyEmployees
        SET     Salary = Salary + @Bonus
        WHERE   GroupID = 10
        PRINT 'Fund balance = 
          ' + CAST((@Fund - (@@ROWCOUNT * @Bonus)) AS VARCHAR(6)) + ' $'
    END
COMMIT
GO

--SET TRANSACTION ISOLATION LEVEL READ COMMITTED --Back to default
--GO
