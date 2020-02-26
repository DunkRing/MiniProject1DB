
-- -- TEST FUNKTIONALITET -- --

-------------------------------------------------------------------------
-- Test the Function "LoanABookby" running the line below 
SELECT LoanABook(11111, '1234561891', '2020-02-15', '2020-02-28');

-- Test helpers
DELETE FROM Borrowed;
UPDATE Status SET BookRented = 0 WHERE ISBN = 88888;
SELECT * FROM Borrowed;
SELECT * FROM Status;
-------------------------------------------------------------------------


-------------------------------------------------------------------------
-- Test the Function "CheckBookIsAvail" by running the line below 
SELECT CheckBookIsAvail(44444);
------------------------------------------------------------------------


-------------------------------------------------------------------------
-- Test the Function "CheckMostPopularTitleStudents" running the line below 
select CheckMostPopularTitleStudents();
-------------------------------------------------------------------------


-------------------------------------------------------------------------
------ The library wants to keep track of each copy of each book’s status and location at any time. ------
--- Overview of all books
SELECT * FROM Borrowed inner JOIN Book ON Book.ISBN = Borrowed.ISBN;

--- giving a isbn return alle the people who has rented it
SELECT CPRNumber, Borrowed.ISBN, COUNT(*) FROM Borrowed INNER JOIN Book ON Book.ISBN = Borrowed.ISBN GROUP BY CPRNumber, Borrowed.ISBN ORDER BY CPRNumber DESC;
-------------------------------------------------------------------------
