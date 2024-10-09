
--creating departments table
CREATE TABLE Departments 
(department_id int primary key,department_name varchar (100),dlocation varchar(100));

--creating empoyee table
CREATE TABLE Employees 
(employee_id int primary key, first_name varchar(100),last_name varchar(100),department_id int foreign key references Departments,salary decimal,hire_date date);

--creating projects table
CREATE TABLE Projects 
(project_id int primary key,project_name varchar(100),employee_id int Foreign Key references Employees,project_hours int);


-- TASKS

-- part 1 inserting data

-- inserting data into department table
INSERT INTO Departments values 
(1,'dev','first floor'),
(2,'accounts','first floor'),
(3,'hr','second floor'),
(4,'it','third floor');

--inserting data into Employees table
INSERT INTO Employees values
(1,'Rajan','Jha',1,100000,'2024-06-10'),
(2,'Rohan','Verma',1,65000,'2023-06-10'),
(3,'Akash','Singh',2,70000,'2023-06-10'),
(4,'Shivam','Bansal',3,50000,'2023-06-10'),
(5,'Vaibhav','Walia',4,6000,'2023-06-10'),
(6,'Sahil','Rajalwal',1,1000,'2023-06-10'),
(7,'Sachin','Jha',2,1000000,'2023-06-10');

INSERT INTO Employees values 
(8,'Temp','t',2,3000,'2021-06-09');

--inserting data into projects
INSERT INTO Projects values
(1,'button',1,200),
(2,'ui',2,150),
(3,'hiring',4,1),
(4,'account opening',3,2),
(5,'software setup',5,200);



--Part 2 Data Retrieval

--Retrieve a list of employees along with the name of the department they belong to.
select e.*,d.department_name
from Employees as e  inner join Departments as d 
on e.department_id=d.department_id;

--Find all employees and their corresponding project information, including employees who are not assigned to any projects.
select e.*,p.*
from Employees as e left join Projects as p
on e.employee_id=p.employee_id;


--Part 3 filtering data

--List all employees whose salary is above $50,000.
select * from Employees where salary>50000;

--Find all employees who were hired in the past three years.
select * from Employees as e where hire_date >= DATEADD(year,-3,getdate()) ;

--select DATEDIFF(year,'2021-06-09',getdate());



--Part-4 : Grouping and Filtering on Aggregated Data

--Determine the total number of hours worked by employees in each department.
select d.department_name,sum(p.project_hours) as total_hours
from  departments as d
join employees e on d.department_id = e.department_id
join projects p on e.employee_id = p.employee_id
group by d.department_name
order by total_hours desc;


--From the previous result, display only those departments where the total project hours exceed 100.

select d.department_name,
sum(p.project_hours) as total_hours
from departments d
join employees e on d.department_id = e.department_id
join projects p on e.employee_id = p.employee_id
group by d.department_name
having sum(p.project_hours) > 100
order by total_hours desc;


--part-5

--Rank employees by their salary within each department, displaying the employee's name, department, salary, and their rank in that department.
with rankedemployees as (
select  e.first_name, e.last_name, d.department_name, e.salary,
rank() over (partition by d.department_id order by e.salary desc) as salary_rank
from employees e
join departments d on e.department_id = d.department_id
)
select first_name,last_name,department_name,salary,salary_rank
from rankedemployees
order by department_name, salary_rank;


--part -6

--Retrieve a list of employees with their salary and a new column that classifies their salary into three categories:
--"High" for employees earning more than $80,000,
--"Medium" for those earning between $50,000 and $80,000,
--"Low" for employees earning less than $50,000.
select first_name,last_name,salary,
    case 
        when salary > 80000 then 'high'
        when salary between 50000 and 80000 then 'medium'
        else 'low'
    end as salary_category
from employees
order by salary desc;


