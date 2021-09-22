--practicing procedures
--create procedures
create or alter procedure CalculateRequestTotal
--then parameters if want (passed in when procedure executed, as happens below)
	@requestId int = NULL --good idea to give it a default value, if null can check if user runs procedure and check value
							--if null, know a user didn't put in a value, syntax check to make sure user gives real value
							--this = assigns requestid to a value, not a valuation
AS
BEGIN --need boolean statement, block only executes if boolean true
	--check for missing requestId
	if @requestId is null --need is null here because equating
	BEGIN
		Print 'RequestID is Required';
		return -1; --causes us to leave the procedure immediately and go back to the caller
	END
		--check that requestId exists
	 if not exists (select 1 from requests where Id = @requestId) --better practice to say select just #1 so sql doesn't have to send
																--whole row back to us, more efficient just to tell us if true
																--not will say if data, return false, block about executing if data exists or not
	begin
		print 'Request not found';
		return -2; --neg numbers good for error conditions
	end
	--we have a request, time to tally up with previous select statement
	--we don't want the number displayed on the console in a grid, we need it to exist and display inside our script to hold a total
	declare @total decimal(9,2); --[if not part of stored procedure,] have to declare
		select @total = sum(rl.quantity * p.price) --to store total in variable, include @total in column list
			from requests r
				join requestlines rl
					on rl.requestid = r.id
				join products p
					on p.id = rl.productid
				where r.id = @requestId; --can test by doing a row that you know with hard coding an id
											--build outside to make sure working then plug 
				select @total 'Total'; --display it in a column named total
				--now update the request
				update requests set
					total = @total 
					where ID = @requestId;
				print 'Updated!'; 
				return 0; --to confirm it worked and will tell you
							--return 0, indicates that it worked
END
Go
exec CalculateRequestTotal @requestID = 1; --tell it to execute
											--best practice to tell system value
											--could also do exec calculaterequesttotal 1 w values separated by a comma
											--can also get confusing without parameters and can put values in in any order
Go
/* if want to define the numbers of return values
declare @rc int;
exec @rc = calculaterequesttotal @requestID = 1; */

--test by editing request lines
--now have procedure can run every time as long as we know what requestid we want to run it for, can also change
--to let it run for all requests
--procedure to indicate what numbers mean what things so when number returned in another procedure, system knows what to display

