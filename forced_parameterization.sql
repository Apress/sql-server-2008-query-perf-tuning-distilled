SELECT  ea.EmailAddress
       ,e.BirthDate
       ,a.City
FROM    Person.Person AS p
        JOIN HumanResources.Employee AS e
        ON p.BusinessEntityID = e.BusinessEntityID
        JOIN Person.BusinessEntityAddress AS bea
        ON e.BusinessEntityID = bea.BusinessEntityID
        JOIN Person.Address AS a
        ON bea.AddressID = a.AddressID
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.EmailAddress AS ea
        ON p.BusinessEntityID = ea.BusinessEntityID
WHERE   ea.EmailAddress LIKE 'david%'
        AND sp.StateProvinceCode = 'WA' ;