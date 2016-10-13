IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1(c1 INT, c2 INT);
SELECT TOP 10000
        IDENTITY( INT,1,1 ) AS n
INTO    #Nums
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2 ;
  INSERT INTO t1 
  (c1,c2)
  SELECT n,2
  FROM #Nums
DROP TABLE #Nums ;

SELECT  c1
       ,c2
FROM    t1
WHERE   c1 = 1;

CREATE NONCLUSTERED INDEX incl ON t1(c1);
CREATE CLUSTERED INDEX icl ON t1(c1)
