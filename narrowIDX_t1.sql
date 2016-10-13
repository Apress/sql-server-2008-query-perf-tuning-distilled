IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE dbo.t1
GO
CREATE TABLE dbo.t1(c1 INT, c2 INT);
WITH    Nums
          AS (SELECT    1 AS n
              UNION ALL
              SELECT    n + 1
              FROM      Nums
              WHERE     n < 20
             )
  INSERT INTO dbo.t1 
  (c1,c2)
  SELECT n,2
  FROM Nums
CREATE INDEX i1 ON dbo.t1(c1)


