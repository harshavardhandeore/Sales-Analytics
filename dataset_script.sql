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

