------ lOAN FUNCTIONALITY WITH BUSINESS CONSTRAINS ----------
-- BUSINESS CONSTRAINTS:
-- 1. STUDENT CAN RENT 3 BOOK, TEACHER 2 BOOKS, GUEST 1 BOOK
-- 2. DIFFERENT PEOPLE CAN BORROW A BOOK WITH THE SAME ISBN IF THERES ONE AVAILABLE

CREATE OR REPLACE FUNCTION LoanABook(ISBNNumberValue integer, CPRNumbmerValue varchar(10), LoanPeriodStartValue date, LoanPeriodEndValue date)
RETURNS void AS $$
DECLARE
  copiesOfSelectedBook int 			:= (SELECT BookAmount FROM Status WHERE ISBN = ISBNNumberValue);  	--Fecthing how many copies of a book
  amountRentedOut int 				:= (SELECT BookRented FROM Status WHERE ISBN = ISBNNumberValue);  	--Fecthing how many book of one type is rented out
  typeOfLoaner varchar(100) 			:= (SELECT Type FROM Loaner WHERE CPRNumber = CPRNumbmerValue); 	--Fecthing the loaners type
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


------ Current availability of a copy of a specific book ----------
CREATE OR REPLACE FUNCTION CheckBookIsAvail(ISBNNumber integer)
RETURNS int AS $$
DECLARE
	copiesOfSelectedBook int	:= (SELECT BookAmount FROM Status WHERE ISBN = ISBNNumber);  --Fecthing how many copies of a book
  	amountRentedOut int 		:= (SELECT BookRented FROM Status WHERE ISBN = ISBNNumber);  --Fecthing how many book a one type is rented out
BEGIN
	RETURN copiesOfSelectedBook - amountRentedOut;
END; $$
LANGUAGE PLPGSQL;


---------- Function for getting the most popular book title amog students ----------
CREATE OR REPLACE FUNCTION CheckMostPopularTitleStudents()
RETURNS varChar(50) AS $$
DECLARE
	isbnOfMostPopularBook int := (SELECT ISBN FROM (SELECT ISBN, COUNT(*) FROM Borrowed INNER JOIN Loaner ON Loaner.CPRNumber = Borrowed.CPRNumber WHERE Loaner.Type = 'Student' GROUP BY ISBN ORDER BY COUNT DESC LIMIT 1) a);
	bookTitle varchar(100) := (SELECT Book.Title FROM Book WHERE ISBN = isbnOfMostPopularBook);
BEGIN
	RETURN bookTitle;
END; $$
LANGUAGE PLPGSQL;





