select * from practice;

insert into practice (Name_s, contact, Email)
values ('abcd', 1234567890, 'abc@efg.com'),
('abcd', 1234567890, 'abc@efg.com'),
('abcd', 1234567890, 'abc@efg.com'),
('abcd', 1234567890, 'abc@efg.com'),
('abcd', 1234567890, 'abc@efg.com'),
('abcd', 1234567890, 'abc@efg.com');

SHOW CREATE TABLE practice;

ALTER TABLE practice MODIFY ID INT AUTO_INCREMENT PRIMARY KEY;