--DELETE statements
--delete students from MI who have not declared a major (start w/select statement, replace select + columns with delete)
delete
from student
	where StateCode = 'MI' AND MajorId is null;
--can put scripts back the way they were by re-running the script

--UPDATE statements
--Update all the majors increasing the minSAT by +10
Update Major Set
	MinSAT = MinSAT + 10;
--left side of = is always going to be column we're changing
--don't need where clause because we're updating ALL the rows
--don't really need to test with a select statement here because working with all the rows

--see if the updates are reflected by doing a select statement
select *
from Major;