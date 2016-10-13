IF (SELECT  OBJECT_ID('dbo.spTempTable')
   ) IS NOT NULL 
    DROP PROC dbo.spTempTable
GO
CREATE PROC dbo.spTempTable
AS 
    CREATE TABLE #MyTempTable (ID INT, Dsc NVARCHAR(50))
    INSERT INTO #MyTempTable (
		ID,
		Dsc
	) SELECT ProductModelId, [Name]
	FROM Production.ProductModel AS pm;  --Needs 1st recompilation
	SELECT * FROM #MyTempTable AS mtt; --Needs 2nd recompile
    CREATE CLUSTERED INDEX iTest ON #MyTempTable (ID);
    SELECT  *
    FROM    #MyTempTable AS mtt; --Needs 3rd recompilation
    CREATE TABLE #t2 (c1 INT);
    SELECT  *
    FROM    #t2;
 --Needs 4th recompilation
GO

EXEC spTempTable --First execution
