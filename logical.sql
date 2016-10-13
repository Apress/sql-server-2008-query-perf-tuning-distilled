BEGIN TRAN --Start: Logical unit of work
  --First:
  INSERT INTO dbo.t1
    SELECT p.ProductID FROM Production.Product AS p
  --Second:
  INSERT INTO dbo.t1 VALUES(1)
COMMIT --End: Logical unit of work
GO

SELECT * FROM t1 --Returns a row with t1.c1 = 1
