SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 50000;

SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Location = 'New York');

SELECT FirstName, LastName
FROM Employees e
WHERE EXISTS (SELECT 1 FROM Projects p WHERE p.EmployeeID = e.EmployeeID);

SELECT FirstName, LastName FROM Employees
UNION
SELECT FirstName, LastName FROM Contractors;

SELECT EmployeeID, FirstName, LastName,
CASE 
    WHEN Salary > 70000 THEN 'High'
    WHEN Salary BETWEEN 50000 AND 70000 THEN 'Medium'
    ELSE 'Low'
END AS SalaryCategory
FROM Employees;

WITH EmployeeCTE AS (
    SELECT EmployeeID, FirstName, Salary
    FROM Employees
    WHERE Salary > 50000
)
SELECT AVG(Salary) AS AverageHighSalary FROM EmployeeCTE;

INSERT INTO Employees (FirstName, LastName, DepartmentID)
SELECT FirstName, LastName, 2 FROM NewHires WHERE StartDate >= '2024-01-01';

UPDATE e
SET e.Salary = e.Salary * 1.1
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.Location = 'Los Angeles';

DELETE FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Projects);

SELECT TOP 10 *
FROM Employees
ORDER BY Salary DESC;

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT DISTINCT d.Location
FROM Departments d
WHERE d.Location IS NOT NULL;

SELECT e.FirstName, e.LastName, COUNT(p.ProjectID) AS ProjectCount
FROM Employees e
LEFT JOIN Projects p ON e.EmployeeID = p.EmployeeID
GROUP BY e.FirstName, e.LastName;

SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE FirstName LIKE 'A%';

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.Budget > 100000;

SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT e.EmployeeID, e.FirstName, e.LastName, 
       ROW_NUMBER() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS SalaryRank
FROM Employees e;
