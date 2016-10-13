SELECT  s.[Name] AS StoreName
       ,p.[LastName] + ', ' + p.[FirstName]
FROM    [Sales].[Store] s
        INNER LOOP JOIN [Sales].SalesPerson AS sp
        ON s.SalesPersonID = sp.BusinessEntityID
        INNER LOOP JOIN HumanResources.Employee AS e
        ON sp.BusinessEntityID = e.BusinessEntityID
        INNER LOOP JOIN Person.Person AS p
        ON e.BusinessEntityID = p.BusinessEntityID
OPTION (LOOP JOIN)
