DROP PROCEDURE passwordChange()
delimiter //
CREATE PROCEDURE passwordChange(
	IN username VARCHAR(255),
    IN id INT,
    IN oldpassword VARCHAR(255),
    IN newpassword VARCHAR(255))
BEGIN
	IF EXISTS(SELECT * FROM BORROWER WHERE BORROWER.Borrower_username = username AND BORROWER.PersonID = id)
		THEN
			IF(SELECT Borrower_password FROM BORROWER WHERE BORROWER.Borrower_username = username AND PersonID = id)
            THEN
				UPDATE BORROWER SET BORROWER.Borrower_password = newpassword WHERE BORROWER.PersonID = id and BORROWER.Borrower_username = username;
            END IF;
    END IF;
END; //
delimiter ;