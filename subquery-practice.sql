-- show a table of all the companies whose sales are above the average of the table
select *
	from Customers
	where sales > (select avg(sales) from customers)
	order by Sales desc;

--write a query where we can use and figure out all the orders for Kroger
select *
	from customers c
	join orders o
	on o.customerid = c.id
	where c.name = 'Kroger';