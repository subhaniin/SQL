create table DemoTable
(ID int primary key,Name varchar(50),dateofbirth DATE,email varchar(50),addrress varchar(100));

alter table DemoTable
rename column addrress to address;

insert into DemoTable(ID,Name,dateofbirth,email,address)
values
(5,'subhani','1997-01-01','subhani@gmail.com','2-65, 1st street, Ganganapalli, kakinada, PIN: 533006'),
(2,'subhani','1997-01-01','subhani@gmail.com','2-65, 1st street, Ganganapalli, kakinada, PIN: 533006'),
(3,'subhani','1997-01-01','subhani@gmail.com','2-65, 1st street, Ganganapalli, kakinada, PIN: 533006'),
(4,'subhani','1997-01-01','subhani@gmail.com','2-65, 1st street, Ganganapalli, kakinada, PIN: 533006')
;

select * from DemoTable;

Update DemoTable set email = concat(Name,'@gmail.com') where ID = 1;
Update DemoTable set email = concat(Name,'@gmail.com') where ID = 3;
Update DemoTable set email = concat(Name,'@gmail.com') where ID = 4;
Update DemoTable set email = concat(Name,'@gmail.com') where ID = 5;

SET SQL_SAFE_UPDATES = 0;

update demotable
set address=null;

SET SQL_SAFE_UPDATES = 1;