
$val = 0; 
while ($val -lt 255)
{$val++; 
Invoke-sqlcmd -Server "FRITCHEYGXP\GF2008" -Database "AdventureWorks2008" -Query "SELECT * FROM Person.Address AS a WHERE city LIKE '' + CHAR($val) + '%'";
Invoke-sqlcmd -Server "FRITCHEYGXP\GF2008" -Database "AdventureWorks2008" -Query "SELECT * FROM production.Product AS p WHERE p.ProductNumber LIKE '' + CHAR($val) + '%'";
$val2 = 59;
while ($val2 -gt 57)
{$val2--;
Invoke-sqlcmd -Server "FRITCHEYGXP\GF2008" -Database "AdventureWorks2008" -Query "SELECT * FROM Sales.SalesOrderHeader AS soh WHERE soh.SalesOrderNumber LIKE 'SO' + CAST($val2 AS VARCHAR) + '%'";
}
}