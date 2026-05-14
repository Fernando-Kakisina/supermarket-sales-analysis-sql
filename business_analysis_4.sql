# Business Question 4

-- What are the best-selling products within each category? --

select * from supermarket_sales limit 1;

with product_rank as (
	select 
		category,
		product_name,
		count(order_id) as total_transaction,
		row_number() over (partition by category order by count(order_id) desc) as rank_num
		from supermarket_sales
	group by category, product_name
)
select *
from product_rank
where rank_num = 1
;

/*
KI Adjustable-Height Table is the most purchased product in Furniture with 17 transactions, Staple Envelope
in Office Supplies with 47 transactions, and Logitech M325 Wireless Mouse in Technology with 15 transactions.
Office Supplies stands out significantly with nearly 3x more transactions compared to Furniture and Technology,
suggesting that office supply products are purchased more frequently than furniture or tech products.
*/