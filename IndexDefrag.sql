CREATE PROCEDURE IndexDefrag
AS

DECLARE @DBName NVARCHAR(255)
	,@TableName NVARCHAR(255)
	,@SchemaName NVARCHAR(255)
	,@IndexName NVARCHAR(255)
	,@PctFrag DECIMAL

DECLARE @Defrag NVARCHAR(MAX)

IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'#Frag'))
	DROP TABLE #Frag

CREATE TABLE #Frag
(DBName NVARCHAR(255)
,TableName NVARCHAR(255)
,SchemaName NVARCHAR(255)
,IndexName NVARCHAR(255)
,AvgFragment DECIMAL)

EXEC sp_msforeachdb 'INSERT INTO #Frag (
	DBName,
	TableName,
	SchemaName,
	IndexName,
	AvgFragment
) SELECT  ''?'' AS DBName
       ,t.Name AS TableName
       ,sc.Name AS SchemaName
       ,i.name AS IndexName
       ,s.avg_fragmentation_in_percent 
FROM    ?.sys.dm_db_index_physical_stats(DB_ID(''?''), NULL, NULL,
                                       NULL, ''Sampled'') AS s
        JOIN ?.sys.indexes i
        ON s.Object_Id = i.Object_id
           AND s.Index_id = i.Index_id
        JOIN ?.sys.tables t
        ON i.Object_id = t.Object_Id
        JOIN ?.sys.schemas sc
        ON t.schema_id = sc.SCHEMA_ID
WHERE s.avg_fragmentation_in_percent > 20
AND t.TYPE = ''U''
AND s.page_count > 8
ORDER BY TableName,IndexName'

DECLARE cList CURSOR
FOR SELECT * FROM #Frag

OPEN cList
FETCH NEXT FROM cList
INTO @DBName, @TableName,@SchemaName,@IndexName,@PctFrag
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @PctFrag BETWEEN 20.0 AND 40.0
	BEGIN
		SET @Defrag = N'ALTER INDEX ' + @IndexName + ' ON ' + @DBName + '.' + @SchemaName + '.' + @TableName + ' REORGANIZE'
		EXEC sp_executesql @Defrag		
		PRINT 'Reorganize index: ' + @DBName + '.' + @SchemaName + '.' + @TableName +'.' + @IndexName
	END
	ELSE IF @PctFrag > 40.0
	BEGIN
		SET @Defrag = N'ALTER INDEX ' + @IndexName + ' ON ' + @DBName + '.' + @SchemaName + '.' + @TableName + ' REBUILD'
		EXEC sp_executesql @Defrag
		PRINT 'Rebuild index: '+ @DBName + '.' + @SchemaName + '.' + @TableName +'.' + @IndexName
	END
		
	FETCH NEXT FROM cList
	INTO @DBName, @TableName,@SchemaName,@IndexName,@PctFrag

END
CLOSE cList
DEALLOCATE cList

DROP TABLE #Frag
