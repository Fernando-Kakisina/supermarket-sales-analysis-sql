# Business Question 5

-- Which months consistently generate the highest sales? --

with monthly_sales as (
	select
		month(order_date) as month,
		year(order_date) as year,
		sum(sales) as sum_sales
	from supermarket_sales
	group by month, year
)
select 
	month,
	avg(sum_sales) as avg_sales
from monthly_sales
group by month
order by avg_sales desc
;

/*
November generates the highest average sales across all years 
at $87,540. Sales from January to August fluctuate in the range 
of $14,000–$39,000, before spiking significantly in September 
($75,025). A notable peak occurs in Q4, where November and December 
consistently record the highest sales at $87,540 and $80,370 respectively, 
suggesting a strong year-end buying trend.
*/