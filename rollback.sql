BEGIN TRY
    BEGIN TRAN --Start: Logical unit of work
  --First:
    INSERT  INTO dbo.t1
            SELECT  p.ProductID
            FROM    Production.Product AS p

  --Second:
    INSERT  INTO dbo.t1
    VALUES  (1)
    COMMIT --End: Logical unit of work
END TRY
BEGIN CATCH
    ROLLBACK
    PRINT 'An error occured'
    RETURN
END CATCH
