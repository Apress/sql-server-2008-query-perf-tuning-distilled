IF (SELECT  OBJECT_ID('t1')
   ) IS NOT NULL 
    DROP TABLE t1
GO
CREATE TABLE t1 (c1 INT, c2 CHAR(999)) ;
WITH    Nums
          AS (SELECT    1 AS n
              UNION ALL
              SELECT    n + 1
              FROM      Nums
              WHERE     n < 24
             )
    INSERT  INTO t1 (c1, c2)
            SELECT  n * 100
                   ,'a'
            FROM    Nums;

CREATE CLUSTERED INDEX i1 ON t1(c1);