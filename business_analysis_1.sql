select * from supermarket_sales ss limit 30;

# Business Question 1

-- Which customers segment generate the highest average transaction value? --

/*
AVG()
GROUP BY
ORDER BY
*/

select
	count(order_id) as order_count,
	segment as consument,
	avg(transaction_value) as avg_transaction_value
from (
	select
		order_id,
		segment,
		sum(sales) as transaction_value
	from supermarket_sales
	group by order_id, segment
) as t
group by consument
order by avg_transaction_value desc
;

/* Home Office generates the highest average transaction value ($475.37) with fewer 
transactions compared to the other segments, however the difference in average 
transaction value across all three segments is relatively small, at around $10–20. 
*/
