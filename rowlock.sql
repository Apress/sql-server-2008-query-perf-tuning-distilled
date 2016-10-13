--Create a test table
IF(SELECT OBJECT_ID('t1')) IS NOT NULL
  DROP TABLE t1
GO
CREATE TABLE t1 (c1 INT)
INSERT INTO t1 VALUES(1)
GO

BEGIN TRAN
  DELETE t1 WHERE c1 = 1
  SELECT tl.request_session_id
	,tl.resource_database_id
	,tl.resource_associated_entity_id
	,tl.resource_type
	,resource_description
	,request_mode
	,request_status
  FROM sys.dm_tran_locks tl
ROLLBACK


