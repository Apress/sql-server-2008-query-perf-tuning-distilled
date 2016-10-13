--Create a small table with one row and an index
IF (SELECT  OBJECT_ID('dbo.t1')
   ) IS NOT NULL 
    DROP TABLE dbo.t1 ;
GO
CREATE TABLE dbo.t1 (c1 INT, c2 CHAR(50)) ;
INSERT  INTO dbo.t1
VALUES  (1, '2') ;
CREATE NONCLUSTERED INDEX i1 ON t1 (c1) ;

--Create a stored procedure referencing the above table
IF (SELECT  OBJECT_ID('dbo.p1')
   ) IS NOT NULL 
    DROP PROC dbo.p1 ;
GO
CREATE PROC dbo.p1
AS 
    SELECT  *
    FROM    t1
    WHERE   c1 = 1
    OPTION  (KEEPFIXED PLAN) ;
GO

--First execution of stored procedure with 1 row in the table
EXEC dbo.p1 ;
 --First execution

--Add many rows to the table to cause statistics change
WITH    Nums
          AS (SELECT    1 AS n
              UNION ALL
              SELECT    n + 1
              FROM      Nums
              WHERE     n < 1000
             )
    INSERT  INTO t1
            SELECT  1
                   ,N
            FROM    Nums
    OPTION  (MAXRECURSION 1000) ;
GO

--Re-execute the stored procedure with a change in statistics
EXEC dbo.p1 --With change in data distribution
