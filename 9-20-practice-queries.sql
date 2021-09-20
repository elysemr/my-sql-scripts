--practice: display all the customers and their orders
select *
	from customers c
	join orders o
	on c.id = o.customerid;

--all customers, whose sales #s are less than the avg of all customers sales, desc by sales
select *
from Customers
where sales < (select avg(sales) from customers)
order by sales desc;

--to find the number of orders per customer, have to group/summarize data
--start with a normal join
select c.name, count(*) as orders
	from Customers c
	join orders o
		on o.CustomerId = c.Id
--then we have to group it to see the number consolidated instead of several lines for each
	group by c.Id, c.Name
--if you group data, you can only put aggregate functions and any columns in the select list 
--(but can't put them in if they're not in the select list)
--in resultset, none should be 0 because they shouldn't show up from the grouped data
--having clause to show only certain ones from the grouped data
	having count(*) > 1;

--slide 125 assignment in manual
select Lastname, isnull(m.Description,'undeclared') Major
		from student s
	left join major m
		on m.id = s.majorid
		where statecode = 'MI';
	


