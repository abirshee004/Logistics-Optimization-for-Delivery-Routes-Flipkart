use internshala_project;

SELECT * FROM flipkart_orders;
SELECT * FROM flipkart_routes;

-- Calculate delivery delay (in days) for each order
ALTER TABLE flipkart_Orders
ADD Delivery_Delay_Days INT;

UPDATE flipkart_orders
SET Delivery_Delay_Days = datediff(Actual_Delivery_Date, Order_Date);


-- Find Top 10 delayed routes based on average delay days.
SELECT Route_ID, AVG(Delivery_Delay_Days) AS average_delay_days
FROM flipkart_orders
GROUP BY Route_ID
ORDER BY average_delay_days DESC
LIMIT 10;

-- Use window functions to rank all orders by delay within each warehouse.
SELECT Order_ID, Route_ID, Warehouse_ID, Delivery_Delay_Days,
RANK() OVER(
	PARTITION BY Warehouse_ID
    ORDER BY Delivery_Delay_Days DESC
    ) AS Delay_Days
FROM flipkart_orders;



