--Associate a SELECT statement to a cursor and define the 
--cursor's characteristics
DECLARE MyCursor CURSOR
 /*<cursor characteristics>*/
    FOR SELECT  adt.AddressTypeId
               ,adt.NAME
               ,adt.ModifiedDate
        FROM    Person.AddressType adt
--Open the cursor to access the result set returned by the 
--SELECT statement
OPEN MyCursor

--Retrieve one row at a time from the result set returned by 
--the SELECT statement
DECLARE @AddressTypeId INT
   ,@Name VARCHAR(50)
   ,@ModifiedDate DATETIME
	
FETCH NEXT FROM MyCursor INTO @AddressTypeId, @Name, @ModifiedDate
WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'NAME = ' + @Name
  --Optionally, modify the row through the cursor
        UPDATE  Person.AddressType
        SET     Name = Name + 'z'
        WHERE CURRENT OF MyCursor
        FETCH NEXT FROM MyCursor INTO @AddressTypeId, @Name, @ModifiedDate
    END
--Close the cursor and release all resources assigned to the
--cursor
CLOSE MyCursor
DEALLOCATE MyCursor
