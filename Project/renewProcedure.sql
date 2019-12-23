-- DROP PROCEDURE Renew;
delimiter //
CREATE PROCEDURE Renew(
	IN Loan INT)
BEGIN
	SET @Person = (SELECT PersonID FROM LOAN WHERE LOAN.LoanID = Loan);
    SET @Copy = (SELECT CopyID FROM LOAN WHERE LOAN.LoanID = Loan);
	IF NOT EXISTS (SELECT * FROM RETURNSTRACKER WHERE RETURNSTRACKER.LoanID = Loan)
		THEN
        UPDATE LOAN SET Extension = 1, Due_date = DATE_ADD(Due_date, INTERVAL (SELECT Extension FROM LOAN_TYPE WHERE LOAN_TYPE.TypeOf = (SELECT Type_of_person FROM UNIVERSITY_PERSON WHERE UNIVERSITY_PERSON.ID = (SELECT @Person)) AND LOAN_TYPE.Category = (SELECT Category FROM BRANCH_COPIES WHERE BRANCH_COPIES.CopyID = (SELECT @Copy))) DAY) WHERE LOAN.LoanID = Loan;
        CALL newBookChange();
	END IF;
END; //
delimiter ;
