--examples of parameterized query plus extra functions (Count and automating)
declare @SATScore int = 1494;

select *
	from student
	where SAT > @SATscore
	order by SAT desc;

--this is what we already knew how to do but you have to change the number in the query manually
select *
	from student
	where SAT > 1494
	order by SAT desc;

--another parameterized example (show students who have a gpa of 3.5 or higher, show students with a gpa of 2.5 or lower)
-- (5,1) 5 = the # of nonzero integers in a result, 1 = only one of them is a decimal place
declare @upperGPA decimal(5,1) = 3.5;
declare @lowerGPA decimal (5,1) = 2.5;

select *
	from Student
	where GPA >= @upperGPA;
-- union only works here if the first statement isn't closed with a ;
select *
	from student
	where GPA <= @lowerGPA;

--practice PQ (display all students from a particular state code)
declare @StateCode varchar(2) = 'IN';

select *
	from Student
	where statecode = @Statecode;

--trying something out
declare @OH varchar(2) = 'OH'
declare @IN varchar(2) = 'IN'
declare @KY varchar(2) = 'KY'

select *
	from Student
	where statecode in(@OH, @KY); --to try to do more than one var but still limited to not all
	

--different functions to automate some of the stuff
select top 4 *
	from student
	order by SAT desc;
	--this works if there are no duplicates, if duplicates then complicates things

--count function counts rows
select count(*)
	from student;