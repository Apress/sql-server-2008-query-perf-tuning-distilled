SELECT  s.avg_fragmentation_in_percent
       ,s.fragment_count
       ,s.page_count
       ,s.avg_page_space_used_in_percent
       ,s.record_count
       ,s.avg_record_size_in_bytes
       ,s.index_id
FROM    sys.dm_db_index_physical_stats(DB_ID('AdventureWorks2008'),
                                       OBJECT_ID(N'Purchasing.PurchaseOrderHeader'), NULL, NULL,
                                       'Sampled') AS s


SELECT  s.avg_fragmentation_in_percent
       ,s.fragment_count
       ,s.page_count
       ,s.avg_page_space_used_in_percent
       ,s.record_count
       ,s.avg_record_size_in_bytes
       ,s.index_id
FROM    sys.dm_db_index_physical_stats(DB_ID('AdventureWorks2008'),
                                       OBJECT_ID(N'Purchasing.PurchaseOrderDetail'), NULL, NULL,
                                       'Sampled') AS s
WHERE s.record_count > 0
ORDER BY s.index_id


SELECT  s.avg_fragmentation_in_percent
       ,s.fragment_count
       ,s.page_count
       ,s.avg_page_space_used_in_percent
       ,s.record_count
       ,s.avg_record_size_in_bytes
       ,s.index_id
FROM    sys.dm_db_index_physical_stats(DB_ID('AdventureWorks2008'),
                                       OBJECT_ID(N'Production.Product'), NULL, NULL,
                                       'Sampled') AS s
WHERE record_count > 0
ORDER BY s.index_id


SELECT  s.avg_fragmentation_in_percent
       ,s.fragment_count
       ,s.page_count
       ,s.avg_page_space_used_in_percent
       ,s.record_count
       ,s.avg_record_size_in_bytes
       ,s.index_id
FROM    sys.dm_db_index_physical_stats(DB_ID('AdventureWorks2008'),
                                       OBJECT_ID(N'Person.Employee'), NULL, NULL,
                                       'Sampled') AS s
WHERE record_count > 0
ORDER BY s.index_id


SELECT  s.avg_fragmentation_in_percent
       ,s.fragment_count
       ,s.page_count
       ,s.avg_page_space_used_in_percent
       ,s.record_count
       ,s.avg_record_size_in_bytes
       ,s.index_id
FROM    sys.dm_db_index_physical_stats(DB_ID('AdventureWorks2008'),
                                       OBJECT_ID(N'Person.Person'), NULL, NULL,
                                       'Sampled') AS s
WHERE record_count > 0
ORDER BY s.index_id


