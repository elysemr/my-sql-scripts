--create a procedure for adding new lines in requests
create or alter procedure AddRequestLine --this will only expect that you have requests and products you can add lines to
--need to specify parameters
@requestID int = null, --so I check to make sure it's put in
@productName varchar(30) = null, --doing by name because can assume unique (easier for users but harder on our end)
@Quantity int = null
as --now that we're done with parameters
begin
	--check to see if any parameters are null/all data entered (if so we have to tell them to provide all data)
	if @requestid is null OR @productname is null OR @quantity is null
	begin
		print 'All parameters must be entered.';
		return -1;
	end
	--need to check to see if the requestid is valid
	if not exists(select 1 from requests where id = @requestid) --don't need semicolon because parentheses
		begin
			print 'Request not found.';
			return -2 --actual numbers in this ex are random
		end
	if not exists(select 1 from products where Name = @productname) --can still be prod name in parameter
		begin
			print 'Product not found';
			return -3;
		end
	if @quantity < 1
		begin
			print 'Quantity must be GTE 0';
			return -4;
		end
	--all parameters have been checked
	--still need data (product id, request id, quantity)
	declare @productid int;
		select @productid = id from products where name = @productname; --we know the product name works because we already checked it in statement before
	--do the insert
	insert requestlines (requestid, productid, quantity) --columns entering data
		values (@requestid, @productid, @quantity);
	print 'Insert Successful!';
	return 0;
end
go
exec addrequestline @requestid = 1, @productname = 'camera battery', @quantity = 1;

select * from requests;