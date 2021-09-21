--example of creating a table
create table Students (
Id int not null primary key identity(1,1),
Name varchar(50) not null,
FavNumber int not null,
FavColor varchar(20) null default 'Gray',
Milk bit null default 0
);

go
--example of entering info into our new table
insert into Students
	(Name, FavNumber, FavColor, Milk)
	values
	('Matt', 144, 'Green', 1),
	('Parth', 84, 'Blue', 1),
	('Caroline', 25, null, 0) --if no value, need to include null bc needs to match up with column list
go
--one insert statement with 3 value clauses so has to include all three
--if want to ignore column, do separate insert statements

--now if want to see the table
select *
	from Students;


create table Topics (
	Id int not null primary key identity(1,1),
	Description varchar(30) not null,
	Sequence int not null unique, --mark column as having unique value so no 2 rows have the same sequence #
	TooEasy bit not null default 1,
);
go