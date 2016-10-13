--Create a test table
IF (SELECT  OBJECT_ID('dbo.t1')
   ) IS NOT NULL 
    DROP TABLE dbo.t1
GO
CREATE TABLE dbo.t1
    (
     c1 INT CONSTRAINT chk_c1 CHECK (c1 = 1)
    )
GO

--All ProductIDs are added into t1 as a logical unit of work
INSERT  INTO dbo.t1
        SELECT  p.ProductID
        FROM    Production.Product AS p
GO
SELECT  *
FROM    dbo.t1 --Returns 0 rows
