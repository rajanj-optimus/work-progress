select
	--here printing all the required datafield mentioned in assignment
	e1.first_name,
	e1.last_name,
	d1.department_name,
	e1.salary, 
	emp_with_total_hours.total_hours,
	--ranking employe according to their salary department wise
    rank() over (partition by d1.department_id order by e1.salary desc) as salary_rank,
case
	when emp_with_total_hours.total_hours>150 then 'star performer'
	when emp_with_total_hours.total_hours>=100 and total_hours<150 then 'good performer'
end as performance_category
from Employees e1

--creating a temp table (named-> emp_with_total_hours) using subquery which will store employe id and their total work 
join 
	(
		select
		sum(p2.project_hours)as total_hours,
		p2.employee_id 
		from projects p2 
		group by p2.employee_id 
	) as emp_with_total_hours
on emp_with_total_hours.employee_id=e1.employee_id
join Departments d1 
on e1.department_id=d1.department_id

--creating a temp table (named-> table_with_department_wise_total_work) using subquery which will store department wise total work and dep id 
join  
	(
		--using double join to get required data field
		select 
		sum(p3.project_hours) as departmentWise_totalHours,
		d3.department_id 
		from Departments d3
		join employees e3
		on e3.department_id=d3.department_id
		join projects p3
		on p3.employee_id=e3.employee_id 
		group by d3.department_id 
	) as table_with_department_wise_total_work
on table_with_department_wise_total_work.department_id=e1.department_id

--conditions to filter data according to which we want our data after doing double join with employee table and two tables i have created using sub query
where departmentWise_totalHours>100 and total_hours>100
order by d1.department_name,salary_rank;


--overall logic
--doing subquery create temp table according to our required data then do inner join on them (all the table employe, department ,emp_with_total_hours and table_with_department_wise_total_work)
--doing join according to our need and common field