select * from ot.orders;
select * from ot.customers;

/* Question 1 */
/* Puneet Anand s10_ananpune*/
CREATE VIEW OTView3 as
SELECT name, address, product_name, quantity, order_date, status,
ROUND(SUM(quantity * unit_price)OVER (PARTITION BY status),2) AS "Cost of goods" FROM ot.customers cust
JOIN ot.orders ords ON cust.customer_id = ords.customer_id
JOIN ot.order_items ordereditems ON ords.order_id = ordereditems.order_id
JOIN ot.products prods ON ordereditems.product_id = prods.product_id
WHERE status IN ('Canceled', 'Shipped') and order_date < '2017-01-01';

select * from OTView3;

/* Question 2 */
/* Puneet Anand s10_ananpune*/
SELECT DISTINCT product_name FROM ot.products WHERE product_id IN
(SELECT product_id FROM ot.orders WHERE product_id IN
(SELECT product_id FROM ot.inventories WHERE quantity > 0));

/* Question 3 */
/* Puneet Anand s10_ananpune*/
SELECT COUNT(cust.customer_id) FROM ot.customers cust
JOIN ot.orders ords ON cust.customer_id = ords.customer_id
JOIN ot.employees emps ON emps.employee_id = ords.salesman_id;

/* Question 4 */
/* Puneet Anand s10_ananpune*/
SELECT wares.warehouse_name, loc.address, loc.postal_code, loc.city, loc.state, country.country_name, reg.region_name
FROM ot.warehouses wares JOIN ot.locations loc ON wares.location_id = loc.location_id
JOIN ot.countries country ON loc.country_id = country.country_id
JOIN ot.regions reg ON country.region_id = reg.region_id
WHERE reg.region_name IN ('Americas') ORDER BY wares.warehouse_name DESC;
