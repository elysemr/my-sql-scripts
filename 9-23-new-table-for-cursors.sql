--cursor and expressions practice >> have to create this table to run the commands
create table Adjustments (
	Id int primary key identity(1,1),
	Firstname varchar(30) not null,
	Lastname varchar (30) not null, 
	GpaDelta decimal(5,2) not null default 0,
	Completed bit not null default 0
		--when we do work for a row, we'll update it and set completed to true so don't re-update data
);