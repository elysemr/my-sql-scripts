select code, description, MinSAT
	from major
	where minSAT >= 1000
	order by code;