--delete item by ID
create or alter procedure DeleteRequestLine
@requestid int = 1
as
	begin
	if exists(select 1 from requestlines where id = @requestid)
		begin
			print 'item(s) deleted.';
	end
	 delete from requestlines where id = @requestid;
	 print 'delete successful';
	 return 0;
end
go
	exec deleterequestline @requestid = 1
--positive condition has to change every time data/structure changes

	--greg's code
	/*
	create or alter procedure deleterequestlinebyid
	@requestlineid int = null
	as begin
		if @requestlineid is null begin
		print 'requestline id is required';
		return -1;
		end

	delete from requestlines
		where id = @requestlineid;
	end
	go
	exec deleterequestlinebyid @requestlineid = 4
	go
	*/
	--do it the null/error route so that you can seed out issues and the procedure can stand if the data changes