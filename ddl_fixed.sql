IF (SELECT  OBJECT_ID('dbo.spTempTable')
   ) IS NOT NULL 
    DROP PROC dbo.spTempTable
GO
CREATE PROC dbo.spTempTable
AS 
    CREATE TABLE #MyTempTable (ID INT, Dsc NVARCHAR(50))
    CREATE CLUSTERED INDEX iTest ON #MyTempTable (ID) ;
    INSERT  INTO #MyTempTable (ID, Dsc)
            SELECT  ProductModelId
                   ,[Name]
            FROM    Production.ProductModel AS pm ;  --Needs 1st recompilation
    CREATE TABLE #t2 (c1 INT) ;
    SELECT  *
    FROM    #MyTempTable AS mtt ; --Needs 2nd recompile
    SELECT  *
    FROM    #MyTempTable AS mtt ; --Needs 3rd recompilation
    SELECT  *
    FROM    #t2 ;
 --Needs 4th recompilation
GO

EXEC spTempTable --First execution
