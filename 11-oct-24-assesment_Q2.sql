create database dbb3

create table employees (employee_id  int primary key , ename varchar(20),depratment_name varchar (20),hire_date DATE);
create table departments (department_id int primary key ,department_name varchar(20));
create table sales (sale_id int primary key ,employee_id int foreign key references employees ,sale_date date,amount decimal);
create table performance_reviews (review_id int primary key,employee_id int foreign key references employees,review_date date ,score int);

insert into employees 
values
(1, 'A', 'Web', DATEFROMPARTS(1970, 01, 01)),
(2, 'B', 'Android', DATEFROMPARTS(1970, 01, 01)),
(3, 'C', 'AIML', DATEFROMPARTS(1970, 01, 01)),
(4, 'D', 'Web', DATEFROMPARTS(1970, 01, 01)),
(5, 'E', 'Android', DATEFROMPARTS(1970, 01, 01)),
(6, 'F', 'Web', DATEFROMPARTS(1970, 01, 01)),
(7, 'G', 'Web', DATEFROMPARTS(1970, 01, 01));


INSERT INTO Departments values
(1, 'Web'),
(2, 'Android'),
(3, 'AIML');

INSERT INTO Sales values
(1, 1, DATEFROMPARTS(1980, 01, 01), 1000),
(2, 1, DATEFROMPARTS(1981, 01, 01), 2000),
(3, 2, DATEFROMPARTS(1982, 01, 01), 3000),
(4, 3, DATEFROMPARTS(1983, 01, 01), 4000),
(5, 4, DATEFROMPARTS(1984, 01, 01), 5000),
(6, 5, DATEFROMPARTS(1985, 01, 01), 500),
(7, 6, DATEFROMPARTS(1986, 01, 01), 1000);


INSERT INTO Performance_Reviews values
(1, 1, DATEFROMPARTS(1990, 01, 01), 10),
(2, 1, DATEFROMPARTS(1991, 01, 01), 20),
(3, 2, DATEFROMPARTS(1992, 01, 01), 30),
(4, 3, DATEFROMPARTS(1993, 01, 01), 40),
(5, 4, DATEFROMPARTS(1994, 01, 01), 50),
(6, 5, DATEFROMPARTS(1995, 01, 01), 50),
(7, 6, DATEFROMPARTS(1996, 01, 01), 100),
(8, 7, DATEFROMPARTS(1997, 01, 01), 100);


-- Query 1: Rank employees based on total sales

select
e1.ename ,
rank() over (order by sale_data.total_sales desc) as emp_rank_sale_wise
from employees as e1 
join 
( 
	select 
	s1.employee_id ,
	sum(s1.amount)as total_sales 
	from sales as s1 
	group by s1.employee_id
) 
as sale_data
on e1.employee_id=sale_data.employee_id;

go;

-- Query 2: Rank employees by average performance score within their departments

with emp_avg_score as
(
	select 
	avg(p1.score) as avg_score,
	p1.employee_id 
	from performance_reviews as p1 
	group by p1.employee_id
)
select
e1.* ,
dense_rank() over (partition by depratment_name order by emp_avg_score.avg_score desc) as employee_rank_department_wise
from employees as e1
join 
emp_avg_score
on emp_avg_score.employee_id=e1.employee_id

go;


-- Query 3: Get top 3 employees by sales in each department



with emp_total_sale as
(
	select 
	sum(s1.amount) as total_sale,
	s1.employee_id 
	from sales s1 
	group by s1.employee_id
),
 ranked_emp as
(
	select 
	e1.*,
	row_number() over (partition by e1.depratment_name order by emp_total_sale.total_sale desc) as emp_rank_department_wise_top_3
	from employees as e1 
	join 
	emp_total_sale
	on  emp_total_sale.employee_id=e1.employee_id 
) 
select * from 
ranked_emp 
where emp_rank_department_wise_top_3 <= 3;


go;


-- Query 4:

with emp_total_sale as
(
	select sum(s1.amount) as total_sale,
	s1.employee_id 
	from sales s1 
	group by s1.employee_id
),
emp_avg_score as
(
	select avg(p1.score) as avg_score,
	p1.employee_id 
	from performance_reviews as p1 
	group by p1.employee_id
),
 ranked_emp as
(
	select 
	e1.*,
	emp_total_sale.total_sale,
	row_number() over (partition by e1.depratment_name order by emp_total_sale.total_sale desc) as emp_rank_department_wise_top
	from employees as e1 
	join 
	emp_total_sale
	on  emp_total_sale.employee_id=e1.employee_id 
) 
select 
ranked_emp.ename,
ranked_emp.depratment_name,
ranked_emp.total_sale,
emp_avg_score.avg_score  
from ranked_emp 
join
emp_avg_score 
on emp_avg_score.employee_id=ranked_emp.employee_id
where emp_rank_department_wise_top = 1
order by ranked_emp.depratment_name desc ,ranked_emp.total_sale desc;

