USE internshala_project;

SELECT * FROM flipkart_orders;
SELECT * FROM flipkart_routes;
SELECT * FROM flipkart_shipmenttracking;
SELECT * FROM flipkart_warehouses;
SELECT * FROM flipkart_deliveryagents;

-- DELETE DUPLICATE VALUES
DELETE o1
FROM flipkart_orders o1
JOIN flipkart_orders o2
ON o1.Order_ID = o2.Order_ID
AND o1.Order_ID > o2.Order_ID;

-- Replace null Traffic_Delay_Min with the average delay for that route.
SELECT * FROM flipkart_routes
WHERE Traffic_Delay_Min IS NULL
OR Traffic_Delay_Min = '';

UPDATE flipkart_routes r1
SET Traffic_Delay_Min = (
	SELECT AVG(Traffic_Delay_Min) As avg_delay
    FROM flipkart_routes r2
    WHERE r2.Route_ID = r1.Route_ID
)
WHERE Traffic_Delay_Min IS NULL;
-- NOT DONE YET

-- Convert all date columns into YYYY-MM-DD format using SQL functions
UPDATE flipkart_orders
SET
Order_Date = date_format(Order_Date, '%Y-%m-%d'),
Expected_Delivery_Date = date_format(Expected_Delivery_Date, '%Y-%m-%d'),
Actual_Delivery_Date = date_format(Actual_Delivery_Date, '%Y-%m-%d');

-- Ensure that no Actual_Delivery_Date is before Order_Date (flag such records).
SELECT *
FROM flipkart_orders
WHERE Actual_Delivery_Date < Order_Date;

ALTER TABLE flipkart_orders
ADD Delivery_Flag VARCHAR(10);

UPDATE flipkart_orders
SET Delivery_Flag = 
	CASE
		WHEN Actual_Delivery_Date < Order_Date THEN 'Invalid'
        ELSE 'Valid'
	END;
    
    
    