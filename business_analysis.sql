select * from supermarket_sales ss limit 30;

# Business Question

-- Which customers segment generate the highest average transaction value? --

/*
AVG()
GROUP BY
ORDER BY
*/

select
	segment,
	avg(transaction_value) as avg_transaction_value
from (
	select
		order_id,
		segment,
		sum(sales) as transaction_value
	from supermarket_sales
	group by order_id, segment
) as t
group by segment 
order by avg_transaction_value desc
;
