select * 
from emp

drop table empp

create table emp(
id int,
ename varchar(30),
dept varchar(30)
);

INSERT INTO emp (id,ename,dept) 
VALUES ('1', 'Kalai', 'HR'),
(2, 'Anbu', 'IT'),
(3, 'Sreenithi', 'Sales'),
('4', 'Praveen', 'Acnt');

/*
--update syntax
UPDATE emp 
SET dept='Mgr'
WHERE ename = 'Sreenithi';
*/

DELETE FROM emp
	WHERE dept = 'IT';


ALTER TABLE empp RENAME TO emp;

ALTER TABLE emp RENAME COLUMN name TO full_name;



drop table emp


truncate table emp


ALTER TABLE emp ADD COLUMN age int,add column join_date date;

UPDATE emp 
SET salary = 40000
WHERE id=2;

Alter table emp drop column join_date;


select ename,salary
from emp
