# Business Question 6

-- Which sub-categories perform strongly only in specific regions? --

with sales as (
	select
		sub_category,
		region,
		sum(sales) as total_sales
	from supermarket_sales
	group by sub_category, region
)
select
	sub_category,
	region,
	total_sales,
	total_sales / sum(total_sales) over (partition by sub_category) * 100 as percentage
from sales
group by sub_category, region
order by sub_category, percentage desc
;

/*
Labels is the most region-specific sub-category, with West contributing 40.6% of 
its total sales — nearly double compared to other regions which range from 19% to 21%. 
In contrast, Envelopes show the most balanced distribution across all regions, ranging 
from 20% to 28%, suggesting consistent demand regardless of region.
*/