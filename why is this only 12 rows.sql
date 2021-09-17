-- this was a test query that shows what classes students are enrolled in (I'm not 100% sure if it's done right)
select firstname, lastname, code
	from class c
	join studentclass sc
	on sc.ClassId = c.Id
	join student s
	on s.id = sc.StudentId;