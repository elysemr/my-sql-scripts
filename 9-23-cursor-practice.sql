--cursor and expressions practice
select * from Student; --see people on the list to choose who is affected

--cursor statement
insert Adjustments
(Firstname, Lastname, GpaDelta)
VALUES
('Eric', 'Ephram', 0.2),
('Jordan', 'Rodgers', -0.1),
('Jessica', 'Patrick', 1.0);

--now check
select * from Adjustments;