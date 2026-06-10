-- Shipment Tracking Analytics 
use internshala_project;

SELECT * FROM flipkart_orders;
SELECT * FROM flipkart_routes;
SELECT * FROM flipkart_shipmenttracking;
SELECT * FROM flipkart_warehouses;
SELECT * FROM flipkart_deliveryagents;

-- For each order, list the last checkpoint and time.
SELECT Order_ID,
       MAX(Checkpoint_Time) AS Last_Checkpoint_Time
FROM flipkart_shipmenttracking
GROUP BY Order_ID
ORDER BY Order_ID ASC;

-- Find the most common delay reasons (excluding None).
SELECT Delay_Reason, COUNT(*) AS Occurrences, SUM(Delay_Minutes) AS Total_Delay_Minutes
FROM flipkart_shipmenttracking
WHERE Delay_Reason <> 'None'
GROUP BY Delay_Reason
ORDER BY Occurrences DESC;

-- Identify orders with >2 delayed checkpoints
SELECT Order_ID,
       COUNT(CASE 
                 WHEN Delay_Minutes > 0 THEN 1
             END) AS Delayed_Checkpoints
FROM flipkart_shipmenttracking
GROUP BY Order_ID
HAVING COUNT(CASE 
                 WHEN Delay_Minutes > 0 THEN 1
             END) > 2;
