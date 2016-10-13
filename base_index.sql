SELECT  i.Name
       ,i.type_desc
       ,s.page_count
       ,s.record_count
       ,s.index_level
FROM    sys.indexes i
        JOIN sys.dm_db_index_physical_stats(DB_ID(N'AdventureWorks2008'),
                                            OBJECT_ID(N'Production.Document'),
                                            NULL, NULL, 'DETAILED') AS s
        ON i.index_id = s.index_id
WHERE i.OBJECT_ID = OBJECT_ID(N'Production.Document')


