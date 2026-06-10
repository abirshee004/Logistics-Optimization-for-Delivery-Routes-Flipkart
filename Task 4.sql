use internshala_project;

SELECT * FROM flipkart_orders;
SELECT * FROM flipkart_routes;
SELECT * FROM flipkart_shipmenttracking;
SELECT * FROM flipkart_warehouses;
SELECT * FROM flipkart_deliveryagents;

-- Find the top 3 warehouses with the highest average processing time.
SELECT Warehouse_ID, Warehouse_Name, Average_Processing_Time_Min
FROM flipkart_warehouses
ORDER BY Average_Processing_Time_Min DESC
LIMIT 3;

-- Calculate total vs. delayed shipments for each warehouse.
SELECT Warehouse_ID, COUNT(*) AS Total_Shipments,
COUNT(CASE
WHEN Actual_Delivery_Date > Expected_Delivery_Date
THEN 1
END) AS Delayed_Shipments
FROM flipkart_orders
GROUP BY Warehouse_ID
ORDER BY Total_Shipments DESC;

-- Use CTEs to find bottleneck warehouses where processing time > global average.
WITH Avg_Processing AS (
    SELECT AVG(Average_Processing_Time_Min) AS Global_Avg
    FROM flipkart_warehouses
)
SELECT Warehouse_ID,
       Warehouse_Name,
       Average_Processing_Time_Min
FROM flipkart_warehouses,
     Avg_Processing
WHERE Average_Processing_Time_Min > Global_Avg
ORDER BY Average_Processing_Time_Min DESC;

-- Rank warehouses based on on-time delivery percentage.
SELECT Warehouse_ID,
ROUND( COUNT(CASE
				WHEN Actual_Delivery_Date <= Expected_Delivery_Date
				THEN 1
				END) * 100.0 / COUNT(*), 2) AS On_Time_Percentage,
       RANK() OVER(
           ORDER BY COUNT(CASE
							WHEN Actual_Delivery_Date <= Expected_Delivery_Date
							THEN 1
                            END) * 100.0 / COUNT(*) DESC) AS Warehouse_Rank
FROM flipkart_orders
GROUP BY Warehouse_ID;

