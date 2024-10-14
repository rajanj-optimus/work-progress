CREATE TRIGGER showEmployeess
ON Employees
AFTER INSERT
AS 
BEGIN
    SELECT * FROM Employees;
	
END;
GO;

ALTER TRIGGER showEmployeess
ON Employees
AFTER INSERT
AS 
BEGIN
	SELECT * FROM Employees;
	print 'Altered'
END;
drop trigger showEmployees;
insert into Employees values (100000002,'a','rrajan''s',1,1000,'2012-09-09');
GO;

DECLARE @count int=0;
set @count=@count+5;
while @count<100
	BEGIN
		set @count=@count+1;
	END
select @count as count;

Go;

DECLARE @ValidJSON NVARCHAR(MAX)='{"name":"Rajan"}';
select 
CASE
	WHEN ISJSON(@ValidJSON)=1 THEN  'Valid'
	ELSE  'Invalid'
END as CheckValidity

SELECT *
FROM OPENJSON(@ValidJSON)

GO;

select * from Employees;

CREATE CLUSTERED INDEX idx_EmployeeID
ON Employees(salary);
CREATE NONCLUSTERED INDEX idx_LastName
ON Employees(employee_id);
