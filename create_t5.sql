ALTER DATABASE AdventureWorks2008 SET AUTO_UPDATE_STATISTICS OFF ;
ALTER DATABASE AdventureWorks2008 SET AUTO_CREATE_STATISTICS OFF ;

IF (SELECT  OBJECT_ID('t1')
   ) IS NOT NULL 
    DROP TABLE t1 ;
GO
CREATE TABLE t1 (c1 INT, c2 INT, c3 CHAR(50)) ;
INSERT  INTO t1 (c1, c2, c3)
VALUES  (51, 1, 'c3') ;
INSERT  INTO t1 (c1, c2, c3)
VALUES  (52, 1, 'c3') ;
CREATE NONCLUSTERED INDEX i1 ON t1(c1,c2);
WITH    Nums
          AS (SELECT    1 AS n
              UNION ALL
              SELECT    n + 1
              FROM      Nums
              WHERE     n < 10000
             )
    INSERT  INTO t1 (c1, c2, c3)
            SELECT  n % 50
                   ,n
                   ,'c3'
            FROM    Nums
    OPTION  (MAXRECURSION 10000) ;
 