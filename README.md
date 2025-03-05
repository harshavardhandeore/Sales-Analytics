# Sales Analytics Project (Interactive dashboard using Excel and SQL)

## Introduction
This project aims to provide insights into sales and sales trends for the client. The goal is to analyze revenue with respect to region, store, product category, and brand, as well as identify top customers and best-performing sales representatives. The analysis is visualized using an Excel dashboard.

## Objectives
The objectives of this project are to:
- Analyze revenue by region, store, product category, and brand.
- Identify top customers based on revenue.
- Determine the best-performing sales representatives.
- Provide actionable insights through an Excel dashboard for better decision-making.

## Dataset Used
Dataset was created using following SQL query:

SELECT
    ord.order_id, 
    CONCAT(cus.first_name, ' ', cus.last_name) AS name, 
    cus.city, 
    cus.state, 
    ord.order_date, 
    prod.product_name, 
    cat.category_name, 
    brnd.brand_name, 
    SUM(orit.quantity) AS ttl_qty, 
    SUM(orit.quantity * orit.list_price) AS revenue, 
    stor.store_name,
    CONCAT(stf.first_name, ' ', stf.last_name) AS representative
FROM 
    sales.orders AS ord
    JOIN sales.customers AS cus ON ord.customer_id = cus.customer_id 
    JOIN sales.order_items AS orit ON ord.order_id = orit.order_id 
    JOIN production.products AS prod ON orit.product_id = prod.product_id 
    JOIN production.brands AS brnd ON prod.brand_id = brnd.brand_id 
    JOIN production.categories AS cat ON prod.category_id = cat.category_id
    JOIN sales.stores AS stor ON ord.store_id = stor.store_id
    JOIN sales.staffs AS stf ON stor.store_id = stf.store_id
GROUP BY
    ord.order_id, 
    CONCAT(cus.first_name, ' ', cus.last_name), 
    cus.city, 
    cus.state, 
    ord.order_date, 
    prod.product_name, 
    cat.category_name, 
    brnd.brand_name,
    CONCAT(stf.first_name, ' ', stf.last_name)
ORDER BY
    ord.order_id;




## Key Questions (KPIs)
This analysis aims to answer the following key questions (KPIs):
- What are the overall sales trends over time?
- How does revenue vary by region?
- How does revenue vary by store?
- How does revenue vary by product category?
- How does revenue vary by brand?
- Who are the top customers based on revenue?
- Who are the best-performing sales representatives?

## Process
The analysis was conducted using the following steps:
1. **Data Creation:** Created the dataset using SQL queries.
2. **Data Upload:** Uploaded the dataset into an Excel file.
3. **Dashboard Creation:** Created an interactive Excel dashboard to visualize the findings.

## Dashboard
[Dashboard](https://github.com/harshavardhandeore/Sales-Analytics/raw/main/Dashboard.jpg)

https://github.com/your_username/your_repo/raw/main/path_to_image/dashboard_screenshot.png)

## Project Insights
- **Revenue Trends:** Revenue peaked in 2017 with $1,200,000, followed by a slight decrease in 2018 to $600,000.
- **Monthly Revenue:** Monthly revenue trends show fluctuations with notable peaks and troughs.
- **Regional Revenue:** The map shows higher revenue in CA ($1,746,187), followed by NY ($218,609.92).
- **Store Revenue:** Baldwin Bikes generates the highest revenue (64%), followed by Santa Cruz Bikes (26%) and Rowlett Bikes (10%).
- **Brand Revenue:** Trek leads with $1,640,382, followed by Electra ($643,776), Surly ($384,041), Sun Bicycle ($182,388), Haro ($64,599), Heller ($64,599), Pure Cycles ($26,159), Ritchey ($20,996), and Strider ($15,159).
- **Product Category Revenue:** Mountain Bikes generate the most revenue ($97,120.82), followed by Road Bikes ($89,697.76), Cruiser Bicycles ($55,219.37), Electric Bikes ($38,529.50), Cyclocross Bicycles ($27,795.56), Comfort Bicycles ($14,154.04), Children Bicycles ($10,823.93), and (Blank) ($4,600).
- **Top Customers:** Top 10 customers are listed based on sales generated due to them.
- **Top Sales Representatives:** Top 10 sales representatives are listed based on sales they made.

## Conclusion
This sales analytics project provides valuable insights into sales trends, regional performance, store performance, product category performance, brand performance, top customers, and top sales representatives. The SQL analysis and Excel dashboard enable better decision-making for revenue optimization and strategic planning. Future work could involve deeper analysis of additional factors influencing sales performance to further refine strategies.



