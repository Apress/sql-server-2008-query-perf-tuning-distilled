IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'[dbo].[t1]')
                    AND type IN (N'U') ) 
    DROP TABLE [dbo].[t1]
GO

CREATE TABLE dbo.t1 (c1 INT, c2 INT, c3 CHAR(50)) ;
INSERT  INTO dbo.t1 (c1, c2, c3)
VALUES  (51, 1, 'c3') ;
INSERT  INTO dbo.t1 (c1, c2, c3)
VALUES  (52, 1, 'c3') ;
CREATE NONCLUSTERED INDEX i1 ON dbo.t1 (c1, c2) ;
SELECT TOP 10000
        IDENTITY( INT,1,1 ) AS n
INTO    #Nums 
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2;

INSERT  INTO dbo.t1 (c1, c2, c3)
        SELECT  n % 50
               ,n
               ,'c3'
        FROM    #Nums;
DROP TABLE #Nums;
