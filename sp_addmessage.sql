CREATE PROC dbo.[sp_addmessage] @param1 NVARCHAR(25)
AS 
    PRINT '@param1 = ' + @param1
GO

EXEC AdventureWorks2008.dbo.[sp_addmessage] 'AdventureWorks'
