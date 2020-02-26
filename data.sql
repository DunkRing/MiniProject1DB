
-- Book data
INSERT INTO Book VALUES (51232, 'Heste kan flyve', 'Jonas Pedersen', 'DinBogmand', '2019');
INSERT INTO Book VALUES (51233, 'Kære fucking dabog', 'Henrik list', 'DinBogmand', '2012');
INSERT INTO Book VALUES (12345, 'Skyggedanseren', 'sara Omar', 'DinBogmand', '2019');
INSERT INTO Book VALUES (55555, 'Sommerfugleværelset', 'Lucinda Riley' , 'DinBogmand', '2019');
INSERT INTO Book VALUES (44444, 'Valdemarsro', 'Ann-Christine Hellerup Brandt', 'DinBogmand', '2012');
INSERT INTO Book VALUES (33333, 'Den tavse patient', 'Alex Michaelides', 'DinBogmand', '2019');
INSERT INTO Book VALUES (22222, 'Dødevaskeren', 'Sara Omar', 'DinBogmand', '2019');
INSERT INTO Book VALUES (11111, 'Heksebørnenes mor' , 'Anja Ringgren Lovén', 'ExpressBog', '2014');

-- Loaner data
INSERT INTO Loaner VALUES (1234567891, 'Christoffer Dunk', 'fælledvej 1 1th, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1234567821, 'Vicki', 'fælledvej 2, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1234567831, 'bo', 'fælledvej 3, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1234567841, 'Mikkel', 'fælledvej 4, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1234567851, 'kasper', 'fælledvej 5, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1234567861, 'Ian', 'fælledvej 6, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1234567871, 'Gordon', 'fælledvej 7, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1234567881, 'Liv', 'fælledvej 8, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1234561891, 'ib', 'fælledvej 9, 4000 Roskilde', 'Student');
INSERT INTO Loaner VALUES (1111111111, 'Kartsen', 'gedevej 2, 4000 Roskilde', 'Teacher');
INSERT INTO Loaner VALUES (1111111112, 'Valde', 'smørbjerg 21, 4000 Roskilde', 'Teacher');
INSERT INTO Loaner VALUES (1111111113, 'Micheal', 'risvej 91, 4000 Roskilde', 'Teacher');
INSERT INTO Loaner VALUES (1111111114, 'Rasmus', 'dyrehaven 86, 4000 Roskilde', 'Teacher');
INSERT INTO Loaner VALUES (7777777777, 'Simon', 'hønsebjerg 3, 4000 Roskilde', 'Guest');
INSERT INTO Loaner VALUES (7777777771, 'Valde', 'gryn 12, 4000 Roskilde', 'Guest');
INSERT INTO Loaner VALUES (7777777772, 'Jyde', 'duestræde 91, 4000 Roskilde', 'Guest');
INSERT INTO Loaner VALUES (7777777773, 'Rasmus', 'allé gade 86, 4000 Roskilde', 'Guest');

-- Orders 
INSERT INTO Orders (ISBN, CPRNumber) VALUES(51232, 1234567891);
INSERT INTO Orders (ISBN, CPRNumber) VALUES(51232, 1234567891);
INSERT INTO Orders (ISBN, CPRNumber) VALUES(51233, 1234567841);
INSERT INTO Orders (ISBN, CPRNumber) VALUES(51233, 1234567841);
INSERT INTO Orders (ISBN, CPRNumber) VALUES(44444, 1234567861);
INSERT INTO Orders (ISBN, CPRNumber) VALUES(44444, 1234567861);
INSERT INTO Orders (ISBN, CPRNumber) VALUES(33333, 1111111114);
INSERT INTO Orders (ISBN, CPRNumber) VALUES(11111, 7777777772);
INSERT INTO Orders (ISBN, CPRNumber) VALUES(22222, 1111111112);


-- Status start point 
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES(51232, 5,0);
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES(51233, 5,0);
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES(12345, 5,0);
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES(55555, 5,0);
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES(44444, 5,0);
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES(33333, 5,0);
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES(22222, 5,0);
INSERT INTO Status (ISBN, BookAmount, BookRented) VALUES(11111, 5,0);

-- Borrowed
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(51232, 1234567891, '2020-02-25', '2020-02-28');  --Student 
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(51232, 1234567891, '2020-02-25', '2020-02-28');  --Student 
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(51233, 1234567891, '2020-01-25', '2020-02-12');  --Student 
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(51232, 1234567831, '2020-02-25', '2020-02-28');  --Student 
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(55555, 1234567831, '2020-02-25', '2020-03-28');  --Student 
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(22222, 1234567851, '2020-01-25', '2020-02-12');  --Student 
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(22222, 1111111111, '2020-02-25', '2020-02-28');  --Teacher
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(51233, 1111111111, '2020-02-25', '2020-02-28');  --Teacher
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(44444, 7777777772, '2020-01-25', '2020-02-12');  --Guest
INSERT INTO Borrowed (ISBN, CPRNumber, LoanPeriodStart, LoanPeriodEnd)VALUES(11111, 7777777777, '2020-02-25', '2020-02-28');  --Guest
