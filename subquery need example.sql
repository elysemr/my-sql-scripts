-- examples of subquery use. start by making sure the subquery works!! *should only be one column*

select firstname, lastname, SAT
	from student
	where SAT > (select avg(sat)
					from student)
		order by SAT desc;

select firstname, lastname, GPA
	from student
	where gpa < (select avg(gpa)
				from Student)
	order by gpa desc;

	select firstname, lastname, SAT
	from student
	where SAT < (select avg(Sat)
					from student)
	order by sat desc;

