sp_configure 'show advanced options', 1;
go
reconfigure;
go
sp_configure 'blocked process threshold',
      5;
go
reconfigure;

sp_configure 'blocked process threshold'


ALTER DATABASE AdventureWorks2008 SET ENABLE_BROKER
GO
CREATE QUEUE Blockingqueue 
GO
CREATE SERVICE BlockingService
    ON QUEUE Blockingqueue ( [http://schemas.microsoft.com/SQL/Notifications/PostEventNotification] )
GO
CREATE EVENT NOTIFICATION notify_locks
    ON SERVER
    WITH fan_in
    FOR blocked_process_report
    TO SERVICE 'BlockingService', 'current database';
go


RECEIVE message_body, message_sequence_number
FROM Blockingqueue


SELECT cast( message_body as xml ), *
FROM Blockingqueue






