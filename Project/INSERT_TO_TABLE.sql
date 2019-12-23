INSERT INTO BRANCH (BranchName)
VALUES
	('Branch_A'),
    ('Branch_B'),
    ('Branch_C');
    
INSERT INTO UNIVERSITY_PERSON (Type_of_person, Fname, Lname, Gender, Department, Email, Birthdate)
VALUES
	('Vocational', 'Jeannie', 'Santiago', 'Female', 'Electrical Engineer', 'JSantiago@gmail.com', '1999-02-25'),
    ('Vocational', 'Eddie', 'Wright', 'Male', 'Computer Science', 'EWright@gmail.com', '1999-05-05'),
    ('Vocational', 'Derrick', 'Romero', 'Male', 'Finance', 'DRomero@gmail.com', '2002-06-10'),
    ('College', 'Valerie', 'Todd', 'Female', 'Electrical Engineer', 'VTodd@gmail.com', '2002-08-12'),
    ('College', 'Preston', 'Thompson', 'Male', 'Computer Science', 'PThompson@gmail.com', '2002-09-12'),
    ('College', 'Denise', 'Hunder', 'Female', 'Finance', 'DHunter@gmail.com', '2003-06-10'),
    ('Graduate', 'Flora', 'Garcia', 'Female', 'Electrical Engineer', 'FGarcia@gmail.com', '2006-10-04'),
	('Graduate', 'Spencer', 'Sanders', 'Male', 'Computer Science', 'SSanders@gmail.com', '2010-09-13'),
    ('Graduate', 'Everett', 'Page', 'Female', 'Finance', 'EPage@gmail.com', '2011-05-31'),
    ('Staff', 'Tommy', 'Ortiz', 'Male', 'Electrical Engineer', 'TOrtiz@gmail.com', '2012-06-21'),
    ('Staff', 'Jackie', 'Bennett', 'Female', 'Computer Science', 'JBannett@gmail.com', '2012-08-28'),
    ('Staff', 'Corolyn', 'Fields', 'Female', 'Finance', 'CFields@gmail.com', '2013-08-12'),
	('Faculty', 'Freddie', 'Burgess', 'Male', 'Electrical Engineer', 'FBurgess@gmail.com', '1998-10-13'),
    ('Faculty', 'Ricardo', 'Guerrero', 'Male', 'Computer Science', 'RGuerrero@gmail.com', '2000-02-16'),
    ('Faculty', 'Rosalie', 'Wright', 'Female', 'Finance', 'RWright@gmail.com', '2001-07-16');
    
INSERT INTO PUBLISHER (Publisher_name)
VALUES
	('Centennial Log Home'),
    ('Yesterday Island'),
    ('Family Of Friends');
    
INSERT INTO BOOK (Type_of_book, Book_name, ISBN, PublisherID, Publish_date, Number_of_words, Price, Brief_introduction)
VALUES
	('English', 'Friend Of The South', '978-3-3606-5388-8', 1, '2001-01-05', 8876, '47.21', 'She stood out from the crowd because she was different.'),
    ('English', 'Fish With Money', '978-5-8589-5509-2', 2, '2001-01-05', 2385, '37.54', 'Most vivid amongst the memories of his home town is when it got blown up.'),
    ('English', 'Trees Of Wood', '978-3-1786-5659-0', 3, '2001-01-05', 3591, '56.48', 'After five years, he just happened to be walking down her street?'),
    ('Foreign', 'Gods Of Reality', '978-9-8252-8640-0', 1, '2001-01-05', 9625, '71.98', 'She was carried along by the crowd of dragons.'),
    ('Foreign', 'Wives And Wolves', '978-3-6550-0884-3', 2, '2001-01-05', 619, '73.88', 'As the policeman pulled back the sheet, she knew immediately that she was caught in the act.'),
    ('Foreign', 'Friends And Companions', '978-9-4691-3136-4', 3, '2003-10-06', 1789, '18.04', 'The fire was getting closer to UCSB.'),
    ('English', 'Origin Of The Void', '978-2-5319-9750-9', 1, '2006-02-16', 8178, '53.68', 'The accident wasn\'t her fault!'),
    ('Foreign', 'Destiny Of Greatness', '978-0-9814-8385-6', 2, '2006-02-16', 1434, '66.76', 'She felt for the lock in the dark side.'),
    ('English', 'Commanding The Ocean', '978-8-2408-4089-1', 3, '2019-07-09', 6739, '80.95', 'He was excited to find 150 new emails in his inbox!');
    
 INSERT INTO AUTHOR (Fname, Lname)
 VALUES
	('Jeremy', 'Cox'),
    ('Travis', 'Wilson'),
    ('Brett', 'Reyes'),
    ('Roberta', 'Jones'),
    ('Timmy', 'Fuller'),
    ('Neal', 'Conner'),
    ('Gregg', 'Mcdaniel'),
    ('Wayne', 'Scott'),
    ('Angelica', 'Jordan'),
    ('Jamie', 'Ramos'),
    ('Mindy', 'Maxwell'),
    ('Steve', 'May');
    
INSERT INTO BOOK_AUTHOR(AuthorID, BookID)
VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 4),
    (6, 5),
    (7, 5),
    (8, 6),
    (9, 6),
    (10, 7),
    (11, 8),
    (12, 9);
 
