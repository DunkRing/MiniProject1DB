create table Book(
ISBN int, Title varchar(100), 
Author varchar(100), Publisher varchar(100), 
YearOfPublication varchar(100),
primary key (ISBN)
);

create table Loaner(
	CPRNummer char(10), name varchar(100), 
	adress varchar(100), 
	type varchar(100),
	primary key (CPRNummer)
);

create table Orders(
	OrderId SERIAL PRIMARY KEY, 
	ISBN varchar(100),
	foreign key (OrderId) references instructor (OrderId)
	primary key (ISBN));

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