IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'[dbo].[t1]')
                    AND type IN (N'U') ) 
    DROP TABLE [dbo].[t1] ;
CREATE TABLE dbo.t1
    (Id INT IDENTITY(1, 1)
    ,MyKey VARCHAR(50)
    ,MyValue VARCHAR(50)) ;
CREATE UNIQUE CLUSTERED INDEX PK_t1 ON dbo.t1 ([Id] ASC) ;
CREATE UNIQUE NONCLUSTERED INDEX IX_Test ON dbo.t1 (MyKey) ;
GO

SELECT TOP 10000
        IDENTITY( INT,1,1 ) AS n
INTO    #Tally
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2

INSERT  INTO dbo.t1 (MyKey, MyValue)
        SELECT TOP 10000
                'UniqueKey' + CAST(n AS VARCHAR)
               ,'Description'
        FROM    #Tally ;

DROP TABLE #Tally;

SELECT  MyValue
FROM    dbo.t1
WHERE   MyKey = 'UniqueKey333';

SELECT  MyValue
FROM    dbo.t1
WHERE   MyKey = N'UniqueKey333';

