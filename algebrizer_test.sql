CREATE TABLE t1 (c1 INT) ;
INSERT  INTO t1
VALUES  (1) ;
SELECT  'Before Error'
       ,c1
FROM    t1 AS t ;
SELECT  'error'
       ,c1
FROM    no_t1 ; --Error: Table doesn't exist
SELECT  'after error' c1
FROM    t1 AS t ;
