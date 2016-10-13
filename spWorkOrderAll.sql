IF (SELECT  OBJECT_ID('dbo.spWorkOrderAll')
   ) IS NOT NULL 
    DROP PROCEDURE dbo.spWorkOrderAll;
GO
CREATE PROCEDURE dbo.spWorkOrderALL
AS 
    SELECT  *
    FROM    Production.WorkOrder AS wo
