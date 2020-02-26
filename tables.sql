create table Book(
	ISBN int,
	Title varchar(100), 
	Author varchar(100),
	Publisher varchar(100), 
	YearOfPublication varchar(100),
	primary key (ISBN)
);

create table Loaner(
	CPRNumber char(10),
	Name varchar(100), 
	Address varchar(100), 
	Type varchar(100),
	primary key (CPRNummer)
);

create table Orders(
	OrderId SERIAL PRIMARY KEY, 
	ISBN int,
	CPRNumber char(10),
	foreign key (CPRNummer) references Loaner (CPRNummer),
	foreign key (ISBN) references Book (ISBN)
);

create table Borrowed
(
	BorrowId serial primary key, 
	ISBN int,
	CPRNumber char(10),
	LoanPeriodStart date,
	LoanPeriodEnd date,
	foreign key (ISBN) references Book (ISBN),
	foreign key (CPRNumber) references Loaner (CPRNumber)	
);

Create table Status
(
	StatusId serial primary key,
	ISBN int,
	BookAmount int, 
	BookRented int, 
	foreign key (ISBN) references Book (ISBN)	
)

