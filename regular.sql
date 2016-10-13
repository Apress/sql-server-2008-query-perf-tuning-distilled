IF(SELECT OBJECT_ID('dbo.p1')) IS NOT NULL
  DROP PROC dbo.p1;
GO
CREATE PROC dbo.p1
AS
CREATE TABLE dbo.p1_t1(c1 INT); --Ensure table doesn't exist
SELECT * FROM dbo.p1_t1; --Causes recompilation
DROP TABLE dbo.p1_t1;
GO

EXEC dbo.p1; --First execution
EXEC dbo.p1; --Second execution
