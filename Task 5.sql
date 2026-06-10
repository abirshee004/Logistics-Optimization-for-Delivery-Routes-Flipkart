-- Delivery Agent Performance

use internshala_project;

SELECT * FROM flipkart_orders;
SELECT * FROM flipkart_routes;
SELECT * FROM flipkart_shipmenttracking;
SELECT * FROM flipkart_warehouses;
SELECT * FROM flipkart_deliveryagents;

-- Rank agents (per route) by on-time delivery percentage
SELECT Agent_ID, Agent_Name, Route_ID, 
	   Avg_Speed_KMPH, On_Time_Delivery_Percentage, Experience_Years,
       RANK() OVER (PARTITION BY Route_ID ORDER BY On_Time_Delivery_Percentage DESC) AS Rank_In_Route 
FROM flipkart_deliveryagents 
ORDER BY Route_ID, Rank_In_Route;

-- Find agents with on-time % < 80%.
SELECT Agent_ID,
ROUND( COUNT(CASE
			    WHEN Actual_Delivery_Date <= Expected_Delivery_Date
				THEN 1
				END) * 100.0 / COUNT(*), 2) AS On_Time_Percentage
FROM flipkart_orders
GROUP BY Agent_ID
HAVING ROUND(
           COUNT(CASE
                     WHEN Actual_Delivery_Date <= Expected_Delivery_Date
                     THEN 1
                 END) * 100.0 / COUNT(*),
           2
       ) < 80
ORDER BY On_Time_Percentage DESC;


-- Compare average speed of top 5 vs bottom 5 agents using subqueries.
WITH Ranked_Agents AS (
    SELECT Agent_ID,
           Avg_Speed_KMPH,
           On_Time_Delivery_Percentage,
           RANK() OVER(
               ORDER BY On_Time_Delivery_Percentage DESC
           ) AS Top_Rank,
           RANK() OVER(
               ORDER BY On_Time_Delivery_Percentage ASC
           ) AS Bottom_Rank
    FROM flipkart_deliveryagents
)
SELECT 'Top 5 Agents' AS Category,
       AVG(Avg_Speed_KMPH) AS Avg_Speed
FROM Ranked_Agents
WHERE Top_Rank <= 5

UNION

SELECT 'Bottom 5 Agents' AS Category,
       AVG(Avg_Speed_KMPH) AS Avg_Speed
FROM Ranked_Agents
WHERE Bottom_Rank <= 5;


-- Suggest training or workload balancing strategies for low performers

