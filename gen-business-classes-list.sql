-- this query shows all the classes required for general business
select c.code, subject, description
	from major m
	join majorclass mc
	on mc.majorid = m.id

	join class c
	on c.id = mc.classid
	where m.code = 'genb';
