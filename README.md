# Logistics-Optimization-for-Delivery-Routes-Flipkart
SQL-based logistics analytics project analyzing delivery delays, route efficiency, warehouse performance, and delivery agent KPIs using MySQL.


## Project Overview

This project focuses on analyzing logistics and delivery operations using SQL to identify delivery delays, optimize routes, evaluate warehouse performance, and assess delivery agent efficiency.

Using a simulated Flipkart logistics dataset, various SQL techniques such as Joins, CTEs, Aggregate Functions, Subqueries, and Window Functions were applied to generate actionable business insights.

## Business Problem

As order volumes increase, logistics operations face challenges such as:

* Delivery delays
* Traffic congestion impacts
* Inefficient route planning
* Warehouse bottlenecks
* Uneven delivery agent performance

The goal of this project is to use SQL analytics to identify operational issues and recommend improvements that can enhance delivery efficiency and customer satisfaction.

---

## Dataset Information

The dataset contains:

| Dataset                       | Records |
| ----------------------------- | ------- |
| Orders                        | 300     |
| Routes                        | 20      |
| Warehouses                    | 10      |
| Delivery Agents               | 50      |
| Shipment Tracking Checkpoints | 999     |

### Tables Used

1. Orders
2. Routes
3. Warehouses
4. Delivery Agents
5. Shipment Tracking

---

## Tools & Technologies

* MySQL Workbench
* SQL
* PowerPoint
* Data Analytics
* Business Intelligence

---

## SQL Concepts Used

* Data Cleaning
* Aggregate Functions
* CASE Statements
* Joins
* Common Table Expressions (CTEs)
* Window Functions
* Ranking Functions
* Group By & Having
* Date Functions
* Performance Analysis

---

## Project Tasks

### 1. Data Cleaning & Preparation

* Removed duplicate records
* Handled missing traffic delay values
* Standardized date formats
* Validated delivery dates
* Created delivery status flags

### 2. Delivery Delay Analysis

* Calculated delivery delay for each order
* Identified top delayed routes
* Ranked delayed orders warehouse-wise using Window Functions

### 3. Route Optimization Analysis

* Calculated average delivery time
* Measured traffic delays
* Computed route efficiency ratio
* Identified worst-performing routes
* Detected routes with high delayed shipment percentages

### 4. Warehouse Performance Analysis

* Analyzed processing times
* Identified warehouse bottlenecks using CTEs
* Compared total vs delayed shipments
* Ranked warehouses by on-time delivery performance

### 5. Delivery Agent Performance Analysis

* Ranked agents route-wise
* Identified low-performing delivery agents
* Evaluated on-time delivery percentages

---

## Key Insights

### Route Performance

* RT_02 recorded the highest average delivery delay.
* RT_13 had the worst route efficiency ratio.
* RT_13 showed the highest delayed shipment percentage (54.5%).

### Warehouse Performance

* WH_10 had the highest processing time.
* WH_09 achieved the highest on-time delivery rate.
* WH_10 recorded the lowest on-time delivery performance.

### Delivery Agent Analysis

* Top-performing agents maintained more than 90% on-time delivery rates.
* Several agents recorded less than 80% on-time performance, indicating opportunities for improvement.

---

## Business Recommendations

* Prioritize optimization of RT_13, RT_14, RT_05, and RT_17 routes.
* Reduce traffic-related delays through better route planning.
* Improve warehouse operations at WH_10 and WH_09.
* Implement targeted training programs for low-performing delivery agents.
* Monitor route efficiency and on-time delivery KPIs regularly.

---

## Project Outcomes

This project demonstrates how SQL can be used to:

* Solve real-world logistics problems
* Generate business insights from operational data
* Identify performance bottlenecks
* Support data-driven decision-making

---

## Author

**Abir Shee**

B.Tech – Computer Science & Engineering

### Connect With Me

* LinkedIn: Add Your LinkedIn URL
* GitHub: Add Your GitHub URL
