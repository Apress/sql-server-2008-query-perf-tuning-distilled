IF(SELECT OBJECT_ID('dbo.p1')) IS NOT NULL
  DROP PROC dbo.p1;
GO
CREATE PROC dbo.p1
AS
CREATE TABLE #t1(c1 INT);
SELECT * FROM #t1; --Needs recompilation on 1st execution
GO
