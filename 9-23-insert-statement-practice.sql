--insert statement review
insert products 
(PartNbr, Name, Price, Unit, VendorId)
VALUES
--if copy/paste column list here and replace those parts with the actual values, you can remember
--what you need and what order they go in and make sure to enter the information correctly

--datetime format review
insert products
	(updated)
	VALUES
	--4 digit year, 2 digit month, 2 digit day, if don't care about time just do date
		--if care about time, space after dd and can go to millisecond
	('2021-09-23 09:30:00')
	--or do
	getdate();

