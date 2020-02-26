------ lOAN FUNCTIONALITY WITH BUSINESS CONSTRAINS ----------
-- BUSINESS CONSTRAINTS:
-- 1. STUDENT CAN RENT 3 BOOK, TEACHER 2 BOOKS, GUEST 1 BOOK
-- 2. DIFFERENT PEOPLE CAN BORROW A BOOK WITH THE SAME ISBN IF THERES ONE AVAILABLE

CREATE OR REPLACE FUNCTION LoanABook(ISBNNumberValue integer, CPRNumbmerValue varchar(10), LoanPeriodStartValue date, LoanPeriodEndValue date)
RETURNS void AS $$
DECLARE
  copiesOfSelectedBook int 			:= (SELECT BookAmount FROM Status WHERE ISBN = ISBNNumberValue);  	--Fecthing how many copies of a book
  amountRentedOut int 				:= (SELECT BookRented FROM Status WHERE ISBN = ISBNNumberValue);  	--Fecthing how many book of one type is rented out
  typeOfLoaner varchar(100) 			:= (SELECT TypeOf FROM Loaner WHERE CPRNumber = CPRNumbmerValue); 	--Fecthing the loaners type
  loanersRentedBookAmount int 			:= (SELECT COUNT(*) FROM Borrowed WHERE CPRNumber = CPRNumbmerValue); 	--Fecthing amount of books the loaner has rented
BEGIN
  IF copiesOfSelectedBook > amountRentedOut THEN
	IF typeOfLoaner = 'Student' THEN
		IF loanersRentedBookAmount < 3 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)
			VALUES (ISBNNumberValue, CPRNumbmerValue, LoanPeriodStartValue, LoanPeriodEndValue);
			--Updates the status
			UPDATE Status SET BookRented = BookRented + 1 WHERE ISBN = ISBNNumberValue;
		ELSE
			RAISE NOTICE 'STUDENT - du kan ikke låne flere bøger';
		END IF;

	ELSIF typeOfLoaner = 'Teacher' THEN
		IF loanersRentedBookAmount < 2 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)
			VALUES (ISBNNumberValue, CPRNumbmerValue, LoanPeriodStartValue, LoanPeriodEndValue);
			--Updates the status
			UPDATE Status SET BookRented = BookRented + 1 WHERE ISBN = ISBNNumberValue;
		ELSE
			RAISE NOTICE 'TEACHER - du kan ikke låne flere bøger';
		END IF;

	ELSE
		IF loanersRentedBookAmount < 1 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)
			VALUES (ISBNNumberValue, CPRNumbmerValue, LoanPeriodStartValue, LoanPeriodEndValue);
			--Updates the status
			UPDATE Status SET BookRented = BookRented + 1 WHERE ISBN = ISBNNumberValue;
		ELSE
			RAISE NOTICE 'GUEST - du kan ikke låne flere bøger';
		END IF;
	END IF;
  ELSE
  	RAISE NOTICE 'all books are rented out, sorry';
  END IF;
END; $$
LANGUAGE PLPGSQL;




-- TEST FUNKTIONALITET AND SHORTCUTS --
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd) VALUES (22222, 1234567890, '2020-02-25', '2020-02-28');

INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES (11111, 2, 0);
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES (88888, 5, 0);

-- Function call
SELECT LoanABook(11111, '1234561891', '2020-02-15', '2020-02-28');

-- Test helpers
DELETE FROM Borrowed;
UPDATE Status SET BookRented = 0 WHERE ISBN = 88888;
SELECT * FROM Borrowed;
SELECT * FROM Status;




------ Current availability of a copy of a specific book ----------
CREATE OR REPLACE FUNCTION CheckBookIsAvail(ISBNNumber integer)
RETURNS int AS $$
DECLARE
	copiesOfSelectedBook int	:= (SELECT BookAmount FROM Status WHERE ISBN = 44444);  --Fecthing how many copies of a book
  	amountRentedOut int 		:= (SELECT BookRented FROM Status WHERE ISBN = 44444);  --Fecthing how many book a one type is rented out
BEGIN
	RETURN copiesOfSelectedBook - amountRentedOut;
END; $$
LANGUAGE PLPGSQL;

-- Test Function
SELECT CheckBookIsAvail(44444);



---------- Function for getting the most popular book title amog students ----------
CREATE OR REPLACE FUNCTION CheckMostPopularTitleStudents()
RETURNS varChar(50) AS $$
DECLARE
	isbnOfMostPopularBook int := (SELECT ISBN FROM (SELECT ISBN, COUNT(*) FROM Borrowed INNER JOIN Loaner ON Loaner.CPRNumber = Borrowed.CPRNumber WHERE Loaner.TypeOf = 'Student' GROUP BY ISBN ORDER BY COUNT DESC LIMIT 1) a);
	bookTitle varchar(100) := (SELECT Book.Title FROM Book WHERE ISBN = isbnOfMostPopularBook);
BEGIN
	RETURN bookTitle;
END; $$
LANGUAGE PLPGSQL;

-- Test functionality 
select CheckMostPopularTitleStudents();




------ The library wants to keep track of each copy of each book’s status and location at any time. ------
--- Overview of all books
SELECT * FROM Borrowed inner JOIN Book ON Book.ISBN = Borrowed.ISBN;

--- giving a isbn return alle the people who has rented it
SELECT CPRNumber, Borrowed.ISBN, COUNT(*) FROM Borrowed INNER JOIN Book ON Book.ISBN = Borrowed.ISBN GROUP BY CPRNumber, Borrowed.ISBN ORDER BY CPRNumber DESC;


