-- Queries 
-- Update contact number 
-- Number of subscribers whose subscriptions will be ending in 2023
-- Number of subscribers who have subscribed for more than 3 months in 2022
-- Subscribers who have subscribed for more than 2 products
-- Product with the most /2ndmost/ 3rdmost number of subscribers in 2022
-- Number of subscribers who have re-subscribed more than once for each product
-- Subscribers who have re-subscribed a higher version of the product in 2023

-- Non-query qn: How to speed up update phone number query?

-- Check what data is in table
SELECT * FROM tblSubscriptionInfo

-- Update contact number 
UPDATE tblSubscriptionInfo
SET customer_phone_number = 'new_phone_number' 
WHERE customer_id = 111

-- Number of subscribers whose subscriptions will be ending in 2023
SELECT COUNT(DISTINCT customer_id) FROM tblSubscriptionInfo
WHERE YEAR(subscription_end_date) = 2023

-- Number of subscribers who have subscribed for more than 3 months in 2022
SELECT COUNT(DISTINCT customer_id) FROM tblSubscriptionInfo
WHERE TIMESTAMPDIFF(MONTH, subscription_start_date, subscription_end_date) > 3

-- Subscribers who have subscribed for more than 2 products
SELECT customer_id, COUNT(DISTINCT product_id) FROM tblSubscriptionInfo
GROUP BY customer_id
HAVING COUNT(DISTINCT product_id) > 2 

-- Product with the most /2ndmost/ 3rdmost number of subscribers in 2022
SELECT product_id, COUNT(DISTINCT customer_id) FROM tblSubscriptionInfo
GROUP BY product_id
ORDER BY COUNT(DISTINCT customer_id) DESC
-- assumption here: distinct subscribers, this will count a subscriber who has re-subscribed as 1 (note I use DISTINCT here)

-- Number of subscribers who have re-subscribed more than once for each product
WITH TBL1 AS(
SELECT product_id, customer_id, COUNT(*) AS num_subscriptions_to_same_product FROM tblSubscriptionInfo
GROUP BY product_id, customer_id)

SELECT customer_id FROM TBL1 WHERE num_subscriptions_to_same_product > 1
-- assumption here: 're-subscribed more than once for each product' means that the subscriber has subscribed to the same product more than once

-- Subscribers who have re-subscribed a higher version of the product in 2023
-- note that the version number of the product is captured in the product_name, and at the end of the product name
-- Categorise the products into its own product lines. Assuming each product name is only 1 word and is delimited with its version number by a whitespace
WITH TBL1 AS (
SELECT customer_id, 
product_id, 
product_name, 
SUBSTRING_INDEX(product_name, ' ', 1) AS product_line, 
SUBSTRING_INDEX(product_name, ' ', -1) AS product_version 
FROM tblSubscriptionInfo
),

TBL2 AS (
SELECT * FROM TBL1 WHERE product_version = '2023')

SELECT DISTINCT a.customer_id FROM TBL1 a
INNER JOIN TBL2 b 
	ON a.customer_id = b.customer_id
    AND a.product_line = b.product_line
WHERE a.product_version != '2023'

-- Qn: How to speed up update phone number query
Currently, the tblSubscriptionInfo table stores data on 3 entities which are subscriptions, product details and customer details
When an update statement is run to update the customer_phone_number, each record of that same customer will have his/her phone number updated. 
This means if the same customer subscribes to 10 different products, 10 records will be updated.

To speed up the update phone number query, we should separate customer details into its own table, say 'customer'.
The 'customer' table will contain all customer details such as customer_id, customer_phone_number, customer_address.
The 'customer' table will only have one record for each unique customer.
When an update query is run to update the customer_phone number, only 1 record will need to be updated. 
From here, if we want to retrieve the customer_phone_number, we just need to INNER JOIN tblSubscriptionInfo and customer ON customer_id

SELECT * 
FROM tblSubscriptionInfo a
INNER JOIN customer b
	ON a.customer_id = b.customer_id
