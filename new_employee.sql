--Transaction 2 from Connection 2
BEGIN TRAN NewEmployee
  INSERT INTO MyEmployees VALUES(5, 10, 1000)
COMMIT
