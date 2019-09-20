--(1) Retrieve the names of employees in department 5 who work more than 10 hours per week on the 'ProductX' project.

SELECT Fname FROM employee, works_on, project WHERE ssn = Essn AND Dno = Dnum AND Pname = "ProductX" AND Pno =  Pnumber;

--(2) List the names of employees who have a dependent with the same first name as themselves.

SELECT Fname FROM employee, dependent WHERE Dependent_name = Fname;

--(3) Find the names of employees that are directly supervised by 'Franklin Wong'.

SELECT Fname FROM employee WHERE Super_ssn IN (SELECT Mgr_ssn  FROM department, employee WHERE Fname = "Franklin" AND Lname = "Wong" AND Mgr_ssn = Ssn);

--(4) For each project, list the project name and the total hours per week (by all employees) spent on that project.

SELECT Pname, Sum(Hours) FROM project, works_on WHERE Pno = Pnumber GROUP BY Pnumber;

--(5) Retrieve the names of employees who work on every project of JPL.

SELECT Fname 
FROM EMPLOYEE
WHERE NOT EXISTS (SELECT *
FROM WORKS_ON B
WHERE(B.Pno IN (SELECT Pno 
FROM CLIENT WHERE CName = "JPL")
AND
NOT EXISTS ( SELECT * 
FROM WORKS_ON C
WHERE C.Essn = Ssn
AND C.Pno = B.Pno)));

--(6) Retrieve the names of employees who do not work on any project of JPL.

SELECT Fname from employee WHERE Ssn NOT IN (SELECT DISTINCT Essn FROM works_on WHERE Pno IN (SELECT Pno FROM client WHERE Cname = "JPL"));

--(7) For each department, retrieve the department name, and the average salary of employees working in that department.

SELECT Dname, avg(Salary) FROM department, employee WHERE Dno = Dnumber GROUP BY Dno;

--(8) Retrieve the average (total) working hour (on all projects) of all female employees.

SELECT sum(hours) / count(DISTINCT Essn) FROM works_on WHERE Essn IN (SELECT ssn FROM employee WHERE sex = "F");

--(9) Find the names and addresses of employees who work on at least one project located in Houston but whose department has no location in Houston.

SELECT Fname, Address FROM employee WHERE Ssn IN ( SELECT Essn FROM works_on WHERE Pno IN (SELECT Pnumber FROM project WHERE Plocation = "Houston")) AND Dno NOT IN (SELECT Dnumber FROM dept_locations WHERE Dlocation = "Houston");

--(10) List the last names of department managers who have no dependents.

SELECT Lname FROM employee WHERE Ssn IN (SELECT Mgr_ssn FROM department WHERE Mgr_ssn NOT IN  (SELECT Essn FROM dependent));