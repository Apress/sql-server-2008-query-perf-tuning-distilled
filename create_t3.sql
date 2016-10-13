IF (SELECT  OBJECT_ID('dbo.t1')
   ) IS NOT NULL 
    DROP TABLE dbo.t1 ;
GO
CREATE TABLE dbo.t1 (c1 INT, c2 INT IDENTITY) ;
INSERT  INTO dbo.t1 (c1)
VALUES  (1) ;
SELECT TOP 119026
        IDENTITY( INT,1,1 ) AS n
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2;
        
INTO    #Nums ;
INSERT  INTO dbo.t1 (c1)
        SELECT  2
        FROM    #Nums ;
CREATE NONCLUSTERED INDEX i1 ON dbo.t1 (c1) ;
