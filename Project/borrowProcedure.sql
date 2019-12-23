-- DROP PROCEDURE Borrow;
delimiter //
CREATE PROCEDURE Borrow(
	IN Book INT,
    IN Branch INT,
    IN Person INT)
BEGIN
	IF EXISTS((SELECT * FROM BRANCH_COPIES WHERE BRANCH_COPIES.BookID = Book AND Available = 'Available' AND BRANCH_COPIES.BranchID = Branch))
		THEN 
        SET @Copy = (SELECT CopyID FROM BRANCH_COPIES WHERE BRANCH_COPIES.BookID = Book AND Available = 'Available' AND BRANCH_COPIES.BranchID = Branch LIMIT 1);
        INSERT INTO LOAN(Loan_date, Due_date, Extension, PersonID, CopyID, BranchID)
		VALUES 
        (NOW(), 
        DATE_ADD(NOW(), 
			INTERVAL (SELECT Loan_period FROM LOAN_TYPE WHERE LOAN_TYPE.TypeOf = (SELECT Type_of_person FROM UNIVERSITY_PERSON WHERE UNIVERSITY_PERSON.ID = Person) AND LOAN_TYPE.Category = (SELECT Category FROM BRANCH_COPIES WHERE BRANCH_COPIES.CopyID = (SELECT @Copy))) DAY), 
		0, 
		Person, 
		(SELECT @Copy),
		Branch);
        UPDATE BRANCH_COPIES SET Available = 'Lent Out' WHERE BRANCH_COPIES.CopyID = (SELECT @Copy);
        CALL newBookChange();
	ELSEIF EXISTS ((SELECT * FROM BRANCH_COPIES WHERE BRANCH_COPIES.BookID = Book AND Available ='Available'))
		THEN
        SET @Copy = (SELECT CopyID FROM BRANCH_COPIES WHERE BRANCH_COPIES.BookID = Book AND Available = 'Available' LIMIT 1);
        INSERT INTO LOAN(Loan_date, Due_date, Extension, PersonID, CopyID, BranchID)
		VALUES (NOW(), DATE_ADD(NOW(), INTERVAL (SELECT Loan_period FROM LOAN_TYPE WHERE LOAN_TYPE.TypeOf = (SELECT Type_of_person FROM UNIVERSITY_PERSON WHERE UNIVERSITY_PERSON.ID = Person) AND LOAN_TYPE.Category = (SELECT CATEGORY FROM BRANCH_COPIES WHERE BRANCH_COPIES.CopyID = (SELECT @Copy))) DAY), 0, Person, (SELECT @Copy), (SELECT BranchID FROM BRANCH_COPIES WHERE BRANCH_COPIES.CopyID = (SELECT @Copy)));
		UPDATE BRANCH_COPIES SET Available = 'Lent Out' WHERE BRANCH_COPIES.CopyID = (SELECT @Copy);
        CALL newBookChange();
	ELSE
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'No copies remaining!';
    END IF;
END; //
delimiter ;