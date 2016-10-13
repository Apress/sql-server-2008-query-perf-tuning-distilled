BEGIN TRANSACTION Tx1
	UPDATE  dbo.t1
	SET     c2 = GETDATE()
	WHERE   c1 = 1;

  SELECT tl.request_session_id
	,tl.resource_database_id
	,tl.resource_associated_entity_id
	,tl.resource_type
	,tl.resource_description
	,tl.request_mode
	,tl.request_status
  FROM sys.dm_tran_locks tl;
 --Lock status after second step of UPDATE
COMMIT
