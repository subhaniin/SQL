use bfsi;

create table managers
(Manager_ID int primary key, manager_name varchar(50));
insert into managers
values
(1,'a'),
(2,'b'),
(3,'c'),
(4,'d'),
(5,'e'),
(6,'f'),
(7,'g'),
(8,'h'),
(9,'i'),
(10,'j'),
(11,Manager_name);

select * from managers;

delete from managers where manager_ID=11