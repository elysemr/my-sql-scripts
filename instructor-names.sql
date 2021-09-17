select m.code, description, c.code, i.Lastname 
	from major m
	join majorclass mc
		on mc.MajorId = m.Id
	join class c
		on c.Id = mc.ClassId
	join instructor i
		on i.id = c.instructorid;