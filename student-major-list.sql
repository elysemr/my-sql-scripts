-- this query shows all the students and lists their majors
select concat(lastname, ', ', firstname) 'Student Name', isnull(description, 'Undecided') Major
from student s
left join major m
on m.id = s.MajorId
order by lastname;
