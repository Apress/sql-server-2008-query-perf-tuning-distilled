--Create a test table
IF(SELECT OBJECT_ID('dbo.t1')) IS NOT NULL
  DROP TABLE dbo.t1
GO
CREATE TABLE dbo.t1 (c1 INT)
INSERT INTO dbo.t1 VALUES(1)
GO

CREATE CLUSTERED INDEX i1 ON dbo.t1(c1);

BEGIN TRAN
  DELETE dbo.t1 WHERE c1 = 1
  SELECT tl.request_session_id
	,tl.resource_database_id
	,tl.resource_associated_entity_id
	,tl.resource_type
	,tl.resource_description
	,tl.request_mode
	,tl.request_status
  FROM sys.dm_tran_locks tl
ROLLBACK


