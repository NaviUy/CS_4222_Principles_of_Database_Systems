-- 1. List the department managers who are controlling more than 2 projects.

SELECT Fname, Lname 
FROM EMPLOYEE 
WHERE Ssn 
	IN (SELECT Mgr_ssn 
		FROM DEPARTMENT 
		WHERE Dnumber 
			IN (SELECT Dnum 
				FROM PROJECT 
				GROUP BY Dnum 
				HAVING COUNT(Dnum) > 2));
 
-- 2. Retrieve the names of the departments that only located in ‘Houston’.

SELECT Dname
FROM DEPARTMENT
WHERE Dnumber
	IN (SELECT Dnumber 
    	FROM DEPT_LOCATIONS
    	WHERE Dlocation = "Houston")
AND
NOT Dname =
  		(SELECT Dname 
  		FROM DEPARTMENT 
   		WHERE Dnumber
  		IN (SELECT Dnumber 
  			FROM DEPT_LOCATIONS 
  			WHERE Dnumber 
  			GROUP BY Dnumber 
  			HAVING COUNT(Dnumber) > 1));	
			
-- 3. List the names of employees all of whose dependents were born before 1960.
 
-- SELECT Fname, Lname
-- FROM EMPLOYEE
-- WHERE Ssn 
-- 	IN(SELECT Essn 
-- 	FROM DEPENDENT 
-- 	WHERE YEAR(Bdate) < 1960);

SELECT Fname, Lname, Dependent_name
FROM EMPLOYEE
LEFT JOIN DEPENDENT
ON Ssn = Essn
WHERE Essn IN (SELECT Essn FROM DEPENDENT WHERE YEAR(DEPENDENT.Bdate) < 1960) 
AND NOT Essn IN (SELECT Essn FROM DEPENDENT WHERE YEAR(DEPENDENT.Bdate) > 1960);

-- 4. List the names of departments managed by the direct subordinate of the manager of ‘Headquarters’ department.

SELECT Dname
FROM DEPARTMENT
WHERE Mgr_ssn 
	IN(SELECT Ssn
	FROM EMPLOYEE
	WHERE Ssn
		IN(SELECT Ssn
		FROM EMPLOYEE 
		WHERE Super_ssn
			In(SELECT Mgr_ssn
			FROM DEPARTMENT 
			WHERE Dname = "Headquarters")));
	
-- 5. Retrieve the average salary of male employees who work totally no less than 50 hours on projects.

SELECT AVG(Salary)
FROM EMPLOYEE
WHERE Ssn 
	IN(SELECT Essn
	FROM WORKS_ON
	GROUP BY Essn
	HAVING SUM(Hours) >= 50);	

-- 6. Find the names of projects that all direct subordinates of James Borg work for.

-- SELECT Pname
-- FROM PROJECT
-- WHERE Dnum
-- 	 IN (SELECT Dno
-- 	 FROM EMPLOYEE
-- 	 WHERE Super_ssn
-- 	 	IN(SELECT Ssn
-- 	 	FROM EMPLOYEE
-- 	 	WHERE Fname = "James" AND Lname = "Borg"));

SELECT Pname
FROM PROJECT
WHERE Pnumber
	IN(SELECT Pno FROM WORKS_ON A
	WHERE Essn
		IN(SELECT Ssn FROM EMPLOYEE
		WHERE Super_ssn
			IN(SELECT Ssn FROM EMPLOYEE WHERE Fname = "James" AND Lname = "Borg"))
		GROUP BY Pno
		HAVING COUNT(Pno) = (SELECT COUNT(Ssn) FROM EMPLOYEE WHERE Super_ssn 
			IN(SELECT Ssn FROM EMPLOYEE WHERE Fname = "James" AND Lname = "Borg")));
		
 
-- 7. Show the name of employee who and whose supervisor are in different departments.

SELECT emp.Fname, emp.Super_ssn, emp.Dno
FROM EMPLOYEE as emp
LEFT JOIN EMPLOYEE as sup
ON emp.Super_ssn = sup.Ssn 
WHERE emp.Dno != sup.Dno;

-- 8. Find the name of employee who only has spouse as the dependent.

SELECT Fname, Lname 
FROM EMPLOYEE as emp
WHERE emp.Ssn 
	IN (SELECT dep.Essn 
	FROM DEPENDENT as dep
	WHERE dep.Relationship = 'Spouse') 
	AND emp.Ssn 
		IN (SELECT dep2.Essn 
		FROM DEPENDENT as dep2
		GROUP BY dep2.Essn 
		HAVING Count(dep2.Essn) = 1);
