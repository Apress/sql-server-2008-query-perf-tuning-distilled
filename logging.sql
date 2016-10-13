DBCC SQLPERF (LOGSPACE)
GO
--Insert 10000 rows
DECLARE @Count INT = 1;
BEGIN TRANSACTION
WHILE @Count <= 10000
    BEGIN
        INSERT  INTO t1
        VALUES  (@Count % 256);
        SET @Count = @Count + 1;
    END
COMMIT
GO
DBCC SQLPERF (LOGSPACE)
GO


SELECT TOP 10000
        IDENTITY( INT,1,1 ) AS n
INTO    #Tally
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2
BEGIN TRANSACTION
INSERT  INTO dbo.t1 (c1)
        SELECT (n % 256)
        FROM    #Tally ;
COMMIT TRANSACTION
DROP TABLE #Tally;
GO
DBCC SQLPERF (LOGSPACE)
GO
