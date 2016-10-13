SELECT  v.[Name] AS VendorName
       ,v.CreditRating
       ,a.AddressLine1
       ,a.AddressLine2
       ,a.City
       ,sp.[Name] AS StateProvName
       ,p.[Name] AS ProductName
FROM    Person.Address AS a
        JOIN Person.StateProvince AS sp
        ON a.StateProvinceID = sp.StateProvinceID
        JOIN Person.BusinessEntityAddress AS bea
        ON a.AddressID = bea.AddressID
        JOIN Purchasing.Vendor AS v
        ON bea.BusinessEntityID = v.BusinessEntityID
        JOIN Purchasing.ProductVendor pv
        ON v.BusinessEntityId = pv.BusinessEntityID
        JOIN Production.Product AS p
        ON pv.ProductID = p.ProductID
WHERE   sp.[Name] = 'California'
