SELECT  tl.request_session_id AS WaitingSessionID
       ,wt.blocking_session_id AS BlockingSessionID
       ,wt.resource_description
       ,wt.wait_type
       ,wt.wait_duration_ms
       ,DB_NAME(tl.resource_database_id) AS DatabaseName
       ,tl.resource_associated_entity_id AS WaitingAssociatedEntity
       ,tl.resource_type AS WaitingResourceType
       ,tl.request_type AS WaitingRequestType
       ,wrt.[text] AS WaitingTSql
       ,btl.request_type BlockingRequestType
       ,brt.[text] AS BlockingTsql
FROM    sys.dm_tran_locks tl
        JOIN sys.dm_os_waiting_tasks wt
        ON tl.lock_owner_address = wt.resource_address
        JOIN sys.dm_exec_requests wr
        ON wr.session_id = tl.request_session_id
        CROSS APPLY sys.dm_exec_sql_text(wr.sql_handle) AS wrt
        LEFT JOIN sys.dm_exec_requests br
        ON br.session_id = wt.blocking_session_id
        OUTER APPLY sys.dm_exec_sql_text(br.sql_handle) AS brt
        LEFT JOIN sys.dm_tran_locks AS btl
        ON br.session_id = btl.request_session_id
