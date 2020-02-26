------ lOAN FUNCTIONALITY WITH BUSINESS CONSTRAINS ----------
--BUSINESS CONSTRAINTS:
-- 1. STUDENT CAN RENT 3 BOOK, TEACHER 2 BOOKS, GUEST 1 BOOK
-- 2. DIFFERENT PEOPLE CAN BORROW A BOOK WITH THE SAME ISBN IF THERES ONE AVAILABLE

CREATE OR REPLACE FUNCTION inc2(isbnNumnerval integer, cprnumbmerval varchar(10), loanperiodstartval date, loanperiodendval date)
RETURNS void AS $$
DECLARE
  a int := (SELECT bookamount FROM status WHERE isbn = isbnNumnerval);  --Fecthing how many copies of a book
  b int := (SELECT bookrented FROM status WHERE isbn = isbnNumnerval);  --Fecthing how many book a one type is rented out
  fetchedtype varchar(100) := (SELECT typeof FROM loaner WHERE cprnummer = cprnumbmerval); --Fecthing the loaners type
  fetchedtypeRentedbookamount int := (SELECT COUNT(*) FROM borrowed where cprnummer = '1234567890'); --Fecthing the loaners type
BEGIN
  IF a > b THEN
	IF fetchedtype = 'Student' THEN
		IF fetchedtypeRentedbookamount < 3 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			insert into borrowed (isbn, cprnummer, loanperiodstart, loanperiodend)
			values (isbnNumnerval, cprnumbmerval, loanperiodstartval, loanperiodendval);
			--Updates the status
			update status SET bookrented = bookrented+1 where isbn=isbnNumnerval;
		ELSE
			RAISE NOTICE 'STUDENT - du kan ikke låne flere bøger';
		END IF;

	ELSIF fetchedtype = 'Teacher' THEN
		IF fetchedtypeRentedbookamount < 2 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			insert into borrowed (isbn, cprnummer, loanperiodstart, loanperiodend)
			values (isbnNumnerval, cprnumbmerval, loanperiodstartval, loanperiodendval);
			--Updates the status
			update status SET bookrented = bookrented+1 where isbn=isbnNumnerval;
		ELSE
			RAISE NOTICE 'TEACHER - du kan ikke låne flere bøger';
		END IF;

	ELSE
		IF fetchedtypeRentedbookamount < 1 THEN
			RAISE NOTICE 'Book available, renting one out..';
			--Creates a new borrow
			insert into borrowed (isbn, cprnummer, loanperiodstart, loanperiodend)
			values (isbnNumnerval, cprnumbmerval, loanperiodstartval, loanperiodendval);
			--Updates the status
			update status SET bookrented = bookrented+1 where isbn=isbnNumnerval;
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
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values (22222, 1234567890, '2020-02-25', '2020-02-28');

insert into status (isbn, bookamount, bookrented) values (11111, 2, 0);
insert into status (isbn, bookamount, bookrented) values (88888, 5, 0);

-- Function call
select inc2(11111, '1234561891', '2020-02-15', '2020-02-28');

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

