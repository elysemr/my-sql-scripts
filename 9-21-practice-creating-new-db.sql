--recreate the entire database in one script practice
--if you have a script and you want to create a new db
	--make sure you're in master
		use master;
		go
		--run everything up to this point before we do anything else
		--if we don't have a DB, create one, if we do, error will say we have the DB
		--if we want to re-create it, we DROP it (delete for DBs), if you try to drop it and if it's not there, also error
		--command for drop if exists
		drop database if exists BcDb;
		go --run all the statements right now since last go in beginning of file
		--if drop DB all tables and data are gone
		create database BcDb; --we know it doesn't exist because we just dropped it if it did exist
		go
		use BcDb; --now ready to create tables so have to switch into new DB
		go
		--create table here
		Create table Customers (
		Id int not null primary key identity(1,1),
		Code varchar(10) not null unique,
		Name varchar(30) not null,
		Sales decimal(9,2) not null default 0 check (sales >= 0),
		Active bit not null default 1,
		Created datetime not null default getdate()
		);
		go
		--do your inserts here
		Insert Customers
		(Code, Name, Sales)
		VALUES
		('Sale1', 'Beyonce Knowles', 5942.63),
		('Sale2', 'Mariah Carey', 6357.33),
		('Sale3', 'John Bon Jovi', 763649.38),
		('Sale4', 'Britney Spears', 73648.99),
		('Sale5', 'Sara Barielles', 53904.28);
		go

		--see if it works
		Select * from Customers;

		--changing code column
		/*
		Update Customers set
		Code = 'cust1' where Id = 1;
		Update Customers set
		Code = 'cust2' where Id = 2;
		Update Customers set
		Code = 'cust3' where Id = 3;
		Update Customers set
		code = 'cust4' where Id = 4;
		Update Customers set
		code = 'cust5' where Id = 5; */

	--adding new column
	alter table customers
		add Updated DateTime; --allowed to be null and that's default

	alter table customers
		alter column Note varchar(30) not null;

		update Customers set
		Note = 'Default note', --don't need where bc affecting all existing rows
		updated = getdate(); --manually have to input update happened, only when they're done