ALTER TABLE [Person].[Address]
        WITH CHECK
ADD CONSTRAINT [FK_Address_StateProvince_StateProvinceID] FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])
GO

IF EXISTS ( SELECT  *
            FROM    sys.foreign_keys
            WHERE   object_id = OBJECT_ID(N'[Person].[FK_Address_StateProvince_StateProvinceID]')
                    AND parent_object_id = OBJECT_ID(N'[Person].[Address]') ) 
    ALTER TABLE [Person].[Address] DROP CONSTRAINT [FK_Address_StateProvince_StateProvinceID]
GO


SELECT  a.AddressID
       ,sp.StateProvinceID
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
WHERE   a.AddressID = 27234;

SELECT  a.AddressID
       ,a.StateProvinceID
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
WHERE   a.AddressID = 27234;

