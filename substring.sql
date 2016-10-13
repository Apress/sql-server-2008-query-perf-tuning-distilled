

SELECT  d.Name
FROM    HumanResources.Department AS d
WHERE   SUBSTRING(d.[Name], 1, 1) = 'F'


SELECT  d.Name
FROM    HumanResources.Department AS d
WHERE   d.[Name] LIKE 'F%'



