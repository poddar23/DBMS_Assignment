CREATE DATABASE ronak;


CREATE TABLE student(studentID, int,studentName varchar(20),email varchar (20),contactno int)

alter TABLE student add COLUMN address varchar(50);

alter TABLE student CHANGE contackno phone int;

============DML===================

INSERT into student(studentID,studentName,email,phone)VALUES(101,"Ronak","ronak@gmail.com",8402833375);
INSERT into student(studentID,studentName,email,phone)VALUES(102,"Shiv","shiv@gmail.com",984734884);


UPDATE student SET phone=8011634830 WHERE studentID=101

SELECT name,email FROM 'employee' WHERE 1

SELECT name as EmployeeName FROM 'Employee' WHERE 1
SELECT * FROM "employee" WHERE EmployeeID=2

SELECT DISTINCT(studentname) as Studentname from student

The select DISTINCT statement is used to return only distinct (different) value

SELECT * from employee ORDER by name ASC;

SELECT * from employee ORDER by name DESC;

SELECT min(Salary) as Minsalary , name from employee

SELECT Max(Salary) as Maxsalary , name from employee

SELECT COUNT(name) as countofemp FROM employee WHERE Salary>65000

SELECT avg(Salary) as avgSalary FROM employee WHERE Salary>65000

SELECT sum(Salary) as totalSalary FROM employee WHERE Salary>65000

The AND operator is used to filter records based on more than one condition, like if you want to return all customers from Spain that starts with the letter 'G':

The OR operator is used to filter records based on more than one condition, like if you want to return all customers from Germany but also those from Spain:

The WHERE clause is used to filter records.

The MIN() function returns the smallest value of the selected column.

The MAX() function returns the largest value of the selected column.

SELECT * FROM employee WHERE name LIKE "a%" 

SELECT * FROM employee WHERE name LIKE "%a" 
SELECT * FROM employee WHERE name LIKE "%a%" 

SELECT * FROM `employee` WHERE DepartmentID in (1,2,3)

SELECT * FROM `employee` WHERE DepartmentID NOT In  (1,2,3)


SELECT * FROM `employee` WHERE HireDate BETWEEN "2017-01-01" AND "2019-12-31";
SELECT * FROM `employee` WHERE Salary BETWEEN 65000 AND 75000


SELECT * FROM employee join department on employee.DepartmentID= department.DepartmentID

SELECT * FROM `employee` join project on employee.ProjectID = project.ProjectID
SELECT * FROM `employee` left join project on employee.ProjectID = project.ProjectID
SELECT * FROM `employee` right join project on employee.ProjectID = project.ProjectID
SELECT * FROM `employee` Full join project;

SELECT COUNT(EmployeeID),DepartmentName FROM employee join department on employee.DepartmentID= department.DepartmentID GROUP BY(employee.DepartmentID)

SELECT SUM(Salary),DepartmentName FROM employee join department on employee.DepartmentID= department.DepartmentID GROUP BY(employee.DepartmentID)

SELECT * FROM project WHERE EXISTS(SELECT * FROM employee where employee.ProjectID = project.ProjectID and salary>60000);
===================================================================================

CREATE PROCEDURE empProce()
SELECT* from employee;

CALL empProce();

CREATE PROCEDURE getEmpById(id int)
SELECT * FROM employee WHERE EmployeeID =id

=============trigger==========================
CREATE TABLE emplog (
id INT PRIMARY KEY auto_increment,
epm_id INT,
time VARCHAR(50));

CREATE TRIGGER empTrigger
AFTER UPDATE ON employee
FOR EACH ROW
INSERT INTO emplog(empid,timeof)VALUES(old.EmployeeID,now())


START TRANSACTION;
DELETE FROM employee where employeeId=13;
COMMIT;

start transaction;
DELETE FROM employee where employeeid=12;
rollback;

START transaction;
UPDATE employee set name="sitesh" where employee=12;
Rollback;

