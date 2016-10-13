IF(SELECT OBJECT_ID('spAddressByCity')) IS NOT NULL
  DROP PROC dbo.spAddressByCity
GO
CREATE PROC dbo.spAddressByCity
@City NVARCHAR(30)
AS
SELECT a.AddressID,a.AddressLine1,AddressLine2,a.City,sp.[Name] AS StateProvinceName,a.PostalCode
FROM Person.Address AS a
JOIN Person.StateProvince AS sp
ON a.StateProvinceID = sp.StateProvinceID
WHERE a.City = @City
