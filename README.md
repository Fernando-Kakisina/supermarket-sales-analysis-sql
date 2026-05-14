# 🛒 Supermarket Sales Analysis with SQL

A portfolio project analyzing supermarket sales data using SQL to answer key business questions across customer behavior, shipping performance, product sales, and regional trends.

---

## 🛠️ Tools Used

- **Microsoft Excel** — Initial data cleaning (removing duplicates, handling missing values, formatting)
- **DBeaver** — SQL query editor
- **MySQL** — Database engine
- **Dataset** — Supermarket Sales (CSV)

---

## 📂 Dataset Overview

The dataset contains **9,800 rows** of transactional sales data from a US-based supermarket chain, covering the following key columns:

| Column | Description |
|---|---|
| `order_id` | Unique order identifier |
| `order_date` | Date of the order |
| `ship_date` | Date of shipment |
| `shipping_days` | Number of days to ship |
| `ship_mode` | Shipping method used |
| `customer_id` | Unique customer identifier |
| `customer_name` | Name of the customer |
| `segment` | Customer segment (Consumer, Corporate, Home Office) |
| `region` | US region (Central, East, South, West) |
| `category` | Product category |
| `sub_category` | Product sub-category |
| `product_name` | Name of the product |
| `sales` | Sales revenue |

---

## ❓ Business Questions

1. Which customer segments generate the highest average transaction value?
2. Which regions experience the slowest shipping performance?
3. Who are the most loyal customers based on purchase frequency?
4. What are the best-selling products within each category?
5. Which months consistently generate the highest sales?
6. Which sub-categories perform strongly only in specific regions?

---

## 📁 File Structure

```
supermarket-sales-sql/
│
├── README.md
├── business_analysis_1.sql
├── business_analysis_2.sql
├── business_analysis_3.sql
├── business_analysis_4.sql.sql
├── business_analysis_5.sql.sql
├── business_analysis_6.sql.sql
└── data_cleaning.sql
```

---

## 💡 Insight Summary

### 1. Customer Segment Transaction Value
Home Office generates the highest average transaction value ($475.37) with fewer transactions compared to the other segments, however the difference in average transaction value across all three segments is relatively small, at around $10–20.

### 2. Regional Shipping Performance
While all regions have a similar average shipping days (~4 days), Central region has the highest percentage of slow orders (≥5 days) at 41.8%, compared to East at 38.6%. Drilling down by Ship Mode, Standard Class is the main contributor with 59.1% slow orders in Central region, while First Class and Same Day show no slow orders at all.

### 3. Most Loyal Customers
William Brown is the most loyal customer with 35 total transactions. Among the top 10 customers, the gap between each of them is relatively small, ranging from only 1 to 5 transactions.

### 4. Best-Selling Products per Category
KI Adjustable-Height Table is the most purchased product in Furniture with 17 transactions, Staple Envelope in Office Supplies with 47 transactions, and Logitech M325 Wireless Mouse in Technology with 15 transactions. Office Supplies stands out significantly with nearly 3x more transactions compared to Furniture and Technology, suggesting that office supply products are purchased more frequently than furniture or tech products.

### 5. Monthly Sales Trends
November generates the highest average sales across all years at $87,540. Sales from January to August fluctuate in the range of $14,000–$39,000, before spiking significantly in September ($75,025). A notable peak occurs in Q4, where November and December consistently record the highest sales at $87,540 and $80,370 respectively, suggesting a strong year-end buying trend.

### 6. Sub-Category Regional Performance
Labels is the most region-specific sub-category, with West contributing 40.6% of its total sales — nearly double compared to other regions which range from 19% to 21%. In contrast, Envelopes show the most balanced distribution across all regions, ranging from 20% to 28%, suggesting consistent demand regardless of region.

---

## 🔗 Connect with Me

- **LinkedIn**: www.linkedin.com/in/fernando-william-kakisina/
- **Medium**: https://medium.com/@fernandowilliamk

---

## 👤 Author

**Fernando William Kakisina**  
Aspiring Data Analyst | Learning SQL for Business Intelligence
