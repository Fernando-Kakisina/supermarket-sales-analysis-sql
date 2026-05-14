select * from supermarket_sales ss limit 30;

# Business Question 2

-- Which regions experience the slowest shipping performance? --

-- Counting percentage of shipping_days >= 5
select
	ss.region,
	AVG(ss.shipping_days) as avg_shipping_days,
	count(case when shipping_days >= 5 then 1 end) / count(ss.order_id) * 100 as percentage
from supermarket_sales ss
group by ss.region
order by avg_shipping_days desc
;

-- ship_mode analysis for central region
select
	ss.region,
	ss.ship_mode,
	AVG(ss.shipping_days) as avg_shipping_days,
	count(case when shipping_days >= 5 then 1 end) / count(ss.order_id) * 100 as percentage
from supermarket_sales ss
where ss.region = 'Central'
group by ss.region, ss.ship_mode
order by avg_shipping_days desc
;

/*
While all regions have a similar average shipping days (~4 days), Central 
region has the highest percentage of slow orders (≥5 days) at 41.8%, compared 
to East at 38.6%.

Drilling down by Ship Mode, Standard Class is the main contributor with 59.1% 
slow orders in Central region, while First Class and Same Day show no slow orders 
at all.
*/
