select *
	from student s
	left join major m
	on m.id = s.MajorId
	where s.MajorId is null;