-- Book data
Insert into book values(51232, 'Heste kan flyve', 'Jonas Pedersen', 'DinBogmand', '2019');
Insert into book values(51233, 'Kære fucking dabog', 'Henrik list', 'DinBogmand', '2012');
Insert into book values(12345, 'Skyggedanseren', 'sara Omar', 'DinBogmand', '2019');
Insert into book values(55555, 'Sommerfugleværelset', 'Lucinda Riley' , 'DinBogmand', '2019');
Insert into book values(44444, 'Valdemarsro', 'Ann-Christine Hellerup Brandt', 'DinBogmand', '2012');
Insert into book values(33333, 'Den tavse patient', 'Alex Michaelides', 'DinBogmand', '2019');
Insert into book values(22222, 'Dødevaskeren', 'Sara Omar', 'DinBogmand', '2019');
Insert into book values(11111, 'Heksebørnenes mor' , 'Anja Ringgren Lovén', 'ExpressBog', '2014');

-- Loaner data
Insert into loaner values(1234567891, 'Christoffer Dunk', 'fælledvej 1 1th, 4000 Roskilde', 'Student');
Insert into loaner values(1234567821, 'Vicki', 'fælledvej 2, 4000 Roskilde', 'Student');
Insert into loaner values(1234567831, 'bo', 'fælledvej 3, 4000 Roskilde', 'Student');
Insert into loaner values(1234567841, 'Mikkel', 'fælledvej 4, 4000 Roskilde', 'Student');
Insert into loaner values(1234567851, 'kasper', 'fælledvej 5, 4000 Roskilde', 'Student');
Insert into loaner values(1234567861, 'Ian', 'fælledvej 6, 4000 Roskilde', 'Student');
Insert into loaner values(1234567871, 'Gordon', 'fælledvej 7, 4000 Roskilde', 'Student');
Insert into loaner values(1234567881, 'Liv', 'fælledvej 8, 4000 Roskilde', 'Student');
Insert into loaner values(1234561891, 'ib', 'fælledvej 9, 4000 Roskilde', 'Student');
Insert into loaner values(1111111111, 'Kartsen', 'gedevej 2, 4000 Roskilde', 'Teacher');
Insert into loaner values(1111111112, 'Valde', 'smørbjerg 21, 4000 Roskilde', 'Teacher');
Insert into loaner values(1111111113, 'Micheal', 'risvej 91, 4000 Roskilde', 'Teacher');
Insert into loaner values(1111111114, 'Rasmus', 'dyrehaven 86, 4000 Roskilde', 'Teacher');
Insert into loaner values(7777777777, 'Simon', 'hønsebjerg 3, 4000 Roskilde', 'Guest');
Insert into loaner values(7777777771, 'Valde', 'gryn 12, 4000 Roskilde', 'Guest');
Insert into loaner values(7777777772, 'Jyde', 'duestræde 91, 4000 Roskilde', 'Guest');
Insert into loaner values(7777777773, 'Rasmus', 'allé gade 86, 4000 Roskilde', 'Guest');

-- Orders 
Insert into orders (isbn, cprnummer) values(123523, 1234567890);
Insert into orders (isbn, cprnummer) values(22222, 1234567890);
Insert into orders (isbn, cprnummer) values(33333, 1234567821);
Insert into orders (isbn, cprnummer) values(11111, 1234567821);
Insert into orders (isbn, cprnummer) values(88888, 1234567821);
Insert into orders (isbn, cprnummer) values(33333, 1234567891);
Insert into orders (isbn, cprnummer) values(11111, 1234567891);
Insert into orders (isbn, cprnummer) values(11111, 1234567871);
Insert into orders (isbn, cprnummer) values(55555, 1234567871);


-- Status
insert into status (isbn, bookamount, bookrented) values(12345, 5,0);
insert into status (isbn, bookamount, bookrented) values(55555, 5,0);
insert into status (isbn, bookamount, bookrented) values(44444, 5,0);
insert into status (isbn, bookamount, bookrented) values(33333, 5,0);
insert into status (isbn, bookamount, bookrented) values(22222, 5,0);
insert into status (isbn, bookamount, bookrented) values(11111, 5,0);

-- Borrowed
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values (22222, 1234567891, '2020-02-25', '2020-02-28');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(88888, 1234567890, '2020-02-25', '2020-02-28');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(12345, 1234567890, '2020-01-25', '2020-02-12');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(55555, 1234567891, '2020-02-25', '2020-02-28');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(33333, 1234567891, '2020-02-25', '2020-03-28');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(22222, 1234567891, '2020-01-25', '2020-02-12');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(11111, 1234567891, '2020-02-25', '2020-02-28');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(33333, 1234567881, '2020-02-25', '2020-02-28');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(22222, 1234567881, '2020-01-25', '2020-02-12');
Insert into borrowed (isbn, CPRNummer, LoanPeriodStart, LoanPeriodEnd)values(11111, 1234567881, '2020-02-25', '2020-02-28');
