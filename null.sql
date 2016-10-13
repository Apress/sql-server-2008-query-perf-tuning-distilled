SELECT  p.FirstName
FROM    Person.Person AS p
WHERE   p.FirstName < 'B'
        OR p.Firstname >= 'C';

SELECT  p.MiddleName
FROM    Person.Person AS p
WHERE   p.MiddleName < 'B'
        OR p.MiddleName >= 'C'
OR p.MiddleName IS NULL;

CREATE INDEX IX_Test1 ON Person.Person (MiddleName);
CREATE INDEX IX_test2 ON Person.Person (FirstName);

DROP INDEX person.Person.ix_test2
DROP INDEX Person.Person.IX_Test1



