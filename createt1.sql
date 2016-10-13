IF (SELECT  OBJECT_ID('t1')
   ) IS NOT NULL 
    DROP TABLE dbo.t1 ;
GO
CREATE TABLE dbo.t1 (c1 INT, c2 INT IDENTITY) ;
SELECT TOP 1500
        IDENTITY( INT,1,1 ) AS n
INTO    #Nums
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2;

INSERT  INTO dbo.t1 (c1)
        SELECT  n
        FROM    #Nums;
        
DROP TABLE #Nums;
CREATE NONCLUSTERED INDEX i1 ON dbo.t1 (c1) ;
