 select concat(firstname, ' ', lastname) as 'name', sat, gpa, sat * gpa Calc
	from student
	where sat >= 1490
	order by gpa desc, sat desc;