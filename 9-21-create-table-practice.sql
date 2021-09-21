--create table practice
create table Rating (
	Id int not null primary key identity(1,1),
	Stars int not null check (Stars >= 1 and Stars <=5),
	Comment varchar(300) null,
	StudentId int not null 
			foreign key references students(id),
	--not plural in studentid because it's referring to one student, but table name is plural for FK so get that right
	--the type of data has to match the type of data on the primary key in the other table
	TopicId int not null
			foreign key references topics(id)
	--have to create students and topics tables first so you can reference them in this table!
);

--practice inserting into our new table
insert Rating --can also say insert into rating
	(Stars, StudentId, TopicId)
	VALUES
	--(3, 1, 1); <<quick way to do it if you have all the values, but you shouldn't use a value for a PK or FK usually!
		(3, (SELECT id from Students where Name = 'Matt'), 
		(SELECT ID from topics where Description like '%Git%'));
		-- ^^ much better way to do things! to avoid putting in definite value 



