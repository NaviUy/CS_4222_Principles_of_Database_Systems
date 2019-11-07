-- 1. Create a prepared statement to display all employees' names in the department ? (Dno) .

PREPARE stmt FROM 'SELECT * FROM EMPLOYEE WHERE Dno = ?';

SET @aid = '5'

EXECUTE stmt USING @aid;

-- DEALLOCATE PREPARE stmt;

-- 2. Define a procedure to display all Clients (Cname) who have some project with Department 5.

DELIMITER //
CREATE PROCEDURE GetAllClients()
BEGIN
SELECT Cname
FROM CLIENT 
WHERE Pno 
IN(SELECT Pnumber 
FROM PROJECT 
WHERE Dnum = 5);
END; //
DELIMITER ;

CALL GetAllClients();


-- 3. Create a procedure to display the number of employees in the department, using Dno as the IN variable.

DELIMITER //
CREATE PROCEDURE GetAllClientsIn(IN Dno INT)
BEGIN
SELECT Cname
FROM CLIENT 
WHERE Pno 
IN(SELECT Pnumber 
FROM PROJECT 
WHERE Dnum = Dno);
END; //
DELIMITER ;

CALL GetAllClientsIn(5);

-- 4. Create a procedure to select the total number of projects of a department, using Dname as the IN variable, and define an OUT variable for the number of projects.

-- DELIMITER //
-- CREATE PROCEDURE TotalProjects (IN name VARCHAR(25), OUT total INT)
-- BEGIN
-- 	SELECT COUNT(*) 
-- 	INTO total
-- 	FROM PROJECT 
-- 	WHERE Dnum 
-- 		IN(SELECT Dnumber FROM DEPARTMENT WHERE Dname = name);
-- END; //
-- DELIMITER ;

DELIMITER //
CREATE PROCEDURE TotalProjects(
IN name varchar(15),
OUT totalNumber INT)
BEGIN
SELECT count(Dnum)
INTO totalNumber
FROM project 
WHERE Dnum in (select Dnumber from department where Dname = name);
end; //
DELIMITER ;

-- DROP PROCEDURE TotalProjects;

CALL TotalProjects('Research', @total);
SELECT @total;
 
-- 5. Create a trigger on WORKS_ON, if a new tuple with Hours=NULL is inserted, set the Hours to 0.

DELIMITER //
CREATE TRIGGER exampleTrigger BEFORE INSERT 
ON WORKS_ON
FOR EACH ROW 
BEGIN
	IF NEW.Hours IS NULL THEN
	SET NEW.Hours = 0;
	END IF;
END; //
DELIMITER ;

-- DROP TRIGGER 'exampleTrigger';

INSERT INTO WORKS_ON(Essn, Pno, Hours) VALUES(888665555, 10, NULL);

SELECT * FROM WORKS_ON;


-- 6. Create a table with attributes SSN, dependent_name and ChangeTimeStamp, whenever a new tuple is inserted into DEPENDENT table, record the operation using a trigger.

CREATE TABLE newTable(
	SSN varchar(9),
	dependent_name varchar(25),
	ChangeTimeStamp DateTime DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER dependent_audit BEFORE INSERT ON DEPENDENT
FOR EACH ROW
BEGIN
	INSERT INTO newTable(SSN, dependent_name) VALUES (NEW.Essn, NEW.Dependent_name);
END; //
DELIMITER ;

-- DROP TRIGGER 'dependent_audit';
-- DROP TABLE newTable;

INSERT INTO DEPENDENT(Essn, Dependent_name, Sex, Bdate, Relationship) VALUES('123456789', 'Kyle', 'M', '1967-06-06', 'Husband');

-- 7. Create a trigger on CLIENT, whenever a tuple is deleted, delete all the tuples in PROJECT table and WORKS_ON table with the same Pno as the deleted tuple from CLIENT.

DELIMITER //
CREATE TRIGGER client_trigger AFTER DELETE ON Client
FOR EACH ROW
BEGIN
	DELETE FROM WORKS_ON WHERE Pno = OLD.Pno;
	DELETE FROM PROJECT WHERE Pnumber = OLD.Pno;
END; //
DELIMITER ;

DELETE FROM CLIENT WHERE Cname ='Google' AND Pno = '20';

-- 8. Create a trigger on EMPLOYEE, whenever a new employee is inserted, if the employee has salary higher than his/her supervisor, set the employee's salary to NULL.

DELIMITER //
CREATE TRIGGER employee_trigger BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
	IF NEW.Salary > (SELECT Salary FROM EMPLOYEE WHERE Ssn = NEW.Super_ssn) THEN
	SET NEW.Salary = NULL;
	END IF;
END; //
DELIMITER ;

INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES('Jason', 'M', 'Hannanto', '000111222', '1997-04-23', '1528 Ethel, Alhambra, CA', 'M', '60000', '888665555', '5');