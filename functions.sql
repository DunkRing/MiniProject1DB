CREATE OR REPLACE FUNCTION inc2(isbnNumnerval integer, cprnumbmerval integer, loanperiodstartval date, loanperiodendval date) 
RETURNS void AS $$
DECLARE
  a int := (SELECT bookamount FROM status WHERE isbn = isbnNumnerval);
  b int := (SELECT bookrented FROM status WHERE isbn = isbnNumnerval);
BEGIN 
  IF a > b THEN
	RAISE NOTICE 'Book available, renting one out..';
  	--Creates a new borrow
  	insert into borrowed (isbn, cprnummer, loanperiodstart, loanperiodend) 
	values (isbnNumnerval, cprnumbmerval, loanperiodstartval, loanperiodendval);
	--Updates the status
	update status SET bookrented = bookrented+1 where isbn=isbnNumnerval;
  ELSE
  	RAISE NOTICE 'all books are rented out, sorry';
  END IF;
END; $$
LANGUAGE PLPGSQL;

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

--Function call
select inc2(11111, 1234567891, '2020-02-25', '2020-02-28');

--test helpers
delete from borrowed where isbn = 11111;
update status set bookrented = 0 where isbn=11111;
select * from borrowed;
select * from status;


insert into status (isbn, bookamount, bookrented) values (11111, 2, 0);
insert into status (isbn, bookamount, bookrented) values (88888, 5, 0);