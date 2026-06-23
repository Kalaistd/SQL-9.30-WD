
create table emp(
e_name varchar(30),
age int,
dept varchar(30),
hire_date date
)


select *
from empp
where dept='IT'



insert into emp values('Arjun',21,'CSE','2023-05-06'),
('Ajay',22,'DS','2026-03-06'),
('Harini',20,'EEE','2024-05-01'),
('Aishwarya',25,'IT','2025-07-06');


alter table emp rename to empp

-------------------------------------------------


CREATE TABLE emp (
  empno decimal(4,0) NOT NULL,
  ename varchar(10) default NULL,
  job varchar(9) default NULL,
  mgr decimal(4,0) default NULL,
  hiredate date default NULL,
  sal decimal(7,2) default NULL,
  comm decimal(7,2) default NULL,
  deptno decimal(2,0) default NULL
);

DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  deptno decimal(2,0) default NULL,
  dname varchar(14) default NULL,
  loc varchar(13) default NULL
);

INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

INSERT INTO dept VALUES ('10','ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');
INSERT INTO dept VALUES ('30','SALES','CHICAGO');
INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');

select *
from emp
where sal >= 3000 or deptno=20

select 11%2;


select *
from emp
where ename like 'S%'

select *
from emp
where ename like '%S'

select *
from emp
where ename like '__L%'



select *
from dept
where dept in ('IT','DS') or salary > 13000


select *
from emp
where job in ('CLERK','MANAGER') AND sal > 2000



select *
from emp
where sal between 2000 and 5000


select *
from emp
where comm is null


---Aggregate functions (with in group by)

---count,sum,avg,min,max

select count(*)
from emp
group by deptno


select deptno,  count(*)
from emp
group by deptno



select job, count(*)
from emp
group by job


select job, sum(sal) 
from emp
group by job


select job, sum(sal) as total_salary
from emp
group by job



select job, avg(sal) as avg_salary
from emp
group by job


select job, min(sal) 
from emp
group by job



select job, max(sal) 
from emp
group by job


select * 
from  emp
order by hiredate asc



select * 
from  emp
order by sal desc



CREATE INDEX idx_ename ON emp(ename)
SELECT * FROM emp WHERE ename='Alice';



view index


drop index idx_ename on emp(ename)

CREATE TABLE departments (dept_id INT PRIMARY KEY,dept_name VARCHAR(50));

CREATE TABLE employees 
(emp_id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT REFERENCES departments (dept_id));

INSERT INTO departments (dept_id,dept_name) values
(10,'HR'),(20,'IT'),(30,'TRAINING'),(40,'ACCOUNTS')

INSERT INTO employees (emp_id, name, dept_id)VALUES
(1, 'Kalai', 10),(2, 'Jana', 20),(3, 'Karthi', 30),(4, 'Sasi', 40),(5, 'Siva',NULL);

SELECT * FROM EMPLOYEES ORDER BY 1
UPDATE EMPLOYEES
SET NAME='Vishnu'
WHERE DEPT_ID=40

--------------INNER

SELECT employees.name, departments.dept_name
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id;


----------------- LEFT

SELECT employees.name, departments.dept_name
FROM employees
LEFT JOIN departments ON employees.dept_id = departments.dept_id;

--------------------RIGHT

SELECT employees.name, departments.dept_name
FROM employees
RIGHT JOIN departments ON employees.dept_id = departments.dept_id;

----------------FULL

SELECT employees.name, departments.dept_name
FROM employees
FULL JOIN departments ON employees.dept_id = departments.dept_id;

----------------------SELF

SELECT employees.name, departments.dept_name
FROM employees
SELF JOIN departments ON employees.dept_id = departments.dept_id;


-------------CROSS

SELECT employees.name, departments.dept_name
FROM employees
CROSS JOIN departments





select * from emp where comm is not null


-------------------------------


---Sub Queries

select * from emp
SELECT * FROM dept


select max(sal)
from emp


select * from emp where ename='KING'


select * 
from emp
where(
select max(sal)
from emp
)



SELECT ename, deptno
FROM emp
WHERE deptno IN (
    SELECT deptno
    FROM dept
    WHERE deptno = 30
);


SELECT * FROM EMP WHERE DEPTNO=30

SELECT ename, job
FROM emp
WHERE job IN (
    SELECT job
    FROM emp
    WHERE job = 'SALESMAN');

-----NOT IN

SELECT ename, deptno
FROM emp
WHERE deptno NOT IN (
    SELECT deptno
    FROM emp
    WHERE deptno = 30
);



------EXIST


SELECT d.deptno, d.dname
FROM dept d
WHERE EXISTS (
    SELECT 1
    FROM emp e
    WHERE e.deptno = d.deptno
);


SELECT d.deptno, d.dname
FROM dept d
WHERE NOT EXISTS (
    SELECT 1
    FROM emp e
    WHERE e.deptno = d.deptno
);
