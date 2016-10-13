
IF (SELECT  OBJECT_ID('t1')) IS NOT NULL 
    DROP TABLE t1 ;
GO
CREATE TABLE t1 (c1 INT, c2 INT) ;

WITH    Nums
          AS (SELECT    1 AS n
              UNION ALL
              SELECT    n + 1
              FROM      Nums
              WHERE     n < 20
             )
    INSERT  INTO t1 (c1, c2)
            SELECT  n
                   ,n + 1
            FROM    Nums

CREATE CLUSTERED INDEX icl ON t1 (c2) ;
CREATE NONCLUSTERED INDEX incl ON t1 (c1) ;
/*
DROP INDEX t1.icl
ALTER TABLE t1 ALTER COLUMN c2 CHAR(500)
CREATE CLUSTERED INDEX icl ON t1(c2)
*/