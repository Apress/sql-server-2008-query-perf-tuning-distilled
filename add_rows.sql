SELECT TOP 1500
        IDENTITY( INT,1,1 ) AS n
INTO    #Nums
FROM    Master.dbo.SysColumns sc1
       ,Master.dbo.SysColumns sc2;
    INSERT INTO dbo.t1 (
        c1
    ) SELECT 2
    FROM #Nums;
DROP TABLE #Nums;
