 -- DROP PROCEDURE returnBook()
delimiter //
CREATE PROCEDURE returnBook(
	IN Loan INT,
    IN Branch INT)
BEGIN
	SET @Copy = (SELECT CopyID FROM LOAN WHERE LOAN.LoanID = Loan);
	INSERT INTO RETURNSTRACKER(Return_date, LoanID, BranchID)
    VALUES(CURRENT_DATE(), Loan, Branch);
    UPDATE BRANCH_COPIES SET Available='Available' WHERE BRANCH_COPIES.CopyID = (SELECT @Copy);
END; //
delimiter ;