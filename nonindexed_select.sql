SELECT  t1.t1_c2
       ,t2.t2_c2
FROM   dbo. t1
        JOIN dbo.t2
        ON t1.t1_c2 = t2.t2_c2
WHERE   t1.t1_c2 = 2;

