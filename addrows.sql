--Add 100000 rows to the test table
SELECT TOP 100000
        IDENTITY( INT,1,1 ) AS n
INTO    #Tally
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2 ;

INSERT  INTO t1
        SELECT  n
               ,n
        FROM    #Tally AS t ;
GO

DROP TABLE #Tally
