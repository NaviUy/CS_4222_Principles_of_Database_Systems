-- DROP PROCEDURE newBookChange;
delimiter //
CREATE PROCEDURE newBookChange()
BEGIN
	UPDATE BRANCH_COPIES SET Category = (SELECT Type_of_book FROM BOOK WHERE BOOK.BookID = BRANCH_COPIES.BookID) WHERE DATE_ADD(Add_date, Interval 60 DAY) <= NOW();
END; //
delimiter ;