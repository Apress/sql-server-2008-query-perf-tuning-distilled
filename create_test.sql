IF (SELECT  OBJECT_ID('t1')
   ) IS NOT NULL 
    DROP TABLE dbo.t1 ;
GO
CREATE TABLE dbo.t1 (c1 INT, c2 INT, c3 CHAR(50)) ;
SELECT TOP 10000
        IDENTITY( INT,1,1 ) AS n
INTO    #Nums
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2 ;

INSERT  INTO dbo.t1 (c1, c2, c3)
        SELECT  n
               ,n
               ,'C3'
        FROM    #Nums ;

DROP TABLE #Nums ;
