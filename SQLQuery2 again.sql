-- this is a comment
select *
	from student s
	join major m
		on m.id = s.MajorID
	join MajorClass mc
		on mc.MajorID = m.ID
	join class c
		on c.ID = mc.ClassID;