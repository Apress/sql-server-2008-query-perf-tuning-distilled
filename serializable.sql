IF (SELECT  OBJECT_ID('dbo.MyEmployees')
   ) IS NOT NULL 
    DROP TABLE dbo.MyEmployees;
GO
CREATE TABLE dbo.MyEmployees
    (EmployeeID INT
    ,GroupID INT
    ,Salary MONEY);
CREATE CLUSTERED INDEX i1 ON dbo.MyEmployees (GroupID);
INSERT  INTO dbo.MyEmployees
VALUES  (1, 10, 1000);
 --Employee 1 in group 10
INSERT  INTO dbo.MyEmployees
VALUES  (2, 10, 1000);
 --Employee 2 in group 10
--Employee 3 & 4 in different groups
INSERT  INTO dbo.MyEmployees
VALUES  (3, 20, 1000);
INSERT  INTO dbo.MyEmployees
VALUES  (4, 9, 1000);
