-- this is a simple example of how to use a union (and a derived column)
select *, 'A'
from Student
	where sat > 1200
union
select *, 'B'
from Student
	where sat <= 1200 and sat >= 1000
union
select *, 'C'
from Student
	where sat < 1000
order by SAT desc;