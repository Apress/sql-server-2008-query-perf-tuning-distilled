--Create first table with 10001 rows
IF(SELECT OBJECT_ID('dbo.t1')) IS NOT NULL
  DROP TABLE dbo.t1;
GO
CREATE TABLE dbo.t1(t1_c1 INT IDENTITY, t1_c2 INT);
INSERT INTO dbo.t1 (t1_c2) VALUES (1);
SELECT TOP 119026
        IDENTITY( INT,1,1 ) AS n
INTO    #Nums
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2;
    INSERT INTO dbo.t1 (
        t1_c2
    ) SELECT 2
    FROM #Nums
GO
CREATE CLUSTERED INDEX i1 ON dbo.t1(t1_c1)

--Create second table with 10001 rows,
--  but opposite data distribution
IF(SELECT OBJECT_ID('dbo.t2')) IS NOT NULL
  DROP TABLE dbo.t2;
GO
CREATE TABLE dbo.t2(t2_c1 INT IDENTITY, t2_c2 INT);
INSERT INTO dbo.t2(t2_c2) VALUES (2);
    INSERT INTO dbo.t2 (
        t2_c2
    ) SELECT 1
    FROM #Nums;
DROP TABLE #Nums;
GO
CREATE CLUSTERED INDEX i1 ON dbo.t2(t2_c1);
