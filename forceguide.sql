DECLARE @plan_handle VARBINARY(64)
   ,@start_offset INT
SELECT  @plan_handle = qs.plan_handle
       ,@start_offset = qs.statement_start_offset
FROM    sys.dm_exec_query_stats AS qs
        CROSS APPLY sys.dm_exec_sql_text(sql_handle)
        CROSS APPLY sys.dm_exec_text_query_plan(qs.plan_handle,
                                                qs.statement_start_offset,
                                                qs.statement_end_offset) AS qp
WHERE   text LIKE N'SELECT  soh.SalesOrderNumber%'

EXECUTE sp_create_plan_guide_from_handle @name = N'ForcedPlanGuide',
    @plan_handle = @plan_handle, @statement_start_offset = @start_offset ;
GO
