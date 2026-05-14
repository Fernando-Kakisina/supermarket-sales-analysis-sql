# Business Question 3

-- Who are the most loyal customers based on purchase frequency? --

select
	customer_name,
	customer_id,
	count(order_id) as total_transaction
from supermarket_sales
group by customer_name, customer_id
order by total_transaction desc
;

/*
William Brown is the most loyal customer with 35 total transactions.
Among the top 10 customers, the gap between each of them is relatively
small, ranging from only 1 to 5 transactions.
 */
