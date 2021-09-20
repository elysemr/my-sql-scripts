--SQL programming examples and practice (our first case of procedural programming)
create or alter procedure CountToTen
as 
begin
--here's where we put what we want to accomplish
	declare @index int = 1;
	declare @stop int = 10;

	while @index <= @stop
	begin
		--indent again to show this is the loop that is inside the other begin/end statement
		print '@index is ' + cast(@index as varchar(5)); --turns int into string so can concat bc defined index as int so needs to be same type
			--plus sign here is concat what's on either side of the plus
		set @index = @index + 1;
	end --don't need a semicolon there, or even after the last one unless you want to do something after the second end
end;
--should see 10 lines and stop. when equates to false, jumps down to line 15 and signfies to end
Go --tells sql to execute line above this first then execute below
exec CountToTen;
Go

--want to put in an extra condition to the above example
create or alter procedure CountToTen
as 
begin
	declare @index int = 1;
	declare @stop int = 10;

	while @index <= @stop
	begin
		print '@index is ' + cast(@index as varchar(5));  --always want this to run
		IF @index = 5 --runs this if statement every time loops, but it's only true once 
		begin
			print '@Index is five';
		end
		set @index = @index + 1;
	end 
end;

Go 
exec CountToTen;