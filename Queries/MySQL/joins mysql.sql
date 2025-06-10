SET SQL_SAFE_UPDATES = 1;

USE DEMODB;

create table demotable2(id int primary key, name varchar(50));
insert into demotable2
values(1, 'subhani'),
(2,'ansar'),
(3,'ali');

select * from demotable2;

#drop table demotable2 abcd
                    
                    #FULL JOIN in mySQL
SELECT * 
FROM demotable
LEFT JOIN demotable2 ON demotable.id = demotable2.id

UNION

SELECT * 
FROM demotable
RIGHT JOIN demotable2 ON demotable.id = demotable2.id;
