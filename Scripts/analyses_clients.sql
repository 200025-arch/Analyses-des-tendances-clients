--Q1 What is the total revenue by male vs. female customers ? 

SELECT * FROM customer

SELECT
	gender,
	SUM(purchase_amount) as total_revenu
FROM customer
GROUP BY gender;

--Q2 Le nbre de client ayant utilisés une remise ou pas
SELECT
	COUNT(customer_id) AS nbr_of_customer,
	ROUND(AVG(purchase_amount), 2),
	discount_applied
FROM customer
GROUP BY discount_applied

--Q3 Which customers used a discount but still spent more than the average purchase amount

SELECT
	customer_id,
	purchase_amount
FROM customer
WHERE discount_applied = 'Yes' AND purchase_amount > (SELECT AVG(purchase_amount) FROM customer)

SELECT ROUND(AVG(purchase_amount), 2) FROM customer

--Q4 Which are the top 5 products with the highest average review rating


SELECT
	item_purchased,
	ROUND(AVG(review_rating :: numeric), 2) AS avg_review_rating
FROM customer
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC
LIMIT 5;

--Q5 Compare the average puchase amounts between standard and express shipping

SELECT 
	shipping_type,
	ROUND(AVG(purchase_amount), 2) AS shipping_type_avg
FROM customer
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type
ORDER BY AVG(purchase_amount) DESC

--Q6 Do suscribed customers spend more ? Compare average spend and total revenue between subscribers and non-subscribers


SELECT
	subscription_status,
	COUNT(customer_id) AS total_customers,
	ROUND(AVG(purchase_amount), 2) AS avg_spend,
	ROUND(SUM(purchase_amount), 2) AS total_revenu
FROM customer
GROUP BY subscription_status;

--Q7 Which 5 products have the highest percentage of purchases with discounts applied ? 

SELECT
	item_purchased,
	ROUND(100 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*), 2) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5;

/*Q8 Segment customers into New, Returning and Loyal based on their total number of previous  purchases and
show the count of each segment */

WITH cte_customer_type AS (
SELECT
	customer_id,
	previous_purchases,
	CASE
		WHEN previous_purchases = 1 THEN 'New'
		WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
		ELSE 'Loyal'
	END customer_segmentation
FROM customer
)

SELECT
	customer_segmentation,
	COUNT(customer_id) AS nbr_of_customer
FROM cte_customer_type
GROUP BY customer_segmentation;

--Q9 What are the top 3 most purchased products within each category ? 


WITH cte_items_counts AS (

SELECT 
	category,
	item_purchased,
	COUNT(customer_id) as total_orders,
	ROW_NUMBER() OVER(PARTITION BY category ORDER BY COUNT(customer_id) DESC) as item_rank
FROM customer
GROUP BY category, item_purchased
)

SELECT
	item_rank, category,item_purchased, total_orders
FROM cte_items_counts
WHERE item_rank <= 3;

--Q10 Are customers who are repeat buyers (more than 5 previous) also likely to subscribe ? 

SELECT
	subscription_status,
	COUNT(customer_id) as reapet_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status

--Q10 What is the revenue contribution of each age group ? 

SELECT
	age_group,
	SUM(purchase_amount) as total_revenu
FROM customer
GROUP BY age_group
ORDER BY total_revenu DESC;






	