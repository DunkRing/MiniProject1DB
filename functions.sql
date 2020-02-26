------ lOAN FUNCTIONALITY WITH BUSINESS CONSTRAINS ----------
-- BUSINESS CONSTRAINTS:
-- 1. STUDENT CAN RENT 3 BOOK, TEACHER 2 BOOKS, GUEST 1 BOOK
-- 2. DIFFERENT PEOPLE CAN BORROW A BOOK WITH THE SAME ISBN IF THERES ONE AVAILABLE

CREATE OR REPLACE FUNCTION LoanABook(ISBNNumberValue integer, CPRNumbmerValue varchar(10), LoanPeriodStartValue date, LoanPeriodEndValue date)
RETURNS void AS $$
DECLARE
  copiesOfSelectedBook int 			:= (SELECT bookamount FROM status WHERE isbn = ISBNNumberValue);  	--Fecthing how many copies of a book
  amountRentedOut int 				:= (SELECT bookrented FROM status WHERE isbn = ISBNNumberValue);  	--Fecthing how many book of one type is rented out
  typeOfLoaner varchar(100) 			:= (SELECT typeof FROM loaner WHERE cprnummer = CPRNumbmerValue); 	--Fecthing the loaners type
  loanersRentedBookAmount int 			:= (SELECT COUNT(*) FROM borrowed where cprnummer = CPRNumbmerValue); 	--Fecthing amount of books the loaner has rented
BEGIN
  IF copiesOfSelectedBook > amountRentedOut THEN
	IF typeOfLoaner = 'Student' THEN
		IF loanersRentedBookAmount < 3 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			INSERT INTO borrowed (isbn, cprnummer, loanperiodstart, loanperiodend)
			VALUES (ISBNNumberValue, CPRNumbmerValue, LoanPeriodStartValue, LoanPeriodEndValue);
			--Updates the status
			UPDATE status SET bookrented = bookrented+1 WHERE isbn=ISBNNumberValue;
		ELSE
			RAISE NOTICE 'STUDENT - du kan ikke låne flere bøger';
		END IF;

	ELSIF typeOfLoaner = 'Teacher' THEN
		IF loanersRentedBookAmount < 2 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			INSERT INTO borrowed (isbn, cprnummer, loanperiodstart, loanperiodend)
			VALUES (ISBNNumberValue, CPRNumbmerValue, LoanPeriodStartValue, LoanPeriodEndValue);
			--Updates the status
			UPDATE status SET bookrented = bookrented+1 WHERE isbn=ISBNNumberValue;
		ELSE
			RAISE NOTICE 'TEACHER - du kan ikke låne flere bøger';
		END IF;

	ELSE
		IF loanersRentedBookAmount < 1 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			INSERT INTO borrowed (isbn, cprnummer, loanperiodstart, loanperiodend)
			VALUES (ISBNNumberValue, CPRNumbmerValue, LoanPeriodStartValue, LoanPeriodEndValue);
			--Updates the status
			UPDATE status SET bookrented = bookrented+1 WHERE isbn=ISBNNumberValue;
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
INSERT INTO borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values (22222, 1234567890, '2020-02-25', '2020-02-28');

INSERT INTO status (isbn, bookamount, bookrented) values (11111, 2, 0);
INSERT INTO status (isbn, bookamount, bookrented) values (88888, 5, 0);

-- Function call
select LoanABook(11111, '1234561891', '2020-02-15', '2020-02-28');

-- Test helpers
delete from borrowed;
update status set bookrented = 0 where isbn=88888;
select * from borrowed;
select * from status;




------ Current availability of a copy of a specific book ----------
CREATE OR REPLACE FUNCTION CheckBookIsAvail(ISBNNumber integer)
RETURNS int AS $$
DECLARE
	a int := (SELECT bookamount FROM status WHERE isbn = 44444);  --Fecthing how many copies of a book
  	b int := (SELECT bookrented FROM status WHERE isbn = 44444);  --Fecthing how many book a one type is rented out
BEGIN
	RETURN a-b;
END; $$
LANGUAGE PLPGSQL;

-- Test Function
Select CheckBookIsAvail(44444);



---------- Function for getting the most popular book title amog students ----------
CREATE OR REPLACE FUNCTION CheckMostPopularTitleStudents()
RETURNS varChar(50) AS $$
DECLARE
	isbnOfMostPopularBook int := (SELECT isbn FROM(select isbn, count(*) from borrowed inner JOIN loaner ON loaner.cprnummer = borrowed.cprnummer where loaner.typeof = 'Student' GROUP BY isbn ORDER BY count DESC limit 1) a);
	bookTitle varchar(100) := (select book.title from book where isbn=isbnOfMostPopularBook);
BEGIN
	return bookTitle;
END; $$
LANGUAGE PLPGSQL;

-- Test functionality 
select CheckMostPopularTitleStudents();




------ The library wants to keep track of each copy of each book’s status and location at any time. ------
--- Overview of all books
select * from borrowed inner JOIN book ON book.isbn = borrowed.isbn;

--- giving a isbn return alle the people who has rented it
select cprnummer, borrowed.isbn, count(*) from borrowed inner JOIN book ON book.isbn = borrowed.isbn GROUP BY cprnummer,borrowed.isbn ORDER BY cprnummer DESC;