INSERT INTO BRANCH_COPIES(BranchID, BookID, Add_date, Available, Category)
VALUES
	(1, 1, '2019-11-28', 'Lent Out', 'New'),
    (1, 1, '2019-11-28', 'Lent Out','New'),
    (1, 1, '2019-11-28', 'Lent Out', 'New'),
    (1, 2, '2013-06-07', 'Lent Out', 'English'),
    (1, 2, '2013-06-07', 'Lent Out', 'English'),
    (1, 3, '2013-11-18', 'Lent Out',' English'),
	(1, 4, '2015-07-24', 'Lent Out','Foreign'),
    (1, 4, '2015-07-24', 'Lent Out', 'Foreign'),
    (1, 5, '2019-02-18', 'Lent Out', 'Foreign'),
    (1, 5, '2019-02-18', 'Lent Out', 'Foreign'),
    (1, 5, '2019-02-18', 'Lent Out', 'Foreign'),
    (1, 6, '2006-07-10', 'Lent Out', 'Foreign'),
    (2, 6, '2019-11-28', 'Available', 'New'),
    (2, 6, '2019-11-28', 'Available', 'New'),
    (2, 5, '2019-11-28', 'Available', 'New'),
    (2, 5, '2008-01-07', 'Lent Out', 'Foreign'),
    (2, 7, '2013-11-11', 'Lent Out', 'English'),
    (2, 8, '2014-04-21', 'Available', 'Foreign'),
	(2, 8, '2014-04-21', 'Available', 'Foreign'),
    (2, 9, '2007-10-09', 'Available', 'English'),
    (2, 9, '2007-10-09', 'Available', 'English'),
    (2, 9, '2007-10-09', 'Available', 'English'),
    (2, 1, '2009-02-16', 'Available', 'English'),
    (2, 2, '2009-05-19', 'Available', 'English'),
    (3, 3, '2019-11-28', 'Available', 'New'),
    (3, 4, '2019-11-28', 'Available', 'New'),
	(3, 5, '2019-11-28', 'Available', 'New'),
    (3, 6, '2009-12-07', 'Available', 'Foreign'),
    (3, 7, '2009-12-07', 'Available', 'English'),
	(3, 8, '2006-02-02', 'Available', 'Foreign'),
    (3, 9, '2006-05-30', 'Available', 'English'),
	(3, 1, '2007-12-04', 'Available', 'English'),
    (3, 7, '2018-03-16', 'Available', 'English'),
    (3, 9, '2018-03-16', 'Available', 'English');
    
INSERT INTO LOAN(Loan_date, Due_date, Extension, PersonID, CopyID, BranchID)
VALUES
	('2019-11-28', '2020-01-28', 0, 1, 1, 1),
    ('2019-11-28', '2020-01-28', 0, 4, 10, 1),
    ('2019-11-28', '2020-01-28', 0, 7, 8, 1),
    ('2019-11-28', '2020-01-28', 0, 10, 3, 1),
    ('2019-11-28', '2020-02-28', 0, 13, 6, 1),
    ('2019-9-28', '2019-10-28', 0, 2, 7, 1),
    ('2019-9-28', '2019-11-28', 0, 5, 11, 1),
    ('2019-9-28', '2019-11-28', 1, 8, 9, 1),
    ('2019-9-28', '2019-11-28', 0, 11, 5, 1),
    ('2019-10-28', '2020-01-28', 0, 14, 2, 1),
    ('2019-10-28', '2019-11-28', 1, 3, 16, 2),
    ('2019-10-28', '2019-12-28', 0, 6, 4, 1),
    ('2019-10-28', '2019-11-4', 1, 9, 12, 1),
    ('2019-10-28', '2019-11-4', 0, 13, 17, 2);
    
INSERT INTO BORROWER(Borrower_username, Borrower_password, PersonID)
VALUES
	('JSan', '1234567989', 1),
    ('EWri', '1234567989', 2),
    ('DRom', '1234567989', 3),
    ('VTod', '1234567989', 4),
    ('PTho', '1234567989', 5),
    ('DHun', '1234567989', 6),
    ('FGar', '1234567989', 7),
    ('SSan', '1234567989', 8),
    ('EPag', '1234567989', 9),
    ('TOrt', '1234567989', 10),
    ('JBen', '1234567989', 11),
    ('CFie', '1234567989', 12),
    ('FBur', '1234567989', 13),
    ('RGue', '1234567989', 14),
    ('RWri', '1234567989', 15);
    
INSERT INTO PASTDUE(LoanID, Amountdue)
VALUES
	(6, '6.20'),
    (13, '12.00');
    
INSERT INTO RETURNSTRACKER(Return_date, LoanID, BranchID)
VALUES
	('2019-11-28', 7, 1),
    ('2019-11-28', 8, 1),
    ('2019-11-28', 9, 1),
    ('2019-11-28', 11, 2);
    
INSERT INTO Loan_Type(TypeOf, Category, Max_Loaned, Loan_Period, Extension, LateFine)
VALUES
    ("Faculty","English",12,90,30,0.2),
    ("Faculty","Foreign",3,60,30,0.5),
    ("Faculty","New",1,7,0,0.5),
    ("Staff","English",7,60,30,0.2),
    ("Staff","Foreign",1,30,30,0.5),
    ("Staff","New",1,7,0,0.5),
    ("Graduate","English",12,60,30,0.2),
    ("Graduate","Foreign",3,60,30,0.5),
    ("Graduate","New",1,7,0,0.5),
    ("College","English",8,60,30,0.2),
    ("College","Foreign",2,60,30,0.5),
    ("College","New",1,7,0,0.5),
    ("Vocational","English",5,60,15,0.2),
    ("Vocational","Foreign",1,30,15,0.5),
    ("Vocational","New",1,7,0,0.5);