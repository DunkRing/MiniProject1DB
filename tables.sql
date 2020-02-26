create table Book(
	ISBN int,
	Title varchar(100), 
	Author varchar(100),
	Publisher varchar(100), 
	YearOfPublication varchar(100),
	primary key (ISBN)
);

create table Loaner(
	CPRNummer char(10),
	name varchar(100), 
	adress varchar(100), 
	type varchar(100),
	primary key (CPRNummer)
);

create table Orders(
	OrderId SERIAL PRIMARY KEY, 
	ISBN int,
	CPRNummer char(10),
	foreign key (CPRNummer) references Loaner (CPRNummer),
	foreign key (ISBN) references Book (ISBN)
);

create table borrowed
(
	BorrowId serial primary key, 
	isbn int,
	CPRNummer char(10),
	LoanPeriodStart date,
	LoanPeriodEnd date,
	foreign key (isbn) references book (isbn),
	foreign key (CPRNummer) references loaner (CPRNummer)	
);

Create table status
(
	statusid serial primary key,
	isbn int,
	bookamount int, 
	bookrented int, 
	foreign key (isbn) references book (isbn)	
)

