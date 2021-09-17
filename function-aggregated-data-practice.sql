--function practice
select min(sales)'Minimum sales', max(Sales) 'Maximum sales', sum(sales) 'Sales Sum', avg(sales) 'Average Sales', count(sales) 'How Many Sales'
	from Customers;
--^^these functions count the outcomes for ALL rows in the table

--show sales by (ex.) state, summary reports, not detail reports, use clauses
select City, count(*) 'Customers'
	from Customers
	group by City;

--total of sales in each city
select City, sum(sales) 'Total Sales'
	from customers
	group by City;

--practicing having clause
select city, sum(sales), count(*)
	from customers
	group by city
	having sum(Sales) > 60000;

--practice having using where clause as well
select city, sum(sales), count(*)
	from Customers
	where sales > 20000
	group by city
	having sum(sales) > 60000;