use internshala_project;

SELECT * FROM flipkart_orders;
SELECT * FROM flipkart_routes;
SELECT * FROM flipkart_shipmenttracking;
SELECT * FROM flipkart_warehouses;
SELECT * FROM flipkart_deliveryagents;

-- For each route, calculate:
-- ○ Average delivery time (in days).
-- ○ Average traffic delay.
-- ○ Distance-to-time efficiency ratio: Distance_KM / Average_Travel_Time_Min.

SELECT o.Route_ID,
ROUND(AVG(DATEDIFF(Actual_Delivery_Date, Order_Date)), 2) AS Avg_Delivery_Time_Days,
AVG(r.Traffic_Delay_Min) AS Avg_Traffic_Delay,
ROUND(r.Distance_KM / r.Average_Travel_Time_Min, 2) AS Efficiency_Ratio
FROM flipkart_orders o
JOIN flipkart_routes r
ON o.Route_ID = r.Route_ID
GROUP BY o.Route_ID, r.Distance_KM, r.Average_Travel_Time_Min
ORDER BY Avg_Delivery_Time_Days DESC;

-- Identify 3 routes with the worst efficiency ratio.
SELECT Route_ID,
ROUND(Distance_KM / Average_Travel_Time_Min, 2) AS Efficiency_Ratio
FROM flipkart_routes r
ORDER BY Efficiency_Ratio ASC
LIMIT 3;

-- Find routes with >20% delayed shipments.
SELECT Route_ID, COUNT(*) AS Total_Orders, 
SUM(CASE
 	WHEN Actual_Delivery_Date > Expected_Delivery_Date 
    THEN 1 	ELSE 0 	
    END) AS Delayed_Orders,
COUNT(CASE
			WHEN Actual_Delivery_Date > Expected_Delivery_Date
			THEN 1
	END) * 100.0 / COUNT(*) AS Delayed_Percentage
FROM flipkart_orders
GROUP BY Route_ID
HAVING COUNT(CASE
WHEN Actual_Delivery_Date > Expected_Delivery_Date
THEN 1
END) * 100.0 / COUNT(*) > 20
ORDER BY Delayed_Percentage DESC;
             
             
-- Recommend potential routes for optimization.

