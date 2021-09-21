use EdDb;

--list of all classes every major required to take and instructor for classes, create view
CREATE VIEW ClassesForMajorIncInstructor as
select m.Code Majorcod, m.Description Major, concat(Firstname, ' ', Lastname) Name, C.Code class 
	from Major m
	join MajorClass mc
		on m.id = mc.MajorId
	join class c
		on c.Id = mc.ClassId
	join Instructor i
		on c.InstructorId = i.Id;

--now can just do this to get same results:
select * from ClassesForMajorIncInstructor;