select lastname, description
from student s
join major m 
	on s.majorid = m.id;