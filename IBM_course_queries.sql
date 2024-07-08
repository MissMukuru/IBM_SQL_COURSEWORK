select * from INSTRUCTOR

SELECT LastName, FirstName  , County
FROM INSTRUCTOR
WHERE City = 'Toronto'

UPDATE INSTRUCTOR SET "City" = 'Markem'
WHERE ins_id = 1
SELECT * FROM INSTRUCTOR


DELETE FROM INSTRUCTOR WHERE ins_id = 2
SELECT * FROM INSTRUCTOR


--RETRIEVE ALL EMPS WHOSE ADDRESS IS ELGIN, iL
SELECT * FROM Employees_updated
WHERE column7 LIKE '%Elg%'

--all employees whowere born during the 1970s
SELECT * FROM Employees_updated
WHERE column5 LIKE '%1970'


SELECT * FROM Employees_updated
WHERE (column9  BETWEEN 60000 AND 70000)

--LIST OF EMPLOYEES ORDERED BY DEPARTMENT ID
SELECT * FROM Employees_updated
ORDER BY column11

--Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
SELECT column2,column3,column11 FROM Employees_updated
ORDER BY column11 desc, column2 desc

--For each department ID retrieve the number of employees in the department.
SELECT column11, COUNT(column11) AS [NO_OF_EMPS]
FROM Employees_updated
GROUP BY column11

--For each department retrieve the number of employees in the department, and the average employee salary in the department..
SELECT AVG(column9)AS [AVERAGE OF SALARY], COUNT(column11) AS [NO OF EMPS]
FROM Employees_updated
GROUP BY column11
HAVING COUNT(column11) < 4
ORDER BY AVG(column9)

--Select the names and job start dates of all employees who work for the department number 5.
SELECT Employees_updated.column2, Employees_updated.column3, Employees_updated.column11,JobsHistory.column2
FROM Employees_updated INNER JOIN JobsHistory
ON Employees_updated.column1 = JobsHistory.column1
WHERE Employees_updated.column11 = 5


--Select the names, job start dates, and job titles of all employees who work for the department number 5.
SELECT Employees_updated.column2, Employees_updated.column3,JobsHistory.column2, Jobs.column2
FROM Employees_updated INNER JOIN JobsHistory ON Employees_updated.column1 = JobsHistory.column1
INNER JOIN Jobs ON Employees_updated.column8 = Jobs.column1 
WHERE Employees_updated.column11 = '5'

--Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees.
SELECT Employees_updated.column1, Employees_updated.column2,Employees_updated.column11, Departments.column2
FROM Employees_updated LEFT OUTER JOIN Departments ON Employees_updated.column2 = Departments.column2
WHERE Employees_updated.column11 = '5'
 