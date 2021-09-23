--cursor + procedure practice
--procedure going to read adjustment table row by row, take columns and issue an update statement for student gpa column
create or alter procedure StudentGpaAdjustment
--don't need parameters because everything we need is in the two tables using
AS BEGIN
	declare @firstname varchar(30);
	declare @lastname varchar(30);
	declare @gpadelta decimal(5,2);
	declare cur cursor for --declare + cursorname + cursor keyword + for keyword
		select Firstname, Lastname, GPADelta
			from adjustments
				where completed = 0 --at this point check to see if select statement runs
	open cur; --keyword open + cursorname;
	--pull rows out of adjustments table 1 by 1 with fetch statement
	fetch next from cur into
	@firstname, @lastname, @gpadelta;
	--try to read first row
	while @@FETCH_STATUS = 0 --if it returns 0, it read something. anything else and it didn't read anything so can't do anything
	--then use status to see if you actually read something
	--while keep looping while reading data from adjustments
	begin
		
		update Student set
			GPA = GPA + @gpadelta --at sign is very impt bc it's the saved value
			where Firstname = @firstname and Lastname = @lastname
	
		--check logic by commenting out update and doing a select to see what will happen before doing update
	/*
	select firstname, lastname, gpa, @gpadelta Delta, (GPA + @gpadelta) 'New GPA'
			from Student
				where Firstname = @firstname AND Lastname = @lastname;
				*/
		--once select works, comment out select to remove	
			fetch next from cur into @firstname, @lastname, @gpadelta; --last thing we do inside the loop is go on to next thing
	end
	close cur;

	deallocate cur; --put close and deallocate in when create open so don't forget esp with big script and work between
	--set all adjustment rows that aren't complete to complete
	update adjustments set
		completed = 1
			where completed = 0; --it's currently reading completed as false/not completed so need to change all rows that
								--say that to true if all of them worked so don't re-update
								--usually update with each row so you can make sure it works before changing to completed
								--def want to use a where because you don't want to always just do all the rows if it's a lot of data
END
Go
Exec StudentGpaAdjustment;
Go
--first fetch outside of loop, check status, create loop and do something inside and 
--process inside if successful and then do whatever you did before loop
--without putting fetch at end of while, it would loop and loop and loop because fetch status won't change
	--fetch status at the end tells it move onto the next until there is no more to read

	select * From adjustments;
	select * from student;