IF (SELECT  OBJECT_ID('t1')
   ) IS NOT NULL 
    DROP TABLE t1
GO
CREATE TABLE t1
    (c1 INT
    ,c2 INT
    ,c3 INT
    ,c4 CHAR(2000))
CREATE CLUSTERED INDEX i1 ON t1 (c1) ;
WITH    Nums
          AS (SELECT    1 AS n
              UNION ALL
              SELECT    n + 1
              FROM      Nums
              WHERE     n < 21
             )
    INSERT  INTO t1 (c1, c2, c3, c4)
            SELECT  n
                   ,n
                   ,n
                   ,'a'
            FROM    Nums ;
WITH    Nums
          AS (SELECT    1 AS n
              UNION ALL
              SELECT    n + 1
              FROM      Nums
              WHERE     n < 21
             )
    INSERT  INTO t1 (c1, c2, c3, c4)
            SELECT  41 - n
                   ,n
                   ,n
                   ,'a'
            FROM    Nums
