create table t10(age int,id int primary key identity(1,1));

--show all table in curr databse
select * from INFORMATION_SCHEMA.TABLES where TABLE_TYPE='BASE TABLE';
--or
select TABLE_NAME from INFORMATION_SCHEMA.TABLES  where TABLE_TYPE='BASE TABLE';
--or
select TABLE_NAME from [temp_09_10_24].INFORMATION_SCHEMA.TABLES  where TABLE_TYPE='BASE TABLE';


--show all table form any db;
select TABLE_NAME from [DB1].INFORMATION_SCHEMA.TABLES  where TABLE_TYPE='BASE TABLE';


create table detail (gender varchar(1),age int,sr_no int);

alter table detail add id int default 10;

insert into DETAIL (gender,age,sr_no)values ('m',21,1);
select * from detail;

select iif(10<11,'yes','no') as result;

select isNULL(10,11);

SELECT SESSION_USER;

SELECT SYSTEM_USER;

select nullif(10,110);

-- CTE
create table employe (ename varchar(100),esalary int ,eid int primary key identity(100,100),edepartment varchar(100));

insert into employe (ename,esalary,edepartment) values 
('Rajan',1000,'dev'),('Rishabh',500,'hr'),('Rohan',2000,'accounts'),('shivam',5000,'nalla');

with AVG_SLRY_table as(
	select avg(esalary) as avg_salary from employe;
)
select ename from employe where esalary>avg_salary.AVG_SLRY_table



