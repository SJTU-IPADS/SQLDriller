SELECT count(*) FROM club	soccer_3
SELECT count(*) FROM club	soccer_3
SELECT Name FROM club ORDER BY Name ASC	soccer_3
SELECT Name FROM club ORDER BY Name ASC	soccer_3
SELECT Manager ,  Captain FROM club	soccer_3
SELECT Manager ,  Captain FROM club	soccer_3
SELECT Name FROM club WHERE Manufacturer != "Nike"	soccer_3
SELECT Name FROM club WHERE Manufacturer != "Nike"	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT p.name FROM player p WHERE p.earnings = (SELECT MAX(earnings) FROM player);	soccer_3
SELECT P.name FROM player P WHERE P.earnings = (SELECT MAX(earnings) FROM player)	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000	soccer_3
SELECT p1.country FROM player p1 WHERE p1.earnings = (SELECT MAX(p2.earnings) FROM player p2 WHERE p2.wins_count > 2) AND p1.wins_count > 2	soccer_3
SELECT p.country FROM player p WHERE p.wins_count > 2 and p.earnings = (SELECT MAX(earnings) FROM player WHERE wins_count>2)	soccer_3
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	soccer_3
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID	soccer_3
SELECT name FROM club WHERE club_id IN (SELECT club_id FROM player WHERE wins_count > 2)	soccer_3
SELECT name FROM club WHERE club_id IN (SELECT club_id FROM player WHERE wins_count > 2)	soccer_3
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"	soccer_3
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC	soccer_3
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT manufacturer FROM club GROUP BY manufacturer HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM club GROUP BY manufacturer))	soccer_3
SELECT manufacturer FROM club GROUP BY manufacturer HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM club GROUP BY manufacturer))	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1	soccer_3
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1	soccer_3
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1	soccer_3
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	soccer_3
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)	soccer_3
SELECT DISTINCT country FROM player WHERE earnings > 1400000 UNION ALL SELECT DISTINCT country FROM player WHERE earnings < 1100000	soccer_3
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000	soccer_3
SELECT COUNT (DISTINCT Country) FROM player	soccer_3
SELECT COUNT (DISTINCT Country) FROM player	soccer_3
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"	soccer_3
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"	soccer_3
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >= 3	e_commerce
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >= 3	e_commerce
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id	e_commerce
SELECT order_id, order_status_code, (SELECT COUNT(*) FROM order_items WHERE order_items.order_id = orders.order_id) AS product_count FROM orders	e_commerce
SELECT min(date_order_placed) FROM Orders UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1	e_commerce
SELECT min(date_order_placed) FROM Orders UNION SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1	e_commerce
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders)	e_commerce
SELECT c.customer_first_name, c.customer_last_name, c.customer_middle_initial FROM customers c WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id)	e_commerce
SELECT product_id ,  product_name ,  product_price ,  product_color FROM Products EXCEPT SELECT T1.product_id ,  T1.product_name ,  T1.product_price ,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.product_id HAVING count(*)  >=  2	e_commerce
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM products p WHERE (SELECT COUNT(DISTINCT oi.order_id) FROM order_items oi WHERE oi.product_id = p.product_id) < 2	e_commerce
SELECT T1.order_id ,  T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2	e_commerce
SELECT T1.order_id ,  T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2	e_commerce
WITH RankedProducts AS (SELECT P.product_id, P.product_name, P.product_price, RANK() OVER (ORDER BY COUNT(OI.product_id) DESC) as Rank FROM products P JOIN order_items OI ON P.product_id = OI.product_id GROUP BY P.product_id) SELECT product_id, product_name, product_price FROM RankedProducts WHERE Rank = 1;	e_commerce
SELECT product_id, product_name, product_price FROM (SELECT T1.product_id, T1.product_name, T1.product_price, rank() over (ORDER BY count(*) DESC) as rk FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id) WHERE rk = 1;	e_commerce
SELECT order_id, sum_price FROM (SELECT T1.order_id, sum(T2.product_price) as sum_price, rank() over (ORDER BY sum(T2.product_price) ) as rk FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id GROUP BY T1.order_id) WHERE rk = 1;	e_commerce
SELECT order_id, sum_price FROM (SELECT T1.order_id, sum(T2.product_price) as sum_price, rank() over (ORDER BY sum(T2.product_price) ) as rk FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id GROUP BY T1.order_id) WHERE rk = 1;	e_commerce
SELECT payment_method_code FROM (SELECT payment_method_code, RANK() OVER (ORDER BY COUNT(*) DESC) as rank FROM customer_payment_methods GROUP BY payment_method_code) WHERE rank = 1	e_commerce
SELECT payment_method_code FROM customer_payment_methods GROUP BY payment_method_code HAVING COUNT(*) = (SELECT max(count_global.use_count) FROM (SELECT payment_method_code, COUNT(*) AS use_count FROM customer_payment_methods GROUP BY payment_method_code) count_global)	e_commerce
SELECT g.gender_code, COUNT(*) AS total_products FROM customers g LEFT JOIN orders o ON g.customer_id = o.customer_id LEFT JOIN order_items oi ON o.order_id = oi.order_id GROUP BY g.gender_code;	e_commerce
SELECT g.gender_code, COUNT(*) AS total_products FROM customers g LEFT JOIN orders o ON g.customer_id = o.customer_id LEFT JOIN order_items oi ON o.order_id = oi.order_id GROUP BY g.gender_code;	e_commerce
SELECT c.gender_code, COUNT(o.order_id) FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.gender_code	e_commerce
SELECT g.gender_code, COUNT(*) AS total_products FROM customers g LEFT JOIN orders o ON g.customer_id = o.customer_id LEFT JOIN order_items oi ON o.order_id = oi.order_id GROUP BY g.gender_code;	e_commerce
SELECT first_name, middle_initial, last_name, method_code FROM (SELECT customer_first_name AS first_name, customer_middle_initial AS middle_initial, customer_last_name AS last_name, customer_id FROM customers) AS cust LEFT JOIN (SELECT payment_method_code AS method_code, customer_id FROM customer_payment_methods) AS paym ON cust.customer_id = paym.customer_id	e_commerce
SELECT c1.customer_first_name, c1.customer_middle_initial, c1.customer_last_name, cp.payment_method_code FROM customers c1 LEFT JOIN customer_payment_methods cp ON c1.customer_id = cp.customer_id	e_commerce
SELECT T2.invoice_status_code, T2.invoice_date, T1.shipment_date FROM Shipments AS T1 LEFT JOIN Invoices AS T2 ON T1.invoice_number = T2.invoice_number	e_commerce
SELECT A.invoice_status_code, A.invoice_date, B.shipment_date FROM (SELECT invoice_number, invoice_status_code, invoice_date FROM invoices) A LEFT JOIN shipments B ON A.invoice_number = B.invoice_number	e_commerce
SELECT T1.product_name ,  T4.shipment_date FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id	e_commerce
SELECT T1.product_name ,  T4.shipment_date FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id	e_commerce
SELECT T1.order_item_status_code ,  T3.shipment_tracking_number FROM Order_items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id  =  T3.shipment_id	e_commerce
SELECT T1.order_item_status_code ,  T3.shipment_tracking_number FROM Order_items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id  =  T3.shipment_id	e_commerce
SELECT product_name, product_color FROM products WHERE product_id IN (SELECT product_id FROM order_items WHERE order_item_id IN (SELECT order_item_id FROM shipment_items))	e_commerce
SELECT product_name, product_color FROM products WHERE product_id IN (SELECT product_id FROM order_items WHERE order_item_id IN (SELECT order_item_id FROM shipment_items))	e_commerce
SELECT DISTINCT T1.product_name ,  T1.product_price ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id JOIN Customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  'Female'	e_commerce
SELECT DISTINCT T1.product_name ,  T1.product_price ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id JOIN Customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  'Female'	e_commerce
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN ( SELECT invoice_number FROM Shipments )	e_commerce
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN ( SELECT invoice_number FROM Shipments )	e_commerce
select t1.order_id ,  t1.date_order_placed ,  sum(t3.product_price) from orders as t1 join order_items as t2 on t1.order_id  =  t2.order_id join products as t3 on t2.product_id  =  t3.product_id group by t1.order_id	e_commerce
SELECT T1.order_id ,  T1.date_order_placed ,  sum(T3.product_price) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id JOIN Products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T1.order_id	e_commerce
SELECT count(DISTINCT customer_id) FROM Orders	e_commerce
SELECT count(DISTINCT customer_id) FROM Orders	e_commerce
SELECT count(DISTINCT order_item_status_code) FROM Order_items	e_commerce
SELECT count(DISTINCT order_item_status_code) FROM Order_items	e_commerce
SELECT count(DISTINCT Payment_method_code) FROM Customer_Payment_Methods	e_commerce
SELECT count(DISTINCT Payment_method_code) FROM Customer_Payment_Methods	e_commerce
SELECT login_name ,  login_password FROM Customers WHERE phone_number LIKE '+12%'	e_commerce
SELECT login_name ,  login_password FROM Customers WHERE phone_number LIKE '+12%'	e_commerce
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'	e_commerce
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'	e_commerce
SELECT product_price ,  product_size FROM Products WHERE product_price  >  ( SELECT avg(product_price) FROM Products )	e_commerce
SELECT product_price ,  product_size FROM Products WHERE product_price  >  ( SELECT avg(product_price) FROM Products )	e_commerce
SELECT count(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_items )	e_commerce
SELECT count(*) FROM Products WHERE product_id NOT IN ( SELECT product_id FROM Order_items )	e_commerce
SELECT count(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payment_Methods )	e_commerce
SELECT count(*) FROM Customers WHERE customer_id NOT IN ( SELECT customer_id FROM Customer_Payment_Methods )	e_commerce
SELECT order_status_code ,  date_order_placed FROM Orders	e_commerce
SELECT order_status_code ,  date_order_placed FROM Orders	e_commerce
SELECT address_line_1 ,  town_city ,  county FROM Customers WHERE Country  =  'USA'	e_commerce
SELECT address_line_1 ,  town_city ,  county FROM Customers WHERE Country  =  'USA'	e_commerce
SELECT c.customer_first_name AS buyer, p.product_name AS product FROM customers c CROSS JOIN products p WHERE EXISTS (SELECT 1 FROM orders o JOIN order_items oi ON o.order_id = oi.order_id WHERE o.customer_id = c.customer_id AND oi.product_id = p.product_id)	e_commerce
SELECT c.customer_first_name AS buyer, p.product_name AS product FROM customers c CROSS JOIN products p WHERE EXISTS (SELECT 1 FROM orders o JOIN order_items oi ON o.order_id = oi.order_id WHERE o.customer_id = c.customer_id AND oi.product_id = p.product_id)	e_commerce
SELECT count(*) FROM Shipment_Items	e_commerce
SELECT count(*) FROM Shipment_Items	e_commerce
SELECT avg(product_price) FROM Products	e_commerce
SELECT avg(product_price) FROM Products	e_commerce
SELECT AVG(product_price) FROM products p JOIN (SELECT DISTINCT product_id FROM order_items) pi ON p.product_id = pi.product_id	e_commerce
SELECT AVG(product_price) FROM products WHERE product_id IN (SELECT product_id FROM order_items)	e_commerce
SELECT email_address, town_city, county FROM customers WHERE customers.gender_code IN (SELECT gender_code FROM customers GROUP BY gender_code HAVING count(*) = (SELECT count(*) AS c FROM customers GROUP BY gender_code ORDER BY c limit 1))	e_commerce
SELECT email_address, town_city, county FROM customers WHERE customers.gender_code IN (SELECT gender_code FROM customers GROUP BY gender_code HAVING count(*) = (SELECT count(*) AS c FROM customers GROUP BY gender_code ORDER BY c limit 1))	e_commerce
SELECT date_order_placed FROM Orders WHERE customer_id IN ( SELECT T1.customer_id FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 )	e_commerce
SELECT date_order_placed FROM Orders WHERE customer_id IN ( SELECT T1.customer_id FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 )	e_commerce
SELECT order_status_code FROM orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MIN(count) FROM (SELECT COUNT(order_status_code) as count FROM orders GROUP BY order_status_code))	e_commerce
WITH OrderStatusCount AS (SELECT order_status_code, COUNT(*) AS OSCOUNT FROM orders GROUP BY order_status_code) SELECT order_status_code FROM OrderStatusCount WHERE OSCOUNT = (SELECT MIN(OSCOUNT) FROM OrderStatusCount)	e_commerce
SELECT T1.product_id ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3	e_commerce
SELECT T1.product_id ,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3	e_commerce
SELECT T1.invoice_date ,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2	e_commerce
SELECT T1.invoice_date ,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2	e_commerce
SELECT shipment_tracking_number ,  shipment_date FROM Shipments	e_commerce
SELECT shipment_tracking_number ,  shipment_date FROM Shipments	e_commerce
SELECT product_color ,  product_description ,  product_size FROM Products WHERE product_price  <  ( SELECT max(product_price) FROM products )	e_commerce
select product_color ,  product_description ,  product_size from products where product_price  !=  ( select max(product_price) from products )	e_commerce
SELECT name FROM director WHERE age  >  (SELECT avg(age) FROM director)	bbc_channels
SELECT name FROM director WHERE Age = (SELECT max(Age) From director)	bbc_channels
SELECT count(*) FROM channel WHERE internet LIKE "%bbc%"	bbc_channels
SELECT count(DISTINCT Digital_terrestrial_channel) FROM channel	bbc_channels
SELECT title FROM program ORDER BY start_year DESC	bbc_channels
SELECT name FROM director WHERE director_id in (SELECT director_id FROM program GROUP BY director_id HAVING COUNT(program_id) = (SELECT MAX(count_programs) FROM (SELECT COUNT(program_id) AS count_programs FROM program GROUP BY director_id)));	bbc_channels
SELECT name, age FROM director WHERE director_id IN (SELECT director_id FROM program GROUP BY director_id HAVING COUNT(program_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(program_id) AS cnt FROM program GROUP BY director_id)))	bbc_channels
SELECT title FROM program WHERE start_year = (SELECT MAX(start_year) FROM program);	bbc_channels
SELECT t1.name ,  t1.internet FROM channel AS t1 JOIN program AS t2 ON t1.channel_id  =  t2.channel_id GROUP BY t1.channel_id HAVING count(*)  >  1	bbc_channels
SELECT c.name, COUNT(p.program_id) AS program_count FROM channel AS c LEFT JOIN program AS p ON c.channel_id = p.channel_id GROUP BY c.channel_id	bbc_channels
SELECT count(*) FROM channel WHERE channel_id NOT IN (SELECT channel_id FROM program)	bbc_channels
SELECT name FROM director WHERE director_id IN (SELECT director_id FROM program WHERE title = 'Dracula')	bbc_channels
SELECT c.name, c.internet FROM channel c INNER JOIN (SELECT channel_id FROM director_admin GROUP BY channel_id HAVING COUNT(DISTINCT director_id) = (SELECT MAX(num_directors) FROM (SELECT COUNT(DISTINCT director_id) AS num_directors FROM director_admin GROUP BY channel_id))) da ON c.channel_id = da.channel_id	bbc_channels
SELECT name FROM director WHERE age BETWEEN 30 AND 60	bbc_channels
SELECT t1.name FROM channel AS t1 JOIN director_admin AS t2 ON t1.channel_id = t2.channel_id JOIN director AS t3 ON t2.director_id = t3.director_id WHERE t3.age < 40 INTERSECT SELECT t1.name FROM channel AS t1 JOIN director_admin AS t2 ON t1.channel_id = t2.channel_id JOIN director AS t3 ON t2.director_id = t3.director_id WHERE t3.age > 60	bbc_channels
SELECT ch.channel_id, ch.name FROM channel ch WHERE ch.channel_id NOT IN (SELECT da.channel_id FROM director_admin da JOIN director d ON da.director_id = d.director_id WHERE d.name = 'Hank Baskett')	bbc_channels
SELECT count(*) FROM radio	tv_shows
select transmitter from radio order by erp_kw asc	tv_shows
SELECT tv_show_name ,  Original_Airdate FROM tv_show	tv_shows
SELECT Station_name FROM city_channel WHERE Affiliation != "ABC"	tv_shows
SELECT Transmitter FROM radio WHERE ERP_kW  >  150 OR ERP_kW  <  30	tv_shows
SELECT transmitter FROM radio WHERE erp_kw = (SELECT MAX(erp_kw) FROM radio)	tv_shows
SELECT avg(ERP_kW) FROM radio	tv_shows
SELECT Affiliation ,  COUNT(*) FROM city_channel GROUP BY Affiliation	tv_shows
SELECT affiliation FROM city_channel GROUP BY affiliation HAVING COUNT(*) = (SELECT MAX(AffiliationCount) FROM (SELECT COUNT(*) AS AffiliationCount FROM city_channel GROUP BY affiliation))	tv_shows
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*)  >  3	tv_shows
SELECT City ,  Station_name FROM city_channel ORDER BY Station_name ASC	tv_shows
SELECT T3.Transmitter ,  T2.City FROM city_channel_radio AS T1 JOIN city_channel AS T2 ON T1.City_channel_ID  =  T2.ID JOIN radio AS T3 ON T1.Radio_ID  =  T3.Radio_ID	tv_shows
SELECT T3.Transmitter ,  T2.Station_name FROM city_channel_radio AS T1 JOIN city_channel AS T2 ON T1.City_channel_ID  =  T2.ID JOIN radio AS T3 ON T1.Radio_ID  =  T3.Radio_ID ORDER BY T3.ERP_kW DESC	tv_shows
SELECT r.transmitter, COUNT(distinct id) AS ChannelsCount FROM radio r LEFT JOIN city_channel_radio ccr ON r.radio_id = ccr.radio_id LEFT JOIN city_channel c ON c.id = ccr.city_channel_id GROUP BY r.radio_id	tv_shows
SELECT DISTINCT transmitter FROM radio WHERE radio_id NOT IN (SELECT radio_id FROM city_channel_radio)	tv_shows
SELECT model FROM vehicle WHERE power > 6000 AND top_speed = (SELECT MAX(top_speed) FROM vehicle WHERE power > 6000)	vehicle_driver
SELECT model FROM vehicle WHERE power > 6000 AND top_speed = (SELECT MAX(top_speed) FROM vehicle WHERE power > 6000)	vehicle_driver
SELECT name FROM driver WHERE citizenship  =  'United States'	vehicle_driver
SELECT name FROM driver WHERE citizenship  =  'United States'	vehicle_driver
SELECT A.driver_id, A.num_vehicles FROM (SELECT driver_id, COUNT(vehicle_id) as num_vehicles FROM vehicle_driver GROUP BY driver_id) A WHERE A.num_vehicles = (SELECT MAX(num_vehicles) FROM (SELECT COUNT(vehicle_id) AS num_vehicles FROM vehicle_driver GROUP BY driver_id))	vehicle_driver
SELECT A.driver_id, A.num_vehicles FROM (SELECT driver_id, COUNT(vehicle_id) as num_vehicles FROM vehicle_driver GROUP BY driver_id) A WHERE A.num_vehicles = (SELECT MAX(num_vehicles) FROM (SELECT COUNT(vehicle_id) AS num_vehicles FROM vehicle_driver GROUP BY driver_id))	vehicle_driver
SELECT max(power) ,  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'	vehicle_driver
SELECT max(power) ,  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'	vehicle_driver
SELECT vehicle_id FROM (SELECT vehicle_id, COUNT(driver_id) as frequency FROM vehicle_driver GROUP BY vehicle_id ORDER BY frequency ASC) WHERE frequency = (SELECT MIN(frequency) FROM (SELECT COUNT(driver_id) as frequency FROM vehicle_driver GROUP BY vehicle_id))	vehicle_driver
SELECT vehicle_id FROM (SELECT vehicle_id, COUNT(driver_id) as frequency FROM vehicle_driver GROUP BY vehicle_id ORDER BY frequency ASC) WHERE frequency = (SELECT MIN(frequency) FROM (SELECT COUNT(driver_id) as frequency FROM vehicle_driver GROUP BY vehicle_id))	vehicle_driver
SELECT top_speed ,  power FROM vehicle WHERE build_year  =  1996	vehicle_driver
SELECT top_speed ,  power FROM vehicle WHERE build_year  =  1996	vehicle_driver
SELECT build_year ,  model ,  builder FROM vehicle	vehicle_driver
SELECT build_year ,  model ,  builder FROM vehicle	vehicle_driver
SELECT count(DISTINCT T1.driver_id) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T2.build_year  =  2012	vehicle_driver
SELECT count(DISTINCT T1.driver_id) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T2.build_year  =  2012	vehicle_driver
SELECT count(*) FROM driver WHERE Racing_Series  =  'NASCAR'	vehicle_driver
SELECT count(*) FROM driver WHERE Racing_Series  =  'NASCAR'	vehicle_driver
SELECT avg(top_speed) FROM vehicle	vehicle_driver
SELECT avg(top_speed) FROM vehicle	vehicle_driver
select distinct t1.name from driver as t1 join vehicle_driver as t2 on t1.driver_id  =  t2.driver_id join vehicle as t3 on t2.vehicle_id  =  t3.vehicle_id where t3.power  >  5000	vehicle_driver
SELECT name FROM driver WHERE driver_id IN (SELECT driver_id FROM vehicle_driver WHERE vehicle_id IN (SELECT vehicle_id FROM vehicle WHERE power > 5000))	vehicle_driver
SELECT DISTINCT v.model FROM vehicle v WHERE (v.total_production > 100 OR v.top_speed > 150);	vehicle_driver
SELECT model FROM vehicle WHERE total_production  >  100 OR top_speed  >  150	vehicle_driver
SELECT model ,  build_year FROM vehicle WHERE model LIKE '%DJ%'	vehicle_driver
SELECT model ,  build_year FROM vehicle WHERE model LIKE '%DJ%'	vehicle_driver
SELECT model FROM vehicle EXCEPT SELECT T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id	vehicle_driver
SELECT model FROM vehicle WHERE vehicle_id NOT IN (SELECT vehicle_id FROM vehicle_driver)	vehicle_driver
SELECT DISTINCT v.vehicle_id, v.model FROM vehicle v WHERE v.builder = 'Ziyang' OR v.vehicle_id IN (SELECT vd.vehicle_id FROM vehicle_driver vd GROUP BY vd.vehicle_id HAVING COUNT(vd.driver_id) = 2)	vehicle_driver
SELECT DISTINCT v.vehicle_id, v.model FROM vehicle v WHERE v.builder = 'Ziyang' OR v.vehicle_id IN (SELECT vd.vehicle_id FROM vehicle_driver vd GROUP BY vd.vehicle_id HAVING COUNT(vd.driver_id) = 2)	vehicle_driver
SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id JOIN driver AS T3 ON T2.driver_id  =  T3.driver_id WHERE T3.name  =  'Jeff Gordon' UNION SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T2.vehicle_id HAVING count(*)  >  2	vehicle_driver
SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id JOIN driver AS T3 ON T2.driver_id  =  T3.driver_id WHERE T3.name  =  'Jeff Gordon' UNION SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T2.vehicle_id HAVING count(*)  >  2	vehicle_driver
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)	vehicle_driver
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)	vehicle_driver
SELECT name FROM driver ORDER BY name	vehicle_driver
SELECT name FROM driver ORDER BY name	vehicle_driver
SELECT count(*) ,  racing_series FROM driver GROUP BY racing_series	vehicle_driver
SELECT count(*) ,  racing_series FROM driver GROUP BY racing_series	vehicle_driver
SELECT name, citizenship FROM driver WHERE driver_id IN (SELECT driver_id FROM vehicle_driver WHERE vehicle_id IN (SELECT vehicle_id FROM vehicle WHERE model = 'DJ1'))	vehicle_driver
SELECT name, citizenship FROM driver WHERE driver_id IN (SELECT driver_id FROM vehicle_driver WHERE vehicle_id IN (SELECT vehicle_id FROM vehicle WHERE model = 'DJ1'))	vehicle_driver
SELECT count(*) FROM driver WHERE driver_id NOT IN ( SELECT driver_id FROM vehicle_driver )	vehicle_driver
SELECT count(*) FROM driver WHERE driver_id NOT IN ( SELECT driver_id FROM vehicle_driver )	vehicle_driver
SELECT count(*) FROM Exams	online_exams
SELECT count(*) FROM Exams	online_exams
select distinct subject_code from exams order by subject_code asc	online_exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code	online_exams
SELECT Exam_Date ,  Exam_Name FROM Exams WHERE Subject_Code != 'Database'	online_exams
SELECT Exam_Date ,  Exam_Name FROM Exams WHERE Subject_Code != 'Database'	online_exams
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC	online_exams
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC	online_exams
SELECT Type_of_Question_Code ,  COUNT(*) FROM Questions GROUP BY Type_of_Question_Code	online_exams
SELECT Type_of_Question_Code ,  COUNT(*) FROM Questions GROUP BY Type_of_Question_Code	online_exams
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"	online_exams
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"	online_exams
SELECT count(DISTINCT Comments) FROM Student_Answers	online_exams
SELECT count(DISTINCT Comments) FROM Student_Answers	online_exams
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC	online_exams
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC	online_exams
SELECT T2.First_Name ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID	online_exams
SELECT T2.First_Name ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID	online_exams
SELECT T2.Email_Adress ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC	online_exams
SELECT T2.Email_Adress ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC	online_exams
SELECT assessment FROM student_assessments GROUP BY assessment HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) AS cnt FROM student_assessments GROUP BY assessment))	online_exams
WITH AssessmentFrequency AS (SELECT assessment, COUNT(*) AS freq FROM student_assessments GROUP BY assessment) SELECT assessment FROM AssessmentFrequency WHERE freq = (SELECT MIN(freq) FROM AssessmentFrequency)	online_exams
SELECT T2.First_Name FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(*)  >=  2	online_exams
SELECT T2.First_Name FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(*)  >=  2	online_exams
SELECT Valid_Answer_Text FROM (SELECT Valid_Answer_Text, rank() over (ORDER BY COUNT(*) DESC) as rk FROM Valid_Answers GROUP BY Valid_Answer_Text) WHERE rk = 1	online_exams
SELECT Valid_Answer_Text FROM (SELECT Valid_Answer_Text, rank() over (ORDER BY COUNT(*) DESC) as rk FROM Valid_Answers GROUP BY Valid_Answer_Text) WHERE rk = 1	online_exams
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"	online_exams
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"	online_exams
SELECT Gender_MFU ,  COUNT(*) FROM Students GROUP BY Gender_MFU	online_exams
SELECT Gender_MFU ,  COUNT(*) FROM Students GROUP BY Gender_MFU	online_exams
SELECT Last_Name FROM Students WHERE Gender_MFU  =  "F" OR Gender_MFU  =  "M"	online_exams
SELECT Last_Name FROM Students WHERE Gender_MFU  =  "F" OR Gender_MFU  =  "M"	online_exams
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)	online_exams
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)	online_exams
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"	online_exams
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"	online_exams
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING count(*)  >=  3	online_exams
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING count(*)  >=  3	online_exams
SELECT * FROM Students	online_exams
SELECT * FROM Students	online_exams
SELECT count(*) FROM Addresses	customers_and_orders
SELECT count(*) FROM Addresses	customers_and_orders
SELECT address_id ,  address_details FROM Addresses	customers_and_orders
SELECT address_id ,  address_details FROM Addresses	customers_and_orders
SELECT count(*) FROM Products	customers_and_orders
SELECT count(*) FROM Products	customers_and_orders
SELECT product_id ,  product_type_code ,  product_name FROM Products	customers_and_orders
SELECT product_id ,  product_type_code ,  product_name FROM Products	customers_and_orders
SELECT product_price FROM Products WHERE product_name  =  "Monitor"	customers_and_orders
SELECT product_price FROM Products WHERE product_name  =  "Monitor"	customers_and_orders
SELECT min(product_price) ,  avg(product_price) ,  max(product_price) FROM Products	customers_and_orders
SELECT min(product_price) ,  avg(product_price) ,  max(product_price) FROM Products	customers_and_orders
SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Clothes"	customers_and_orders
SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Clothes"	customers_and_orders
SELECT count(*) FROM Products WHERE product_type_code  =  "Hardware"	customers_and_orders
SELECT count(*) FROM Products WHERE product_type_code  =  "Hardware"	customers_and_orders
SELECT product_name FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)	customers_and_orders
SELECT product_name FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Hardware")	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Hardware")	customers_and_orders
SELECT product_name FROM products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM products WHERE product_type_code = 'Clothes')	customers_and_orders
SELECT product_name FROM products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM products WHERE product_type_code = 'Clothes')	customers_and_orders
SELECT product_id, product_name FROM (SELECT product_id, product_name, RANK() OVER (ORDER BY product_price ASC) AS rnk FROM products WHERE product_type_code = 'Hardware') WHERE rnk = 1	customers_and_orders
SELECT p1.product_id, p1.product_name FROM products p1 WHERE p1.product_type_code = 'Hardware' AND p1.product_price = (SELECT MIN(product_price) FROM products p2 WHERE p2.product_type_code = 'Hardware')	customers_and_orders
SELECT product_name FROM Products ORDER BY product_price DESC	customers_and_orders
SELECT product_name FROM Products ORDER BY product_price DESC	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC	customers_and_orders
SELECT product_type_code ,  count(*) FROM Products GROUP BY product_type_code	customers_and_orders
SELECT product_type_code ,  count(*) FROM Products GROUP BY product_type_code	customers_and_orders
SELECT product_type_code ,  avg(product_price) FROM Products GROUP BY product_type_code	customers_and_orders
SELECT product_type_code ,  avg(product_price) FROM Products GROUP BY product_type_code	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*)  >=  2	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*)  >=  2	customers_and_orders
SELECT product_type_code FROM products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(product_id) AS cnt FROM products GROUP BY product_type_code))	customers_and_orders
SELECT product_type_code FROM products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(product_id) AS cnt FROM products GROUP BY product_type_code))	customers_and_orders
SELECT count(*) FROM Customers	customers_and_orders
SELECT count(*) FROM Customers	customers_and_orders
SELECT customer_id ,  customer_name FROM Customers	customers_and_orders
SELECT customer_id ,  customer_name FROM Customers	customers_and_orders
SELECT customer_address ,  customer_phone ,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"	customers_and_orders
SELECT customer_address ,  customer_phone ,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"	customers_and_orders
SELECT payment_method_code ,  count(*) FROM Customers GROUP BY payment_method_code	customers_and_orders
SELECT payment_method_code ,  count(*) FROM Customers GROUP BY payment_method_code	customers_and_orders
SELECT payment_method_code FROM customers GROUP BY payment_method_code HAVING COUNT(customer_id) = (SELECT MAX(customer_count) FROM (SELECT payment_method_code, COUNT(customer_id) AS customer_count FROM customers GROUP BY payment_method_code) sub)	customers_and_orders
SELECT payment_method_code FROM customers GROUP BY payment_method_code HAVING COUNT(payment_method_code) = (SELECT MAX(count) FROM (SELECT COUNT(payment_method_code) AS count FROM customers GROUP BY payment_method_code))	customers_and_orders
SELECT customer_name FROM customers WHERE payment_method_code IN (SELECT payment_method_code FROM customers GROUP BY payment_method_code HAVING COUNT(customer_id) = (SELECT MIN(count) FROM (SELECT COUNT(customer_id) AS count FROM customers GROUP BY payment_method_code)))	customers_and_orders
SELECT C.customer_name FROM customers C WHERE EXISTS (SELECT 1 FROM customers WHERE customers.payment_method_code = C.payment_method_code GROUP BY payment_method_code HAVING COUNT(*) = (SELECT COUNT(*) FROM customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1))	customers_and_orders
SELECT payment_method_code ,  customer_number FROM Customers WHERE customer_name  =  "Jeromy"	customers_and_orders
SELECT payment_method_code ,  customer_number FROM Customers WHERE customer_name  =  "Jeromy"	customers_and_orders
SELECT DISTINCT payment_method_code FROM Customers	customers_and_orders
SELECT DISTINCT payment_method_code FROM Customers	customers_and_orders
SELECT product_id ,  product_type_code FROM Products ORDER BY product_name	customers_and_orders
SELECT product_id ,  product_type_code FROM Products ORDER BY product_name	customers_and_orders
SELECT product_type_code FROM products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MIN(cnt) FROM (SELECT COUNT(product_id) as cnt FROM products GROUP BY product_type_code) t)	customers_and_orders
SELECT p.product_type_code FROM products p GROUP BY p.product_type_code HAVING COUNT(p.product_id) = (SELECT MIN(cnt) FROM (SELECT COUNT(p1.product_id) AS cnt FROM products p1 GROUP BY p1.product_type_code) sub)	customers_and_orders
SELECT count(*) FROM Customer_orders	customers_and_orders
SELECT count(*) FROM Customer_orders	customers_and_orders
SELECT order_id ,  order_date ,  order_status_code FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"	customers_and_orders
SELECT order_id ,  order_date ,  order_status_code FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"	customers_and_orders
SELECT customers.customer_name, customers.customer_id, COUNT(customer_orders.order_id) AS number_of_orders FROM customers LEFT JOIN customer_orders ON customers.customer_id = customer_orders.customer_id GROUP BY customers.customer_id, customers.customer_name	customers_and_orders
SELECT c.customer_name, c.customer_id, (SELECT COUNT(*) FROM customer_orders WHERE customer_id = c.customer_id) AS num_orders FROM customers c	customers_and_orders
SELECT DISTINCT customers.customer_id, customers.customer_name, customers.customer_phone, customers.customer_email FROM customers JOIN customer_orders ON customers.customer_id = customer_orders.customer_id GROUP BY customers.customer_id HAVING COUNT(customer_orders.order_id) = (SELECT MAX(OrderCount) FROM (SELECT COUNT(order_id) AS OrderCount FROM customer_orders GROUP BY customer_id) temp)	customers_and_orders
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM customers c INNER JOIN customer_orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id HAVING COUNT(co.order_id) = (SELECT MAX(order_count) FROM (SELECT COUNT(order_id) AS order_count FROM customer_orders GROUP BY customer_id) tmp)	customers_and_orders
SELECT order_status_code ,  count(*) FROM Customer_orders GROUP BY order_status_code	customers_and_orders
SELECT order_status_code ,  count(*) FROM Customer_orders GROUP BY order_status_code	customers_and_orders
SELECT order_status_code AS MostFrequentStatusCode FROM customer_orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MAX(cnt) FROM (SELECT order_status_code, COUNT(order_status_code) as cnt FROM customer_orders GROUP BY order_status_code))	customers_and_orders
WITH RankFrequency AS (SELECT order_status_code, RANK() OVER (ORDER BY COUNT(order_id) DESC) as rank FROM customer_orders GROUP BY order_status_code) SELECT order_status_code FROM RankFrequency WHERE rank = 1	customers_and_orders
SELECT count(*) FROM Customers WHERE customer_id NOT IN  ( SELECT customer_id FROM Customer_orders)	customers_and_orders
SELECT count(*) FROM Customers WHERE customer_id NOT IN  ( SELECT customer_id FROM Customer_orders)	customers_and_orders
SELECT p.product_name FROM products p WHERE p.product_id NOT IN (SELECT o.product_id FROM order_items o)	customers_and_orders
SELECT product_name FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)	customers_and_orders
SELECT COUNT(DISTINCT products.product_id) FROM products JOIN order_items ON products.product_id = order_items.product_id WHERE products.product_name = 'Monitor'	customers_and_orders
SELECT COUNT(DISTINCT products.product_id) FROM products JOIN order_items ON products.product_id = order_items.product_id WHERE products.product_name = 'Monitor'	customers_and_orders
SELECT count(DISTINCT T3.customer_id) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id JOIN Customer_orders AS T3 ON T3.order_id  =  T1.order_id WHERE T2.product_name  =  "Monitor"	customers_and_orders
SELECT count(DISTINCT T3.customer_id) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id JOIN Customer_orders AS T3 ON T3.order_id  =  T1.order_id WHERE T2.product_name  =  "Monitor"	customers_and_orders
SELECT count(DISTINCT customer_id) FROM Customer_orders	customers_and_orders
SELECT count(DISTINCT customer_id) FROM Customer_orders	customers_and_orders
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Customer_orders	customers_and_orders
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Customer_orders	customers_and_orders
SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 UNION SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  3;	customers_and_orders
SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 UNION SELECT T1.order_date ,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  3;	customers_and_orders
SELECT count(*) FROM building	region_building
SELECT count(*) FROM building	region_building
SELECT Name FROM building ORDER BY Number_of_Stories ASC	region_building
SELECT Name FROM building ORDER BY Number_of_Stories ASC	region_building
SELECT Address FROM building ORDER BY Completed_Year DESC	region_building
SELECT Address FROM building ORDER BY Completed_Year DESC	region_building
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != "1980"	region_building
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != "1980"	region_building
SELECT avg(Population) FROM region	region_building
SELECT avg(Population) FROM region	region_building
SELECT Name FROM region ORDER BY Name ASC	region_building
SELECT Name FROM region ORDER BY Name ASC	region_building
SELECT Capital FROM region WHERE Area  >  10000	region_building
SELECT Capital FROM region WHERE Area  >  10000	region_building
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1	region_building
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1	region_building
SELECT Name FROM region WHERE Area IS NOT NULL AND Area >= (SELECT min(T.Area) FROM (SELECT Area FROM region WHERE Area IS NOT NULL ORDER BY Area DESC LIMIT 5) T) ORDER BY Area DESC	region_building
SELECT Name FROM region WHERE Area IS NOT NULL AND Area >= (SELECT min(T.Area) FROM (SELECT Area FROM region WHERE Area IS NOT NULL ORDER BY Area DESC LIMIT 5) T) ORDER BY Area DESC	region_building
SELECT T1.Name ,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID	region_building
SELECT T1.Name ,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID	region_building
SELECT T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID HAVING COUNT(*)  >  1	region_building
SELECT T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID HAVING COUNT(*)  >  1	region_building
SELECT capital FROM region WHERE region_id IN (SELECT region_id FROM building GROUP BY region_id HAVING COUNT(building_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(building_id) AS cnt FROM building GROUP BY region_id)))	region_building
SELECT capital FROM region WHERE region_id IN (SELECT region_id FROM building GROUP BY region_id HAVING COUNT(building_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(building_id) AS cnt FROM building GROUP BY region_id)))	region_building
SELECT T1.Address ,  T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID	region_building
SELECT building.address, region.name FROM building JOIN region ON building.region_id = region.region_id	region_building
SELECT T1.Number_of_Stories FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"	region_building
SELECT T1.Number_of_Stories FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"	region_building
SELECT Completed_Year ,  COUNT(*) FROM building GROUP BY Completed_Year	region_building
SELECT Completed_Year ,  COUNT(*) FROM building GROUP BY Completed_Year	region_building
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING COUNT(*) = (SELECT COUNT(*) FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1)	region_building
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING COUNT(*) = (SELECT COUNT(*) FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1)	region_building
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)	region_building
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)	region_building
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15	region_building
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15	region_building
SELECT DISTINCT Address FROM building	region_building
SELECT DISTINCT Address FROM building	region_building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC	region_building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC	region_building
select channel_details from channels order by channel_details	government_shift
select channel_details from channels order by channel_details	government_shift
SELECT count(*) FROM services	government_shift
SELECT count(*) FROM services	government_shift
SELECT analytical_layer_type_code FROM analytical_layer GROUP BY analytical_layer_type_code HAVING COUNT(analytical_layer_type_code) = (SELECT MAX(count_type) FROM (SELECT COUNT(analytical_layer_type_code) AS count_type FROM analytical_layer GROUP BY analytical_layer_type_code))	government_shift
WITH TypeFrequency AS (SELECT analytical_layer_type_code, COUNT(*) AS Count FROM analytical_layer GROUP BY analytical_layer_type_code) SELECT analytical_layer_type_code FROM TypeFrequency WHERE Count = (SELECT MAX(Count) FROM TypeFrequency)	government_shift
SELECT service_details FROM services WHERE EXISTS (SELECT * FROM customers INNER JOIN customers_and_services ON customers.customer_id = customers_and_services.customer_id WHERE customers.customer_details = 'Hardy Kutch' AND services.service_id = customers_and_services.service_id)	government_shift
SELECT service_details FROM services WHERE service_id IN (SELECT service_id FROM customers_and_services WHERE customer_id IN (SELECT customer_id FROM customers WHERE customer_details = 'Hardy Kutch'))	government_shift
SELECT s.service_details FROM services s WHERE s.service_id IN (SELECT cas.service_id FROM customers_and_services cas GROUP BY cas.service_id HAVING COUNT(cas.customers_and_services_id) > 3)	government_shift
SELECT s.service_details FROM services s WHERE s.service_id IN (SELECT cas.service_id FROM customers_and_services cas GROUP BY cas.service_id HAVING COUNT(cas.customers_and_services_id) > 3)	government_shift
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM customers_and_services GROUP BY customer_id HAVING COUNT(service_id) = (SELECT MAX(service_count) FROM (SELECT customer_id, COUNT(service_id) AS service_count FROM customers_and_services GROUP BY customer_id)))	government_shift
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM customers_and_services GROUP BY customer_id HAVING COUNT(service_id) = (SELECT MAX(service_count) FROM (SELECT customer_id, COUNT(service_id) AS service_count FROM customers_and_services GROUP BY customer_id)))	government_shift
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM customers_and_services GROUP BY customer_id HAVING COUNT(DISTINCT service_id) = (SELECT MAX(CountServices) FROM (SELECT COUNT(DISTINCT service_id) AS CountServices FROM customers_and_services GROUP BY customer_id)))	government_shift
SELECT cu.customer_details FROM customers cu WHERE cu.customer_id IN (SELECT ca.customer_id FROM customers_and_services ca GROUP BY ca.customer_id HAVING COUNT(DISTINCT ca.service_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(DISTINCT service_id) cnt FROM customers_and_services GROUP BY customer_id)))	government_shift
select customer_details from customers where customer_id not in (select customer_id from customers_and_services)	government_shift
select customer_details from customers where customer_id not in (select customer_id from customers_and_services)	government_shift
SELECT customer_details FROM customers WHERE customer_id IN (SELECT Customer_ID FROM customers_and_services WHERE service_id IN (SELECT service_id FROM customers_and_services GROUP BY service_id HAVING (COUNT(*)) = (SELECT COUNT(*) FROM customers_and_services GROUP BY service_id ORDER BY COUNT(*) ASC LIMIT 1)))	government_shift
SELECT DISTINCT c.customer_details FROM customers c INNER JOIN customers_and_services cas ON c.customer_id = cas.customer_id WHERE cas.service_id IN (SELECT s.service_id FROM services s WHERE s.service_id IN (SELECT service_id FROM customers_and_services GROUP BY service_id HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) count FROM customers_and_services GROUP BY service_id) tmp)))	government_shift
SELECT count(DISTINCT customers_and_services_details) FROM customers_and_services	government_shift
SELECT count(DISTINCT customers_and_services_details) FROM customers_and_services	government_shift
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"	government_shift
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"	government_shift
SELECT service_details FROM services WHERE EXISTS (SELECT 1 FROM customers_and_services, customers WHERE services.service_id = customers_and_services.service_id AND customers_and_services.customer_id = customers.customer_id AND customers.customer_details = 'Hardy Kutch') OR EXISTS (SELECT 1 FROM customer_interactions WHERE services.service_id = customer_interactions.service_id AND customer_interactions.services_and_channels_details = 'good')	government_shift
SELECT service_details FROM services WHERE EXISTS (SELECT 1 FROM customers_and_services, customers WHERE services.service_id = customers_and_services.service_id AND customers_and_services.customer_id = customers.customer_id AND customers.customer_details = 'Hardy Kutch') OR EXISTS (SELECT 1 FROM customer_interactions WHERE services.service_id = customer_interactions.service_id AND customer_interactions.services_and_channels_details = 'good')	government_shift
SELECT service_details FROM services WHERE EXISTS (SELECT 1 FROM customers_and_services, customers WHERE services.service_id = customers_and_services.service_id AND customers_and_services.customer_id = customers.customer_id AND customers.customer_details = 'Hardy Kutch') AND EXISTS (SELECT 1 FROM customer_interactions WHERE services.service_id = customer_interactions.service_id AND customer_interactions.services_and_channels_details = 'bad')	government_shift
SELECT service_details FROM services WHERE EXISTS (SELECT 1 FROM customers_and_services, customers WHERE services.service_id = customers_and_services.service_id AND customers_and_services.customer_id = customers.customer_id AND customers.customer_details = 'Hardy Kutch') AND EXISTS (SELECT 1 FROM customer_interactions WHERE services.service_id = customer_interactions.service_id AND customer_interactions.services_and_channels_details = 'bad')	government_shift
SELECT S.service_details FROM services S WHERE EXISTS (SELECT 1 FROM customer_interactions CI JOIN channels C ON CI.channel_id = C.channel_id WHERE CI.service_id = S.service_id AND C.channel_details = '15 ij')	government_shift
SELECT S.service_details FROM services S WHERE EXISTS (SELECT 1 FROM customer_interactions CI JOIN channels C ON CI.channel_id = C.channel_id WHERE CI.service_id = S.service_id AND C.channel_details = '15 ij')	government_shift
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM customer_interactions WHERE status_code = 'stuck' AND services_and_channels_details = 'bad')	government_shift
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM customer_interactions WHERE status_code = 'Stuck' AND services_and_channels_details = 'bad')	government_shift
SELECT count(*) FROM integration_platform WHERE integration_platform_details  =  "Success"	government_shift
SELECT count(*) FROM integration_platform WHERE integration_platform_details  LIKE  "%Success%"	government_shift
SELECT customer_details FROM customers WHERE EXISTS (SELECT 1 FROM customer_interactions CI JOIN integration_platform IP ON CI.customer_interaction_id = IP.customer_interaction_id WHERE CI.customer_id = customers.customer_id AND IP.integration_platform_details = 'Fail')	government_shift
SELECT customer_details FROM customers WHERE EXISTS (SELECT 1 FROM customer_interactions CI JOIN integration_platform IP ON CI.customer_interaction_id = IP.customer_interaction_id WHERE CI.customer_id = customers.customer_id AND IP.integration_platform_details = 'Fail')	government_shift
SELECT service_details FROM services s LEFT JOIN customers_and_services cs ON s.service_id = cs.service_id WHERE cs.service_id IS NULL	government_shift
SELECT service_details FROM services WHERE service_id NOT IN (SELECT service_id FROM customers_and_services)	government_shift
SELECT analytical_layer_type_code ,  count(*) FROM analytical_layer GROUP BY analytical_layer_type_code	government_shift
SELECT analytical_layer_type_code ,  count(*) FROM analytical_layer GROUP BY analytical_layer_type_code	government_shift
SELECT service_details FROM services WHERE service_id IN (SELECT service_id FROM customers_and_services WHERE customers_and_services_details = 'unsatisfied')	government_shift
SELECT service_details FROM services WHERE service_id IN (SELECT service_id FROM customers_and_services WHERE customers_and_services_details = 'unsatisfied')	government_shift
SELECT count(*) FROM vehicles	vehicle_rent
SELECT count(*) FROM vehicles	vehicle_rent
SELECT name FROM vehicles ORDER BY model_year DESC	vehicle_rent
SELECT name FROM vehicles ORDER BY model_year DESC	vehicle_rent
SELECT DISTINCT type_of_powertrain FROM vehicles	vehicle_rent
SELECT DISTINCT type_of_powertrain FROM vehicles	vehicle_rent
SELECT name ,  type_of_powertrain ,  annual_fuel_cost FROM vehicles WHERE model_year  =  2013 OR model_year  =  2014	vehicle_rent
SELECT name ,  type_of_powertrain ,  annual_fuel_cost FROM vehicles WHERE model_year  =  2013 OR model_year  =  2014	vehicle_rent
SELECT type_of_powertrain FROM vehicles WHERE model_year  =  2014 INTERSECT SELECT type_of_powertrain FROM vehicles WHERE model_year  =  2013	vehicle_rent
SELECT type_of_powertrain FROM vehicles WHERE model_year  =  2014 INTERSECT SELECT type_of_powertrain FROM vehicles WHERE model_year  =  2013	vehicle_rent
SELECT type_of_powertrain ,  count(*) FROM vehicles GROUP BY type_of_powertrain	vehicle_rent
SELECT type_of_powertrain ,  count(*) FROM vehicles GROUP BY type_of_powertrain	vehicle_rent
SELECT type_of_powertrain FROM vehicles GROUP BY type_of_powertrain HAVING COUNT(id) = (SELECT MAX(count) FROM (SELECT COUNT(id) count FROM vehicles GROUP BY type_of_powertrain))	vehicle_rent
SELECT type_of_powertrain FROM vehicles GROUP BY type_of_powertrain HAVING COUNT(type_of_powertrain) = (SELECT MAX(cnt) FROM (SELECT COUNT(type_of_powertrain) AS cnt FROM vehicles GROUP BY type_of_powertrain))	vehicle_rent
SELECT min(annual_fuel_cost) ,  max(annual_fuel_cost) ,  avg(annual_fuel_cost) FROM vehicles	vehicle_rent
SELECT min(annual_fuel_cost) ,  max(annual_fuel_cost) ,  avg(annual_fuel_cost) FROM vehicles	vehicle_rent
SELECT name ,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate	vehicle_rent
SELECT name ,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate	vehicle_rent
SELECT type_of_powertrain ,  avg(annual_fuel_cost) FROM vehicles GROUP BY type_of_powertrain HAVING count(*)  >=  2	vehicle_rent
SELECT type_of_powertrain ,  avg(annual_fuel_cost) FROM vehicles GROUP BY type_of_powertrain HAVING count(*)  >=  2	vehicle_rent
SELECT name ,  age ,  membership_credit FROM customers	vehicle_rent
SELECT name ,  age ,  membership_credit FROM customers	vehicle_rent
SELECT name, age FROM customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM customers)	vehicle_rent
SELECT name, age FROM customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM customers)	vehicle_rent
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)	vehicle_rent
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)	vehicle_rent
SELECT * FROM discount	vehicle_rent
SELECT * FROM discount	vehicle_rent
SELECT T2.name ,  sum(T1.total_hours) FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T2.id	vehicle_rent
SELECT T2.name ,  sum(T1.total_hours) FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T2.id	vehicle_rent
SELECT name FROM vehicles WHERE id NOT IN (SELECT vehicles_id FROM renting_history)	vehicle_rent
SELECT name FROM vehicles WHERE id NOT IN (SELECT vehicles_id FROM renting_history)	vehicle_rent
SELECT T2.name FROM renting_history AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.id GROUP BY T2.id HAVING count(*)  >=  2	vehicle_rent
SELECT T2.name FROM renting_history AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.id GROUP BY T2.id HAVING count(*)  >=  2	vehicle_rent
SELECT name, model_year FROM vehicles WHERE id IN (SELECT vehicles_id FROM renting_history GROUP BY vehicles_id HAVING COUNT(id) = (SELECT MAX(cnt) FROM (SELECT COUNT(id) AS cnt FROM renting_history GROUP BY vehicles_id)))	vehicle_rent
SELECT v.name, v.model_year FROM vehicles v WHERE v.id IN (SELECT vehicles_id FROM renting_history GROUP BY vehicles_id HAVING COUNT(vehicles_id) = (SELECT MAX(ccount) FROM (SELECT COUNT(vehicles_id) AS ccount FROM renting_history GROUP BY vehicles_id)))	vehicle_rent
SELECT T2.name FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T2.id ORDER BY sum(T1.total_hours) DESC	vehicle_rent
SELECT T2.name FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T2.id ORDER BY sum(T1.total_hours) DESC	vehicle_rent
SELECT d.name FROM discount d, renting_history rh WHERE d.id = rh.discount_id GROUP BY d.id HAVING COUNT(rh.discount_id) = (SELECT MAX(COUNTed) FROM (SELECT discount_id, COUNT(*) AS COUNTed FROM renting_history GROUP BY discount_id) count_max)	vehicle_rent
SELECT d.name FROM discount d, renting_history rh WHERE d.id = rh.discount_id GROUP BY d.id HAVING COUNT(rh.discount_id) = (SELECT MAX(COUNTed) FROM (SELECT discount_id, COUNT(*) AS COUNTed FROM renting_history GROUP BY discount_id) count_max)	vehicle_rent
SELECT T2.name ,  T2.Type_of_powertrain FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id HAVING sum(T1.total_hours)  >  30	vehicle_rent
SELECT T2.name ,  T2.Type_of_powertrain FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id HAVING sum(T1.total_hours)  >  30	vehicle_rent
SELECT avg(City_fuel_economy_rate) ,  avg(Highway_fuel_economy_rate) , Type_of_powertrain FROM vehicles GROUP BY Type_of_powertrain	vehicle_rent
SELECT avg(City_fuel_economy_rate) ,  avg(Highway_fuel_economy_rate) , Type_of_powertrain FROM vehicles GROUP BY Type_of_powertrain	vehicle_rent
SELECT avg(amount_of_loan) FROM Student_Loans	cre_Students_Information_Systems
SELECT avg(amount_of_loan) FROM Student_Loans	cre_Students_Information_Systems
SELECT s.student_id, s.bio_data FROM students s WHERE (SELECT COUNT(*) FROM classes c WHERE c.student_id = s.student_id) >= 2 OR (SELECT COUNT(*) FROM detention d WHERE d.student_id = s.student_id) < 2	cre_Students_Information_Systems
SELECT s.student_id, s.bio_data FROM students s WHERE (SELECT COUNT(*) FROM classes c WHERE c.student_id = s.student_id) >= 2 OR (SELECT COUNT(*) FROM detention d WHERE d.student_id = s.student_id) < 2	cre_Students_Information_Systems
SELECT teacher_details FROM teachers WHERE teacher_id IN (SELECT c.teacher_id FROM classes c WHERE c.class_details LIKE '%data%') AND teacher_id NOT IN (SELECT c.teacher_id FROM classes c WHERE c.class_details LIKE 'net%') GROUP BY teacher_id	cre_Students_Information_Systems
SELECT t.teacher_details FROM teachers t WHERE EXISTS (SELECT 1 FROM classes c WHERE c.teacher_id = t.teacher_id AND c.class_details LIKE '%data%') AND NOT EXISTS (SELECT 1 FROM classes c2 WHERE c2.teacher_id = t.teacher_id AND c2.class_details LIKE 'net%')	cre_Students_Information_Systems
select bio_data from students where student_id not in (select t1.student_id from students as t1 join detention as t2 on t1.student_id  =  t2.student_id union select t1.student_id from students as t1 join student_loans as t2 on t1.student_id  =  t2.student_id)	cre_Students_Information_Systems
select bio_data from students where student_id not in (select t1.student_id from students as t1 join detention as t2 on t1.student_id  =  t2.student_id union select t1.student_id from students as t1 join student_loans as t2 on t1.student_id  =  t2.student_id)	cre_Students_Information_Systems
SELECT amount_of_loan ,  date_of_loan FROM Student_Loans WHERE student_id IN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING count(*)  >=  2 )	cre_Students_Information_Systems
SELECT amount_of_loan ,  date_of_loan FROM Student_Loans WHERE student_id IN ( SELECT student_id FROM Achievements GROUP BY student_id HAVING count(*)  >=  2 )	cre_Students_Information_Systems
SELECT teacher_details, teacher_id FROM teachers WHERE teacher_id IN (SELECT teacher_id FROM classes GROUP BY teacher_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM classes GROUP BY teacher_id)))	cre_Students_Information_Systems
SELECT t.teacher_details, t.teacher_id FROM classes c JOIN teachers t ON c.teacher_id = t.teacher_id GROUP BY c.teacher_id HAVING COUNT(c.class_id) = (SELECT MAX(total_classes) FROM (SELECT teacher_id, COUNT(class_id) AS total_classes FROM classes GROUP BY teacher_id) sub)	cre_Students_Information_Systems
SELECT distinct(T1.detention_type_description) FROM Ref_Detention_Type AS T1 JOIN Detention AS T2 ON T1.detention_type_code  =  T2.detention_type_code	cre_Students_Information_Systems
SELECT distinct(T1.detention_type_description) FROM Ref_Detention_Type AS T1 JOIN Detention AS T2 ON T1.detention_type_code  =  T2.detention_type_code	cre_Students_Information_Systems
SELECT T1.student_details ,  T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Address_Types AS T3 ON T2.address_type_code  =  T3.address_type_code	cre_Students_Information_Systems
SELECT T1.student_details ,  T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Address_Types AS T3 ON T2.address_type_code  =  T3.address_type_code	cre_Students_Information_Systems
SELECT T1.address_details ,  T3.bio_data FROM Addresses AS T1 JOIN Students_Addresses AS T2 ON T1.address_id  =  T2.address_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id	cre_Students_Information_Systems
SELECT T1.address_details ,  T3.bio_data FROM Addresses AS T1 JOIN Students_Addresses AS T2 ON T1.address_id  =  T2.address_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id	cre_Students_Information_Systems
SELECT students.bio_data AS BioData, transcripts.date_of_transcript AS IssuanceDate FROM students LEFT JOIN transcripts ON students.student_id = transcripts.student_id	cre_Students_Information_Systems
SELECT students.bio_data AS BioData, transcripts.date_of_transcript AS IssuanceDate FROM students LEFT JOIN transcripts ON students.student_id = transcripts.student_id	cre_Students_Information_Systems
SELECT count(DISTINCT student_id), behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING count(*) = (SELECT count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1)	cre_Students_Information_Systems
SELECT count(*), behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING count(*) = (SELECT count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1)	cre_Students_Information_Systems
SELECT T1.bio_data, T1.student_details FROM Students AS T1 WHERE T1.student_id IN (SELECT T2.student_id FROM Behaviour_Monitoring AS T2 WHERE T2.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING (count(*)) = (SELECT count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1)) AND T2.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING count(*) = 3))	cre_Students_Information_Systems
SELECT T1.bio_data, T1.student_details FROM Students AS T1 WHERE T1.student_id IN (SELECT T2.student_id FROM Behaviour_Monitoring AS T2 WHERE T2.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING (count(*)) = (SELECT count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1)) AND T2.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING count(*) = 3))	cre_Students_Information_Systems
SELECT s.bio_data FROM students s WHERE s.student_id IN (SELECT student_id FROM behaviour_monitoring GROUP BY student_id, behaviour_monitoring_details HAVING COUNT(*) = (SELECT COUNT(*) FROM behaviour_monitoring bm2 GROUP BY bm2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))	cre_Students_Information_Systems
SELECT T1.bio_data FROM Students AS T1 WHERE T1.student_id IN (SELECT T2.student_id FROM Behaviour_Monitoring AS T2 WHERE T2.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING (count(*)) = (SELECT count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1)))	cre_Students_Information_Systems
SELECT T1.bio_data ,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id	cre_Students_Information_Systems
SELECT T1.bio_data ,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id	cre_Students_Information_Systems
SELECT COUNT(DISTINCT student_id), E.event_type_code, R.event_type_description FROM student_events E JOIN ref_event_types R ON E.event_type_code = R.event_type_code WHERE E.event_type_code IN (SELECT event_type_code FROM student_events GROUP BY event_type_code HAVING COUNT(*) = (SELECT COUNT(*) FROM student_events GROUP BY event_type_code ORDER BY COUNT(*) DESC LIMIT 1)) GROUP BY E.event_type_code, R.event_type_description	cre_Students_Information_Systems
SELECT COUNT(DISTINCT student_id), E.event_type_code, R.event_type_description FROM student_events E JOIN ref_event_types R ON E.event_type_code = R.event_type_code WHERE E.event_type_code IN (SELECT event_type_code FROM student_events GROUP BY event_type_code HAVING COUNT(DISTINCT student_id) = (SELECT COUNT(DISTINCT student_id) FROM student_events GROUP BY event_type_code ORDER BY COUNT(*) DESC LIMIT 1)) GROUP BY E.event_type_code, R.event_type_description	cre_Students_Information_Systems
SELECT T1.achievement_details ,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code	cre_Students_Information_Systems
SELECT T1.achievement_details ,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code	cre_Students_Information_Systems
SELECT count(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.student_id NOT IN ( SELECT student_id FROM Achievements )	cre_Students_Information_Systems
SELECT count(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.student_id NOT IN ( SELECT student_id FROM Achievements )	cre_Students_Information_Systems
SELECT date_of_transcript ,  transcript_details FROM Transcripts	cre_Students_Information_Systems
SELECT date_of_transcript ,  transcript_details FROM Transcripts	cre_Students_Information_Systems
SELECT achievement_type_code ,  achievement_details ,  date_achievement FROM Achievements	cre_Students_Information_Systems
SELECT achievement_type_code ,  achievement_details ,  date_achievement FROM Achievements	cre_Students_Information_Systems
SELECT datetime_detention_start ,  datetime_detention_end FROM Detention	cre_Students_Information_Systems
SELECT datetime_detention_start ,  datetime_detention_end FROM Detention	cre_Students_Information_Systems
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'	cre_Students_Information_Systems
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'	cre_Students_Information_Systems
SELECT T1.teacher_details ,  T3.student_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id	cre_Students_Information_Systems
SELECT T1.teacher_details ,  T3.student_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id	cre_Students_Information_Systems
WITH CourseCounts AS (SELECT teacher_id, COUNT(DISTINCT class_id) AS num_courses FROM classes GROUP BY teacher_id) SELECT teacher_id, num_courses FROM CourseCounts WHERE num_courses = (SELECT MAX(num_courses) FROM CourseCounts);	cre_Students_Information_Systems
WITH CourseCounts AS (SELECT teacher_id, COUNT(DISTINCT class_id) AS num_courses FROM classes GROUP BY teacher_id) SELECT teacher_id, num_courses FROM CourseCounts WHERE num_courses = (SELECT MAX(num_courses) FROM CourseCounts);	cre_Students_Information_Systems
SELECT c.student_id, COUNT(*) as tot_courses FROM classes c GROUP BY c.student_id HAVING tot_courses = (SELECT MAX(count_classes) FROM (SELECT COUNT(class_id) as count_classes FROM classes GROUP BY student_id))	cre_Students_Information_Systems
SELECT c.student_id, COUNT(*) as tot_courses FROM classes c GROUP BY c.student_id HAVING tot_courses = (SELECT MAX(count_classes) FROM (SELECT COUNT(class_id) as count_classes FROM classes GROUP BY student_id))	cre_Students_Information_Systems
SELECT T1.student_id ,  T1.student_details FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2	cre_Students_Information_Systems
SELECT T1.student_id ,  T1.student_details FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2	cre_Students_Information_Systems
WITH DetentionCounts AS (SELECT detention_type_code, COUNT(*) AS Cnt FROM detention GROUP BY detention_type_code) SELECT ref_detention_type.detention_type_code, detention_type_description FROM ref_detention_type JOIN DetentionCounts ON DetentionCounts.detention_type_code = ref_detention_type.detention_type_code WHERE DetentionCounts.Cnt = (SELECT MIN(Cnt) FROM DetentionCounts)	cre_Students_Information_Systems
WITH RankedDetType AS (SELECT detention_type_code, RANK() OVER (ORDER BY COUNT(*) ASC) AS rk FROM detention GROUP BY detention_type_code) SELECT dt.detention_type_code, dt.detention_type_description FROM RankedDetType rdt INNER JOIN ref_detention_type dt ON dt.detention_type_code = rdt.detention_type_code WHERE rk = 1	cre_Students_Information_Systems
SELECT s.bio_data, s.student_details FROM students s WHERE s.student_id IN (SELECT sl.student_id FROM student_loans sl WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM student_loans))	cre_Students_Information_Systems
SELECT s.bio_data, s.student_details FROM students s WHERE s.student_id IN (SELECT sl.student_id FROM student_loans sl WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM student_loans))	cre_Students_Information_Systems
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1	cre_Students_Information_Systems
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1	cre_Students_Information_Systems
SELECT T1.bio_data FROM Students AS T1 WHERE T1.student_id IN (SELECT T2.student_id FROM Student_Loans AS T2 WHERE T2.amount_of_loan = (SELECT min(amount_of_loan) FROM Student_Loans))	cre_Students_Information_Systems
SELECT T1.bio_data FROM Students AS T1 WHERE T1.student_id IN (SELECT T2.student_id FROM Student_Loans AS T2 WHERE T2.amount_of_loan = (SELECT min(amount_of_loan) FROM Student_Loans))	cre_Students_Information_Systems
SELECT date_of_transcript FROM transcripts WHERE student_id IN (SELECT student_id FROM student_loans WHERE amount_of_loan = (SELECT MAX(amount_of_loan) FROM student_loans));	cre_Students_Information_Systems
SELECT date_of_transcript FROM transcripts WHERE student_id IN (SELECT student_id FROM student_loans WHERE amount_of_loan = (SELECT MAX(amount_of_loan) FROM student_loans));	cre_Students_Information_Systems
SELECT T.teacher_details FROM teachers T WHERE EXISTS (SELECT 1 FROM classes C WHERE C.teacher_id = T.teacher_id AND C.student_id IN (SELECT student_id FROM transcripts WHERE date_of_transcript = (SELECT MIN(date_of_transcript) FROM transcripts)))	cre_Students_Information_Systems
SELECT T.teacher_details FROM teachers T WHERE EXISTS (SELECT 1 FROM classes C WHERE C.teacher_id = T.teacher_id AND C.student_id IN (SELECT student_id FROM transcripts WHERE date_of_transcript = (SELECT MIN(date_of_transcript) FROM transcripts)))	cre_Students_Information_Systems
SELECT students.student_id, (SELECT SUM(sl.amount_of_loan) FROM student_loans sl WHERE sl.student_id = students.student_id) FROM students GROUP BY students.student_id	cre_Students_Information_Systems
SELECT students.student_id, (SELECT SUM(sl.amount_of_loan) FROM student_loans sl WHERE sl.student_id = students.student_id) FROM students GROUP BY students.student_id	cre_Students_Information_Systems
SELECT student_id, bio_data, (SELECT COUNT(*) FROM classes WHERE student_id = students.student_id) AS course_count FROM students	cre_Students_Information_Systems
SELECT s.student_id, s.bio_data, (SELECT COUNT(*) FROM classes WHERE classes.student_id = s.student_id) AS num_courses FROM students s	cre_Students_Information_Systems
SELECT count(DISTINCT student_id) FROM Detention	cre_Students_Information_Systems
SELECT count(DISTINCT student_id) FROM Detention	cre_Students_Information_Systems
SELECT r.address_type_code, r.address_type_description FROM ref_address_types r WHERE address_type_code IN (SELECT address_type_code FROM students_addresses GROUP BY address_type_code HAVING COUNT(*) = (SELECT MAX(counts) FROM (SELECT COUNT(*) as counts FROM students_addresses GROUP BY address_type_code)))	cre_Students_Information_Systems
SELECT r.address_type_code, r.address_type_description FROM ref_address_types r WHERE address_type_code IN (SELECT address_type_code FROM students_addresses GROUP BY address_type_code HAVING COUNT(*) = (SELECT MAX(counts) FROM (SELECT COUNT(*) as counts FROM students_addresses GROUP BY address_type_code)))	cre_Students_Information_Systems
SELECT s.bio_data FROM students s WHERE s.student_id IN (SELECT student_id FROM student_events) AND s.student_id NOT IN (SELECT student_id FROM student_loans)	cre_Students_Information_Systems
SELECT s.bio_data FROM students s WHERE s.student_id IN (SELECT student_id FROM student_events) AND s.student_id NOT IN (SELECT student_id FROM student_loans)	cre_Students_Information_Systems
SELECT date_from ,  date_to FROM Students_Addresses WHERE student_id IN ( SELECT student_id FROM Transcripts GROUP BY student_id HAVING count(*)  =  2 )	cre_Students_Information_Systems
SELECT date_from ,  date_to FROM Students_Addresses WHERE student_id IN ( SELECT student_id FROM Transcripts GROUP BY student_id HAVING count(*)  =  2 )	cre_Students_Information_Systems
SELECT datetime_detention_start FROM Detention	cre_Students_Information_Systems
SELECT datetime_detention_start FROM Detention	cre_Students_Information_Systems
SELECT name FROM Author	book_1
SELECT name FROM Author	book_1
SELECT name ,  address FROM Client	book_1
SELECT name ,  address FROM Client	book_1
SELECT title ,  isbn ,  SalePrice FROM Book	book_1
SELECT title ,  isbn ,  SalePrice FROM Book	book_1
SELECT count(*) FROM Book	book_1
SELECT count(*) FROM Book	book_1
SELECT count(*) FROM Author	book_1
SELECT count(*) FROM Author	book_1
SELECT count(*) FROM Client	book_1
SELECT count(*) FROM Client	book_1
SELECT name ,  address FROM Client ORDER BY name	book_1
SELECT name ,  address FROM Client ORDER BY name	book_1
SELECT T3.title ,  T1.name FROM Author AS T1 JOIN Author_Book AS T2 ON T2.Author  =  T1.idAuthor JOIN Book AS T3 ON T2.isbn  =  T3.isbn	book_1
SELECT T3.title ,  T1.name FROM Author AS T1 JOIN Author_Book AS T2 ON T2.Author  =  T1.idAuthor JOIN Book AS T3 ON T2.isbn  =  T3.isbn	book_1
SELECT T1.idOrder ,  T2.name FROM Orders AS T1 JOIN Client AS T2 ON T1.idClient  =  T2.idClient	book_1
SELECT T1.idOrder ,  T2.name FROM Orders AS T1 JOIN Client AS T2 ON T1.idClient  =  T2.idClient	book_1
SELECT author.name, COUNT(author_book.author) FROM author LEFT JOIN author_book ON author.idauthor = author_book.author GROUP BY author.idauthor	book_1
SELECT author.name, COUNT(author_book.author) FROM author LEFT JOIN author_book ON author.idauthor = author_book.author GROUP BY author.idauthor	book_1
SELECT book.isbn, COUNT(books_order.isbn) AS order_count FROM book LEFT JOIN books_order ON book.isbn = books_order.isbn GROUP BY book.isbn;	book_1
SELECT book.isbn, COUNT(books_order.isbn) AS order_count FROM book LEFT JOIN books_order ON book.isbn = books_order.isbn GROUP BY book.isbn	book_1
SELECT T1.isbn, sum(T2.amount) FROM Book AS T1 LEFT JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.isbn	book_1
SELECT book.isbn, IFNULL(TOTAL(books_order.amount), 0) AS totalOrders FROM book LEFT JOIN books_order ON books_order.isbn = book.isbn GROUP BY book.isbn	book_1
SELECT b1.title FROM book b1 WHERE b1.isbn = (SELECT bo1.isbn FROM books_order bo1 GROUP BY bo1.isbn HAVING COUNT(bo1.isbn) = (SELECT MAX(cnt) FROM (SELECT COUNT(isbn) AS cnt FROM books_order GROUP BY isbn)));	book_1
SELECT title FROM (SELECT T2.title, rank() over (ORDER BY count(*) DESC) FROM Books_Order AS T1 JOIN Book AS T2 ON T1.isbn = T2.isbn GROUP BY T1.isbn)	book_1
SELECT t.title, t.purchaseprice FROM book t JOIN (SELECT isbn FROM books_order GROUP BY isbn HAVING SUM(amount) = (SELECT MAX(total_amount) FROM (SELECT SUM(amount) AS total_amount FROM books_order GROUP BY isbn))) t2 ON t.isbn = t2.isbn	book_1
SELECT t.title, t.purchaseprice FROM book t JOIN (SELECT isbn FROM books_order GROUP BY isbn HAVING SUM(amount) = (SELECT MAX(total_amount) FROM (SELECT SUM(amount) AS total_amount FROM books_order GROUP BY isbn))) t2 ON t.isbn = t2.isbn	book_1
SELECT book.title FROM book WHERE EXISTS (SELECT 1 FROM books_order WHERE books_order.isbn = book.isbn);	book_1
SELECT DISTINCT T1.title FROM book AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn	book_1
SELECT DISTINCT T1.name FROM Client AS T1 JOIN Orders AS T2 ON T1.idClient  =  T2.idClient	book_1
SELECT name FROM client WHERE idclient IN (SELECT idclient FROM orders)	book_1
SELECT cl.name, (SELECT COUNT(*) FROM orders ords WHERE ords.idclient = cl.idclient) FROM client cl	book_1
SELECT c1.name, COALESCE(order_count.count, 0) AS order_number FROM client c1 LEFT JOIN (SELECT idclient, COUNT(idorder) AS count FROM orders GROUP BY idclient) order_count ON c1.idclient = order_count.idclient	book_1
SELECT c.name FROM client AS c INNER JOIN (SELECT idclient FROM orders GROUP BY idclient HAVING COUNT(idorder) = (SELECT MAX(total_orders) FROM (SELECT idclient, COUNT(*) as total_orders FROM orders GROUP BY idclient) tmp)) AS max_orders ON c.idclient = max_orders.idclient	book_1
SELECT name FROM client WHERE idclient IN (SELECT idclient FROM orders GROUP BY idclient HAVING COUNT(idorder) = (SELECT MAX(order_count) FROM (SELECT idclient, COUNT(idorder) AS order_count FROM orders GROUP BY idclient) temp))	book_1
SELECT T1.name, sum(T3.amount) FROM Client AS T1 LEFT JOIN Orders AS T2 ON T1.idClient = T2.idClient LEFT JOIN Books_Order AS T3 ON T2.idOrder = T3.idOrder GROUP BY T1.idClient;	book_1
SELECT T1.name, sum(T3.amount) FROM Client AS T1 LEFT JOIN Orders AS T2 ON T1.idClient = T2.idClient LEFT JOIN Books_Order AS T3 ON T2.idOrder = T3.idOrder GROUP BY T1.idClient;	book_1
SELECT c.name FROM client c, orders o, books_order bo WHERE c.idclient = o.idclient AND o.idorder = bo.idorder GROUP BY c.idclient HAVING SUM(bo.amount) = (SELECT MAX(Total) FROM (SELECT SUM(amount) AS Total FROM orders JOIN books_order ON orders.idorder = books_order.idorder GROUP BY idclient) totals)	book_1
SELECT c.name FROM client c, orders o, books_order bo WHERE c.idclient = o.idclient AND o.idorder = bo.idorder GROUP BY c.idclient HAVING SUM(bo.amount) = (SELECT MAX(Total) FROM (SELECT SUM(amount) AS Total FROM orders JOIN books_order ON orders.idorder = books_order.idorder GROUP BY idclient) totals)	book_1
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)	book_1
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)	book_1
SELECT name FROM client WHERE idclient NOT IN (SELECT idclient FROM orders)	book_1
SELECT name FROM client WHERE idclient NOT IN (SELECT idclient FROM orders)	book_1
SELECT max(saleprice) ,  min(saleprice) FROM Book	book_1
SELECT max(saleprice) ,  min(saleprice) FROM Book	book_1
SELECT avg(purchaseprice) ,  avg(saleprice) FROM Book	book_1
SELECT avg(purchaseprice) ,  avg(saleprice) FROM Book	book_1
SELECT max(saleprice - purchaseprice) FROM Book	book_1
SELECT max(saleprice - purchaseprice) FROM Book	book_1
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)	book_1
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)	book_1
select title from book order by saleprice asc limit 1	book_1
select title from book order by saleprice asc limit 1	book_1
select title from book order by purchaseprice  desc limit 1	book_1
select title from book order by purchaseprice  desc limit 1	book_1
SELECT AVG(saleprice) FROM book WHERE isbn IN (SELECT isbn FROM author_book WHERE author IN (SELECT idauthor FROM author WHERE name = 'George Orwell'))	book_1
SELECT AVG(saleprice) FROM book WHERE isbn IN (SELECT isbn FROM author_book JOIN author ON author_book.author = author.idauthor WHERE author.name = 'George Orwell')	book_1
SELECT saleprice FROM book WHERE isbn IN (SELECT isbn FROM author_book WHERE author IN (SELECT idauthor FROM author WHERE name = 'Plato'))	book_1
SELECT b.saleprice FROM book AS b WHERE EXISTS (SELECT 1 FROM author_book AS ab JOIN author AS a ON ab.author = a.idauthor WHERE ab.isbn = b.isbn AND a.name = 'Plato')	book_1
WITH LowestPrice AS (SELECT book.isbn FROM book JOIN author_book ON book.isbn = author_book.isbn JOIN author ON author_book.author = author.idauthor WHERE author.name = 'George Orwell' and book.SalePrice = (SELECT MIN(saleprice) FROM book JOIN author_book ON book.isbn = author_book.isbn JOIN author ON author_book.author = author.idauthor WHERE author.name = 'George Orwell')) SELECT title FROM book WHERE isbn IN (SELECT isbn FROM LowestPrice);	book_1
WITH LowestPrice AS (SELECT book.isbn FROM book JOIN author_book ON book.isbn = author_book.isbn JOIN author ON author_book.author = author.idauthor WHERE author.name = 'George Orwell' and book.SalePrice = (SELECT MIN(saleprice) FROM book JOIN author_book ON book.isbn = author_book.isbn JOIN author ON author_book.author = author.idauthor WHERE author.name = 'George Orwell')) SELECT title FROM book WHERE isbn IN (SELECT isbn FROM LowestPrice);	book_1
SELECT title FROM book WHERE isbn IN (SELECT isbn FROM author_book WHERE author IN (SELECT idauthor FROM author WHERE name = 'Plato')) AND saleprice < (SELECT AVG(saleprice) FROM book);	book_1
SELECT title FROM book WHERE isbn IN (SELECT isbn FROM author_book WHERE author IN (SELECT idauthor FROM author WHERE name = 'Plato')) AND saleprice < (SELECT AVG(saleprice) FROM book)	book_1
SELECT name FROM author WHERE idauthor IN (SELECT author FROM author_book WHERE isbn IN (SELECT isbn FROM book WHERE title = 'Pride and Prejudice'))	book_1
SELECT name FROM author WHERE idauthor IN (SELECT author FROM author_book WHERE isbn IN (SELECT isbn FROM book WHERE title = 'Pride and Prejudice'))	book_1
SELECT title FROM book WHERE isbn IN (SELECT isbn FROM author_book WHERE author IN (SELECT idauthor FROM author WHERE name LIKE '%Plato%'))	book_1
SELECT title FROM book WHERE isbn IN (SELECT isbn FROM author_book WHERE author IN (SELECT idauthor FROM author WHERE name LIKE '%Plato%'))	book_1
SELECT COUNT(DISTINCT orders.idorder) FROM book JOIN books_order ON book.isbn = books_order.isbn JOIN orders ON books_order.idorder = orders.idorder WHERE book.title = 'Pride and Prejudice'	book_1
SELECT COUNT(*) FROM orders WHERE idorder IN (SELECT idorder FROM books_order WHERE isbn IN (SELECT isbn FROM book WHERE title = 'Pride and Prejudice'))	book_1
SELECT idOrder FROM Book AS T1 JOIN Books_Order AS T2 ON T1.isbn  =  T2.isbn WHERE T1.title  =  "Pride and Prejudice" INTERSECT SELECT idOrder FROM Book AS T1 JOIN Books_Order AS T2 ON T1.isbn  =  T2.isbn WHERE T1.title  =  "The Little Prince"	book_1
SELECT idOrder FROM Book AS T1 JOIN Books_Order AS T2 ON T1.isbn  =  T2.isbn WHERE T1.title  =  "Pride and Prejudice" INTERSECT SELECT idOrder FROM Book AS T1 JOIN Books_Order AS T2 ON T1.isbn  =  T2.isbn WHERE T1.title  =  "The Little Prince"	book_1
SELECT T2.isbn FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.idOrder  =  T2.idOrder JOIN Client AS T3 ON T1.idClient  =  T3.idClient WHERE T3.name  =  "Peter Doe" INTERSECT SELECT T2.isbn FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.idOrder  =  T2.idOrder JOIN Client AS T3 ON T1.idClient  =  T3.idClient WHERE T3.name  =  "James Smith"	book_1
SELECT T2.isbn FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.idOrder  =  T2.idOrder JOIN Client AS T3 ON T1.idClient  =  T3.idClient WHERE T3.name  =  "Peter Doe" INTERSECT SELECT T2.isbn FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.idOrder  =  T2.idOrder JOIN Client AS T3 ON T1.idClient  =  T3.idClient WHERE T3.name  =  "James Smith"	book_1
SELECT title FROM Book WHERE ISBN IN (SELECT T2.ISBN FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder = T2.IdOrder JOIN Client AS T3 ON T1.IdClient = T3.IdClient WHERE T3.name = "Peter Doe" EXCEPT SELECT T2.ISBN FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder = T2.IdOrder JOIN Client AS T3 ON T1.IdClient = T3.IdClient WHERE T3.name = "James Smith")	book_1
SELECT title FROM Book WHERE ISBN IN (SELECT T2.ISBN FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder = T2.IdOrder JOIN Client AS T3 ON T1.IdClient = T3.IdClient WHERE T3.name = "Peter Doe" EXCEPT SELECT T2.ISBN FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder = T2.IdOrder JOIN Client AS T3 ON T1.IdClient = T3.IdClient WHERE T3.name = "James Smith")	book_1
SELECT name FROM client WHERE idclient IN (SELECT idclient FROM orders WHERE idorder IN (SELECT idorder FROM book WHERE title = 'Pride and Prejudice'))	book_1
SELECT name FROM client WHERE idclient IN (SELECT idclient FROM orders WHERE idorder IN (SELECT idorder FROM book WHERE title = 'Pride and Prejudice'))	book_1
SELECT count(*) FROM book	book_review
SELECT Title FROM book ORDER BY Title ASC	book_review
SELECT Title FROM book ORDER BY Pages DESC	book_review
SELECT TYPE ,  Release FROM book	book_review
SELECT max(Chapters) ,  min(Chapters) FROM book	book_review
SELECT Title FROM book WHERE TYPE != "Poet"	book_review
SELECT avg(Rating) FROM review	book_review
SELECT T1.Title ,  T2.Rating FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID	book_review
SELECT r.rating FROM review r JOIN book b ON r.book_id = b.book_id WHERE b.chapters = (SELECT MAX(chapters) FROM book);	book_review
SELECT r.rank FROM review r JOIN book b ON r.book_id = b.book_id WHERE b.pages = (SELECT MIN(pages) FROM book);	book_review
SELECT Title FROM (SELECT Title, rank() over (ORDER BY (SELECT max(rank) FROM review WHERE review.Book_ID = book.Book_ID)) as rk FROM book) WHERE rk = 1	book_review
SELECT avg(T2.Readers_in_Million) FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID WHERE T1.Type  =  "Novel"	book_review
SELECT TYPE ,  COUNT(*) FROM book GROUP BY TYPE	book_review
SELECT type FROM book GROUP BY type HAVING COUNT(type) = (SELECT MAX(count) FROM (SELECT type, COUNT(*) AS count FROM book GROUP BY type))	book_review
SELECT TYPE FROM book GROUP BY TYPE HAVING COUNT(*)  >=  3	book_review
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Rating ASC	book_review
SELECT T1.Title ,  T1.audio FROM book AS T1 LEFT JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID GROUP BY T1.Book_ID ORDER BY sum(T2.Readers_in_Million) DESC	book_review
SELECT count(*) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)	book_review
SELECT TYPE FROM book WHERE Chapters  >  75 INTERSECT SELECT TYPE FROM book WHERE Chapters  <  50	book_review
SELECT count(DISTINCT TYPE) FROM book	book_review
SELECT DISTINCT book.type, book.title FROM book LEFT JOIN review ON book.book_id = review.book_id WHERE review.rating IS NULL	book_review
SELECT count(*) FROM customer	restaurant_bills
SELECT count(*) FROM customer	restaurant_bills
SELECT Name FROM customer ORDER BY Level_of_Membership ASC	restaurant_bills
SELECT Name FROM customer ORDER BY Level_of_Membership ASC	restaurant_bills
SELECT Nationality ,  Card_Credit FROM customer	restaurant_bills
SELECT Nationality ,  Card_Credit FROM customer	restaurant_bills
SELECT Name FROM customer WHERE Nationality  =  "England" OR Nationality  =  "Australia"	restaurant_bills
SELECT Name FROM customer WHERE Nationality  =  "England" OR Nationality  =  "Australia"	restaurant_bills
SELECT avg(Card_Credit) FROM customer WHERE Level_of_Membership  >  1	restaurant_bills
SELECT avg(Card_Credit) FROM customer WHERE Level_of_Membership  >  1	restaurant_bills
SELECT card_credit FROM (SELECT card_credit, RANK() OVER (ORDER BY level_of_membership DESC) as rk FROM customer) WHERE rk = 1;	restaurant_bills
SELECT card_credit FROM (SELECT card_credit, RANK() OVER (ORDER BY level_of_membership DESC) as rk FROM customer) WHERE rk = 1;	restaurant_bills
SELECT Nationality ,  COUNT(*) FROM customer GROUP BY Nationality	restaurant_bills
SELECT Nationality ,  COUNT(*) FROM customer GROUP BY Nationality	restaurant_bills
SELECT nationality FROM customer GROUP BY nationality HAVING COUNT(nationality) = (SELECT MAX(cnt) FROM (SELECT nationality, COUNT(*) as cnt FROM customer GROUP BY nationality) subquery)	restaurant_bills
WITH RankedNationalities AS (SELECT nationality, RANK() OVER (ORDER BY COUNT(customer_id) DESC) as rank FROM customer GROUP BY nationality) SELECT nationality FROM RankedNationalities WHERE rank = 1	restaurant_bills
SELECT Nationality FROM customer WHERE Card_Credit  <  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  >  75	restaurant_bills
SELECT DISTINCT c1.nationality FROM customer c1 JOIN customer c2 ON c1.nationality = c2.nationality WHERE c1.card_credit > 50 AND c2.card_credit < 75	restaurant_bills
SELECT T1.Name ,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID	restaurant_bills
SELECT T1.Name ,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID	restaurant_bills
SELECT T1.Name ,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID ORDER BY T2.Quantity DESC	restaurant_bills
SELECT T1.Name ,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID ORDER BY T2.Quantity DESC	restaurant_bills
SELECT c.name, SUM(quantity) AS total_orders FROM customer c LEFT JOIN customer_order co ON c.customer_id = co.customer_id GROUP BY c.customer_id	restaurant_bills
SELECT c.name, SUM(quantity) AS total_orders FROM customer c LEFT JOIN customer_order co ON c.customer_id = co.customer_id GROUP BY c.customer_id	restaurant_bills
SELECT c.name FROM customer c JOIN customer_order co ON c.customer_id = co.customer_id GROUP BY c.customer_id HAVING SUM(co.quantity) > 1	restaurant_bills
SELECT c.name FROM customer c WHERE c.customer_id IN (SELECT co.customer_id FROM customer_order co GROUP BY co.customer_id HAVING SUM(co.quantity) > 1)	restaurant_bills
SELECT DISTINCT Manager FROM branch	restaurant_bills
SELECT DISTINCT Manager FROM branch	restaurant_bills
SELECT name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)	restaurant_bills
SELECT name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)	restaurant_bills
SELECT count(*) FROM member	club_leader
SELECT Name FROM member ORDER BY Age ASC	club_leader
SELECT Name ,  Nationality FROM member	club_leader
SELECT name FROM member WHERE nationality != 'England'	club_leader
SELECT Name FROM member WHERE Age  =  19 OR Age  =  20	club_leader
SELECT name FROM member WHERE age = (SELECT MAX(age) FROM member)	club_leader
SELECT Nationality ,  COUNT(*) FROM member GROUP BY Nationality	club_leader
SELECT M.nationality FROM member M GROUP BY M.nationality HAVING COUNT(M.nationality) = (SELECT MAX(count) FROM (SELECT COUNT(M2.nationality) as count FROM member M2 GROUP BY M2.nationality))	club_leader
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*)  >=  2	club_leader
SELECT T3.Name ,  T2.Club_Name FROM club_leader AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID JOIN member AS T3 ON T1.Member_ID  =  T3.Member_ID	club_leader
SELECT name FROM member WHERE member_id IN (SELECT member_id FROM club_leader WHERE club_id IN (SELECT club_id FROM club WHERE overall_ranking > 100))	club_leader
SELECT name FROM member WHERE member_id IN (SELECT member_id FROM club_leader WHERE year_join < 2018)	club_leader
SELECT Name FROM member WHERE Member_ID IN (SELECT Member_ID FROM club_leader WHERE Club_ID IN (SELECT Club_ID FROM club WHERE Club_Name = 'Houston'))	club_leader
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)	club_leader
SELECT Nationality FROM member WHERE Age  >  22 INTERSECT SELECT Nationality FROM member WHERE Age  <  19	club_leader
SELECT AVG(age) FROM member WHERE member_id IN (SELECT member_id FROM club_leader)	club_leader
SELECT club_name FROM club WHERE club_name LIKE '%state%'	club_leader
SELECT Collection_Subset_Name FROM Collection_Subsets;	cre_Doc_and_collections
SELECT Collection_Subset_Name FROM Collection_Subsets;	cre_Doc_and_collections
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = "Top collection";	cre_Doc_and_collections
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = "Top collection";	cre_Doc_and_collections
SELECT Document_Subset_Name FROM Document_Subsets;	cre_Doc_and_collections
SELECT Document_Subset_Name FROM Document_Subsets;	cre_Doc_and_collections
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = "Best for 2000";	cre_Doc_and_collections
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = "Best for 2000";	cre_Doc_and_collections
SELECT Document_Object_ID FROM Document_Objects;	cre_Doc_and_collections
SELECT Document_Object_ID FROM Document_Objects;	cre_Doc_and_collections
SELECT document_object_id FROM document_objects WHERE document_object_id IN (SELECT parent_document_object_id FROM document_objects WHERE owner = 'Marlin')	cre_Doc_and_collections
SELECT document_object_id FROM document_objects WHERE owner = 'Marlin'	cre_Doc_and_collections
SELECT OWNER FROM Document_Objects WHERE Description  =  'Braeden Collection'	cre_Doc_and_collections
SELECT OWNER FROM Document_Objects WHERE Description  =  'Braeden Collection'	cre_Doc_and_collections
SELECT parent.owner FROM document_objects AS parent WHERE parent.document_object_id IN (SELECT child.parent_document_object_id FROM document_objects AS child WHERE child.owner = 'Marlin')	cre_Doc_and_collections
SELECT parent.owner FROM document_objects AS parent WHERE parent.document_object_id IN (SELECT child.parent_document_object_id FROM document_objects AS child WHERE child.owner = 'Marlin')	cre_Doc_and_collections
SELECT DISTINCT T2.Description FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID	cre_Doc_and_collections
SELECT DISTINCT T2.Description FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID	cre_Doc_and_collections
SELECT count(*) FROM Document_Objects WHERE OWNER = "Marlin";	cre_Doc_and_collections
SELECT count(*) FROM Document_Objects WHERE OWNER = "Marlin";	cre_Doc_and_collections
SELECT Document_Object_ID FROM Document_Objects EXCEPT SELECT Parent_Document_Object_ID FROM Document_Objects	cre_Doc_and_collections
SELECT Document_Object_ID FROM Document_Objects EXCEPT SELECT Parent_Document_Object_ID FROM Document_Objects	cre_Doc_and_collections
SELECT T2.Document_Object_ID ,  count(*) FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID GROUP BY T2.Document_Object_ID;	cre_Doc_and_collections
SELECT T2.Document_Object_ID ,  count(*) FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID GROUP BY T2.Document_Object_ID;	cre_Doc_and_collections
SELECT Collection_Name FROM Collections;	cre_Doc_and_collections
SELECT Collection_Name FROM Collections;	cre_Doc_and_collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = "Best";	cre_Doc_and_collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = "Best";	cre_Doc_and_collections
SELECT c1.Collection_Name FROM Collections AS c1 WHERE c1.Collection_ID IN (SELECT c2.Parent_Collection_ID FROM Collections AS c2 WHERE c2.Collection_Name = "Nice");	cre_Doc_and_collections
SELECT c1.Collection_Name FROM Collections AS c1 WHERE c1.Collection_ID IN (SELECT c2.Parent_Collection_ID FROM Collections AS c2 WHERE c2.Collection_Name = "Nice");	cre_Doc_and_collections
SELECT collection_name FROM collections WHERE collection_id NOT IN (SELECT parent_collection_id FROM collections WHERE parent_collection_id IS NOT NULL)	cre_Doc_and_collections
SELECT collection_name FROM collections WHERE collection_id NOT IN (SELECT parent_collection_id FROM collections WHERE parent_collection_id IS NOT NULL)	cre_Doc_and_collections
SELECT T2.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID GROUP BY T2.Document_Object_ID HAVING count(*)  >  1;	cre_Doc_and_collections
SELECT T2.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID GROUP BY T2.Document_Object_ID HAVING count(*)  >  1;	cre_Doc_and_collections
SELECT count(*) FROM Collections AS T1 JOIN Collections AS T2 ON T1.Parent_Collection_ID = T2.Collection_ID WHERE T2.Collection_Name = "Best";	cre_Doc_and_collections
SELECT count(*) FROM Collections AS T1 JOIN Collections AS T2 ON T1.Parent_Collection_ID = T2.Collection_ID WHERE T2.Collection_Name = "Best";	cre_Doc_and_collections
SELECT DISTINCT d.document_object_id FROM document_objects d JOIN document_subset_members dsm ON d.document_object_id = dsm.Document_Object_ID JOIN document_objects do ON do.document_object_id = dsm.Related_Document_Object_ID WHERE do.owner = 'Ransom';	cre_Doc_and_collections
SELECT DISTINCT d.document_object_id FROM document_objects d JOIN document_subset_members dsm ON d.document_object_id = dsm.Document_Object_ID JOIN document_objects do ON do.document_object_id = dsm.Related_Document_Object_ID WHERE do.owner = 'Ransom';	cre_Doc_and_collections
SELECT cs.collection_subset_id, cs.collection_subset_name, COUNT(csm.collection_id) AS number_of_collections FROM collection_subsets cs LEFT JOIN collection_subset_members csm ON cs.collection_subset_id = csm.collection_subset_id GROUP BY cs.collection_subset_id, cs.collection_subset_name	cre_Doc_and_collections
SELECT cs.collection_subset_id, cs.collection_subset_name, COUNT(csm.collection_id) AS num_collections FROM collection_subsets cs LEFT JOIN collection_subset_members csm ON cs.collection_subset_id = csm.collection_subset_id GROUP BY cs.collection_subset_id, cs.collection_subset_name	cre_Doc_and_collections
SELECT Document_Object_ID, cnt FROM ( SELECT T2.Document_Object_ID, COUNT(*) as cnt, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID GROUP BY T2.Document_Object_ID ) AS subquery WHERE rk = 1	cre_Doc_and_collections
SELECT parent.document_object_id, COUNT(child.document_object_id) AS child_count FROM document_objects AS parent LEFT JOIN document_objects AS child ON parent.document_object_id = child.parent_document_object_id GROUP BY parent.document_object_id	cre_Doc_and_collections
SELECT d.document_object_id, COUNT(r.related_document_object_id) AS CountRelated FROM document_objects d LEFT JOIN document_subset_members r ON d.document_object_id = r.document_object_id GROUP BY d.document_object_id ORDER BY CountRelated ASC LIMIT 1	cre_Doc_and_collections
SELECT d.document_object_id, COUNT(r.related_document_object_id) AS CountRelated FROM document_objects d LEFT JOIN document_subset_members r ON d.document_object_id = r.document_object_id GROUP BY d.document_object_id ORDER BY CountRelated ASC LIMIT 1	cre_Doc_and_collections
select document_object_id , count(*) from document_subset_members group by document_object_id having count(*) between 2 and 4;	cre_Doc_and_collections
SELECT Document_Object_ID , count(*) FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING count(*) BETWEEN 2 AND 4;	cre_Doc_and_collections
SELECT DISTINCT OWNER FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Related_Document_Object_ID  =  T2.Document_Object_ID WHERE T2.Owner  =  'Braeden';	cre_Doc_and_collections
SELECT DISTINCT OWNER FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Related_Document_Object_ID  =  T2.Document_Object_ID WHERE T2.Owner  =  'Braeden';	cre_Doc_and_collections
SELECT DISTINCT T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.owner  =  'Braeden'	cre_Doc_and_collections
SELECT DISTINCT T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.owner  =  'Braeden'	cre_Doc_and_collections
SELECT doc_sub.document_subset_id, doc_sub.document_subset_name, (SELECT COUNT(DISTINCT doc_mem.document_object_id) FROM document_subset_members doc_mem WHERE doc_mem.document_subset_id = doc_sub.document_subset_id) AS doc_count FROM document_subsets doc_sub	cre_Doc_and_collections
SELECT document_subsets.document_subset_id, document_subset_name, (SELECT COUNT(DISTINCT document_object_id) FROM document_subset_members WHERE document_subset_members.document_subset_id = document_subsets.document_subset_id) FROM document_subsets	cre_Doc_and_collections
SELECT document_subset_id, document_subset_name, num_docs FROM (SELECT ds.document_subset_id, ds.document_subset_name, COUNT(DISTINCT dsm.document_object_id) as num_docs, rank() over (ORDER BY COUNT(DISTINCT dsm.document_object_id) DESC) as rk FROM document_subsets ds JOIN document_subset_members dsm ON ds.document_subset_id = dsm.document_subset_id GROUP BY ds.document_subset_id, ds.document_subset_name) WHERE rk = 1;	cre_Doc_and_collections
SELECT a.document_subset_id, a.document_subset_name, COUNT(DISTINCT b.document_object_id) AS document_count FROM document_subsets a INNER JOIN document_subset_members b ON a.document_subset_id = b.document_subset_id GROUP BY a.document_subset_id HAVING document_count = (SELECT MAX(c.countdoc) FROM (SELECT COUNT(DISTINCT document_object_id) AS countdoc FROM document_subset_members GROUP BY document_subset_id) c)	cre_Doc_and_collections
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID =  T2.Document_Subset_ID WHERE T2.Document_Subset_Name = "Best for 2000";	cre_Doc_and_collections
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID =  T2.Document_Subset_ID WHERE T2.Document_Subset_Name = "Best for 2000";	cre_Doc_and_collections
SELECT DISTINCT T3.Document_Subset_Name ,  T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subset_Members  AS T2 ON T1.Related_Document_Object_ID = T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID =  T3.Document_Subset_ID	cre_Doc_and_collections
select distinct t3.document_subset_name ,  t1.document_object_id from document_subset_members as t1 join document_subset_members  as t2 on t1.related_document_object_id = t2.document_object_id join document_subsets as t3 on t2.document_subset_id =  t3.document_subset_id	cre_Doc_and_collections
SELECT c.collection_name FROM collections c WHERE c.collection_id IN ( SELECT dc.collection_id FROM documents_in_collections dc JOIN document_objects d ON dc.document_object_id = d.document_object_id WHERE d.owner = 'Ransom' )	cre_Doc_and_collections
SELECT c.collection_name FROM collections c WHERE c.collection_id IN ( SELECT dc.collection_id FROM documents_in_collections dc JOIN document_objects d ON dc.document_object_id = d.document_object_id WHERE d.owner = 'Ransom' )	cre_Doc_and_collections
SELECT d.document_object_id, COUNT(c.collection_id) AS total_collections FROM document_objects d LEFT JOIN documents_in_collections dc ON d.document_object_id = dc.document_object_id LEFT JOIN collections c ON dc.collection_id = c.collection_id GROUP BY d.document_object_id	cre_Doc_and_collections
SELECT d.document_object_id, COUNT(c.collection_id) AS total_collections FROM document_objects d LEFT JOIN documents_in_collections dc ON d.document_object_id = dc.document_object_id LEFT JOIN collections c ON dc.collection_id = c.collection_id GROUP BY d.document_object_id	cre_Doc_and_collections
SELECT COUNT(DISTINCT doc.document_object_id) FROM collections col INNER JOIN documents_in_collections doc_col ON col.collection_id = doc_col.collection_id INNER JOIN document_objects doc ON doc_col.document_object_id = doc.document_object_id WHERE col.collection_name = 'Best'	cre_Doc_and_collections
SELECT COUNT(DISTINCT doc.document_object_id) FROM documents_in_collections dic JOIN collections c ON dic.collection_id = c.collection_id JOIN document_objects doc ON dic.document_object_id = doc.document_object_id WHERE c.collection_name = 'Best'	cre_Doc_and_collections
SELECT DISTINCT document_objects.document_object_id FROM document_objects, documents_in_collections, collections WHERE document_objects.document_object_id = documents_in_collections.document_object_id AND documents_in_collections.collection_id = collections.collection_id AND collections.collection_name = 'Best'	cre_Doc_and_collections
SELECT COUNT(DISTINCT doc.document_object_id) FROM documents_in_collections AS doc JOIN collections AS col ON doc.collection_id = col.collection_id WHERE col.collection_name = 'Best'	cre_Doc_and_collections
SELECT c.collection_name, c.collection_id, COUNT(d.document_object_id) AS total_docs FROM collections c JOIN documents_in_collections d ON c.collection_id = d.collection_id WHERE c.collection_name = 'Best' GROUP BY c.collection_id HAVING total_docs = (SELECT MAX(doc_counts) FROM (SELECT COUNT(document_object_id) AS doc_counts FROM documents_in_collections GROUP BY collection_id))	cre_Doc_and_collections
SELECT c.collection_name, c.collection_id, COUNT(d.document_object_id) AS total_docs FROM collections c JOIN documents_in_collections d ON c.collection_id = d.collection_id WHERE c.collection_name = 'Best' GROUP BY c.collection_id HAVING total_docs = (SELECT MAX(doc_counts) FROM (SELECT COUNT(document_object_id) AS doc_counts FROM documents_in_collections GROUP BY collection_id))	cre_Doc_and_collections
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID =  T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID  =  T4.Collection_ID WHERE T2.Document_Subset_Name = "Best for 2000" AND T4.Collection_Name = "Best";	cre_Doc_and_collections
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID =  T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID  =  T4.Collection_ID WHERE T2.Document_Subset_Name = "Best for 2000" AND T4.Collection_Name = "Best";	cre_Doc_and_collections
SELECT DISTINCT T2.Document_Object_ID FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = "Best" EXCEPT SELECT DISTINCT T3.Document_Object_ID FROM Document_Subset_Members AS T3 JOIN Document_Subsets AS T4 ON T3.Document_Subset_ID =  T4.Document_Subset_ID WHERE T4.Document_Subset_Name = "Best for 2000"	cre_Doc_and_collections
SELECT DISTINCT T2.Document_Object_ID FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = "Best" EXCEPT SELECT DISTINCT T3.Document_Object_ID FROM Document_Subset_Members AS T3 JOIN Document_Subsets AS T4 ON T3.Document_Subset_ID =  T4.Document_Subset_ID WHERE T4.Document_Subset_Name = "Best for 2000"	cre_Doc_and_collections
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID =  T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID  =  T4.Collection_ID WHERE T2.Document_Subset_Name = "Best for 2000" OR T4.Collection_Name = "Best";	cre_Doc_and_collections
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID =  T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID  =  T4.Collection_ID WHERE T2.Document_Subset_Name = "Best for 2000" OR T4.Collection_Name = "Best";	cre_Doc_and_collections
SELECT T1.collection_name FROM collections AS T1 WHERE T1.collection_id IN (SELECT T2.collection_id FROM collection_subset_members AS T2 JOIN collections AS T3 ON T2.Related_Collection_ID = T3.collection_id WHERE T3.collection_name = 'Best')	cre_Doc_and_collections
SELECT T1.collection_name FROM collections AS T1 WHERE T1.collection_id IN (SELECT T2.collection_id FROM collection_subset_members AS T2 JOIN collections AS T3 ON T2.Related_Collection_ID = T3.collection_id WHERE T3.collection_name = 'Best')	cre_Doc_and_collections
SELECT count(DISTINCT T1.Related_Collection_ID) FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name = "Best";	cre_Doc_and_collections
SELECT count(DISTINCT T1.Related_Collection_ID) FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name = "Best";	cre_Doc_and_collections
SELECT cs.collection_subset_name FROM collection_subsets AS cs WHERE cs.collection_subset_id IN (SELECT csm.collection_subset_id FROM collection_subset_members AS csm WHERE csm.collection_id IN (SELECT c.collection_id FROM collections AS c WHERE c.collection_name = 'Best'))	cre_Doc_and_collections
SELECT cs.collection_subset_name FROM collection_subsets AS cs WHERE cs.collection_subset_id IN (SELECT csm.collection_subset_id FROM collection_subset_members AS csm WHERE csm.collection_id IN (SELECT c.collection_id FROM collections AS c WHERE c.collection_name = 'Best'))	cre_Doc_and_collections
SELECT count(*) FROM songs WHERE name LIKE "%Love%"	sing_contest
SELECT name FROM songs ORDER BY name	sing_contest
select name , language from songs	sing_contest
SELECT max(voice_sound_quality) ,  min(voice_sound_quality) FROM performance_score	sing_contest
SELECT T1.voice_sound_quality ,  T1.rhythm_tempo ,  T1.stage_presence FROM performance_score AS T1 JOIN participants AS T2 ON T1.participant_id  =  T2.id WHERE T2.name  =  'Freeway'	sing_contest
SELECT id ,  LANGUAGE ,  original_artist FROM songs WHERE name != 'Love'	sing_contest
SELECT name ,  original_artist FROM songs WHERE english_translation  =  'All the streets of love'	sing_contest
SELECT DISTINCT T2.stage_presence FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id WHERE T1.language  =  'English'	sing_contest
SELECT T1.id ,  T1.Name FROM participants AS T1 JOIN performance_score AS T2 ON T2.participant_id  =  T1.id GROUP BY T1.id HAVING count(*)  >=  2	sing_contest
SELECT T1.id ,  T1.Name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T2.participant_id  =  T1.id GROUP BY T1.id ORDER BY count(*)	sing_contest
SELECT DISTINCT p.id, p.name FROM participants p, performance_score ps WHERE p.id = ps.participant_id AND (ps.voice_sound_quality = 5 OR ps.rhythm_tempo = 5)	sing_contest
SELECT T1.voice_sound_quality FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T2.name  =  ' The Balkan Girls ' AND T2.language  =  'English'	sing_contest
SELECT s.id, s.name FROM songs s INNER JOIN performance_score ps ON s.id = ps.songs_id GROUP BY s.id, s.name HAVING COUNT(DISTINCT ps.participant_id) = (SELECT MAX(participant_count) FROM (SELECT COUNT(DISTINCT ps.participant_id) AS participant_count FROM performance_score ps GROUP BY ps.songs_id) t)	sing_contest
SELECT count(*) FROM performance_score WHERE stage_presence  <  7 OR stage_presence  >  9	sing_contest
SELECT count(*) FROM songs WHERE id NOT IN ( SELECT songs_id FROM performance_score );	sing_contest
SELECT avg(T2.rhythm_tempo) ,  T1.language FROM songs AS T1 JOIN performance_score AS T2 ON T2.songs_id  =  T1.id GROUP BY T1.language	sing_contest
SELECT DISTINCT T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T2.participant_id  =  T1.id JOIN songs AS T3 ON T3.id  =  T2.songs_id WHERE T3.language  =  'English'	sing_contest
SELECT p.name, p.popularity FROM participants p WHERE EXISTS (SELECT 1 FROM songs s JOIN performance_score ps ON s.id = ps.songs_id WHERE s.language = 'Croatian' AND ps.participant_id = p.id) AND EXISTS (SELECT 1 FROM songs s JOIN performance_score ps ON s.id = ps.songs_id WHERE s.language = 'English' AND ps.participant_id = p.id)	sing_contest
SELECT name FROM songs WHERE name LIKE "%Is%"	sing_contest
select original_artist from songs AS T1 join (select songs_id, max(voice_sound_quality) as voice_sound_quality from performance_score where rhythm_tempo > 5 group by songs_id) AS T2 where T1.id = T2.songs_id ORDER BY T2.voice_sound_quality	sing_contest
SELECT count(*) FROM City	address_1
SELECT count(*) FROM City	address_1
select distinct state from city	address_1
SELECT DISTINCT state FROM City	address_1
SELECT count(DISTINCT country) FROM City	address_1
SELECT count(DISTINCT country) FROM City	address_1
SELECT city_name ,  city_code ,  state ,  country FROM City	address_1
SELECT city_name ,  city_code ,  state ,  country FROM City	address_1
SELECT latitude ,  longitude FROM City WHERE city_name  =  "Baltimore"	address_1
SELECT latitude ,  longitude FROM City WHERE city_name  =  "Baltimore"	address_1
SELECT city_name FROM City WHERE state  =  "PA"	address_1
SELECT city_name FROM City WHERE state  =  "PA"	address_1
SELECT count(*) FROM City WHERE country  =  "CANADA"	address_1
SELECT count(*) FROM City WHERE country  =  "CANADA"	address_1
SELECT city_name FROM City WHERE country  =  "USA" ORDER BY latitude	address_1
SELECT city_name FROM City WHERE country  =  "USA" ORDER BY latitude	address_1
SELECT state ,  count(*) FROM City GROUP BY state	address_1
SELECT state ,  count(*) FROM City GROUP BY state	address_1
select country ,  count(*) from city group by country	address_1
SELECT country ,  count(*) FROM City GROUP BY country	address_1
SELECT state FROM City GROUP BY state HAVING count(*)  >=  2	address_1
SELECT state FROM City GROUP BY state HAVING count(*)  >=  2	address_1
SELECT state FROM city GROUP BY state HAVING COUNT(city_name) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) as Cnt FROM city GROUP BY state))	address_1
SELECT state FROM city GROUP BY state HAVING COUNT(city_name) = (SELECT MAX(city_count) FROM (SELECT COUNT(city_name) AS city_count FROM city GROUP BY state))	address_1
SELECT country FROM city GROUP BY country HAVING COUNT(city_code) = (SELECT MIN(total) FROM (SELECT COUNT(city_code) AS total FROM city GROUP BY country))	address_1
WITH CityCount AS (SELECT country, COUNT(*) AS count FROM city GROUP BY country) SELECT country FROM CityCount WHERE count = (SELECT MIN(count) FROM CityCount)	address_1
SELECT T2.Fname ,  T2.Lname FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "MD"	address_1
SELECT T2.Fname ,  T2.Lname FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "MD"	address_1
SELECT count(*) FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.country  =  "CHINA"	address_1
SELECT count(*) FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.country  =  "CHINA"	address_1
SELECT T2.Fname ,  T2.Major FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.city_name  =  "Baltimore"	address_1
SELECT T2.Fname ,  T2.Major FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.city_name  =  "Baltimore"	address_1
SELECT T1.country ,  count(*) FROM City AS T1 LEFT JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country	address_1
SELECT T1.country ,  count(*) FROM City AS T1 LEFT JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country	address_1
SELECT CITY.CITY_NAME, (SELECT COUNT(STUID) FROM STUDENT WHERE CITY_CODE = CITY.CITY_CODE) AS STUDENT_COUNT FROM CITY	address_1
SELECT CITY.CITY_NAME, (SELECT COUNT(STUID) FROM STUDENT WHERE CITY_CODE = CITY.CITY_CODE) AS STUDENT_COUNT FROM CITY	address_1
SELECT state FROM city INNER JOIN student ON city.city_code = student.city_code GROUP BY state HAVING COUNT(student.city_code) = (SELECT MAX(c) FROM (SELECT COUNT(student.city_code) AS c FROM city JOIN student ON city.city_code = student.city_code GROUP BY state))	address_1
SELECT state FROM city INNER JOIN student ON city.city_code = student.city_code GROUP BY state HAVING COUNT(student.city_code) = (SELECT MAX(c) FROM (SELECT COUNT(student.city_code) AS c FROM city JOIN student ON city.city_code = student.city_code GROUP BY state))	address_1
WITH StudentCount AS (SELECT country, COUNT(student.stuid) AS s_count FROM city LEFT JOIN student ON city.city_code = student.city_code GROUP BY country) SELECT country FROM StudentCount WHERE s_count = (SELECT min(s_count) FROM StudentCount)	address_1
WITH StudentCount AS (SELECT country, COUNT(student.stuid) AS s_count FROM city LEFT JOIN student ON city.city_code = student.city_code GROUP BY country) SELECT country FROM StudentCount WHERE s_count = (SELECT min(s_count) FROM StudentCount)	address_1
SELECT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_code HAVING count(*)  >=  3	address_1
SELECT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_code HAVING count(*)  >=  3	address_1
SELECT T1.state FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state HAVING count(*)  >  5	address_1
SELECT T1.state FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state HAVING count(*)  >  5	address_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE country  =  "USA"	address_1
SELECT StuID FROM Student EXCEPT SELECT StuID FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE country  =  "USA"	address_1
SELECT StuID FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "PA"  AND T2.sex  =  'F'	address_1
SELECT StuID FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "PA"  AND T2.sex  =  'F'	address_1
SELECT StuID FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T2.sex  =  'M' AND T1.country != "USA"	address_1
SELECT StuID FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T2.sex  =  'M' AND T1.country != "USA"	address_1
SELECT distance FROM Direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"	address_1
SELECT distance FROM Direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"	address_1
SELECT distance FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code JOIN City AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.city_name  =  "Boston" AND T3.city_name  =  "Newark"	address_1
SELECT distance FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code JOIN City AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.city_name  =  "Boston" AND T3.city_name  =  "Newark"	address_1
SELECT avg(distance) ,  min(distance) ,  max(distance) FROM Direct_distance	address_1
SELECT avg(distance) ,  min(distance) ,  max(distance) FROM Direct_distance	address_1
SELECT city1_code, city2_code FROM direct_distance WHERE distance = (SELECT MAX(distance) FROM direct_distance)	address_1
SELECT city1_code, city2_code FROM direct_distance WHERE distance = (SELECT MAX(distance) FROM direct_distance)	address_1
SELECT city1_code ,  city2_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)	address_1
SELECT city1_code ,  city2_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)	address_1
SELECT city1_code ,  city2_code FROM Direct_distance WHERE distance  <  1000	address_1
SELECT city1_code ,  city2_code FROM Direct_distance WHERE distance  <  1000	address_1
SELECT sum(distance) FROM Direct_distance WHERE city1_code  =  "BAL"	address_1
SELECT sum(distance) FROM Direct_distance WHERE city1_code  =  "BAL"	address_1
SELECT avg(distance) FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Boston"	address_1
SELECT avg(distance) FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Boston"	address_1
SELECT city_name FROM ( SELECT T3.city_name, rank() OVER (ORDER BY T1.distance) as rk FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code = T2.city_code JOIN City AS T3 ON T1.city2_code = T3.city_code WHERE T2.city_name = 'Chicago' ) AS subquery WHERE rk = 1	address_1
SELECT city_name FROM ( SELECT T3.city_name, rank() OVER (ORDER BY T1.distance) as rk FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code = T2.city_code JOIN City AS T3 ON T1.city2_code = T3.city_code WHERE T2.city_name = 'Chicago' ) AS subquery WHERE rk = 1	address_1
SELECT city_name FROM ( SELECT T3.city_name, rank() OVER (ORDER BY T1.distance DESC) as rk FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code = T2.city_code JOIN City AS T3 ON T1.city2_code = T3.city_code WHERE T2.city_name = 'Boston' ) AS subquery WHERE rk = 1	address_1
SELECT city_name FROM ( SELECT T3.city_name, rank() OVER (ORDER BY T1.distance DESC) as rk FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code = T2.city_code JOIN City AS T3 ON T1.city2_code = T3.city_code WHERE T2.city_name = 'Boston' ) AS subquery WHERE rk = 1	address_1
SELECT city1_code ,  sum(distance) FROM Direct_distance GROUP BY city1_code	address_1
SELECT city1_code ,  sum(distance) FROM Direct_distance GROUP BY city1_code	address_1
SELECT city_name, (SELECT AVG(distance) FROM direct_distance WHERE city_code = city1_code) AS average_distance FROM city	address_1
SELECT city_name, (SELECT AVG(distance) FROM direct_distance WHERE city_code = city1_code) AS average_distance FROM city	address_1
SELECT distance FROM Direct_distance AS T1 JOIN Student AS T2 ON T1.city1_code  =  T2.city_code JOIN Student AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.Fname  =  "Linda" AND T2.Lname  =  "Smith" AND T3.Fname  =  "Tracy" AND T3.Lname  =  "Kim"	address_1
SELECT distance FROM Direct_distance AS T1 JOIN Student AS T2 ON T1.city1_code  =  T2.city_code JOIN Student AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.Fname  =  "Linda" AND T2.Lname  =  "Smith" AND T3.Fname  =  "Tracy" AND T3.Lname  =  "Kim"	address_1
SELECT fn.fname, fn.lname FROM student fn, direct_distance dd, (SELECT st.city_code FROM student st WHERE st.fname = 'Linda' AND st.lname = 'Smith') linda WHERE fn.city_code = dd.city2_code AND dd.distance = (SELECT MAX(distance) FROM direct_distance WHERE city1_code = linda.city_code)	address_1
SELECT fn.fname, fn.lname FROM student fn, direct_distance dd, (SELECT st.city_code FROM student st WHERE st.fname = 'Linda' AND st.lname = 'Smith') linda WHERE fn.city_code = dd.city2_code AND dd.distance = (SELECT MAX(distance) FROM direct_distance WHERE city1_code = linda.city_code)	address_1
SELECT state FROM city WHERE city_code IN (SELECT city_code FROM student WHERE fname = 'Linda')	address_1
SELECT state FROM city WHERE city_code IN (SELECT city_code FROM student WHERE fname = 'Linda')	address_1
SELECT * FROM Sailors WHERE age  >  30	boat_1
SELECT * FROM Sailors WHERE age  >  30	boat_1
SELECT name ,  age FROM Sailors WHERE age  <  30	boat_1
SELECT name ,  age FROM Sailors WHERE age  <  30	boat_1
SELECT DISTINCT bid FROM Reserves WHERE sid = 1	boat_1
SELECT DISTINCT bid FROM Reserves WHERE sid = 1	boat_1
SELECT name FROM sailors WHERE sid IN (SELECT sid FROM reserves WHERE bid = 102)	boat_1
SELECT name FROM sailors WHERE sid IN (SELECT sid FROM reserves WHERE bid = 102)	boat_1
SELECT DISTINCT bid FROM Reserves	boat_1
SELECT DISTINCT bid FROM Reserves	boat_1
SELECT name FROM Sailors WHERE name LIKE '%e%'	boat_1
SELECT name FROM Sailors WHERE name LIKE '%e%'	boat_1
SELECT S.sid FROM sailors S WHERE S.age > (SELECT MAX(S2.age) FROM sailors S2 WHERE S2.sid != S.sid)	boat_1
SELECT DISTINCT sid FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors);	boat_1
SELECT DISTINCT s1.name FROM Sailors s1 WHERE s1.age  >  (SELECT max(s2.age) FROM Sailors s2 WHERE s2.sid != s1.sid AND s2.rating  >  7);	boat_1
SELECT DISTINCT name FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors WHERE rating  >  7);	boat_1
SELECT DISTINCT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid	boat_1
SELECT DISTINCT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid	boat_1
SELECT S.sid, S.name FROM sailors S INNER JOIN reserves R ON S.sid = R.sid GROUP BY S.sid, S.name HAVING COUNT(DISTINCT R.bid) > 1	boat_1
SELECT DISTINCT sailors.name FROM sailors JOIN reserves ON sailors.sid = reserves.sid GROUP BY sailors.sid HAVING COUNT(DISTINCT reserves.bid) >= 2	boat_1
SELECT DISTINCT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid WHERE T1.color  =  'red' OR T1.color  =  "blue"	boat_1
SELECT DISTINCT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid WHERE T1.color  =  'red' OR T1.color  =  "blue"	boat_1
SELECT DISTINCT T2.sid ,  T3.name FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  'red' OR T1.color  =  "blue"	boat_1
SELECT DISTINCT T2.sid ,  T3.name FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  'red' OR T1.color  =  "blue"	boat_1
SELECT DISTINCT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid WHERE T1.color  =  'red' INTERSECT SELECT DISTINCT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid WHERE T1.color  =  "blue"	boat_1
SELECT DISTINCT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid WHERE T1.color  =  'red' INTERSECT SELECT DISTINCT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid WHERE T1.color  =  "blue"	boat_1
SELECT DISTINCT T2.sid ,  T3.name FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  'red' INTERSECT SELECT DISTINCT T2.sid ,  T3.name FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  "blue"	boat_1
SELECT DISTINCT T2.sid ,  T3.name FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  'red' INTERSECT SELECT DISTINCT T2.sid ,  T3.name FROM Boats AS T1 JOIN Reserves AS T2 ON  T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  "blue"	boat_1
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves	boat_1
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves	boat_1
SELECT sid ,  name FROM Sailors EXCEPT SELECT T1.sid ,  T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid	boat_1
SELECT sid ,  name FROM Sailors EXCEPT SELECT T1.sid ,  T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid	boat_1
SELECT sid FROM Sailors EXCEPT SELECT T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid	boat_1
SELECT sid FROM Sailors EXCEPT SELECT T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid	boat_1
SELECT name FROM sailors WHERE sid IN (SELECT sid FROM reserves WHERE bid = 103)	boat_1
SELECT name FROM sailors WHERE sid IN (SELECT sid FROM reserves WHERE bid = 103)	boat_1
SELECT S.name FROM sailors S WHERE NOT EXISTS (SELECT 1 FROM sailors S2 WHERE S2.name = 'Luis' AND S2.rating >= S.rating)	boat_1
SELECT S.name FROM sailors S WHERE NOT EXISTS (SELECT 1 FROM sailors S2 WHERE S2.name = 'Luis' AND S2.rating >= S.rating)	boat_1
SELECT s.name FROM sailors s WHERE NOT EXISTS (SELECT 1 FROM sailors l WHERE l.name = 'Luis' AND l.rating >= s.rating)	boat_1
SELECT name FROM sailors s1 WHERE NOT EXISTS (SELECT s2.sid FROM sailors s2 WHERE s2.name = 'Luis' AND s1.rating <= s2.rating)	boat_1
SELECT DISTINCT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE  T1.rating  >  2	boat_1
SELECT DISTINCT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE  T1.rating  >  2	boat_1
SELECT name ,  age FROM Sailors WHERE age  =  ( SELECT max(age) FROM Sailors )	boat_1
SELECT name ,  age FROM Sailors WHERE age  =  ( SELECT max(age) FROM Sailors )	boat_1
SELECT COUNT(*) FROM Sailors	boat_1
SELECT COUNT(*) FROM Sailors	boat_1
SELECT AVG(age) FROM Sailors WHERE rating  =  7	boat_1
SELECT AVG(age) FROM Sailors WHERE rating  =  7	boat_1
select count(*) from sailors where name like 'd%'	boat_1
select count(*) from sailors where name like 'd%'	boat_1
SELECT AVG(rating) ,  MAX(age) FROM Sailors	boat_1
SELECT AVG(rating) ,  MAX(age) FROM Sailors	boat_1
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM boats LEFT JOIN reserves ON boats.bid = reserves.bid GROUP BY boats.bid	boat_1
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM boats LEFT JOIN reserves ON boats.bid = reserves.bid GROUP BY boats.bid	boat_1
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM boats LEFT JOIN reserves ON boats.bid = reserves.bid WHERE boats.bid  >  50 GROUP BY boats.bid	boat_1
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM boats LEFT JOIN reserves ON boats.bid = reserves.bid WHERE boats.bid  >  50 GROUP BY boats.bid	boat_1
SELECT bid ,  count(*) FROM Reserves GROUP BY bid HAVING count(*)  >  1	boat_1
SELECT bid ,  count(*) FROM Reserves GROUP BY bid HAVING count(*)  >  1	boat_1
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM boats LEFT JOIN reserves ON boats.bid = reserves.bid WHERE reserves.sid  >  1 GROUP BY boats.bid	boat_1
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM boats LEFT JOIN reserves ON boats.bid = reserves.bid WHERE reserves.sid  >  1 GROUP BY boats.bid	boat_1
SELECT rating, AVG(age) FROM sailors WHERE sid IN (SELECT sid FROM reserves WHERE bid IN (SELECT bid FROM boats WHERE color = 'red')) GROUP BY rating	boat_1
SELECT RATING, AVG(AGE) FROM sailors WHERE sid IN (SELECT sid FROM reserves WHERE bid IN (SELECT bid FROM boats WHERE color = 'red')) GROUP BY RATING	boat_1
SELECT name ,  rating ,  age FROM Sailors ORDER BY rating ,  age	boat_1
SELECT name ,  rating ,  age FROM Sailors ORDER BY rating ,  age	boat_1
SELECT count(*) FROM Boats	boat_1
SELECT count(*) FROM Boats	boat_1
SELECT count(*) FROM Boats WHERE color  =  'red'	boat_1
SELECT count(*) FROM Boats WHERE color  =  'red'	boat_1
SELECT b.name FROM boats b WHERE b.bid IN (SELECT r.bid FROM reserves r INNER JOIN sailors s ON r.sid = s.sid WHERE s.age >= 20 AND s.age <= 30)	boat_1
SELECT b.name FROM boats b WHERE b.bid IN (SELECT r.bid FROM reserves r INNER JOIN sailors s ON r.sid = s.sid WHERE s.age >= 20 AND s.age <= 30)	boat_1
SELECT S.name FROM sailors S WHERE NOT EXISTS (SELECT 1 FROM sailors S2 JOIN reserves R ON S2.sid = R.sid JOIN boats B ON B.bid = R.bid WHERE B.color = 'red' AND S2.rating >= S.rating)	boat_1
SELECT s.name FROM sailors s WHERE NOT EXISTS (SELECT 1 FROM sailors s2 JOIN reserves r ON s2.sid = r.sid JOIN boats b ON r.bid = b.bid WHERE b.color = 'red' AND s2.rating >= s.rating)	boat_1
SELECT max(rating) FROM Sailors	boat_1
SELECT max(rating) FROM Sailors	boat_1
SELECT name FROM sailors WHERE sid IN (SELECT sid FROM reserves WHERE bid IN (SELECT bid FROM boats WHERE name = 'Melon'))	boat_1
SELECT name FROM sailors WHERE sid IN (SELECT sid FROM reserves, boats WHERE reserves.bid = boats.bid AND boats.name = 'Melon')	boat_1
SELECT name ,  age FROM Sailors ORDER BY rating DESC	boat_1
SELECT name ,  age FROM Sailors ORDER BY rating DESC	boat_1
SELECT model FROM headphone WHERE price = (SELECT MAX(price) FROM headphone)	headphone_store
SELECT h1.model FROM headphone AS h1 WHERE NOT EXISTS (SELECT 1 FROM headphone AS h2 WHERE h2.price > h1.price)	headphone_store
SELECT DISTINCT model FROM headphone ORDER BY model	headphone_store
SELECT DISTINCT model FROM headphone ORDER BY model	headphone_store
SELECT h.class FROM headphone h GROUP BY h.class HAVING COUNT(h.class) = (SELECT MAX(freq) FROM (SELECT COUNT(*) freq FROM headphone GROUP BY class) sub)	headphone_store
SELECT class FROM headphone GROUP BY class HAVING COUNT(headphone_id) = (SELECT MAX(count) FROM (SELECT class, COUNT(headphone_id) AS count FROM headphone GROUP BY class))	headphone_store
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  >  2	headphone_store
SELECT h.class FROM headphone h GROUP BY h.class HAVING COUNT(DISTINCT h.headphone_id) <= 2	headphone_store
SELECT count(*) ,  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS	headphone_store
SELECT count(*) ,  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS	headphone_store
SELECT count(DISTINCT earpads) FROM headphone	headphone_store
SELECT count(DISTINCT earpads) FROM headphone	headphone_store
SELECT earpads FROM ( SELECT earpads, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM headphone GROUP BY earpads ) AS subquery WHERE rk <= 2	headphone_store
SELECT earpads FROM ( SELECT earpads, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM headphone GROUP BY earpads ) AS subquery WHERE rk <= 2	headphone_store
SELECT model, class, construction FROM headphone WHERE price = (SELECT MIN(price) FROM headphone)	headphone_store
SELECT model, class, construction FROM headphone WHERE price = (SELECT MIN(price) FROM headphone)	headphone_store
SELECT construction ,  avg(price) FROM headphone GROUP BY construction	headphone_store
SELECT construction ,  avg(price) FROM headphone GROUP BY construction	headphone_store
SELECT CLASS FROM headphone WHERE earpads  =  'Bowls' INTERSECT SELECT CLASS FROM headphone WHERE earpads  =  'Comfort Pads'	headphone_store
SELECT CLASS FROM headphone WHERE earpads  =  'Bowls' INTERSECT SELECT CLASS FROM headphone WHERE earpads  =  'Comfort Pads'	headphone_store
SELECT earpads FROM headphone EXCEPT SELECT earpads FROM headphone WHERE construction  =  'Plastic'	headphone_store
SELECT earpads FROM headphone EXCEPT SELECT earpads FROM headphone WHERE construction  =  'Plastic'	headphone_store
SELECT model FROM headphone WHERE price  <  (SELECT avg(price) FROM headphone)	headphone_store
SELECT model FROM headphone WHERE price  <  (SELECT avg(price) FROM headphone)	headphone_store
SELECT name FROM store ORDER BY date_opened	headphone_store
SELECT name FROM store ORDER BY date_opened	headphone_store
SELECT name ,  parking FROM store WHERE neighborhood  =  'Tarzana'	headphone_store
SELECT name ,  parking FROM store WHERE neighborhood  =  'Tarzana'	headphone_store
SELECT count(DISTINCT neighborhood) FROM store	headphone_store
SELECT count(DISTINCT neighborhood) FROM store	headphone_store
SELECT count(*) ,  neighborhood FROM store GROUP BY neighborhood	headphone_store
SELECT count(*) ,  neighborhood FROM store GROUP BY neighborhood	headphone_store
SELECT name, sum FROM ( SELECT t1.name, SUM(t2.quantity) as sum, RANK() OVER (ORDER BY SUM(t2.quantity) DESC) as rk FROM store AS t1 JOIN stock AS t2 ON t1.store_id = t2.store_id GROUP BY t2.store_id ) AS subquery WHERE rk = 1	headphone_store
SELECT s.name, (SELECT SUM(st.quantity) FROM stock st WHERE st.store_id = s.store_id GROUP BY st.store_id) AS Quantity FROM store s	headphone_store
SELECT name FROM store WHERE store_id NOT IN (SELECT store_id FROM stock WHERE quantity > 0)	headphone_store
SELECT name FROM store WHERE store_id NOT IN (SELECT DISTINCT store_id FROM stock WHERE quantity > 0)	headphone_store
SELECT DISTINCT h.model FROM headphone h WHERE NOT EXISTS (SELECT 1 FROM stock s WHERE s.headphone_id = h.headphone_id AND quantity > 0)	headphone_store
SELECT DISTINCT h.model FROM headphone h WHERE NOT EXISTS (SELECT 1 FROM stock s WHERE s.headphone_id = h.headphone_id AND quantity > 0)	headphone_store
SELECT model FROM (SELECT t1.model, rank() over (ORDER BY sum(t2.quantity) DESC ) as rk FROM headphone AS t1 JOIN stock AS t2 ON t1.headphone_id = t2.headphone_id GROUP BY t1.model) WHERE rk = 1;	headphone_store
SELECT model FROM headphone WHERE headphone_id IN (SELECT headphone_id FROM stock GROUP BY headphone_id HAVING SUM(quantity) = (SELECT MAX(total_quantity) FROM (SELECT SUM(quantity) AS total_quantity FROM stock GROUP BY headphone_id)))	headphone_store
SELECT sum(t2.quantity) FROM store AS t1 JOIN stock AS t2 ON t1.store_id  =  t2.store_id WHERE t1.name  =  'Woodman'	headphone_store
SELECT sum(t2.quantity) FROM store AS t1 JOIN stock AS t2 ON t1.store_id  =  t2.store_id WHERE t1.name  =  'Woodman'	headphone_store
SELECT neighborhood FROM store EXCEPT SELECT neighborhood FROM store WHERE store_id IN (SELECT store_id FROM stock WHERE quantity > 0)	headphone_store
SELECT s.neighborhood FROM store s LEFT JOIN stock st ON s.store_id = st.store_id GROUP BY s.neighborhood HAVING SUM(st.quantity) IS NULL OR SUM(st.quantity) = 0	headphone_store
SELECT count(*) FROM Author	aan_1
SELECT count(*) FROM Author	aan_1
SELECT count(*) FROM Paper	aan_1
SELECT count(*) FROM Paper	aan_1
SELECT count(*) FROM Affiliation	aan_1
SELECT count(*) FROM Affiliation	aan_1
SELECT count(*) FROM Paper WHERE venue  =  "NAACL" AND YEAR  =  2000	aan_1
SELECT count(*) FROM Paper WHERE venue  =  "NAACL" AND YEAR  =  2000	aan_1
SELECT count(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T3.name LIKE "Columbia University" AND T1.year  =  2009	aan_1
SELECT count(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T3.name LIKE "Columbia University" AND T1.year  =  2009	aan_1
SELECT name, address FROM affiliation	aan_1
SELECT name, address FROM affiliation;	aan_1
SELECT venue, year FROM paper ORDER BY year	aan_1
SELECT DISTINCT venue ,  YEAR FROM paper ORDER BY YEAR	aan_1
SELECT DISTINCT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T3.name  =  "Harvard University"	aan_1
SELECT DISTINCT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T3.name  =  "Harvard University"	aan_1
SELECT title, paper_id FROM paper WHERE paper_id IN (SELECT paper_id FROM author_list WHERE author_id IN (SELECT author_id FROM author WHERE name = '%Mckeown%'))	aan_1
SELECT title, paper_id FROM paper WHERE paper_id IN (SELECT paper_id FROM author_list WHERE author_id IN (SELECT author_id FROM author WHERE name = '%Mckeown%'))	aan_1
SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T3.name LIKE "Stanford University" INTERSECT SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T3.name LIKE "Columbia University"	aan_1
SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T3.name LIKE "Stanford University" INTERSECT SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T3.name LIKE "Columbia University"	aan_1
SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name LIKE "%Mckeown ,  Kathleen%" INTERSECT SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name LIKE "%Rambow ,  Owen%"	aan_1
SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name LIKE "%Mckeown ,  Kathleen%" INTERSECT SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name LIKE "%Rambow ,  Owen%"	aan_1
SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name LIKE "%Mckeown%" EXCEPT SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name LIKE "%Rambow%"	aan_1
SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name LIKE "%Mckeown%" EXCEPT SELECT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE T3.name LIKE "%Rambow%"	aan_1
SELECT DISTINCT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE  T3.name LIKE "%Mckeown,  Kathleen%" OR T3.name LIKE "%Rambow,  Owen%"	aan_1
SELECT DISTINCT T1.title ,  T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Author AS T3 ON T2.author_id  =  T3.author_id WHERE  T3.name LIKE "%Mckeown,  Kathleen%" OR T3.name LIKE "%Rambow,  Owen%"	aan_1
SELECT aut.name, (SELECT COUNT(*) FROM paper WHERE paper.paper_id IN (SELECT author_list.paper_id FROM author_list WHERE author_list.author_id = aut.author_id)) AS paper_num FROM author aut GROUP BY aut.author_id ORDER BY paper_num DESC	aan_1
SELECT aut.name, (SELECT COUNT(*) FROM paper WHERE paper.paper_id IN (SELECT author_list.paper_id FROM author_list WHERE author_list.author_id = aut.author_id)) AS paper_num FROM author aut GROUP BY aut.author_id ORDER BY paper_num DESC	aan_1
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.affiliation_id ORDER BY count(*) DESC	aan_1
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.affiliation_id ORDER BY count(*) DESC	aan_1
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING count(*)  >  50	aan_1
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING count(*)  >  50	aan_1
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING count(*)  =  1	aan_1
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING count(*)  =  1	aan_1
SELECT venue, year FROM paper GROUP BY venue, year HAVING COUNT(paper_id) = (SELECT MAX(count) FROM (SELECT COUNT(paper_id) as count FROM paper GROUP BY venue, year))	aan_1
SELECT p.venue, p.year FROM paper p GROUP BY p.venue, p.year HAVING COUNT(p.paper_id) = (SELECT MAX(c) FROM (SELECT COUNT(paper_id) AS c FROM paper GROUP BY venue, year) t)	aan_1
SELECT p.venue FROM paper p GROUP BY p.venue HAVING COUNT(p.paper_id) = (SELECT MIN(c.count) FROM (SELECT COUNT(paper_id) AS count FROM paper GROUP BY venue) c)	aan_1
WITH VenueCount AS (SELECT venue, COUNT(paper_id) as cnt FROM paper GROUP BY venue) SELECT venue FROM VenueCount WHERE cnt = (SELECT MIN(cnt) FROM VenueCount)	aan_1
SELECT count(*) FROM Citation WHERE cited_paper_id  =  "A00-1002"	aan_1
SELECT count(*) FROM Citation WHERE cited_paper_id  =  "A00-1002"	aan_1
SELECT count(*) FROM Citation WHERE paper_id  =  "D12-1027"	aan_1
SELECT count(*) FROM Citation WHERE paper_id  =  "D12-1027"	aan_1
SELECT cited_paper_id, COUNT(cited_paper_id) as total_citations FROM citation GROUP BY cited_paper_id HAVING total_citations = (SELECT MAX(citation_count) FROM (SELECT COUNT(*) as citation_count FROM citation GROUP BY cited_paper_id))	aan_1
SELECT cited_paper_id, COUNT(cited_paper_id) as total_citations FROM citation GROUP BY cited_paper_id HAVING total_citations = (SELECT MAX(citation_count) FROM (SELECT COUNT(*) as citation_count FROM citation GROUP BY cited_paper_id))	aan_1
SELECT title FROM (SELECT T2.title, rank() over (ORDER BY count(*) DESC) as rk FROM Citation AS T1 JOIN Paper AS T2 ON T2.paper_id  =  T1.paper_id GROUP BY T1.paper_id) WHERE rk = 1	aan_1
SELECT title FROM (SELECT T2.title, rank() over (ORDER BY count(*) DESC) as rk FROM Citation AS T1 JOIN Paper AS T2 ON T2.paper_id  =  T1.paper_id GROUP BY T1.paper_id) WHERE rk = 1	aan_1
SELECT cited_paper_id, cnt FROM (SELECT cited_paper_id ,  count(*) as cnt, RANK() OVER (ORDER BY count(*) DESC) as rk FROM Citation GROUP BY cited_paper_id) WHERE rk <= 10	aan_1
SELECT cited_paper_id, cnt FROM (SELECT cited_paper_id ,  count(*) as cnt, RANK() OVER (ORDER BY count(*) DESC) as rk FROM Citation GROUP BY cited_paper_id) WHERE rk <= 10	aan_1
select count(*) from citation as t1 join author_list as t2 on t1.cited_paper_id  =  t2.paper_id join author as t3 on t2.author_id  =  t3.author_id where t3.name = "mckeown ,  kathleen"	aan_1
select count(*) from citation as t1 join author_list as t2 on t1.cited_paper_id  =  t2.paper_id join author as t3 on t2.author_id  =  t3.author_id where t3.name = "mckeown ,  kathleen"	aan_1
select count(*) from citation as t1 join author_list as t2 on t1.paper_id  =  t2.paper_id join author as t3 on t2.author_id  =  t3.author_id where t3.name = "mckeown ,  kathleen"	aan_1
select count(*) from citation as t1 join author_list as t2 on t1.paper_id  =  t2.paper_id join author as t3 on t2.author_id  =  t3.author_id where t3.name = "mckeown ,  kathleen"	aan_1
SELECT name, cnt FROM ( SELECT T3.name, count(*) as cnt, RANK() OVER (ORDER BY count(*) DESC) as rk FROM Citation AS T1 JOIN Author_list AS T2 ON T1.cited_paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id GROUP BY T2.author_id ) WHERE rk <= 1	aan_1
SELECT name, cnt FROM ( SELECT T3.name, count(*) as cnt, RANK() OVER (ORDER BY count(*) DESC) as rk FROM Citation AS T1 JOIN Author_list AS T2 ON T1.cited_paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id GROUP BY T2.author_id ) WHERE rk <= 1	aan_1
select distinct t1.venue ,  t1.year from paper as t1 join author_list as t2 on t1.paper_id  =  t2.paper_id join author as t3 on t2.author_id  =  t3.author_id where t3.name = "mckeown ,  kathleen"	aan_1
select distinct t1.venue ,  t1.year from paper as t1 join author_list as t2 on t1.paper_id  =  t2.paper_id join author as t3 on t2.author_id  =  t3.author_id where t3.name = "mckeown ,  kathleen"	aan_1
SELECT DISTINCT p.venue, p.year FROM paper p JOIN author_list al ON p.paper_id = al.paper_id JOIN affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Columbia University'	aan_1
SELECT DISTINCT P.venue, P.year FROM paper P JOIN author_list AL ON P.paper_id = AL.paper_id JOIN affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'	aan_1
SELECT name FROM ( SELECT T3.name, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T3.author_id = T2.author_id WHERE T1.year = 2009 GROUP BY T2.author_id ) AS subquery WHERE rk = 1	aan_1
SELECT name FROM ( SELECT T3.name, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T3.author_id = T2.author_id WHERE T1.year = 2009 GROUP BY T2.author_id ) AS subquery WHERE rk = 1	aan_1
SELECT name FROM ( SELECT T3.name, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T1.year = 2009 GROUP BY T2.affiliation_id ) AS subquery WHERE rk <= 3	aan_1
SELECT name FROM ( SELECT T3.name, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T1.year = 2009 GROUP BY T2.affiliation_id ) AS subquery WHERE rk <= 3	aan_1
SELECT COUNT(DISTINCT paper.paper_id) FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN affiliation ON affiliation.affiliation_id = author_list.affiliation_id WHERE affiliation.name = 'Columbia University' AND paper.year <= 2009	aan_1
SELECT COUNT(DISTINCT paper.paper_id) FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN affiliation ON author_list.affiliation_id = affiliation.affiliation_id WHERE affiliation.name = 'Columbia University' AND paper.year <= 2009	aan_1
SELECT count(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T1.year  >=  2000 AND T1.year  <=  2009 AND T3.name LIKE "Stanford University"	aan_1
SELECT count(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T1.year  >=  2000 AND T1.year  <=  2009 AND T3.name LIKE "Stanford University"	aan_1
SELECT P.title FROM paper P WHERE P.paper_id IN (SELECT A.paper_id FROM author_list A GROUP BY A.paper_id HAVING COUNT(A.author_id) = (SELECT MAX(T.auth_count) FROM (SELECT COUNT(author_id) AS auth_count FROM author_list GROUP BY paper_id) T))	aan_1
SELECT P.title FROM paper P WHERE P.paper_id IN (SELECT A.paper_id FROM author_list A GROUP BY A.paper_id HAVING COUNT(A.author_id) = (SELECT MAX(T.auth_count) FROM (SELECT COUNT(author_id) AS auth_count FROM author_list GROUP BY paper_id) T))	aan_1
select count (distinct t2.author_id) from author_list as t1 join author_list as t2 on t1.paper_id  =  t2.paper_id and t1.author_id != t2.author_id join author as t3 on t1.author_id  =  t3.author_id where t3.name = "mckeown ,  kathleen"	aan_1
select count (distinct t2.author_id) from author_list as t1 join author_list as t2 on t1.paper_id  =  t2.paper_id and t1.author_id != t2.author_id join author as t3 on t1.author_id  =  t3.author_id where t3.name = "mckeown ,  kathleen"	aan_1
SELECT name FROM ( SELECT t4.name, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM author_list as t1 JOIN author_list as t2 ON t1.paper_id = t2.paper_id AND t1.author_id != t2.author_id JOIN author as t3 ON t1.author_id = t3.author_id JOIN author as t4 ON t2.author_id = t4.author_id WHERE t3.name = 'mckeown , kathleen' GROUP BY t2.author_id ) AS subquery WHERE rk = 1	aan_1
SELECT name FROM ( SELECT t4.name, RANK() OVER (ORDER BY COUNT(*) DESC) as rk FROM author_list as t1 JOIN author_list as t2 ON t1.paper_id = t2.paper_id AND t1.author_id != t2.author_id JOIN author as t3 ON t1.author_id = t3.author_id JOIN author as t4 ON t2.author_id = t4.author_id WHERE t3.name = 'mckeown , kathleen' GROUP BY t2.author_id ) AS subquery WHERE rk = 1	aan_1
SELECT paper_id FROM Paper WHERE title LIKE "%translation%"	aan_1
SELECT paper_id FROM Paper WHERE title LIKE "%translation%"	aan_1
SELECT paper_id ,  title FROM Paper WHERE paper_id NOT IN (SELECT cited_paper_id FROM Citation)	aan_1
SELECT paper_id ,  title FROM Paper WHERE paper_id NOT IN (SELECT cited_paper_id FROM Citation)	aan_1
SELECT a.name FROM affiliation a WHERE a.address LIKE '%China%' AND a.affiliation_id IN (SELECT al.affiliation_id FROM author_list al GROUP BY al.affiliation_id HAVING COUNT(DISTINCT al.paper_id) = (SELECT MAX(c) FROM (SELECT COUNT(paper_id) AS c FROM author_list WHERE affiliation_id IN (SELECT affiliation_id FROM affiliation WHERE address LIKE '%China%') GROUP BY affiliation_id)))	aan_1
SELECT a.name FROM affiliation a WHERE a.address LIKE '%China%' AND a.affiliation_id IN (SELECT al.affiliation_id FROM author_list al GROUP BY al.affiliation_id HAVING COUNT(DISTINCT al.paper_id) = (SELECT MAX(c) FROM (SELECT COUNT(paper_id) AS c FROM author_list WHERE affiliation_id IN (SELECT affiliation_id FROM affiliation WHERE address LIKE '%China%') GROUP BY affiliation_id)))	aan_1
SELECT count(*) ,  venue ,  YEAR FROM Paper GROUP BY venue ,  YEAR	aan_1
SELECT count(*) ,  venue ,  YEAR FROM Paper GROUP BY venue ,  YEAR	aan_1
SELECT count(DISTINCT T2.paper_id) ,  T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.affiliation_id	aan_1
SELECT count(DISTINCT T2.paper_id) ,  T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.affiliation_id	aan_1
SELECT T2.title FROM Citation AS T1 JOIN Paper AS T2 ON T1.cited_paper_id  =  T2.paper_id GROUP BY T1.cited_paper_id HAVING count(*)  >  50	aan_1
SELECT T2.title FROM Citation AS T1 JOIN Paper AS T2 ON T1.cited_paper_id  =  T2.paper_id GROUP BY T1.cited_paper_id HAVING count(*)  >  50	aan_1
SELECT count(*) FROM Author WHERE Author_id NOT IN ( SELECT T2.author_id FROM Citation AS T1 JOIN Author_list AS T2 ON T1.cited_paper_id  =  T2.paper_id GROUP BY T1.cited_paper_id HAVING count(DISTINCT T1.paper_id)  >  50)	aan_1
SELECT count(*) FROM Author WHERE Author_id NOT IN ( SELECT T2.author_id FROM Citation AS T1 JOIN Author_list AS T2 ON T1.cited_paper_id  =  T2.paper_id GROUP BY T1.cited_paper_id HAVING count(DISTINCT T1.paper_id)  >  50)	aan_1
SELECT name FROM Author WHERE author_id IN (SELECT T1.author_id FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "ACL" AND T2.year  =  2009 INTERSECT SELECT T1.author_id FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "NAACL" AND T2.year  =  2009)	aan_1
SELECT name FROM Author WHERE author_id IN (SELECT T1.author_id FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "ACL" AND T2.year  =  2009 INTERSECT SELECT T1.author_id FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "NAACL" AND T2.year  =  2009)	aan_1
SELECT name FROM Author WHERE author_id NOT IN (SELECT T1.author_id FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "ACL")	aan_1
SELECT name FROM Author WHERE author_id NOT IN (SELECT T1.author_id FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "ACL")	aan_1
SELECT count(*) FROM conference	conference
SELECT count(*) FROM conference	conference
SELECT DISTINCT conference_name FROM conference	conference
SELECT DISTINCT conference_name FROM conference	conference
SELECT conference_name ,  YEAR ,  LOCATION FROM conference	conference
SELECT conference_name ,  YEAR ,  LOCATION FROM conference	conference
SELECT conference_name ,  count(*) FROM conference GROUP BY conference_name	conference
SELECT conference_name ,  count(*) FROM conference GROUP BY conference_name	conference
SELECT YEAR ,  count(*) FROM conference GROUP BY YEAR	conference
SELECT YEAR ,  count(*) FROM conference GROUP BY YEAR	conference
SELECT year FROM conference GROUP BY year HAVING COUNT(*) = (SELECT MIN(c) FROM (SELECT COUNT(*) AS c FROM conference GROUP BY year))	conference
SELECT a.year FROM (SELECT year, COUNT(conference_id) transmission_count FROM conference GROUP BY year) a WHERE a.transmission_count = (SELECT MIN(transmission_count) FROM (SELECT COUNT(conference_id) transmission_count FROM conference GROUP BY year))	conference
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING count(*)  >=  2	conference
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING count(*)  >=  2	conference
SELECT institution_name ,  LOCATION ,  founded FROM institution	conference
SELECT institution_name ,  LOCATION ,  founded FROM institution	conference
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900	conference
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900	conference
SELECT i.institution_name, i.location FROM institution i WHERE i.founded = (SELECT MAX(founded) FROM institution)	conference
SELECT i.institution_name, i.location FROM institution i WHERE i.founded = (SELECT MAX(founded) FROM institution)	conference
SELECT institution_name, (SELECT COUNT(*) FROM staff WHERE staff.institution_id = institution.institution_id) AS staff_count FROM institution WHERE founded > 1800	conference
SELECT institution_name, (SELECT COUNT(*) FROM staff WHERE staff.institution_id = institution.institution_id) AS staff_count FROM institution WHERE founded > 1800	conference
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)	conference
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)	conference
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)	conference
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)	conference
SELECT MAX(age) AS maximum_age, MIN(age) AS minimum_age FROM staff WHERE nationality = 'United States';	conference
SELECT max(age) ,  min(age) FROM staff	conference
SELECT conference_name FROM conference WHERE conference_id IN (SELECT conference_id FROM conference_participation WHERE staff_id IN (SELECT staff_id FROM staff WHERE nationality = 'Canada'))	conference
SELECT conference_name FROM conference WHERE conference_id IN (SELECT conference_id FROM conference_participation WHERE staff_id IN (SELECT staff_id FROM staff WHERE nationality = 'Canada'))	conference
SELECT name FROM staff WHERE staff_id IN (SELECT staff_id FROM conference_participation WHERE role = 'Speaker' INTERSECT SELECT staff_id FROM conference_participation WHERE role = 'Sponsor')	conference
SELECT name FROM staff WHERE staff_id IN (SELECT staff_id FROM conference_participation WHERE role = 'Speaker') AND staff_id IN (SELECT staff_id FROM conference_participation WHERE role = 'Sponsor')	conference
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE s.staff_id = cp.staff_id AND c.conference_name = 'ACL') AND EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE s.staff_id = cp.staff_id AND c.conference_name = 'Naccl')	conference
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE s.staff_id = cp.staff_id AND c.conference_name = 'ACL') AND EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE s.staff_id = cp.staff_id AND c.conference_name = 'NACCL')	conference
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE cp.staff_id = s.staff_id AND c.year IN (2003, 2004))	conference
SELECT name FROM staff WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE cp.staff_id = staff.staff_id AND (c.year BETWEEN 2003 AND 2004))	conference
SELECT c.conference_name, c.year, (SELECT COUNT(*) FROM conference_participation WHERE conference_participation.conference_id = c.conference_id) AS participants FROM conference c	conference
SELECT c.conference_id, c.conference_name, c.year, (SELECT COUNT(*) FROM conference_participation WHERE conference_id = c.conference_id) AS num_participants FROM conference AS c	conference
SELECT conference_name FROM (SELECT T1.conference_name, rank() over (ORDER BY count(*) DESC) as rk FROM Conference AS T1 JOIN Conference_participation AS T2 ON T1.conference_id = T2.conference_id GROUP BY T2.conference_id) WHERE rk <= 2	conference
SELECT conference_name FROM (SELECT T1.conference_name, rank() over (ORDER BY count(*) DESC) as rk FROM Conference AS T1 JOIN Conference_participation AS T2 ON T1.conference_id = T2.conference_id GROUP BY T2.conference_id) WHERE rk <= 2	conference
SELECT name ,  nationality FROM staff WHERE staff_id NOT IN (SELECT T2.staff_id FROM Conference AS T1 JOIN Conference_participation AS T2 ON T1.conference_id  =  T2.conference_id WHERE T1.Conference_Name  =  "ACL")	conference
SELECT name ,  nationality FROM staff WHERE staff_id NOT IN (SELECT T2.staff_id FROM Conference AS T1 JOIN Conference_participation AS T2 ON T1.conference_id  =  T2.conference_id WHERE T1.Conference_Name  =  "ACL")	conference
SELECT i.institution_name, i.location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_id = cp.staff_id JOIN conference c ON c.conference_id = cp.conference_id WHERE c.year = 2004 AND s.institution_id = i.institution_id)	conference
SELECT i.institution_name, i.location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_id = cp.staff_id JOIN conference c ON cp.conference_id = c.conference_id WHERE s.institution_id = i.institution_id AND c.year = 2004)	conference
SELECT pilot_name FROM pilotskills WHERE age = (SELECT MAX(age) FROM pilotskills)	pilot_1
SELECT pilot_name FROM pilotskills WHERE age = (SELECT MAX(age) FROM pilotskills)	pilot_1
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age	pilot_1
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age	pilot_1
SELECT * FROM PilotSkills WHERE age  <  30	pilot_1
select * from pilotskills where age  <  30	pilot_1
SELECT pilot_name FROM PilotSkills WHERE age  <  35 AND plane_name  =  'Piper Cub'	pilot_1
SELECT pilot_name FROM PilotSkills WHERE age  <  35 AND plane_name  =  'Piper Cub'	pilot_1
SELECT LOCATION FROM hangar WHERE plane_name  =  'F-14 Fighter'	pilot_1
SELECT LOCATION FROM hangar WHERE plane_name  =  'F-14 Fighter'	pilot_1
SELECT count(DISTINCT LOCATION) FROM hangar	pilot_1
SELECT count(DISTINCT LOCATION) FROM hangar	pilot_1
SELECT plane_name FROM pilotskills WHERE pilot_name  =  'Jones'  AND age  =  32	pilot_1
SELECT plane_name FROM pilotskills WHERE pilot_name  =  'Jones'  AND age  =  32	pilot_1
SELECT count(*) FROM pilotskills WHERE age  >  40	pilot_1
SELECT count(*) FROM pilotskills WHERE age  >  40	pilot_1
SELECT count(*) FROM pilotskills WHERE age  <  35 AND plane_name  =  'B-52 Bomber'	pilot_1
SELECT count(*) FROM pilotskills WHERE age  <  35 AND plane_name  =  'B-52 Bomber'	pilot_1
SELECT pilot_name FROM pilotskills WHERE plane_name = 'Piper Cub' AND age = (SELECT MIN(age) FROM pilotskills WHERE plane_name = 'Piper Cub')	pilot_1
SELECT pilot_name FROM pilotskills WHERE plane_name = 'Piper Cub' AND age = (SELECT MIN(age) FROM pilotskills WHERE plane_name = 'Piper Cub')	pilot_1
WITH RankedPlanes AS (SELECT plane_name, RANK() OVER (ORDER BY COUNT(*) DESC) as rank FROM pilotskills GROUP BY plane_name) SELECT plane_name FROM RankedPlanes WHERE rank = 1	pilot_1
SELECT plane_name FROM pilotskills GROUP BY plane_name HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM pilotskills GROUP BY plane_name) t)	pilot_1
SELECT plane_name FROM (SELECT h.plane_name, rank() over (ORDER BY COUNT(p.plane_name)) as rk FROM hangar h LEFT JOIN pilotskills p ON h.plane_name = p.plane_name GROUP BY h.plane_name) WHERE rk = 1	pilot_1
SELECT plane_name FROM (SELECT h.plane_name, rank() over (ORDER BY COUNT(p.plane_name)) as rk FROM hangar h LEFT JOIN pilotskills p ON h.plane_name = p.plane_name GROUP BY h.plane_name) WHERE rk = 1	pilot_1
SELECT count(DISTINCT T1.pilot_name) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Chicago'	pilot_1
SELECT count(DISTINCT T1.pilot_name) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Chicago'	pilot_1
SELECT plane_name FROM pilotskills WHERE pilot_name  =  'Smith' AND age  =  41	pilot_1
SELECT plane_name FROM pilotskills WHERE pilot_name  =  'Smith' AND age  =  41	pilot_1
SELECT count(DISTINCT plane_name) FROM pilotskills	pilot_1
SELECT count(DISTINCT plane_name) FROM pilotskills	pilot_1
SELECT count(plane_name) FROM pilotskills WHERE pilot_name  =  'Smith'	pilot_1
SELECT count(plane_name) FROM pilotskills WHERE pilot_name  =  'Smith'	pilot_1
SELECT count(plane_name) FROM pilotskills WHERE age  >  40	pilot_1
SELECT count(plane_name) FROM pilotskills WHERE age  >  40	pilot_1
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age	pilot_1
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age	pilot_1
SELECT pilot_name FROM pilotskills ORDER BY age DESC	pilot_1
SELECT pilot_name FROM pilotskills ORDER BY age DESC	pilot_1
SELECT LOCATION FROM hangar ORDER BY plane_name	pilot_1
SELECT LOCATION FROM hangar ORDER BY plane_name	pilot_1
SELECT DISTINCT plane_name FROM pilotskills ORDER BY plane_name	pilot_1
SELECT DISTINCT plane_name FROM hangar ORDER BY plane_name ASC	pilot_1
SELECT count(pilot_name) FROM pilotskills ORDER BY age  >  40 OR age  <  30	pilot_1
SELECT count(pilot_name) FROM pilotskills ORDER BY age  >  40 OR age  <  30	pilot_1
SELECT pilot_name ,  age FROM pilotskills WHERE plane_name  =  'Piper Cub' AND age  >  35 UNION SELECT pilot_name ,  age FROM pilotskills WHERE plane_name  =  'F-14 Fighter' AND age  <  30	pilot_1
SELECT pilot_name ,  age FROM pilotskills WHERE plane_name  =  'Piper Cub' AND age  >  35 UNION SELECT pilot_name ,  age FROM pilotskills WHERE plane_name  =  'F-14 Fighter' AND age  <  30	pilot_1
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' EXCEPT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'	pilot_1
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' EXCEPT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'	pilot_1
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' INTERSECT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'	pilot_1
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' INTERSECT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'	pilot_1
SELECT avg(age) ,  min(age) FROM pilotskills	pilot_1
SELECT avg(age) ,  min(age) FROM pilotskills	pilot_1
SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin" INTERSECT SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.LOCATION  =  "Boston"	pilot_1
SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin" INTERSECT SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.LOCATION  =  "Boston"	pilot_1
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' OR plane_name  =  'F-14 Fighter'	pilot_1
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' OR plane_name  =  'F-14 Fighter'	pilot_1
SELECT avg(age) ,  plane_name FROM pilotskills GROUP BY plane_name	pilot_1
SELECT avg(age) ,  plane_name FROM pilotskills GROUP BY plane_name	pilot_1
SELECT h.plane_name, count(p.plane_name) FROM Hangar AS h LEFT JOIN PilotSkills as p on h.plane_name = p.plane_name group by h.plane_name	pilot_1
SELECT h.plane_name, count(p.plane_name) FROM Hangar AS h LEFT JOIN PilotSkills as p on h.plane_name = p.plane_name group by h.plane_name	pilot_1
SELECT ps.plane_name, ps.pilot_name FROM pilotskills ps WHERE ps.age = (SELECT MAX(age) FROM pilotskills WHERE plane_name = ps.plane_name) ORDER BY ps.plane_name	pilot_1
SELECT h.plane_name, ps.pilot_name FROM hangar h JOIN pilotskills ps ON h.plane_name = ps.plane_name WHERE ps.age = (SELECT MAX(age) FROM pilotskills WHERE plane_name = h.plane_name) ORDER BY h.plane_name	pilot_1
SELECT ps.pilot_name, ps.plane_name FROM pilotskills ps INNER JOIN (SELECT plane_name, MAX(age) AS max_age FROM pilotskills GROUP BY plane_name) max_ps ON ps.plane_name = max_ps.plane_name AND ps.age = max_ps.max_age	pilot_1
SELECT DISTINCT hangar.plane_name, pilotskills.pilot_name FROM hangar JOIN pilotskills ON hangar.plane_name = pilotskills.plane_name WHERE pilotskills.age = (SELECT MAX(age) FROM pilotskills WHERE pilotskills.plane_name = hangar.plane_name)	pilot_1
SELECT max(age) ,  pilot_name FROM pilotskills GROUP BY pilot_name	pilot_1
SELECT max(age) ,  pilot_name FROM pilotskills GROUP BY pilot_name	pilot_1
SELECT h.location, COUNT(pilot_name) as num_pilots, AVG(ps.age) as av_age FROM hangar h LEFT JOIN pilotskills ps ON h.plane_name = ps.plane_name GROUP BY h.location	pilot_1
SELECT h.location, COUNT(pilot_name) as num_pilots, AVG(ps.age) as av_age FROM hangar h LEFT JOIN pilotskills ps ON h.plane_name = ps.plane_name GROUP BY h.location	pilot_1
SELECT count(*) ,  plane_name FROM pilotskills GROUP BY plane_name HAVING avg(age)  <  35	pilot_1
SELECT count(*) ,  plane_name FROM pilotskills GROUP BY plane_name HAVING avg(age)  <  35	pilot_1
SELECT location FROM hangar WHERE plane_name in (SELECT plane_name FROM pilotskills WHERE age = (select min(age) from PilotSkills))	pilot_1
SELECT location FROM hangar WHERE plane_name in (SELECT plane_name FROM pilotskills WHERE age = (select min(age) from PilotSkills))	pilot_1
SELECT T1.pilot_name ,  T1.age FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin"	pilot_1
SELECT T1.pilot_name ,  T1.age FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin"	pilot_1
SELECT pilot_name FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub') ORDER BY pilot_name	pilot_1
SELECT ps1.pilot_name FROM pilotskills ps1 WHERE ps1.age > (SELECT MAX(ps2.age) FROM pilotskills ps2 WHERE ps2.plane_name = 'Piper Cub') ORDER BY ps1.pilot_name	pilot_1
SELECT count(*) FROM pilotskills WHERE age  <  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'F-14 Fighter')	pilot_1
SELECT count(*) FROM pilotskills WHERE age  <  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'F-14 Fighter')	pilot_1
SELECT DISTINCT plane_name FROM hangar WHERE plane_name LIKE '%Bomber%'	pilot_1
SELECT DISTINCT plane_name FROM hangar WHERE plane_name LIKE '%Bomber%'	pilot_1
SELECT count(pilot_name) FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub')	pilot_1
SELECT count(pilot_name) FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub')	pilot_1
SELECT d.name FROM district d WHERE d.area_km = (SELECT MAX(area_km) FROM district)	district_spokesman
SELECT area_km ,  Government_website FROM district WHERE Population  = (SELECT min(Population) FROM district);	district_spokesman
SELECT name ,  population FROM district WHERE area_km  >  (SELECT avg(area_km) FROM district)	district_spokesman
SELECT max(area_km) ,  avg(area_km) FROM district	district_spokesman
SELECT SUM(Population) FROM (SELECT Population, rank() over (ORDER BY Area_km DESC ) AS rk FROM district) WHERE rk <= 3	district_spokesman
SELECT name ,  Government_website ,  district_id FROM district ORDER BY Population	district_spokesman
SELECT name FROM district WHERE Government_website LIKE "%gov%"	district_spokesman
SELECT district_id ,  name FROM district WHERE area_km  >  3000 OR population  >  4000	district_spokesman
SELECT name ,  speach_title FROM spokesman	district_spokesman
SELECT avg(points) ,  avg(age) FROM spokesman WHERE rank_position  =  1	district_spokesman
SELECT name ,  points FROM spokesman WHERE age  <  40	district_spokesman
SELECT name FROM spokesman WHERE Age = (SELECT max(Age) FROM spokesman)	district_spokesman
SELECT name FROM spokesman WHERE points  <  (SELECT avg(points) FROM spokesman)	district_spokesman
SELECT d.name FROM district AS d INNER JOIN (SELECT district_id FROM spokesman_district GROUP BY district_id HAVING COUNT(spokesman_id) = (SELECT MAX(c) FROM (SELECT COUNT(spokesman_id) as c FROM spokesman_district GROUP BY district_id))) y ON d.district_id = y.district_id	district_spokesman
SELECT name FROM spokesman WHERE spokesman_id IN (SELECT spokesman_id FROM spokesman_district WHERE start_year < 2004)	district_spokesman
SELECT name, (SELECT COUNT(spokesman_id) FROM spokesman_district WHERE district_id = d.district_id) AS num_spokesmen FROM district AS d	district_spokesman
SELECT d.name FROM district d WHERE EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.spokesman_id = s.spokesman_id WHERE sd.district_id = d.district_id AND s.rank_position = 1) AND EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.spokesman_id = s.spokesman_id WHERE sd.district_id = d.district_id AND s.rank_position = 2);	district_spokesman
SELECT t1.name FROM district AS t1 JOIN spokesman_district AS t2 ON t1.District_ID  =  t2.District_ID GROUP BY t2.District_ID HAVING count(*)  >  1	district_spokesman
SELECT count(*) FROM district WHERE district_id NOT IN (SELECT district_id FROM spokesman_district)	district_spokesman
SELECT name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT Spokesman_ID FROM spokesman_district)	district_spokesman
SELECT sum(population) ,  avg(population) FROM district WHERE district_id IN (SELECT district_id FROM spokesman_district)	district_spokesman
SELECT title FROM sculptures WHERE year = (SELECT MAX(year) FROM sculptures)	art_1
SELECT title FROM sculptures WHERE year = (SELECT MAX(year) FROM sculptures)	art_1
SELECT paintings.title, paintings.location FROM paintings WHERE paintings.year = (SELECT MIN(year) FROM paintings);	art_1
SELECT paintings.title, paintings.location FROM paintings WHERE paintings.year = (SELECT MIN(year) FROM paintings);	art_1
SELECT title FROM sculptures WHERE LOCATION  =  "Gallery 226"	art_1
SELECT title FROM sculptures WHERE LOCATION  =  "Gallery 226"	art_1
SELECT title ,  LOCATION FROM paintings	art_1
SELECT title ,  LOCATION FROM paintings	art_1
SELECT title ,  LOCATION FROM sculptures	art_1
SELECT title ,  LOCATION FROM sculptures	art_1
SELECT medium FROM paintings WHERE paintingID  =  80	art_1
select medium from paintings where paintingid  =  80	art_1
SELECT lname ,  fname FROM artists WHERE birthYear  >  1850	art_1
SELECT lname ,  fname FROM artists WHERE birthYear  >  1850	art_1
SELECT title ,  YEAR FROM sculptures WHERE LOCATION != "Gallery 226"	art_1
SELECT title ,  YEAR FROM sculptures WHERE LOCATION != "Gallery 226"	art_1
SELECT fname, lname FROM (SELECT DISTINCT artistid, fname, lname FROM artists) AS unique_artists WHERE unique_artists.artistid IN (SELECT sculptorid FROM sculptures WHERE year < 1900)	art_1
SELECT fname, lname FROM artists WHERE EXISTS (SELECT 1 FROM sculptures WHERE sculptorid = artistid AND year < 1900)	art_1
SELECT birthyear FROM artists WHERE EXISTS (SELECT 1 FROM sculptures WHERE sculptures.sculptorid = artists.artistid AND year > 1920)	art_1
SELECT birthyear FROM artists WHERE EXISTS (SELECT 1 FROM sculptures WHERE sculptures.sculptorid = artists.artistid AND year > 1920)	art_1
SELECT a.fname, a.lname FROM artists a WHERE (a.deathyear - a.birthyear) = (SELECT MAX(b.deathyear - b.birthyear) FROM artists b)	art_1
SELECT a.fname, a.lname FROM artists a WHERE (a.deathyear - a.birthyear) = (SELECT MAX(b.deathyear - b.birthyear) FROM artists b)	art_1
SELECT lifespan FROM (SELECT (deathyear - birthyear) AS lifespan FROM artists) WHERE lifespan = (SELECT MIN(deathyear - birthyear) FROM artists)	art_1
SELECT lifespan FROM (SELECT (deathyear - birthyear) AS lifespan FROM artists) WHERE lifespan = (SELECT MIN(deathyear - birthyear) FROM artists)	art_1
SELECT fname, deathyear - birthyear AS age FROM artists WHERE (deathyear - birthyear) = (SELECT MAX(deathyear - birthyear) FROM artists)	art_1
SELECT fname, deathyear - birthyear AS age FROM artists WHERE (deathyear - birthyear) = (SELECT MAX(deathyear - birthyear) FROM artists)	art_1
SELECT count(*) FROM paintings WHERE LOCATION  =  "Gallery 240"	art_1
SELECT count(*) FROM paintings WHERE LOCATION  =  "Gallery 240"	art_1
SELECT artistid, COUNT(*) FROM artists a LEFT JOIN paintings p ON p.painterid = a.artistid WHERE (a.deathyear - a.birthyear) = (SELECT MAX(deathyear - birthyear) FROM artists) GROUP BY a.artistid;	art_1
SELECT artistid, COUNT(*) FROM artists a LEFT JOIN paintings p ON p.painterid = a.artistid WHERE (a.deathyear - a.birthyear) = (SELECT MAX(deathyear - birthyear) FROM artists) GROUP BY a.artistid;	art_1
SELECT T2.title ,   T2.year FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.fname  =  "Mary"	art_1
SELECT T2.title ,   T2.year FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.fname  =  "Mary"	art_1
SELECT T2.width_mm FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.birthYear  <  1850	art_1
SELECT T2.width_mm FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.birthYear  <  1850	art_1
SELECT T2.location ,   T2.medium FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.fname  =  "Pablo"	art_1
SELECT T2.location ,   T2.medium FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.fname  =  "Pablo"	art_1
SELECT a.fname, a.lname FROM artists a WHERE EXISTS (SELECT 1 FROM paintings p WHERE p.painterid = a.artistid) AND EXISTS (SELECT 1 FROM sculptures s WHERE s.sculptorid = a.artistid)	art_1
SELECT a.fname, a.lname FROM artists a WHERE EXISTS (SELECT 1 FROM paintings p WHERE p.painterid = a.artistid) AND EXISTS (SELECT 1 FROM sculptures s WHERE s.sculptorid = a.artistid)	art_1
SELECT a.fname, a.lname FROM artists a WHERE artistid IN (SELECT painterid FROM paintings WHERE medium = 'oil') AND artistid IN (SELECT painterid FROM paintings WHERE medium = 'lithograph')	art_1
SELECT fname, lname FROM artists WHERE artistid IN (SELECT painterid FROM paintings WHERE medium = 'oil') AND artistid IN (SELECT painterid FROM paintings WHERE medium = 'lithograph')	art_1
SELECT birthyear FROM artists WHERE artistid IN (SELECT painterid FROM paintings WHERE year = 1884 AND mediumon = 'canvas')	art_1
SELECT birthyear FROM artists WHERE artistid IN (SELECT painterid FROM paintings WHERE year = 1884)	art_1
SELECT DISTINCT T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.medium  =  "oil" AND LOCATION  =  "Gallery 241"	art_1
SELECT fname FROM artists WHERE artistid IN (SELECT painterid FROM paintings WHERE medium = 'oil' AND location = 'Gallery 241')	art_1
SELECT medium, COUNT(*) AS NumWorks FROM (SELECT medium FROM paintings UNION ALL SELECT medium FROM sculptures) GROUP BY medium;	art_1
SELECT medium, COUNT(*) AS total_works FROM (SELECT medium FROM paintings UNION ALL SELECT medium FROM sculptures) GROUP BY medium	art_1
SELECT avg(height_mm) ,  medium FROM paintings GROUP BY medium	art_1
SELECT avg(height_mm) ,  medium FROM paintings GROUP BY medium	art_1
SELECT count(*) ,  LOCATION FROM paintings WHERE YEAR  <  1900 GROUP BY LOCATION	art_1
SELECT count(*) ,  LOCATION FROM paintings WHERE YEAR  <  1900 GROUP BY LOCATION	art_1
SELECT title FROM paintings WHERE YEAR  >  1910 AND medium  =  "oil"	art_1
SELECT title FROM paintings WHERE YEAR  >  1910 AND medium  =  "oil"	art_1
SELECT DISTINCT painterID FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 240"	art_1
SELECT DISTINCT painterID FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 240"	art_1
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT min(height_mm) FROM paintings WHERE mediumOn  =  "canvas")	art_1
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT min(height_mm) FROM paintings WHERE mediumOn  =  "canvas")	art_1
SELECT paintingID FROM paintings WHERE YEAR  <  (SELECT max(YEAR) FROM paintings WHERE LOCATION  =  "Gallery 240")	art_1
SELECT paintingID FROM paintings WHERE YEAR  <  (SELECT max(YEAR) FROM paintings WHERE LOCATION  =  "Gallery 240")	art_1
SELECT paintingid FROM paintings WHERE year = (SELECT MIN(year) FROM paintings)	art_1
SELECT paintingid FROM paintings WHERE year = (SELECT MIN(year) FROM paintings)	art_1
SELECT fname, lname FROM artists WHERE artistid IN (SELECT sculptorid FROM sculptures WHERE title LIKE '%female%')	art_1
SELECT fname, lname FROM artists WHERE artistid IN (SELECT sculptorid FROM sculptures WHERE title LIKE '%female%')	art_1
SELECT title FROM paintings ORDER BY title	art_1
SELECT title FROM paintings ORDER BY title	art_1
SELECT title FROM paintings ORDER BY height_mm	art_1
SELECT title FROM paintings ORDER BY height_mm	art_1
SELECT title FROM paintings WHERE year BETWEEN 1900 AND 1950 UNION ALL SELECT title FROM sculptures WHERE year BETWEEN 1900 AND 1950	art_1
SELECT title FROM (SELECT title, year FROM paintings UNION ALL SELECT title, year FROM sculptures) WHERE year BETWEEN 1900 AND 1950	art_1
SELECT p.title FROM paintings AS p WHERE p.painterid = 222 UNION ALL SELECT s.title FROM sculptures AS s WHERE s.sculptorid = 222	art_1
SELECT title FROM paintings WHERE painterid = 222 UNION ALL SELECT title FROM sculptures WHERE sculptorid = 222	art_1
SELECT a.artistid FROM artists a WHERE (SELECT COUNT(*) FROM paintings p WHERE p.painterid = a.artistid AND p.year < 1900) = (SELECT MAX(c.cnt) FROM (SELECT COUNT(*) AS cnt FROM paintings WHERE year < 1900 GROUP BY painterid) c);	art_1
SELECT a.artistid FROM artists a WHERE (SELECT COUNT(*) FROM paintings p WHERE p.painterid = a.artistid AND p.year < 1900) = (SELECT MAX(c.cnt) FROM (SELECT COUNT(*) AS cnt FROM paintings WHERE year < 1900 GROUP BY painterid) c);	art_1
SELECT fname FROM artists WHERE artistid IN (SELECT sculptorid FROM sculptures GROUP BY sculptorid HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT sculptorid, COUNT(*) as cnt FROM sculptures GROUP BY sculptorid)))	art_1
SELECT fname FROM artists WHERE artistid IN (SELECT sculptorid FROM sculptures GROUP BY sculptorid HAVING COUNT(sculptorid) = (SELECT MAX(work_count) FROM (SELECT COUNT(*) AS work_count FROM sculptures GROUP BY sculptorid)))	art_1
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800	art_1
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800	art_1
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  < 1885 OR YEAR  >  1930	art_1
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  < 1885 OR YEAR  >  1930	art_1
SELECT paintingID FROM paintings WHERE height_mm  >  500 AND height_mm  <  2000	art_1
SELECT paintingID FROM paintings WHERE height_mm  >  500 AND height_mm  <  2000	art_1
SELECT DISTINCT LOCATION FROM paintings WHERE mediumOn  =  "panel" INTERSECT SELECT DISTINCT LOCATION FROM paintings WHERE mediumOn  =  "canvas"	art_1
SELECT DISTINCT LOCATION FROM paintings WHERE mediumOn  =  "panel" INTERSECT SELECT DISTINCT LOCATION FROM paintings WHERE mediumOn  =  "canvas"	art_1
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 INTERSECT SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  >  1930	art_1
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 INTERSECT SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  >  1930	art_1
SELECT avg(height_mm) ,  avg(width_mm) FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 241"	art_1
SELECT avg(height_mm) ,  avg(width_mm) FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 241"	art_1
SELECT height_mm, paintingID FROM paintings WHERE YEAR < 1900 AND height_mm = (SELECT MAX(height_mm) FROM paintings WHERE YEAR < 1900)	art_1
SELECT height_mm, paintingID FROM paintings WHERE YEAR < 1900 AND height_mm = (SELECT MAX(height_mm) FROM paintings WHERE YEAR < 1900)	art_1
SELECT max(height_mm) ,  max(width_mm) ,  YEAR FROM paintings GROUP BY YEAR	art_1
SELECT max(height_mm) ,  max(width_mm) ,  YEAR FROM paintings GROUP BY YEAR	art_1
SELECT artists.artistID, AVG(paintings.height_mm) ASAverageHeight, AVG(paintings.width_mm) AS AverageWidth FROM paintings INNER JOIN artists ON paintings.painterid = artists.artistid GROUP BY artists.artistid ORDER BY artists.lname, artists.fname	art_1
SELECT artists.artistID, AVG(paintings.height_mm) ASAverageHeight, AVG(paintings.width_mm) AS AverageWidth FROM paintings INNER JOIN artists ON paintings.painterid = artists.artistid GROUP BY artists.artistid ORDER BY artists.lname, artists.fname	art_1
SELECT T1.fname ,  count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T2.painterID HAVING count(*)  >=  2	art_1
SELECT T1.fname ,  count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T2.painterID HAVING count(*)  >=  2	art_1
SELECT A.deathyear FROM artists A WHERE 3 >= (SELECT COUNT(*) FROM paintings WHERE painterid = A.artistid)	art_1
SELECT deathyear FROM artists WHERE (SELECT COUNT(*) FROM paintings WHERE painterid = artistid) < 4	art_1
WITH tmp as (SELECT A.deathYear, count(S.sculptureID) as cnt FROM Artists A LEFT JOIN Sculptures S on A.artistID = S.sculptorID GROUP BY A.artistID) SELECT tmp.deathYear FROM tmp WHERE cnt = (SELECT min(cnt) FROM tmp)	art_1
WITH tmp as (SELECT A.deathYear, count(S.sculptureID) as cnt FROM Artists A LEFT JOIN Sculptures S on A.artistID = S.sculptorID GROUP BY A.artistID) SELECT tmp.deathYear FROM tmp WHERE cnt = (SELECT min(cnt) FROM tmp)	art_1
SELECT paintingid, height_mm FROM paintings WHERE location = 'Gallery 240' AND width_mm = (SELECT MAX(width_mm) FROM paintings WHERE location = 'Gallery 240')	art_1
SELECT paintingid, height_mm FROM paintings WHERE width_mm = (SELECT MAX(width_mm) FROM paintings WHERE location = 'Gallery 240') AND location = 'Gallery 240'	art_1
SELECT paintingID FROM paintings WHERE YEAR  <   (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  'Gallery 240')	art_1
SELECT paintingID FROM paintings WHERE YEAR  <   (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  'Gallery 240')	art_1
SELECT paintingID FROM paintings WHERE height_mm  >   (SELECT max(height_mm) FROM paintings WHERE YEAR  >  1900)	art_1
SELECT paintingID FROM paintings WHERE height_mm  >   (SELECT max(height_mm) FROM paintings WHERE YEAR  >  1900)	art_1
SELECT fname, lname FROM (SELECT a.fname, a.lname, rank() over (ORDER BY COUNT(p.paintingid) DESC) as rk FROM artists a JOIN paintings p ON a.artistid = p.painterid WHERE p.medium = 'oil' GROUP BY a.artistid) WHERE rk <= 3	art_1
SELECT fname, lname FROM (SELECT a.fname, a.lname, rank() over (ORDER BY COUNT(p.paintingid) DESC) as rk FROM artists a JOIN paintings p ON a.artistid = p.painterid WHERE p.medium = 'oil' GROUP BY a.artistid) WHERE rk = 1	art_1
SELECT paintingID ,  title ,  LOCATION FROM paintings WHERE medium  =  "oil" ORDER BY YEAR	art_1
SELECT paintingID ,  title ,  LOCATION FROM paintings WHERE medium  =  "oil" ORDER BY YEAR	art_1
SELECT title ,  LOCATION ,  YEAR FROM paintings WHERE height_mm  >  1000 ORDER BY title	art_1
SELECT title ,  LOCATION ,  YEAR FROM paintings WHERE height_mm  >  1000 ORDER BY title	art_1
SELECT a.fname, a.lname FROM artists a WHERE a.artistid IN (SELECT p.painterid FROM paintings p) AND a.artistid NOT IN (SELECT s.sculptorid FROM sculptures s)	art_1
SELECT a.fname, a.lname FROM artists a WHERE a.artistid IN (SELECT p.painterid FROM paintings p) AND a.artistid NOT IN (SELECT s.sculptorid FROM sculptures s)	art_1
SELECT p.location FROM paintings p WHERE p.year < 1885 EXCEPT SELECT p.location FROM paintings p WHERE p.mediumon = 'canvas'	art_1
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 AND mediumOn != "canvas"	art_1
SELECT count(*) FROM race	car_road_race
SELECT count(*) FROM race	car_road_race
SELECT Winning_driver ,  Winning_team FROM race ORDER BY Winning_team ASC	car_road_race
SELECT Winning_driver ,  Winning_team FROM race ORDER BY Winning_team ASC	car_road_race
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'	car_road_race
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'	car_road_race
SELECT CONSTRUCTOR FROM driver ORDER BY Age ASC	car_road_race
SELECT DISTINCT CONSTRUCTOR FROM driver ORDER BY Age ASC	car_road_race
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20	car_road_race
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20	car_road_race
SELECT max(Age) ,  min(Age) FROM driver	car_road_race
SELECT max(Age) ,  min(Age) FROM driver	car_road_race
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20	car_road_race
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20	car_road_race
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC	car_road_race
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC	car_road_race
SELECT T1.Driver_Name ,  T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID	car_road_race
SELECT T1.Driver_Name ,  T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID	car_road_race
SELECT D.driver_name, (SELECT COUNT(*) FROM race R WHERE R.driver_id = D.driver_id) AS races_participated FROM driver D	car_road_race
SELECT D.driver_name, (SELECT COUNT(*) FROM race R WHERE R.driver_id = D.driver_id) AS races_participated FROM driver D	car_road_race
SELECT age FROM driver d WHERE driver_id IN (SELECT driver_id FROM race GROUP BY driver_id HAVING COUNT(*) = (SELECT MAX(x.total) FROM (SELECT driver_id, COUNT(*) as total FROM race GROUP BY driver_id) x))	car_road_race
SELECT age FROM driver d WHERE driver_id IN (SELECT driver_id FROM race GROUP BY driver_id HAVING COUNT(*) = (SELECT MAX(x.total) FROM (SELECT driver_id, COUNT(*) as total FROM race GROUP BY driver_id) x))	car_road_race
SELECT T1.Driver_Name ,  T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID HAVING COUNT(*)  >=  2	car_road_race
SELECT T1.Driver_Name ,  T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID HAVING COUNT(*)  >=  2	car_road_race
SELECT T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Age  >=  26	car_road_race
SELECT T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Age  >=  26	car_road_race
SELECT Driver_Name FROM driver WHERE CONSTRUCTOR != "Bugatti"	car_road_race
SELECT Driver_Name FROM driver WHERE CONSTRUCTOR != "Bugatti"	car_road_race
SELECT CONSTRUCTOR ,  COUNT(*) FROM driver GROUP BY CONSTRUCTOR	car_road_race
SELECT CONSTRUCTOR ,  COUNT(*) FROM driver GROUP BY CONSTRUCTOR	car_road_race
SELECT engine FROM driver GROUP BY engine HAVING COUNT(engine) = (SELECT MAX(counts) FROM (SELECT COUNT(engine) AS counts FROM driver GROUP BY engine))	car_road_race
SELECT engine FROM driver GROUP BY engine HAVING COUNT(engine) = (SELECT MAX(count) FROM (SELECT engine, COUNT(*) as count FROM driver GROUP BY engine))	car_road_race
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*)  >=  2	car_road_race
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*)  >=  2	car_road_race
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)	car_road_race
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)	car_road_race
SELECT CONSTRUCTOR FROM driver WHERE Age  <  20 INTERSECT SELECT CONSTRUCTOR FROM driver WHERE Age  >  30	car_road_race
SELECT CONSTRUCTOR FROM driver WHERE Age  <  20 INTERSECT SELECT CONSTRUCTOR FROM driver WHERE Age  >  30	car_road_race
SELECT Winning_team FROM race GROUP BY Winning_team HAVING count(*)  >  1	car_road_race
SELECT Winning_team FROM race GROUP BY Winning_team HAVING count(*)  >  1	car_road_race
SELECT driver_name FROM driver WHERE driver_id IN (SELECT driver_id FROM race WHERE pole_position = 'Carl Skerlong' INTERSECT SELECT driver_id FROM race WHERE pole_position = 'James Hinchcliffe');	car_road_race
SELECT driver_name FROM driver WHERE driver_id IN (SELECT driver_id FROM race WHERE pole_position IN ('James Hinchcliffe', 'Carl Skerlong') GROUP BY driver_id HAVING COUNT(DISTINCT pole_position) = 2);	car_road_race
SELECT driver_name FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM race WHERE pole_position = 'James Hinchcliffe')	car_road_race
SELECT driver_name FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM race WHERE pole_position = 'James Hinchcliffe')	car_road_race
SELECT count(*) FROM languages	country_language
SELECT count(*) FROM languages	country_language
SELECT name FROM languages ORDER BY name ASC	country_language
SELECT name FROM languages ORDER BY name ASC	country_language
SELECT name FROM languages WHERE name LIKE "%ish%"	country_language
SELECT name FROM languages WHERE name LIKE "%ish%"	country_language
SELECT name FROM countries ORDER BY overall_score DESC	country_language
SELECT name FROM countries ORDER BY overall_score DESC	country_language
SELECT avg(justice_score) FROM countries	country_language
SELECT avg(justice_score) FROM countries	country_language
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name != "Norway"	country_language
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name != "Norway"	country_language
SELECT count(DISTINCT language_id) FROM official_languages	country_language
SELECT count(DISTINCT language_id) FROM official_languages	country_language
SELECT name FROM countries ORDER BY education_score DESC	country_language
SELECT name FROM countries ORDER BY education_score DESC	country_language
SELECT countries.name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)	country_language
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)	country_language
SELECT T1.name ,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id	country_language
SELECT T1.name ,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id	country_language
SELECT language.name, (SELECT COUNT(*) FROM official_languages WHERE language_id = language.id) AS CountriesCount FROM languages AS language	country_language
SELECT L.name, (SELECT COUNT(distinct O.country_id) FROM official_languages O WHERE L.id = O.language_id) AS num_countries FROM languages L	country_language
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(language_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(language_id) AS cnt FROM official_languages GROUP BY language_id)))	country_language
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(language_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(language_id) AS cnt FROM official_languages GROUP BY language_id)))	country_language
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.id HAVING COUNT(*)  >=  2	country_language
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.id HAVING COUNT(*)  >=  2	country_language
SELECT AVG(ov_score) FROM (SELECT overall_score AS ov_score FROM countries WHERE id IN (SELECT country_id FROM official_languages WHERE language_id IN (SELECT id FROM languages WHERE name = 'English')))	country_language
SELECT AVG(ovsc) FROM (SELECT overall_score AS ovsc FROM countries WHERE id IN (SELECT country_id FROM official_languages JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English'))	country_language
WITH RankedLanguages AS (SELECT language_id, RANK() OVER (ORDER BY COUNT(DISTINCT country_id) DESC) as rank FROM official_languages GROUP BY language_id) SELECT name FROM languages WHERE id IN (SELECT language_id FROM RankedLanguages WHERE rank <= 3)	country_language
WITH RankedLanguages AS (SELECT language_id, RANK() OVER (ORDER BY COUNT(DISTINCT country_id) DESC) as rank FROM official_languages GROUP BY language_id) SELECT name FROM languages WHERE id IN (SELECT language_id FROM RankedLanguages WHERE rank <= 3)	country_language
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id GROUP BY T3.id ORDER BY avg(T1.overall_score) DESC	country_language
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id GROUP BY T3.id ORDER BY avg(T1.overall_score) DESC	country_language
SELECT name FROM countries WHERE id IN (SELECT ol.country_id FROM official_languages ol GROUP BY ol.country_id HAVING COUNT(ol.language_id) = (SELECT MAX(lang_count) FROM (SELECT COUNT(language_id) AS lang_count FROM official_languages GROUP BY country_id)))	country_language
SELECT name FROM countries WHERE id IN (SELECT ol.country_id FROM official_languages ol GROUP BY ol.country_id HAVING COUNT(ol.language_id) = (SELECT MAX(lang_count) FROM (SELECT COUNT(language_id) AS lang_count FROM official_languages GROUP BY country_id)))	country_language
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)	country_language
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)	country_language
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)	country_language
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)	country_language
SELECT name FROM languages WHERE id IN (SELECT ol.language_id FROM official_languages ol JOIN countries c ON ol.country_id = c.id WHERE c.overall_score > 95) AND id IN (SELECT ol.language_id FROM official_languages ol JOIN countries c ON ol.country_id = c.id WHERE c.overall_score < 90);	country_language
SELECT languages.name FROM languages WHERE languages.id IN (SELECT ol.language_id FROM official_languages ol JOIN countries c ON ol.country_id = c.id GROUP BY ol.language_id HAVING MAX(c.overall_score) > 95 AND MIN(c.overall_score) < 90)	country_language
SELECT DISTINCT country, town_city FROM addresses	real_estate_rentals
SELECT country ,  town_city FROM Addresses;	real_estate_rentals
SELECT T1.county_state_province FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id;	real_estate_rentals
SELECT T1.county_state_province FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id;	real_estate_rentals
SELECT feature_description FROM Features WHERE feature_name  =  'rooftop';	real_estate_rentals
SELECT feature_description FROM Features WHERE feature_name  =  'rooftop';	real_estate_rentals
SELECT f.feature_name, f.feature_description FROM features f JOIN property_features pf ON f.feature_id = pf.feature_id GROUP BY f.feature_id HAVING COUNT(pf.property_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(property_id) AS Cnt FROM property_features GROUP BY feature_id))	real_estate_rentals
SELECT f.feature_name, f.feature_description FROM features f JOIN property_features pf ON f.feature_id = pf.feature_id GROUP BY f.feature_id HAVING COUNT(pf.property_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(property_id) AS Cnt FROM property_features GROUP BY feature_id))	real_estate_rentals
SELECT min(room_count) FROM Properties;	real_estate_rentals
SELECT min(room_count) FROM Properties;	real_estate_rentals
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  1;	real_estate_rentals
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  1;	real_estate_rentals
SELECT T2.age_category_code FROM Ref_User_Categories AS T1 JOIN Users AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T1.User_category_description LIKE "%Mother";	real_estate_rentals
SELECT T2.age_category_code FROM Ref_User_Categories AS T1 JOIN Users AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T1.User_category_description LIKE "%Mother";	real_estate_rentals
SELECT U.first_name FROM users U WHERE EXISTS (SELECT 1 FROM properties P WHERE P.owner_user_id = U.user_id GROUP BY P.owner_user_id HAVING COUNT(P.property_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(property_id) AS Cnt FROM properties GROUP BY owner_user_id)))	real_estate_rentals
SELECT U.first_name FROM users U WHERE EXISTS (SELECT 1 FROM properties P WHERE P.owner_user_id = U.user_id GROUP BY P.owner_user_id HAVING COUNT(P.property_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(property_id) AS Cnt FROM properties GROUP BY owner_user_id)))	real_estate_rentals
SELECT AVG(room_count) FROM properties WHERE EXISTS (SELECT 1 FROM property_features JOIN features ON property_features.feature_id = features.feature_id WHERE features.feature_name = 'garden' AND properties.property_id = property_features.property_id)	real_estate_rentals
SELECT AVG(room_count) AS avg_rooms FROM properties WHERE property_id IN (SELECT properties.property_id FROM properties JOIN property_features ON properties.property_id = property_features.property_id JOIN features ON property_features.feature_id = features.feature_id WHERE features.feature_name = 'garden')	real_estate_rentals
SELECT DISTINCT t.town_city FROM addresses t JOIN properties p ON t.address_id = p.property_address_id JOIN property_features pf ON p.property_id = pf.property_id JOIN features f ON pf.feature_id = f.feature_id WHERE f.feature_name = 'swimming pool'	real_estate_rentals
SELECT DISTINCT t.town_city FROM addresses t JOIN properties p ON t.address_id = p.property_address_id JOIN property_features pf ON p.property_id = pf.property_id JOIN features f ON pf.feature_id = f.feature_id WHERE f.feature_name = 'swimming pool'	real_estate_rentals
SELECT property_id, vendor_requested_price FROM properties WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM properties)	real_estate_rentals
SELECT property_id, vendor_requested_price FROM properties WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM properties)	real_estate_rentals
SELECT avg(room_count) FROM Properties;	real_estate_rentals
SELECT avg(room_count) FROM Properties;	real_estate_rentals
SELECT count(DISTINCT room_size) FROM Rooms;	real_estate_rentals
SELECT count(DISTINCT room_size) FROM Rooms;	real_estate_rentals
SELECT u.user_id, us.search_string FROM user_searches us INNER JOIN users u ON us.user_id = u.user_id WHERE u.user_id IN (SELECT user_id FROM user_searches GROUP BY user_id HAVING COUNT(search_seq) >= 2)	real_estate_rentals
SELECT DISTINCT us.user_id, us.search_seq FROM user_searches us INNER JOIN (SELECT user_id FROM user_searches GROUP BY user_id HAVING COUNT(search_seq) >= 2) t ON us.user_id = t.user_id	real_estate_rentals
SELECT max(search_datetime) FROM User_Searches;	real_estate_rentals
SELECT max(search_datetime) FROM User_Searches;	real_estate_rentals
SELECT search_datetime ,  search_string FROM User_Searches ORDER BY search_string DESC;	real_estate_rentals
SELECT search_datetime ,  search_string FROM User_Searches ORDER BY search_string DESC;	real_estate_rentals
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id WHERE T2.owner_user_id NOT IN ( SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING count(*)  <=  2 );	real_estate_rentals
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id WHERE T2.owner_user_id NOT IN ( SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING count(*)  <=  2 );	real_estate_rentals
SELECT T1.user_category_code ,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  =  1;	real_estate_rentals
SELECT T1.user_category_code ,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  =  1;	real_estate_rentals
SELECT age_category_code FROM Users WHERE user_id IN (SELECT user_id FROM User_Searches WHERE search_datetime = (SELECT min(search_datetime) FROM User_Searches))	real_estate_rentals
SELECT age_category_code FROM Users WHERE user_id IN (SELECT user_id FROM User_Searches WHERE search_datetime = (SELECT min(search_datetime) FROM User_Searches))	real_estate_rentals
SELECT login_name FROM Users WHERE user_category_code  =  'Senior Citizen' ORDER BY first_name	real_estate_rentals
SELECT login_name FROM Users WHERE user_category_code  =  'Senior Citizen' ORDER BY first_name	real_estate_rentals
SELECT count(*) FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  1;	real_estate_rentals
SELECT count(*) FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  1;	real_estate_rentals
SELECT date_registered FROM Users WHERE login_name  =  'ratione';	real_estate_rentals
SELECT date_registered FROM Users WHERE login_name  =  'ratione';	real_estate_rentals
SELECT first_name ,  middle_name ,  last_name ,  login_name FROM Users WHERE is_seller  =  1;	real_estate_rentals
SELECT first_name ,  middle_name ,  last_name ,  login_name FROM Users WHERE is_seller  =  1;	real_estate_rentals
SELECT T1.line_1_number_building ,  T1.line_2_number_street ,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.user_category_code  =  'Senior Citizen';	real_estate_rentals
SELECT T1.line_1_number_building ,  T1.line_2_number_street ,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.user_category_code  =  'Senior Citizen';	real_estate_rentals
SELECT COUNT(DISTINCT properties.property_id) FROM properties JOIN property_features ON properties.property_id = property_features.property_id GROUP BY properties.property_id HAVING COUNT(property_features.feature_id) >= 2	real_estate_rentals
SELECT COUNT(DISTINCT pf.property_id) FROM property_features pf GROUP BY pf.property_id HAVING COUNT(pf.feature_id) >= 2	real_estate_rentals
SELECT p.property_id, IFNULL(COUNT(pp.photo_seq), 0) FROM properties p LEFT JOIN property_photos pp ON p.property_id = pp.property_id GROUP BY p.property_id	real_estate_rentals
SELECT properties.property_id, COUNT(property_photos.photo_seq) AS photo_count FROM properties LEFT JOIN property_photos ON properties.property_id = property_photos.property_id GROUP BY properties.property_id	real_estate_rentals
SELECT owner_user_id AS user_id, COUNT(photo_seq) AS photo_count FROM properties LEFT JOIN property_photos ON properties.property_id = property_photos.property_id GROUP BY owner_user_id	real_estate_rentals
SELECT T1.owner_user_id ,  count(*) FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.owner_user_id;	real_estate_rentals
SELECT sum(T1.price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.user_category_code  =  'Single Mother' OR T2.user_category_code  =  'Student';	real_estate_rentals
SELECT sum(T1.price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.user_category_code  =  'Single Mother' OR T2.user_category_code  =  'Student';	real_estate_rentals
SELECT T1.datestamp ,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY datestamp;	real_estate_rentals
SELECT T1.datestamp ,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY datestamp;	real_estate_rentals
SELECT property_type_description, property_type_code FROM (SELECT T1.property_type_description, T1.property_type_code, rank() over (ORDER BY count(*) DESC) as rk FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T1.property_type_code) WHERE rk = 1	real_estate_rentals
SELECT property_type_description, property_type_code FROM (SELECT T1.property_type_description, T1.property_type_code, rank() over (ORDER BY count(*) DESC) as rk FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T1.property_type_code) WHERE rk = 1	real_estate_rentals
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60';	real_estate_rentals
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60';	real_estate_rentals
SELECT room_size ,  count(*) FROM Rooms GROUP BY room_size	real_estate_rentals
SELECT room_size ,  count(*) FROM Rooms GROUP BY room_size	real_estate_rentals
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.first_name  =  'Robbie';	real_estate_rentals
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.first_name  =  'Robbie';	real_estate_rentals
SELECT first_name, middle_name, last_name FROM users WHERE user_id IN (SELECT owner_user_id FROM properties WHERE property_address_id IN (SELECT address_id FROM addresses WHERE address_id = user_address_id))	real_estate_rentals
SELECT first_name, middle_name, last_name FROM users WHERE EXISTS (SELECT 1 FROM properties WHERE property_address_id = user_address_id)	real_estate_rentals
SELECT us.search_string FROM user_searches us WHERE us.user_id NOT IN (SELECT properties.owner_user_id FROM properties)	real_estate_rentals
SELECT us.search_string FROM user_searches us WHERE us.user_id NOT IN (SELECT properties.owner_user_id FROM properties)	real_estate_rentals
SELECT u.user_id, u.last_name FROM users u WHERE (SELECT COUNT(*) FROM properties p WHERE p.owner_user_id = u.user_id) >= 2 AND (SELECT COUNT(*) FROM user_searches s WHERE s.user_id = u.user_id) <= 2	real_estate_rentals
SELECT u.user_id, u.last_name FROM users u WHERE (SELECT COUNT(*) FROM properties p WHERE p.owner_user_id = u.user_id) >= 2 AND (SELECT COUNT(*) FROM user_searches s WHERE s.user_id = u.user_id) <= 2	real_estate_rentals
SELECT count(*) FROM bike WHERE weight  >  780	bike_racing
SELECT product_name ,  weight FROM bike ORDER BY price ASC	bike_racing
SELECT heat ,  name ,  nation FROM cyclist	bike_racing
SELECT max(weight) ,  min(weight) FROM bike	bike_racing
SELECT avg(price) FROM bike WHERE material  =  'Carbon CC'	bike_racing
SELECT name ,  RESULT FROM cyclist WHERE nation != 'Russia'	bike_racing
SELECT DISTINCT T1.id ,  T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id WHERE T2.purchase_year  >  2015	bike_racing
SELECT T1.id ,  T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id GROUP BY T1.id HAVING count(*)  >=  4	bike_racing
SELECT c.id, c.name FROM cyclist c JOIN cyclists_own_bikes cb ON c.id = cb.cyclist_id GROUP BY c.id HAVING COUNT(cb.bike_id) = (SELECT MAX(bike_count) FROM (SELECT COUNT(bike_id) AS bike_count FROM cyclists_own_bikes GROUP BY cyclist_id));	bike_racing
SELECT DISTINCT T3.product_name FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id JOIN bike AS T3 ON T2.bike_id  =  T3.id WHERE T1.nation  =  'Russia' OR T1.nation  =  'Great Britain'	bike_racing
SELECT count(DISTINCT heat) FROM cyclist	bike_racing
SELECT count(*) FROM cyclist WHERE id NOT IN ( SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year  >  2015 )	bike_racing
SELECT T1.product_name FROM bike AS T1 WHERE T1.id IN (SELECT T3.bike_id FROM cyclist AS T2 JOIN cyclists_own_bikes AS T3 ON T2.id = T3.cyclist_id WHERE T2.result < '4:21.558')	bike_racing
SELECT bike.product_name, bike.price FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.name IN ('Bradley Wiggins', 'Antonio Tauler') GROUP BY bike.id HAVING COUNT(DISTINCT cyclist.name) = 2	bike_racing
SELECT name, nation, RESULT FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes)	bike_racing
SELECT product_name FROM bike WHERE material LIKE "%fiber%"	bike_racing
SELECT cy.id, COUNT(distinct cb.bike_id) FROM cyclist cy LEFT JOIN cyclists_own_bikes cb ON cy.id = cb.cyclist_id GROUP BY cy.id ORDER BY cy.id	bike_racing
SELECT goods.id, goods.flavor FROM goods WHERE goods.food = 'cake' AND goods.price = (SELECT MAX(price) FROM goods WHERE food = 'cake')	bakery_1
SELECT goods.id, goods.flavor FROM goods WHERE goods.food = 'cake' AND goods.price = (SELECT MAX(price) FROM goods WHERE food = 'cake')	bakery_1
SELECT goods.id, goods.flavor FROM goods WHERE goods.food = 'cookie' AND price = (SELECT MIN(price) FROM goods WHERE food = 'cookie')	bakery_1
SELECT goods.id, goods.flavor FROM goods WHERE goods.food = 'cookie' AND price = (SELECT MIN(price) FROM goods WHERE food = 'cookie')	bakery_1
SELECT id FROM goods WHERE flavor = 'apple'	bakery_1
SELECT id FROM goods WHERE flavor = 'apple'	bakery_1
SELECT id FROM goods WHERE price  <  3	bakery_1
SELECT id FROM goods WHERE price  <  3	bakery_1
SELECT DISTINCT customers.id FROM customers JOIN receipts ON customers.id = receipts.customerid JOIN items ON receipts.receiptnumber = items.receipt JOIN goods ON items.item = goods.id WHERE goods.food = 'cake' AND goods.flavor = 'lemon'	bakery_1
SELECT DISTINCT customers.id FROM customers JOIN receipts ON customers.id = receipts.customerid JOIN items ON receipts.receiptnumber = items.receipt JOIN goods ON items.item = goods.id WHERE goods.food = 'cake' AND goods.flavor = 'lemon'	bakery_1
SELECT g.Food, COUNT(DISTINCT r.CustomerId) FROM goods g LEFT JOIN items i ON g.Id = i.Item JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food	bakery_1
SELECT g.Food, COUNT(DISTINCT r.CustomerId) FROM goods g LEFT JOIN items i ON g.Id = i.Item JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food	bakery_1
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING count(*)  >=  15	bakery_1
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING count(*)  >=  15	bakery_1
SELECT T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.id GROUP BY T2.id HAVING count(*)  >  10	bakery_1
SELECT T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.id GROUP BY T2.id HAVING count(*)  >  10	bakery_1
SELECT count(*) FROM goods WHERE food  =  "Cake"	bakery_1
SELECT COUNT(DISTINCT id) FROM goods WHERE food = 'cake'	bakery_1
SELECT flavor FROM goods WHERE food  =  "Croissant"	bakery_1
SELECT flavor FROM goods WHERE food  =  "croissant"	bakery_1
SELECT DISTINCT T1.item FROM items AS T1 JOIN receipts AS T2 ON T1.receipt  =  T2.ReceiptNumber WHERE T2.CustomerId  =  15	bakery_1
SELECT DISTINCT T1.item FROM items AS T1 JOIN receipts AS T2 ON T1.receipt  =  T2.ReceiptNumber WHERE T2.CustomerId  =  15	bakery_1
SELECT food ,  avg(price) ,  max(price) ,  min(price) FROM goods GROUP BY food	bakery_1
SELECT food ,  avg(price) ,  max(price) ,  min(price) FROM goods GROUP BY food	bakery_1
SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cake" INTERSECT SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cookie"	bakery_1
SELECT DISTINCT r.receiptnumber FROM receipts r WHERE EXISTS (SELECT 1 FROM items i JOIN goods g ON i.item = g.id WHERE g.food = 'cake' AND i.receipt = r.receiptnumber) AND EXISTS (SELECT 1 FROM items i2 JOIN goods g2 ON i2.item = g2.id WHERE g2.food = 'cookie' AND i2.receipt = r.receiptnumber)	bakery_1
SELECT DISTINCT receipts.receiptnumber FROM receipts, customers, items, goods WHERE receipts.customerid = customers.id AND items.receipt = receipts.receiptnumber AND items.item = goods.id AND customers.lastname = 'LOGAN' AND goods.food = 'Croissant'	bakery_1
SELECT DISTINCT r.receiptnumber FROM receipts r JOIN customers c ON r.customerid = c.id JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id WHERE c.lastname = 'Logan' AND g.food = 'croissant'	bakery_1
SELECT receiptnumber, date FROM receipts WHERE receiptnumber IN (SELECT receipt FROM items WHERE item IN (SELECT id FROM goods WHERE price = (SELECT MAX(price) FROM goods)))	bakery_1
SELECT receiptnumber, date FROM receipts WHERE receiptnumber IN (SELECT receipt FROM items WHERE item IN (SELECT id FROM goods WHERE price = (SELECT MAX(price) FROM goods)))	bakery_1
SELECT I.item FROM items I GROUP BY I.item HAVING COUNT(I.item) = (SELECT MIN(Count) FROM (SELECT COUNT(item) Count FROM items GROUP BY item))	bakery_1
SELECT I.item FROM items I GROUP BY I.item HAVING COUNT(I.item) = (SELECT MIN(Count) FROM (SELECT COUNT(item) Count FROM items GROUP BY item))	bakery_1
SELECT count(*) ,  food FROM goods GROUP BY food	bakery_1
SELECT count(*) ,  food FROM goods GROUP BY food	bakery_1
SELECT avg(price) ,  food FROM goods GROUP BY food	bakery_1
SELECT avg(price) ,  food FROM goods GROUP BY food	bakery_1
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5	bakery_1
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5	bakery_1
SELECT flavor FROM goods WHERE food  =  "cake" AND price  >  10	bakery_1
SELECT flavor FROM goods WHERE food  =  "cake" AND price  >  10	bakery_1
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)	bakery_1
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)	bakery_1
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT max(price) FROM goods WHERE food  =  "Tart")	bakery_1
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  "Tart")	bakery_1
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  13	bakery_1
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  13	bakery_1
SELECT DISTINCT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  15	bakery_1
SELECT DISTINCT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  15	bakery_1
SELECT id FROM goods WHERE id LIKE "%APP%"	bakery_1
SELECT id FROM goods WHERE id LIKE "%APP%"	bakery_1
SELECT id ,  price FROM goods WHERE id LIKE "%70%"	bakery_1
SELECT id ,  price FROM goods WHERE id LIKE "%70%"	bakery_1
SELECT LastName FROM customers ORDER BY LastName	bakery_1
SELECT LastName FROM customers ORDER BY LastName	bakery_1
SELECT DISTINCT id FROM goods ORDER BY id	bakery_1
SELECT DISTINCT id FROM goods ORDER BY id	bakery_1
SELECT DISTINCT r.receiptnumber FROM receipts r WHERE r.customerid = 12 OR r.receiptnumber IN (SELECT i.receipt FROM items i JOIN goods g ON i.item = g.id WHERE g.flavor = 'apple' AND g.food = 'pie')	bakery_1
SELECT receipts.receiptnumber FROM receipts WHERE EXISTS (SELECT 1 FROM items JOIN goods ON items.item = goods.id WHERE items.receipt = receipts.receiptnumber AND goods.flavor = 'apple' AND goods.food = 'pie') OR receipts.customerid = 12	bakery_1
SELECT ReceiptNumber ,  date FROM receipts WHERE date  =  (SELECT date FROM receipts ORDER BY date DESC LIMIT 1)	bakery_1
SELECT ReceiptNumber ,  date FROM receipts WHERE date  =  (SELECT date FROM receipts ORDER BY date DESC LIMIT 1)	bakery_1
SELECT T1.Receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.price  >  10 UNION SELECT ReceiptNumber FROM receipts WHERE date  =  (SELECT date FROM receipts ORDER BY date LIMIT 1)	bakery_1
SELECT T1.Receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.price  >  10 UNION SELECT ReceiptNumber FROM receipts WHERE date  =  (SELECT date FROM receipts ORDER BY date LIMIT 1)	bakery_1
SELECT id FROM goods WHERE food IN ('Cookie', 'Cake') AND price BETWEEN 3 AND 7	bakery_1
SELECT id FROM goods WHERE food IN ('Cookie', 'Cake') AND price BETWEEN 3 AND 7	bakery_1
SELECT firstname, lastname FROM customers WHERE id IN (SELECT customerid FROM receipts WHERE date = (SELECT MIN(date) FROM receipts))	bakery_1
SELECT firstname, lastname FROM customers WHERE id IN (SELECT customerid FROM receipts WHERE date = (SELECT MIN(date) FROM receipts))	bakery_1
SELECT AVG(price) FROM goods WHERE flavor IN ('blackberry', 'blueberry')	bakery_1
SELECT AVG(price) FROM goods WHERE flavor IN ('blackberry', 'blueberry')	bakery_1
SELECT MIN(price) FROM goods WHERE flavor = 'cheese'	bakery_1
SELECT id FROM goods WHERE flavor = 'cheese' AND price = (SELECT MIN(price) FROM goods WHERE flavor = 'cheese')	bakery_1
SELECT max(price) ,  min(price) ,  avg(price) ,  flavor FROM goods GROUP BY flavor ORDER BY flavor	bakery_1
SELECT max(price) ,  min(price) ,  avg(price) ,  flavor FROM goods GROUP BY flavor ORDER BY flavor	bakery_1
SELECT min(price) ,  max(price) ,  food FROM goods GROUP BY food ORDER BY food	bakery_1
SELECT min(price) ,  max(price) ,  food FROM goods GROUP BY food ORDER BY food	bakery_1
WITH RankedDates AS (SELECT date, RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk FROM receipts GROUP BY date) SELECT date FROM RankedDates WHERE rnk <= 3	bakery_1
WITH RankedDates AS (SELECT date, RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk FROM receipts GROUP BY date) SELECT date FROM RankedDates WHERE rnk <= 3	bakery_1
WITH cnt AS ( SELECT CustomerId, count(*) AS cnt FROM receipts GROUP BY CustomerId ) SELECT CustomerId, cnt FROM cnt WHERE cnt = (SELECT MAX(cnt) FROM cnt)	bakery_1
WITH cnt AS ( SELECT CustomerId, count(*) AS cnt FROM receipts GROUP BY CustomerId ) SELECT CustomerId, cnt FROM cnt WHERE cnt = (SELECT MAX(cnt) FROM cnt)	bakery_1
SELECT date ,  COUNT (DISTINCT CustomerId) FROM receipts GROUP BY date	bakery_1
SELECT date ,  COUNT (DISTINCT CustomerId) FROM receipts GROUP BY date	bakery_1
SELECT firstname, lastname FROM customers WHERE id IN (SELECT customerid FROM receipts WHERE receiptnumber IN (SELECT receipt FROM items WHERE item IN (SELECT id FROM goods WHERE flavor = 'apple' AND food = 'Tart')))	bakery_1
SELECT firstname, lastname FROM customers WHERE id IN (SELECT customerid FROM receipts WHERE receiptnumber IN (SELECT receipt FROM items WHERE item IN (SELECT id FROM goods WHERE flavor = 'apple' AND food = 'Tart')))	bakery_1
SELECT id FROM goods WHERE food  =  "Cookie" AND price  <  (SELECT min(price) FROM goods WHERE food  =  'Croissant')	bakery_1
SELECT id FROM goods WHERE food  =  "Cookie" AND price  <  (SELECT min(price) FROM goods WHERE food  =  'Croissant')	bakery_1
SELECT id FROM goods WHERE food  =  "Cake" AND price  >=  (SELECT avg(price) FROM goods WHERE food  =  "Tart")	bakery_1
SELECT id FROM goods WHERE food  =  "Cake" AND price  >=  (SELECT avg(price) FROM goods WHERE food  =  "Tart")	bakery_1
SELECT id FROM goods WHERE price > 2 * (SELECT AVG(price) FROM goods)	bakery_1
SELECT id FROM goods WHERE price > 2 * (SELECT AVG(price) FROM goods)	bakery_1
SELECT id ,  flavor ,  food FROM goods ORDER BY price	bakery_1
SELECT id ,  flavor ,  food FROM goods ORDER BY price	bakery_1
SELECT id ,  flavor FROM goods WHERE food  =  "Cake" ORDER BY flavor	bakery_1
SELECT id ,  flavor FROM goods WHERE food  =  "Cake" ORDER BY flavor	bakery_1
SELECT g.id FROM goods g WHERE g.flavor = 'chocolate' AND (SELECT COUNT(*) FROM items i WHERE i.item = g.id) <= 10	bakery_1
SELECT g.id FROM goods g WHERE g.flavor = 'chocolate' AND (SELECT COUNT(*) FROM items i WHERE i.item = g.id) <= 10	bakery_1
SELECT DISTINCT flavor FROM goods WHERE food  =  "Cake" EXCEPT SELECT DISTINCT flavor FROM goods WHERE food  =  "Tart"	bakery_1
SELECT DISTINCT flavor FROM goods WHERE food  =  "Cake" EXCEPT SELECT DISTINCT flavor FROM goods WHERE food  =  "Tart"	bakery_1
WITH cnt AS ( SELECT item, COUNT(*) AS cnt FROM items GROUP BY item ) SELECT item FROM cnt WHERE EXISTS ( SELECT 1 FROM (SELECT cnt FROM cnt ORDER BY cnt DESC LIMIT 3) t WHERE cnt.cnt = t.cnt )	bakery_1
WITH cnt AS ( SELECT item, COUNT(*) AS cnt FROM items GROUP BY item ) SELECT item FROM cnt WHERE EXISTS ( SELECT 1 FROM (SELECT cnt FROM cnt ORDER BY cnt DESC LIMIT 3) t WHERE cnt.cnt = t.cnt )	bakery_1
SELECT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.CustomerId HAVING sum(T1.price)  >  150	bakery_1
SELECT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.CustomerId HAVING sum(T1.price)  >  150	bakery_1
SELECT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.CustomerId HAVING avg(T1.price)  >  5	bakery_1
SELECT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.CustomerId HAVING avg(T1.price)  >  5	bakery_1
SELECT T3.date FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.date HAVING sum(T1.price)  >  100	bakery_1
SELECT T3.date FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T2.receipt  =  T3.ReceiptNumber GROUP BY T3.date HAVING sum(T1.price)  >  100	bakery_1
SELECT count(*) FROM driver	car_racing
SELECT count(*) FROM driver	car_racing
SELECT make ,  count(*) FROM driver WHERE points  >  150 GROUP BY make	car_racing
SELECT make ,  count(*) FROM driver WHERE points  >  150 GROUP BY make	car_racing
SELECT avg(age) ,  Make FROM driver GROUP BY make	car_racing
SELECT avg(age) ,  Make FROM driver GROUP BY make	car_racing
SELECT avg(Laps) FROM driver WHERE age  <  20	car_racing
SELECT avg(Laps) FROM driver WHERE age  <  20	car_racing
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner	car_racing
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner	car_racing
SELECT make FROM team GROUP BY make HAVING COUNT(team_id) > 1	car_racing
SELECT make FROM team GROUP BY make HAVING COUNT(team_id) > 1	car_racing
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"	car_racing
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"	car_racing
SELECT max(Points) ,  min(Points) FROM driver	car_racing
SELECT max(Points) ,  min(Points) FROM driver	car_racing
SELECT count(*) FROM driver WHERE Points  <  150	car_racing
SELECT count(*) FROM driver WHERE Points  <  150	car_racing
SELECT Driver FROM driver ORDER BY Age ASC	car_racing
SELECT Driver FROM driver ORDER BY Age ASC	car_racing
SELECT Driver FROM driver ORDER BY Points DESC	car_racing
SELECT Driver FROM driver ORDER BY Points DESC	car_racing
SELECT T2.Driver, T1.Country FROM country AS T1 RIGHT JOIN driver AS T2 ON T1.Country_ID = T2.Country	car_racing
SELECT T2.Driver, T1.Country FROM country AS T1 RIGHT JOIN driver AS T2 ON T1.Country_ID = T2.Country	car_racing
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Capital  =  "Dublin"	car_racing
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Capital  =  "Dublin"	car_racing
SELECT avg(T2.age) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Official_native_language  =  "English"	car_racing
SELECT avg(T2.age) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Official_native_language  =  "English"	car_racing
SELECT country.country FROM country WHERE country_id IN (SELECT country_id FROM country JOIN driver ON country.country_id = driver.country WHERE driver.points > 150)	car_racing
SELECT country.country FROM country WHERE country_id IN (SELECT country_id FROM country JOIN driver ON country.country_id = driver.country WHERE driver.points > 150)	car_racing
SELECT (SELECT capital FROM country WHERE country = d.country) AS capital FROM driver d WHERE d.points = (SELECT MAX(points) FROM driver)	car_racing
SELECT (SELECT capital FROM country WHERE country = d.country) AS capital FROM driver d WHERE d.points = (SELECT MAX(points) FROM driver)	car_racing
SELECT Make ,  COUNT(*) FROM driver GROUP BY Make	car_racing
SELECT Make ,  COUNT(*) FROM driver GROUP BY Make	car_racing
WITH Ranked AS (SELECT make, RANK() OVER (ORDER BY COUNT(driver_id) DESC) AS rank FROM driver GROUP BY make) SELECT make FROM Ranked WHERE rank = 1	car_racing
SELECT make FROM (SELECT make, COUNT(*) as num_drivers FROM driver GROUP BY make) temp WHERE num_drivers = (SELECT MAX(num_drivers) FROM (SELECT make, COUNT(*) as num_drivers FROM driver GROUP BY make) temp2)	car_racing
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3	car_racing
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3	car_racing
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)	car_racing
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)	car_racing
SELECT Country FROM country WHERE Country_ID IN ( SELECT Country FROM driver WHERE Make = 'Dodge' ) AND Country_ID IN ( SELECT Country FROM driver WHERE Make = 'Chevrolet' )	car_racing
SELECT Country FROM country WHERE Country_ID IN ( SELECT Country FROM driver WHERE Make = 'Dodge' ) AND Country_ID IN ( SELECT Country FROM driver WHERE Make = 'Chevrolet' )	car_racing
SELECT sum(Points) ,  avg(Points) FROM driver	car_racing
SELECT sum(Points) ,  avg(Points) FROM driver	car_racing
SELECT country FROM country WHERE country_id NOT IN (SELECT country FROM driver)	car_racing
SELECT country FROM country WHERE country_id NOT IN (SELECT country FROM driver)	car_racing
WITH DriverCounts AS ( SELECT t.team_id, COUNT(td.team_id) AS num_drivers FROM team t LEFT JOIN team_driver td ON t.team_id = td.team_id GROUP BY t.team_id ) SELECT t.manager, t.sponsor FROM team t INNER JOIN DriverCounts dc ON t.team_id = dc.team_id WHERE dc.num_drivers = ( SELECT MAX(num_drivers) FROM DriverCounts )	car_racing
WITH DriverCounts AS ( SELECT t.team_id, COUNT(td.team_id) AS num_drivers FROM team t LEFT JOIN team_driver td ON t.team_id = td.team_id GROUP BY t.team_id ) SELECT t.manager, t.sponsor FROM team t INNER JOIN DriverCounts dc ON t.team_id = dc.team_id WHERE dc.num_drivers = ( SELECT MAX(num_drivers) FROM DriverCounts )	car_racing
SELECT t1.manager ,  t1.car_owner FROM team AS t1 JOIN team_driver AS t2 ON t1.team_id  =  t2.team_id GROUP BY t2.team_id HAVING count(*)  >=  2	car_racing
SELECT t1.manager ,  t1.car_owner FROM team AS t1 JOIN team_driver AS t2 ON t1.team_id  =  t2.team_id GROUP BY t2.team_id HAVING count(*)  >=  2	car_racing
SELECT count(*) FROM institution	institution_sports
SELECT count(*) FROM institution	institution_sports
SELECT Name FROM institution ORDER BY Name ASC	institution_sports
SELECT Name FROM institution ORDER BY Name ASC	institution_sports
SELECT Name FROM institution ORDER BY Founded ASC	institution_sports
SELECT Name FROM institution ORDER BY Founded ASC	institution_sports
SELECT City ,  Province FROM institution	institution_sports
SELECT City ,  Province FROM institution	institution_sports
SELECT max(Enrollment) ,  min(Enrollment) FROM institution	institution_sports
SELECT max(Enrollment) ,  min(Enrollment) FROM institution	institution_sports
SELECT Affiliation FROM institution WHERE City != "Vancouver"	institution_sports
SELECT Affiliation FROM institution WHERE City != "Vancouver"	institution_sports
SELECT Stadium FROM institution ORDER BY Capacity DESC	institution_sports
SELECT Stadium FROM institution ORDER BY Capacity DESC	institution_sports
SELECT stadium FROM institution WHERE enrollment = (SELECT MAX(enrollment) FROM institution)	institution_sports
SELECT stadium FROM institution WHERE enrollment = (SELECT MAX(enrollment) FROM institution)	institution_sports
SELECT i.Name, c.Nickname FROM institution AS i LEFT JOIN Championship AS c ON c.Institution_ID = i.Institution_ID	institution_sports
SELECT i.Name, c.Nickname FROM institution AS i LEFT JOIN Championship AS c ON c.Institution_ID = i.Institution_ID	institution_sports
SELECT (SELECT nickname FROM championship WHERE institution_id = i.institution_id) FROM institution i WHERE enrollment = (SELECT MIN(enrollment) FROM institution)	institution_sports
SELECT (SELECT nickname FROM championship WHERE institution_id = i.institution_id) FROM institution i WHERE enrollment = (SELECT MIN(enrollment) FROM institution)	institution_sports
SELECT i.Name FROM institution AS i LEFT JOIN Championship AS c ON c.Institution_ID = i.Institution_ID ORDER BY c.Number_of_Championships DESC	institution_sports
SELECT i.Name FROM institution AS i LEFT JOIN Championship AS c ON c.Institution_ID = i.Institution_ID ORDER BY c.Number_of_Championships DESC	institution_sports
SELECT T2.Name FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T1.Number_of_Championships  >=  1	institution_sports
SELECT T2.Name FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T1.Number_of_Championships  >=  1	institution_sports
SELECT sum(T1.Number_of_Championships) FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T2.Affiliation  =  "Public"	institution_sports
SELECT sum(T1.Number_of_Championships) FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T2.Affiliation  =  "Public"	institution_sports
SELECT Affiliation ,  COUNT(*) FROM institution GROUP BY Affiliation	institution_sports
SELECT Affiliation ,  COUNT(*) FROM institution GROUP BY Affiliation	institution_sports
SELECT affiliation FROM institution GROUP BY affiliation HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM institution GROUP BY affiliation))	institution_sports
SELECT affiliation FROM institution GROUP BY affiliation HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) Cnt FROM institution GROUP BY affiliation))	institution_sports
SELECT founded FROM institution GROUP BY founded HAVING COUNT(*) > 1	institution_sports
SELECT Founded ,  COUNT(*) FROM institution GROUP BY Founded HAVING COUNT(*)  >  1	institution_sports
SELECT c.Nickname FROM institution AS i LEFT JOIN Championship AS c ON i.Institution_ID = c.Institution_ID ORDER BY i.Capacity DESC	institution_sports
SELECT c.Nickname FROM institution AS i LEFT JOIN Championship AS c ON i.Institution_ID = c.Institution_ID ORDER BY i.Capacity DESC	institution_sports
SELECT SUM(enrollment) FROM institution WHERE city IN ('Vancouver', 'Calgary')	institution_sports
SELECT enrollment FROM institution WHERE city IN ('Calgary', 'Vancouver')	institution_sports
SELECT Province FROM institution WHERE Founded  <  1920 INTERSECT SELECT Province FROM institution WHERE Founded  >  1950	institution_sports
SELECT Province FROM institution WHERE Founded  <  1920 INTERSECT SELECT Province FROM institution WHERE Founded  >  1950	institution_sports
SELECT count(DISTINCT Province) FROM institution	institution_sports
SELECT count(DISTINCT Province) FROM institution	institution_sports
SELECT * FROM warehouses	warehouse_1
SELECT * FROM warehouses	warehouse_1
SELECT DISTINCT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE LOCATION  =  'New York'	warehouse_1
SELECT DISTINCT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE LOCATION  =  'New York'	warehouse_1
SELECT CONTENTS FROM boxes WHERE Value  >  150	warehouse_1
SELECT CONTENTS FROM boxes WHERE Value  >  150	warehouse_1
SELECT w.Code, AVG(b.Value) FROM Warehouses w LEFT JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code	warehouse_1
SELECT w.Code, AVG(b.Value) FROM Warehouses w LEFT JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code	warehouse_1
SELECT avg(value) ,  sum(value) FROM boxes	warehouse_1
SELECT avg(value) ,  sum(value) FROM boxes	warehouse_1
SELECT avg(capacity) ,  sum(capacity) FROM warehouses	warehouse_1
SELECT avg(capacity) ,  sum(capacity) FROM warehouses	warehouse_1
SELECT avg(value) ,  max(value) ,  CONTENTS FROM boxes GROUP BY CONTENTS	warehouse_1
SELECT avg(value) ,  max(value) ,  CONTENTS FROM boxes GROUP BY CONTENTS	warehouse_1
SELECT t.contents FROM (SELECT contents, SUM(value) AS total_value FROM boxes GROUP BY contents) t WHERE t.total_value = (SELECT MAX(t2.total_value) FROM (SELECT SUM(value) AS total_value FROM boxes GROUP BY contents) t2)	warehouse_1
SELECT DISTINCT contents FROM boxes WHERE value = (SELECT MAX(value) FROM boxes)	warehouse_1
SELECT avg(value) FROM boxes	warehouse_1
SELECT avg(value) FROM boxes	warehouse_1
SELECT DISTINCT CONTENTS FROM boxes	warehouse_1
SELECT DISTINCT CONTENTS FROM boxes	warehouse_1
SELECT count(DISTINCT CONTENTS) FROM boxes	warehouse_1
SELECT count(DISTINCT CONTENTS) FROM boxes	warehouse_1
SELECT DISTINCT location FROM warehouses;	warehouse_1
SELECT DISTINCT location FROM warehouses;	warehouse_1
SELECT T1.code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'	warehouse_1
SELECT T1.code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'	warehouse_1
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'	warehouse_1
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'	warehouse_1
SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' INTERSECT SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'	warehouse_1
SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' INTERSECT SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'	warehouse_1
SELECT CONTENTS FROM boxes EXCEPT SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'	warehouse_1
SELECT CONTENTS FROM boxes EXCEPT SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'	warehouse_1
SELECT location FROM warehouses WHERE code IN (SELECT warehouse FROM boxes WHERE contents = 'Rocks') AND code NOT IN (SELECT warehouse FROM boxes WHERE contents = 'Scissors')	warehouse_1
SELECT location FROM warehouses WHERE code IN (SELECT warehouse FROM boxes WHERE contents = 'Rocks') AND code NOT IN (SELECT warehouse FROM boxes WHERE contents = 'Scissors')	warehouse_1
SELECT DISTINCT warehouse FROM boxes WHERE CONTENTS  =  'Rocks' OR CONTENTS  =  'Scissors'	warehouse_1
SELECT DISTINCT warehouse FROM boxes WHERE CONTENTS  =  'Rocks' OR CONTENTS  =  'Scissors'	warehouse_1
SELECT location FROM warehouses WHERE code IN (SELECT warehouse FROM boxes WHERE contents = 'Rocks' INTERSECT SELECT warehouse FROM boxes WHERE contents = 'Scissors')	warehouse_1
SELECT location FROM warehouses WHERE code IN (SELECT warehouse FROM boxes WHERE contents = 'Rocks' INTERSECT SELECT warehouse FROM boxes WHERE contents = 'Scissors')	warehouse_1
SELECT code ,  CONTENTS FROM boxes ORDER BY value	warehouse_1
SELECT code ,  CONTENTS FROM boxes ORDER BY value	warehouse_1
SELECT code, contents FROM boxes WHERE value = (SELECT MIN(value) FROM boxes)	warehouse_1
SELECT code, contents FROM boxes WHERE value = (SELECT MIN(value) FROM boxes)	warehouse_1
SELECT DISTINCT CONTENTS FROM boxes WHERE value  >  (SELECT avg(value) FROM boxes)	warehouse_1
SELECT DISTINCT CONTENTS FROM boxes WHERE value  >  (SELECT avg(value) FROM boxes)	warehouse_1
SELECT DISTINCT CONTENTS FROM boxes ORDER BY CONTENTS	warehouse_1
SELECT DISTINCT CONTENTS FROM boxes ORDER BY CONTENTS	warehouse_1
SELECT code FROM boxes WHERE value  >  (SELECT min(value) FROM boxes WHERE CONTENTS  =  'Rocks')	warehouse_1
SELECT code FROM boxes WHERE value  >  (SELECT min(value) FROM boxes WHERE CONTENTS  =  'Rocks')	warehouse_1
SELECT code ,  CONTENTS FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE CONTENTS  =  'Scissors')	warehouse_1
SELECT code ,  CONTENTS FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE CONTENTS  =  'Scissors')	warehouse_1
SELECT (SELECT SUM(value) FROM boxes WHERE warehouse = w.code) FROM warehouses w WHERE capacity = (SELECT MAX(capacity) FROM warehouses)	warehouse_1
SELECT (SELECT SUM(value) FROM boxes WHERE warehouse = w.code) FROM warehouses w WHERE capacity = (SELECT MAX(capacity) FROM warehouses)	warehouse_1
SELECT warehouse ,  avg(value) FROM boxes GROUP BY warehouse HAVING avg(value)  >  150	warehouse_1
SELECT warehouse ,  avg(value) FROM boxes GROUP BY warehouse HAVING avg(value)  >  150	warehouse_1
SELECT sum(value) ,  count(*) ,  CONTENTS FROM boxes GROUP BY CONTENTS	warehouse_1
SELECT sum(value) ,  count(*) ,  CONTENTS FROM boxes GROUP BY CONTENTS	warehouse_1
SELECT sum(capacity) ,  avg(capacity) ,  max(capacity) ,  LOCATION FROM warehouses GROUP BY LOCATION	warehouse_1
SELECT sum(capacity) ,  avg(capacity) ,  max(capacity) ,  LOCATION FROM warehouses GROUP BY LOCATION	warehouse_1
SELECT sum(capacity) FROM warehouses	warehouse_1
SELECT sum(capacity) FROM warehouses	warehouse_1
SELECT w.location, MAX(b.value) max_val FROM warehouses w LEFT JOIN boxes b ON w.code = b.warehouse GROUP BY w.location	warehouse_1
SELECT w.location, MAX(b.value) max_val FROM warehouses w LEFT JOIN boxes b ON w.code = b.warehouse GROUP BY w.location	warehouse_1
SELECT warehouses.code, COUNT(boxes.code) FROM warehouses LEFT JOIN boxes ON warehouses.code = boxes.warehouse GROUP BY warehouses.code	warehouse_1
SELECT warehouses.code, COUNT(boxes.code) AS box_total FROM warehouses LEFT JOIN boxes ON warehouses.code = boxes.warehouse GROUP BY warehouses.code	warehouse_1
SELECT count(DISTINCT LOCATION) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  'Rocks'	warehouse_1
SELECT COUNT(DISTINCT warehouse) FROM boxes WHERE contents = 'Rocks';	warehouse_1
SELECT T1.code ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.Code	warehouse_1
SELECT T1.code ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.Code	warehouse_1
SELECT T1.code FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago'	warehouse_1
SELECT T1.code FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago'	warehouse_1
SELECT w.code, COUNT(b.code) FROM warehouses w LEFT JOIN boxes b ON w.code = b.warehouse GROUP BY w.code	warehouse_1
SELECT w.code, COUNT(b.code) as box_count FROM warehouses w LEFT JOIN boxes b ON w.code = b.warehouse GROUP BY w.code	warehouse_1
SELECT w2.code, (SELECT COUNT(DISTINCT contents) FROM boxes WHERE warehouse = w2.code) FROM warehouses w2	warehouse_1
SELECT w2.code, (SELECT COUNT(DISTINCT contents) FROM boxes WHERE warehouse = w2.code) FROM warehouses w2	warehouse_1
SELECT w.code FROM warehouses w LEFT JOIN boxes b ON w.code = b.warehouse GROUP BY w.code HAVING COUNT(b.code) > w.capacity	warehouse_1
SELECT w.code FROM warehouses w LEFT JOIN boxes b ON w.code = b.warehouse GROUP BY w.code HAVING COUNT(b.code) > w.capacity	warehouse_1
SELECT sum(T1.value) FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location != 'Chicago'	warehouse_1
SELECT sum(T1.value) FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location != 'Chicago'	warehouse_1
SELECT university_name ,  city ,  state FROM University ORDER BY university_name	university_rank
SELECT university_name ,  city ,  state FROM University ORDER BY university_name	university_rank
SELECT count(*) FROM University WHERE state  =  'Illinois' OR state  =  'Ohio'	university_rank
SELECT count(*) FROM University WHERE state  =  'Illinois' OR state  =  'Ohio'	university_rank
SELECT max(enrollment) ,  avg(enrollment) ,  min(enrollment) FROM University	university_rank
SELECT max(enrollment) ,  avg(enrollment) ,  min(enrollment) FROM University	university_rank
SELECT team_name FROM University WHERE enrollment  >  (SELECT avg(enrollment) FROM University)	university_rank
select team_name from university where enrollment  >  (select avg(enrollment) from university)	university_rank
SELECT DISTINCT home_conference FROM University	university_rank
SELECT DISTINCT home_conference FROM University	university_rank
SELECT home_conference ,  count(*) FROM University GROUP BY home_conference	university_rank
SELECT home_conference ,  count(*) FROM University GROUP BY home_conference	university_rank
SELECT state FROM university GROUP BY state HAVING COUNT(*) = (SELECT MAX(total) FROM (SELECT COUNT(*) AS total FROM university GROUP BY state))	university_rank
SELECT state FROM university GROUP BY state HAVING COUNT(university_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(university_id) AS cnt FROM university GROUP BY state))	university_rank
SELECT home_conference FROM University GROUP BY home_conference HAVING avg(enrollment)  >  2000	university_rank
SELECT home_conference FROM University GROUP BY home_conference HAVING avg(enrollment)  >  2000	university_rank
WITH Enrollment_Sums AS (SELECT home_conference, SUM(enrollment) as total_enrollment FROM university GROUP BY home_conference) SELECT home_conference FROM Enrollment_Sums WHERE total_enrollment = (SELECT MIN(total_enrollment) FROM Enrollment_Sums)	university_rank
WITH Enrollment_Sums AS (SELECT home_conference, SUM(enrollment) as total_enrollment FROM university GROUP BY home_conference) SELECT home_conference FROM Enrollment_Sums WHERE total_enrollment = (SELECT MIN(total_enrollment) FROM Enrollment_Sums)	university_rank
SELECT major_name ,  major_code FROM Major ORDER BY major_code	university_rank
SELECT major_name ,  major_code FROM Major ORDER BY major_code	university_rank
SELECT T1.rank ,  T3.major_name FROM Major_Ranking AS T1 JOIN University AS T2 JOIN Major AS T3 ON T1.university_id  =  T2.university_id AND T1.major_id  =  T3.major_id WHERE T2.university_name  =  'Augustana College'	university_rank
SELECT T1.rank ,  T3.major_name FROM Major_Ranking AS T1 JOIN University AS T2 JOIN Major AS T3 ON T1.university_id  =  T2.university_id AND T1.major_id  =  T3.major_id WHERE T2.university_name  =  'Augustana College'	university_rank
SELECT university_name, city, state FROM university WHERE university_id IN (SELECT university_id FROM major_ranking JOIN major ON major_ranking.major_id = major.major_id WHERE major_ranking.rank = 1 AND major.major_name = 'Accounting')	university_rank
SELECT U.university_name, U.city, U.state FROM university U WHERE EXISTS (SELECT 1 FROM major_ranking R INNER JOIN major M ON M.major_id = R.major_id WHERE R.university_id = U.university_id AND M.major_name = 'Accounting' AND R.rank = 1)	university_rank
SELECT U.university_name FROM university AS U JOIN (SELECT university_id, COUNT(*) AS c FROM major_ranking WHERE rank = 1 GROUP BY university_id HAVING c = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM major_ranking WHERE rank = 1 GROUP BY university_id))) AS R ON U.university_id = R.university_id	university_rank
SELECT U.university_name FROM university AS U JOIN (SELECT university_id, COUNT(*) AS c FROM major_ranking WHERE rank = 1 GROUP BY university_id HAVING c = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM major_ranking WHERE rank = 1 GROUP BY university_id))) AS R ON U.university_id = R.university_id	university_rank
SELECT u.university_name FROM university u WHERE NOT EXISTS (SELECT * FROM major_ranking mr WHERE mr.rank = 1 AND mr.university_id = u.university_id)	university_rank
SELECT university_name FROM university WHERE university_id NOT IN (SELECT university_id FROM major_ranking WHERE rank = 1)	university_rank
SELECT university_name FROM university WHERE university_id IN (SELECT MR.university_id FROM major_ranking MR INNER JOIN major M ON MR.major_id = M.major_id WHERE M.major_name = 'Accounting' INTERSECT SELECT MR.university_id FROM major_ranking MR INNER JOIN major M ON MR.major_id = M.major_id WHERE M.major_name = 'Urban Education')	university_rank
SELECT university_name FROM university WHERE university_id IN (SELECT mr.university_id FROM major_ranking mr JOIN major m ON mr.major_id = m.major_id WHERE m.major_name = 'Accounting' INTERSECT SELECT mr.university_id FROM major_ranking mr JOIN major m ON mr.major_id = m.major_id WHERE m.major_name = 'Urban Education')	university_rank
SELECT T1.University_Name, T2.Rank FROM university AS T1 LEFT JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T1.State = 'Wisconsin'	university_rank
SELECT T1.University_Name, T2.Rank FROM university AS T1 LEFT JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T1.State = 'Wisconsin'	university_rank
SELECT U.university_name FROM university U INNER JOIN overall_ranking O ON U.university_id = O.university_id WHERE O.research_point = (SELECT MAX(research_point) FROM overall_ranking)	university_rank
SELECT U.university_name FROM university U INNER JOIN overall_ranking O ON U.university_id = O.university_id WHERE O.research_point = (SELECT MAX(research_point) FROM overall_ranking)	university_rank
SELECT T1.University_Name FROM university AS T1 LEFT JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_Point	university_rank
SELECT T1.University_Name FROM university AS T1 LEFT JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_Point	university_rank
SELECT university_name FROM university WHERE EXISTS (SELECT 1 FROM major_ranking JOIN major ON major_ranking.major_id = major.major_id WHERE major_ranking.university_id = university.university_id AND major_name = 'Accounting' AND rank <= 3)	university_rank
SELECT university_name FROM university WHERE EXISTS (SELECT 1 FROM major_ranking JOIN major ON major_ranking.major_id = major.major_id WHERE major_ranking.university_id = university.university_id AND major_name = 'Accounting' AND rank <= 3)	university_rank
SELECT sum(enrollment) FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank  >=  5	university_rank
SELECT sum(enrollment) FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank  >=  5	university_rank
SELECT T1.University_Name, T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 WHERE EXISTS ( SELECT 1 FROM ( SELECT T2.Reputation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3 ) T WHERE T.Reputation_point = T2.Reputation_point )	university_rank
SELECT T1.University_Name, T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 WHERE EXISTS ( SELECT 1 FROM ( SELECT T2.Reputation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3 ) T WHERE T.Reputation_point = T2.Reputation_point )	university_rank
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2	university_rank
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2	university_rank
SELECT title FROM movies WHERE rating IS NULL	movie_2
SELECT title FROM movies WHERE rating IS NULL	movie_2
SELECT title FROM movies WHERE rating  =  'G'	movie_2
SELECT title FROM movies WHERE rating  =  'G'	movie_2
SELECT title FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')	movie_2
SELECT title FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')	movie_2
SELECT T1.title ,  T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie GROUP BY T1.code, T2.name	movie_2
SELECT T1.title ,  T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie GROUP BY T1.code, T2.name	movie_2
SELECT count(*) FROM movies WHERE rating  =  'G'	movie_2
SELECT count(*) FROM movies WHERE rating  =  'G'	movie_2
SELECT COUNT(DISTINCT movie) FROM movietheaters	movie_2
SELECT COUNT(DISTINCT movie) FROM movietheaters	movie_2
SELECT count(DISTINCT T1.code) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie	movie_2
SELECT count(DISTINCT T1.code) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie	movie_2
SELECT count(DISTINCT name) FROM movietheaters	movie_2
SELECT count(DISTINCT name) FROM movietheaters	movie_2
SELECT rating FROM movies WHERE title LIKE '%Citizen%'	movie_2
SELECT rating FROM movies WHERE title LIKE '%Citizen%'	movie_2
SELECT DISTINCT mt.name FROM movietheaters AS mt JOIN movies AS m ON mt.movie = m.code WHERE m.rating IN ('G', 'PG')	movie_2
SELECT DISTINCT mt.name FROM movietheaters AS mt JOIN movies AS m ON mt.movie = m.code WHERE m.rating IN ('G', 'PG')	movie_2
SELECT title FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name = 'Odeon' OR name = 'Imperial')	movie_2
SELECT title FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name = 'Odeon' OR name = 'Imperial')	movie_2
SELECT title FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name = 'Imperial') AND code IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')	movie_2
SELECT title FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name = 'Imperial') AND code IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')	movie_2
SELECT title FROM movies WHERE NOT EXISTS (SELECT 1 FROM movietheaters WHERE movietheaters.movie = movies.code AND movietheaters.name = 'Odeon')	movie_2
SELECT title FROM movies WHERE code NOT IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')	movie_2
SELECT title FROM movies ORDER BY title	movie_2
SELECT title FROM movies ORDER BY title	movie_2
SELECT title FROM movies ORDER BY rating	movie_2
SELECT title FROM movies ORDER BY rating	movie_2
SELECT name FROM movietheaters GROUP BY name HAVING COUNT(DISTINCT movie) = (SELECT MAX(movie_count) FROM (SELECT COUNT(DISTINCT movie) AS movie_count FROM movietheaters GROUP BY name) T)	movie_2
SELECT name FROM movietheaters GROUP BY name HAVING COUNT(DISTINCT movie) = (SELECT MAX(movie_count) FROM (SELECT COUNT(DISTINCT movie) AS movie_count FROM movietheaters GROUP BY name) T)	movie_2
WITH CNT AS ( SELECT m.Title, COUNT(mt.Code) AS cnt FROM Movies m LEFT JOIN MovieTheaters mt ON m.Code = mt.Movie GROUP BY m.Code ) SELECT Title FROM CNT WHERE cnt = (SELECT MAX(cnt) FROM CNT)	movie_2
WITH CNT AS ( SELECT m.Title, COUNT(mt.Code) AS cnt FROM Movies m LEFT JOIN MovieTheaters mt ON m.Code = mt.Movie GROUP BY m.Code ) SELECT Title FROM CNT WHERE cnt = (SELECT MAX(cnt) FROM CNT)	movie_2
SELECT count(*) ,  rating FROM movies GROUP BY rating	movie_2
SELECT count(*) ,  rating FROM movies GROUP BY rating	movie_2
SELECT COUNT(*) FROM movies WHERE rating IS NOT NULL	movie_2
SELECT COUNT(*) FROM movies WHERE rating IS NOT NULL	movie_2
SELECT name FROM movietheaters GROUP BY name HAVING count(movie)  >=  1	movie_2
SELECT name FROM movietheaters GROUP BY name HAVING count(movie)  >=  1	movie_2
SELECT Name FROM MovieTheaters GROUP BY Name HAVING COUNT(Movie) = 0	movie_2
SELECT Name FROM MovieTheaters GROUP BY Name HAVING COUNT(Movie) = 0	movie_2
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'	movie_2
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'	movie_2
SELECT title FROM movies	movie_2
SELECT title FROM movies	movie_2
SELECT DISTINCT rating FROM movies	movie_2
SELECT DISTINCT rating FROM movies	movie_2
SELECT * FROM movies WHERE rating IS NULL	movie_2
SELECT * FROM movies WHERE rating IS NULL	movie_2
SELECT title FROM movies WHERE code NOT IN (SELECT movie FROM movietheaters)	movie_2
SELECT title FROM movies WHERE code NOT IN (SELECT movie FROM movietheaters)	movie_2
SELECT name FROM client WHERE accountnumber IN (SELECT recipient FROM package WHERE weight = (SELECT MAX(weight) FROM package))	planet_1
SELECT name FROM client WHERE accountnumber IN (SELECT recipient FROM package WHERE weight = (SELECT MAX(weight) FROM package))	planet_1
SELECT sum(T1.Weight) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong";	planet_1
SELECT sum(T1.Weight) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong";	planet_1
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong";	planet_1
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong";	planet_1
SELECT Salary ,  POSITION FROM Employee WHERE Name  =  "Turanga Leela";	planet_1
SELECT Salary ,  POSITION FROM Employee WHERE Name  =  "Turanga Leela";	planet_1
SELECT avg(Salary) FROM Employee WHERE POSITION  =  "Intern";	planet_1
SELECT avg(Salary) FROM Employee WHERE POSITION  =  "Intern";	planet_1
SELECT T1.Level FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee = T2.EmployeeID WHERE T2.position  =  "Physician";	planet_1
SELECT T1.Level FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee = T2.EmployeeID WHERE T2.position  =  "Physician";	planet_1
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong";	planet_1
SELECT COUNT(packagenumber) FROM package JOIN client ON package.sender = client.accountnumber WHERE client.name = 'Leo Wong'	planet_1
SELECT p.packagenumber FROM package p JOIN client c ON p.recipient = c.accountnumber WHERE c.name = 'Leo Wong'	planet_1
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name = "Leo Wong";	planet_1
SELECT p.PackageNumber FROM Package AS p JOIN Client AS c1 ON p.Sender = c1.AccountNumber JOIN Client AS c2 ON p.Recipient = c2.AccountNumber WHERE c1.Name = 'Leo Wong' OR c2.Name = 'Leo Wong'	planet_1
SELECT DISTINCT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber OR T1.Recipient  =  T2.AccountNumber WHERE T2.Name = "Leo Wong"	planet_1
SELECT COUNT(*) FROM package JOIN client AS sender ON package.sender = sender.accountnumber JOIN client AS recipient ON package.recipient = recipient.accountnumber WHERE sender.name = 'Ogden Wernstrom' AND recipient.name = 'Leo Wong'	planet_1
SELECT COUNT(*) FROM package JOIN client AS sender ON package.sender = sender.accountnumber JOIN client AS recipient ON package.recipient = recipient.accountnumber WHERE sender.name = 'Ogden Wernstrom' AND recipient.name = 'Leo Wong'	planet_1
SELECT T1.Contents FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "John Zoidfarb";	planet_1
SELECT T1.Contents FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "John Zoidfarb";	planet_1
WITH Weights AS ( SELECT p.PackageNumber, p.Weight FROM Package AS p JOIN Client AS c ON p.Sender = c.AccountNumber WHERE c.Name LIKE '%John%' ) SELECT * FROM Weights WHERE Weight = (SELECT MAX(Weight) FROM Weights)	planet_1
WITH Weights AS ( SELECT p.PackageNumber, p.Weight FROM Package AS p JOIN Client AS c ON p.Sender = c.AccountNumber WHERE c.Name LIKE '%John%' ) SELECT * FROM Weights WHERE Weight = (SELECT MAX(Weight) FROM Weights)	planet_1
SELECT PackageNumber, Weight FROM ( SELECT PackageNumber, Weight, RANK() OVER (ORDER BY Weight) AS rnk FROM Package ) t WHERE rnk <= 3	planet_1
SELECT PackageNumber, Weight FROM ( SELECT PackageNumber, Weight, RANK() OVER (ORDER BY Weight) AS rnk FROM Package ) t WHERE rnk <= 3	planet_1
WITH PackageCount AS ( SELECT c.Name, COUNT(p.PackageNumber) AS cnt FROM Client c LEFT JOIN Package p ON c.AccountNumber = p.Sender GROUP BY c.AccountNumber ) SELECT Name, cnt FROM PackageCount WHERE cnt = (SELECT MAX(cnt) FROM PackageCount)	planet_1
WITH PackageCount AS ( SELECT c.Name, COUNT(p.PackageNumber) AS cnt FROM Client c LEFT JOIN Package p ON c.AccountNumber = p.Sender GROUP BY c.AccountNumber ) SELECT Name, cnt FROM PackageCount WHERE cnt = (SELECT MAX(cnt) FROM PackageCount)	planet_1
WITH PackageCount AS ( SELECT c.Name, COUNT(p.PackageNumber) AS cnt FROM Client c LEFT JOIN Package p ON c.AccountNumber = p.Recipient GROUP BY c.AccountNumber ) SELECT Name, cnt FROM PackageCount WHERE cnt = (SELECT MIN(cnt) FROM PackageCount)	planet_1
WITH PackageCount AS ( SELECT c.Name, COUNT(p.PackageNumber) AS cnt FROM Client c LEFT JOIN Package p ON c.AccountNumber = p.Recipient GROUP BY c.AccountNumber ) SELECT Name, cnt FROM PackageCount WHERE cnt = (SELECT MIN(cnt) FROM PackageCount)	planet_1
SELECT name FROM client WHERE accountnumber IN (SELECT sender FROM package GROUP BY sender HAVING COUNT(packagenumber) > 1)	planet_1
SELECT name FROM client WHERE accountnumber IN (SELECT sender FROM package GROUP BY sender HAVING COUNT(*) > 1)	planet_1
SELECT Coordinates FROM Planet WHERE Name  =  "Mars";	planet_1
SELECT Coordinates FROM Planet WHERE Name  =  "Mars";	planet_1
SELECT Name ,  Coordinates FROM Planet ORDER BY Name	planet_1
SELECT Name ,  Coordinates FROM Planet ORDER BY Name	planet_1
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager = T2.EmployeeID WHERE T2.Name = "Phillip J. Fry";	planet_1
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager = T2.EmployeeID WHERE T2.Name = "Phillip J. Fry";	planet_1
SELECT Date FROM Shipment;	planet_1
SELECT Date FROM Shipment;	planet_1
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet = T2.PlanetID WHERE T2.Name  =  "Mars";	planet_1
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet = T2.PlanetID WHERE T2.Name  =  "Mars";	planet_1
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet = T2.PlanetID JOIN Employee AS T3 ON T3.EmployeeID = T1.Manager WHERE T2.Name = "Mars" AND T3.Name = "Turanga Leela";	planet_1
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet = T2.PlanetID JOIN Employee AS T3 ON T3.EmployeeID = T1.Manager WHERE T2.Name = "Mars" AND T3.Name = "Turanga Leela";	planet_1
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet = T2.PlanetID JOIN Employee AS T3 ON T3.EmployeeID = T1.Manager WHERE T2.Name = "Mars" OR T3.Name = "Turanga Leela";	planet_1
SELECT shipment.shipmentid FROM shipment JOIN planet ON shipment.planet = planet.planetid JOIN employee ON shipment.manager = employee.employeeid WHERE planet.name = 'Mars' AND employee.name = 'Turanga Leela'	planet_1
SELECT name, (SELECT COUNT(*) FROM shipment WHERE shipment.planet = planet.planetid) AS total_shipments FROM planet	planet_1
SELECT name, (SELECT COUNT(shipmentid) FROM shipment WHERE planet = planetid) AS Shipments FROM planet	planet_1
WITH CNT AS ( SELECT p.Name, COUNT(ShipmentID) AS cnt FROM Planet p LEFT JOIN Shipment s ON s.Planet = p.PlanetID GROUP BY p.PlanetID ) SELECT Name FROM CNT WHERE cnt = (SELECT MAX(cnt) FROM CNT)	planet_1
WITH CNT AS ( SELECT p.Name, COUNT(ShipmentID) AS cnt FROM Planet p LEFT JOIN Shipment s ON s.Planet = p.PlanetID GROUP BY p.PlanetID ) SELECT Name FROM CNT WHERE cnt = (SELECT MAX(cnt) FROM CNT)	planet_1
SELECT T2.Name ,  count(*) FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager = T2.EmployeeID GROUP BY T1.Manager;	planet_1
SELECT T2.Name ,  count(*) FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager = T2.EmployeeID GROUP BY T1.Manager;	planet_1
SELECT sum(T1.Weight) FROM PACKAGE AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID WHERE T3.Name = "Mars";	planet_1
SELECT sum(T1.Weight) FROM PACKAGE AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID WHERE T3.Name = "Mars";	planet_1
SELECT P.NAME AS PLANET_NAME, TOTAL_WEIGHT FROM PLANET P LEFT JOIN (SELECT SHIPMENT.PLANET, SUM(PACKAGE.WEIGHT) AS TOTAL_WEIGHT FROM SHIPMENT JOIN PACKAGE ON SHIPMENT.SHIPMENTID = PACKAGE.SHIPMENT GROUP BY SHIPMENT.PLANET) S ON P.PLANETID = S.PLANET ORDER BY P.NAME	planet_1
SELECT P.NAME AS PLANET_NAME, TOTAL_WEIGHT FROM PLANET P LEFT JOIN (SELECT SHIPMENT.PLANET, SUM(PACKAGE.WEIGHT) AS TOTAL_WEIGHT FROM SHIPMENT JOIN PACKAGE ON SHIPMENT.SHIPMENTID = PACKAGE.SHIPMENT GROUP BY SHIPMENT.PLANET) S ON P.PLANETID = S.PLANET ORDER BY P.NAME	planet_1
SELECT T3.Name FROM PACKAGE AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID GROUP BY T2.Planet HAVING sum(T1.Weight)  >  30;	planet_1
SELECT T3.Name FROM PACKAGE AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID GROUP BY T2.Planet HAVING sum(T1.Weight)  >  30;	planet_1
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON  T1.Sender = T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment = T3.ShipmentID JOIN Planet AS T4 ON T3.Planet = T4.PlanetID WHERE T2.Name = "Zapp Brannigan" AND T4.Name = "Omicron Persei 8";	planet_1
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON  T1.Sender = T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment = T3.ShipmentID JOIN Planet AS T4 ON T3.Planet = T4.PlanetID WHERE T2.Name = "Zapp Brannigan" AND T4.Name = "Omicron Persei 8";	planet_1
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON  T1.Sender = T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment = T3.ShipmentID JOIN Planet AS T4 ON T3.Planet = T4.PlanetID WHERE T2.Name  =  "Zapp Brannigan" OR T4.Name  =  "Omicron Persei 8";	planet_1
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON  T1.Sender = T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment = T3.ShipmentID JOIN Planet AS T4 ON T3.Planet = T4.PlanetID WHERE T2.Name  =  "Zapp Brannigan" OR T4.Name  =  "Omicron Persei 8";	planet_1
SELECT PackageNumber ,  Weight FROM PACKAGE WHERE Weight BETWEEN 10 AND 30;	planet_1
SELECT PackageNumber ,  Weight FROM PACKAGE WHERE Weight BETWEEN 10 AND 30;	planet_1
SELECT e.name FROM employee e WHERE NOT EXISTS (SELECT 1 FROM has_clearance h JOIN planet p ON h.planet = p.planetid WHERE h.employee = e.employeeid AND p.name = 'Mars')	planet_1
SELECT e.name FROM employee e WHERE NOT EXISTS (SELECT 1 FROM has_clearance h INNER JOIN planet p ON h.planet = p.planetid WHERE h.employee = e.employeeid AND p.name = 'Mars')	planet_1
SELECT name FROM employee WHERE employeeid IN (SELECT employee FROM has_clearance WHERE planet IN (SELECT planetid FROM planet WHERE name = 'Omega III'))	planet_1
SELECT e.name FROM employee e WHERE EXISTS (SELECT 1 FROM has_clearance h JOIN planet p ON p.planetid = h.planet WHERE h.employee = e.employeeid AND p.name = 'Omega III')	planet_1
SELECT T3.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee = T2.EmployeeID JOIN Planet AS T3 ON T1.Planet = T3.PlanetID GROUP BY T1.Planet HAVING count(*)  =  1;	planet_1
SELECT T3.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee = T2.EmployeeID JOIN Planet AS T3 ON T1.Planet = T3.PlanetID GROUP BY T1.Planet HAVING count(*)  =  1;	planet_1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000	planet_1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000	planet_1
SELECT Name FROM Employee WHERE Salary  >  5000 OR Salary  >  (SELECT avg(salary) FROM employee)	planet_1
SELECT Name FROM Employee WHERE Salary  >  5000 OR Salary  >  (SELECT avg(salary) FROM employee)	planet_1
SELECT COUNT(DISTINCT e.employeeid) FROM employee e WHERE e.employeeid NOT IN (SELECT h.employee FROM has_clearance h JOIN planet p ON h.planet = p.planetid WHERE p.name = 'Mars')	planet_1
SELECT COUNT(employeeid) FROM employee WHERE NOT EXISTS (SELECT 1 FROM has_clearance JOIN planet ON has_clearance.planet = planet.planetid WHERE has_clearance.employee = employee.employeeid AND planet.name = 'Mars')	planet_1
SELECT count(*) FROM game	video_game
SELECT count(*) FROM game	video_game
SELECT Title ,  Developers FROM game ORDER BY Units_sold_Millions DESC	video_game
SELECT Title ,  Developers FROM game ORDER BY Units_sold_Millions DESC	video_game
SELECT avg(Units_sold_Millions) FROM game WHERE developers != 'Nintendo'	video_game
SELECT avg(Units_sold_Millions) FROM game WHERE developers != 'Nintendo'	video_game
SELECT Platform_name ,  Market_district FROM platform	video_game
SELECT Platform_name ,  Market_district FROM platform	video_game
SELECT Platform_name ,  Platform_ID FROM platform WHERE Download_rank  =  1	video_game
SELECT Platform_name ,  Platform_ID FROM platform WHERE Download_rank  =  1	video_game
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player	video_game
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player	video_game
SELECT COUNT(DISTINCT player_id) FROM player WHERE rank_of_the_year < 3	video_game
SELECT count(*) FROM player WHERE Rank_of_the_year  <=  3	video_game
SELECT Player_name FROM player ORDER BY Player_name ASC	video_game
SELECT Player_name FROM player ORDER BY Player_name ASC	video_game
SELECT Player_name ,  College FROM player ORDER BY Rank_of_the_year DESC	video_game
SELECT Player_name ,  College FROM player ORDER BY Rank_of_the_year DESC	video_game
SELECT player_name, rank_of_the_year FROM player WHERE player_id IN (SELECT player_id FROM game_player WHERE game_id IN (SELECT game_id FROM game WHERE title = 'Super Mario World'))	video_game
SELECT player_name, rank_of_the_year FROM player WHERE player_id IN (SELECT game_player.player_id FROM game_player JOIN game ON game_player.game_id = game.game_id WHERE game.title = 'Super Mario World');	video_game
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"	video_game
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"	video_game
SELECT AVG(units_sold_millions) FROM game WHERE game_id IN (SELECT game_id FROM game_player WHERE player_id IN (SELECT player_id FROM player WHERE position = 'Guard'))	video_game
SELECT AVG(units_sold_millions) FROM game WHERE game_id IN (SELECT gp.game_id FROM game_player gp JOIN player p ON gp.player_id = p.player_id WHERE p.position = 'Guard')	video_game
SELECT T1.Title ,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID	video_game
SELECT T1.Title ,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID	video_game
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  "Asia" OR T2.Market_district  =  "USA"	video_game
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  "Asia" OR T2.Market_district  =  "USA"	video_game
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise	video_game
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise	video_game
SELECT franchise FROM game GROUP BY franchise HAVING COUNT(*) = (SELECT MAX(game_count) FROM (SELECT COUNT(game_id) as game_count FROM game GROUP BY franchise))	video_game
SELECT franchise FROM game GROUP BY franchise HAVING COUNT(*) = (SELECT MAX(game_count) FROM (SELECT COUNT(game_id) as game_count FROM game GROUP BY franchise))	video_game
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2	video_game
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2	video_game
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)	video_game
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)	video_game
SELECT title FROM game AS g WHERE EXISTS (SELECT 1 FROM game_player AS gp JOIN player AS p ON gp.player_id = p.player_id WHERE gp.game_id = g.game_id AND p.college = 'Auburn') AND EXISTS (SELECT 1 FROM game_player AS gp JOIN player AS p ON gp.player_id = p.player_id WHERE gp.game_id = g.game_id AND p.college = 'Oklahoma')	video_game
SELECT title FROM game AS g WHERE EXISTS (SELECT 1 FROM game_player AS gp JOIN player AS p ON gp.player_id = p.player_id WHERE gp.game_id = g.game_id AND p.college = 'Auburn') AND EXISTS (SELECT 1 FROM game_player AS gp JOIN player AS p ON gp.player_id = p.player_id WHERE gp.game_id = g.game_id AND p.college = 'Oklahoma')	video_game
SELECT DISTINCT Franchise FROM game	video_game
SELECT DISTINCT Franchise FROM game	video_game
SELECT title FROM game WHERE game_id NOT IN (SELECT g.game_id FROM game g JOIN game_player gp ON g.game_id = gp.game_id JOIN player p ON gp.player_id = p.player_id WHERE p.position = 'Guard')	video_game
SELECT title FROM game WHERE game_id NOT IN (SELECT g.game_id FROM game g JOIN game_player gp ON g.game_id = gp.game_id JOIN player p ON gp.player_id = p.player_id WHERE p.position = 'Guard')	video_game
SELECT name FROM press ORDER BY Year_Profits_billion DESC	book_press
SELECT name FROM press ORDER BY Year_Profits_billion DESC	book_press
SELECT name FROM press WHERE Year_Profits_billion  >  15 OR Month_Profits_billion  >  1	book_press
SELECT name FROM press WHERE Year_Profits_billion  >  15 OR Month_Profits_billion  >  1	book_press
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press	book_press
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press	book_press
SELECT press.name FROM press WHERE press.month_profits_billion = (SELECT MAX(month_profits_billion) FROM press)	book_press
SELECT p.name FROM press p WHERE p.month_profits_billion = (SELECT MAX(month_profits_billion) FROM press)	book_press
SELECT name FROM press WHERE Month_Profits_billion  =  (SELECT min(Month_Profits_billion) FROM press) OR Month_Profits_billion  =  (SELECT max(Month_Profits_billion) FROM press)	book_press
SELECT name FROM press WHERE Month_Profits_billion  =  (SELECT min(Month_Profits_billion) FROM press) OR Month_Profits_billion  =  (SELECT max(Month_Profits_billion) FROM press)	book_press
SELECT count(*) FROM author WHERE age  <  30	book_press
SELECT count(*) FROM author WHERE age  <  30	book_press
SELECT avg(age) ,  gender FROM author GROUP BY gender	book_press
SELECT avg(age) ,  gender FROM author GROUP BY gender	book_press
SELECT count(*) ,  gender FROM author WHERE age  >  30 GROUP BY gender	book_press
SELECT count(*) ,  gender FROM author WHERE age  >  30 GROUP BY gender	book_press
SELECT title FROM book ORDER BY release_date DESC	book_press
SELECT title FROM book ORDER BY release_date DESC	book_press
SELECT count(*) ,  book_series FROM book GROUP BY book_series	book_press
SELECT count(*) ,  book_series FROM book GROUP BY book_series	book_press
SELECT b.Title, b.release_date FROM book b WHERE EXISTS ( SELECT 1 FROM (SELECT sale_amount FROM book ORDER BY sale_amount DESC LIMIT 5) top WHERE top.sale_amount = b.sale_amount )	book_press
SELECT b.Title, b.release_date FROM book b WHERE EXISTS ( SELECT 1 FROM (SELECT sale_amount FROM book ORDER BY sale_amount DESC LIMIT 5) top WHERE top.sale_amount = b.sale_amount )	book_press
SELECT book_series FROM book WHERE sale_amount  >  1000 INTERSECT SELECT book_series FROM book WHERE sale_amount  <  500	book_press
SELECT book_series FROM book WHERE sale_amount  >  1000 INTERSECT SELECT book_series FROM book WHERE sale_amount  <  500	book_press
SELECT name FROM author WHERE EXISTS (SELECT 1 FROM book WHERE author_id = author.author_id AND book_series = 'MM') AND EXISTS (SELECT 1 FROM book WHERE author_id = author.author_id AND book_series = 'LT')	book_press
SELECT author.name FROM author WHERE author.author_id IN (SELECT b.author_id FROM book b WHERE b.book_series = 'LT') AND author.author_id IN (SELECT b.author_id FROM book b WHERE b.book_series = 'MM')	book_press
SELECT name ,  age FROM author WHERE author_id NOT IN (SELECT author_id FROM book)	book_press
select name from author where author_id not in (select author_id from book)	book_press
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id GROUP BY t2.author_id HAVING count(*)  >  1	book_press
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id GROUP BY t2.author_id HAVING count(*)  >  1	book_press
SELECT b.Title, a.Name, p.Name FROM book b JOIN press p ON b.Press_ID = p.Press_ID JOIN author a ON b.Author_ID = a.Author_ID WHERE EXISTS ( SELECT 1 FROM (SELECT sale_amount FROM book ORDER BY sale_amount DESC LIMIT 3) top WHERE top.sale_amount = b.sale_amount )	book_press
SELECT b.Title, a.Name, p.Name FROM book b JOIN press p ON b.Press_ID = p.Press_ID JOIN author a ON b.Author_ID = a.Author_ID WHERE EXISTS ( SELECT 1 FROM (SELECT sale_amount FROM book ORDER BY sale_amount DESC LIMIT 3) top WHERE top.sale_amount = b.sale_amount )	book_press
SELECT p.Name, IFNULL( (SELECT SUM(b.sale_amount) FROM book b WHERE b.Press_ID = p.Press_ID), 0) FROM press p	book_press
SELECT p.Name, IFNULL( (SELECT SUM(b.sale_amount) FROM book b WHERE b.Press_ID = p.Press_ID), 0) FROM press p	book_press
SELECT press.name, (SELECT COUNT(*) FROM book WHERE book.press_id = press.press_id AND book.sale_amount > 1000) AS num_books FROM press	book_press
SELECT press.name, (SELECT COUNT(*) FROM book WHERE book.press_id = press.press_id AND book.sale_amount > 1000) AS num_books FROM press	book_press
WITH BestSellingBook AS ( SELECT MAX(Sale_amount) AS MaxSale FROM book ) SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID, BestSellingBook WHERE b.Sale_amount = BestSellingBook.MaxSale GROUP BY a.Author_ID, a.Name	book_press
WITH BestSellingBook AS ( SELECT MAX(Sale_amount) AS MaxSale FROM book ) SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID, BestSellingBook WHERE b.Sale_amount = BestSellingBook.MaxSale GROUP BY a.Author_ID, a.Name	book_press
WITH BookCount AS ( SELECT author.Author_ID, COUNT(book.Book_ID) AS cnt FROM author LEFT JOIN book ON author.Author_ID = book.Author_ID GROUP BY author.Author_ID ) SELECT author.name, author.gender FROM author JOIN BookCount ON author.Author_ID = BookCount.Author_ID WHERE BookCount.cnt = (SELECT MAX(cnt) FROM BookCount)	book_press
WITH BookCount AS ( SELECT author.Author_ID, COUNT(book.Book_ID) AS cnt FROM author LEFT JOIN book ON author.Author_ID = book.Author_ID GROUP BY author.Author_ID ) SELECT author.name, author.gender FROM author JOIN BookCount ON author.Author_ID = BookCount.Author_ID WHERE BookCount.cnt = (SELECT MAX(cnt) FROM BookCount)	book_press
SELECT a.name FROM author a WHERE a.author_id NOT IN (SELECT b.author_id FROM book b INNER JOIN press p ON b.press_id = p.press_id WHERE p.name = 'Accor')	book_press
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM book WHERE press_id IN (SELECT press_id FROM press WHERE name = 'Accor'))	book_press
SELECT t2.name ,  t2.Year_Profits_billion FROM book AS t1 JOIN press AS t2 ON t1.press_id  =  t2.press_id GROUP BY t2.press_id HAVING count(*)  >  2	book_press
SELECT t2.name ,  t2.Year_Profits_billion FROM book AS t1 JOIN press AS t2 ON t1.press_id  =  t2.press_id GROUP BY t2.press_id HAVING count(*)  >  2	book_press
SELECT count(*) FROM Authors	cre_Doc_Workflow
SELECT author_name FROM Authors	cre_Doc_Workflow
SELECT author_name ,  other_details FROM Authors	cre_Doc_Workflow
SELECT other_details FROM Authors WHERE author_name  =  "Addison Denesik"	cre_Doc_Workflow
SELECT count(*) FROM Documents	cre_Doc_Workflow
SELECT author_name FROM Documents WHERE document_id  =  4	cre_Doc_Workflow
SELECT author_name FROM Documents WHERE document_name  =  "Travel to Brazil"	cre_Doc_Workflow
SELECT count(*) FROM Documents WHERE author_name  =  "Era Kerluke"	cre_Doc_Workflow
SELECT document_name ,  document_description FROM Documents	cre_Doc_Workflow
SELECT document_id ,  document_name FROM Documents WHERE author_name  =  "Bianka Cummings"	cre_Doc_Workflow
SELECT T2.author_name ,  T2.other_details FROM Documents AS T1 JOIN Authors AS T2 ON T1.author_name  =  T2.author_name WHERE document_name  =  "Travel to China"	cre_Doc_Workflow
SELECT a.author_name, (SELECT COUNT(*) FROM Documents WHERE author_name = a.author_name) FROM Authors a GROUP BY a.author_name	cre_Doc_Workflow
WITH DocCount AS ( SELECT a.author_name, (SELECT COUNT(*) FROM Documents WHERE author_name = a.author_name) AS cnt FROM Authors a GROUP BY a.author_name ) SELECT author_name FROM DocCount WHERE cnt = (SELECT MAX(cnt) FROM DocCount)	cre_Doc_Workflow
SELECT author_name FROM Documents GROUP BY author_name HAVING count(*)  >=  2	cre_Doc_Workflow
SELECT count(*) FROM Business_processes	cre_Doc_Workflow
SELECT next_process_id ,  process_name ,  process_description FROM Business_processes WHERE process_id  =  9	cre_Doc_Workflow
SELECT process_name FROM Business_processes WHERE process_id  =  (SELECT next_process_id FROM Business_processes WHERE process_id  =  9)	cre_Doc_Workflow
SELECT count(*) FROM Process_outcomes	cre_Doc_Workflow
SELECT process_outcome_code ,  process_outcome_description FROM Process_outcomes	cre_Doc_Workflow
SELECT process_outcome_description FROM Process_outcomes WHERE process_outcome_code  =  "working"	cre_Doc_Workflow
SELECT count(*) FROM Process_status	cre_Doc_Workflow
SELECT process_status_code ,  process_status_description FROM Process_status	cre_Doc_Workflow
SELECT process_status_description FROM Process_status WHERE process_status_code  =  "ct"	cre_Doc_Workflow
SELECT count(*) FROM Staff	cre_Doc_Workflow
SELECT staff_id ,  staff_details FROM Staff	cre_Doc_Workflow
SELECT staff_details FROM Staff WHERE staff_id  =  100	cre_Doc_Workflow
SELECT count(*) FROM Ref_staff_roles	cre_Doc_Workflow
SELECT staff_role_code ,  staff_role_description FROM Ref_staff_roles	cre_Doc_Workflow
SELECT staff_role_description FROM Ref_staff_roles WHERE staff_role_code  =  "HR"	cre_Doc_Workflow
SELECT count(DISTINCT document_id) FROM Documents_processes	cre_Doc_Workflow
SELECT DISTINCT process_id FROM Documents_processes	cre_Doc_Workflow
SELECT document_id FROM Documents EXCEPT SELECT document_id FROM Documents_processes	cre_Doc_Workflow
SELECT process_id FROM Business_processes EXCEPT SELECT process_id FROM Documents_processes	cre_Doc_Workflow
SELECT T2.process_outcome_description ,  T3.process_status_description FROM Documents_processes AS T1 JOIN Process_outcomes AS T2 ON T1.process_outcome_code  =  T2.process_outcome_code JOIN Process_Status AS T3 ON T1.process_status_code  =  T3.process_status_code WHERE T1.document_id  =  0	cre_Doc_Workflow
SELECT T3.process_name FROM Documents_processes AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id JOIN Business_processes AS T3 ON T1.process_id  =  T3.process_id WHERE T2.document_name  =  "Travel to Brazil"	cre_Doc_Workflow
SELECT p.process_id, COUNT(d.document_id) FROM business_processes AS p LEFT JOIN documents_processes AS d ON p.process_id = d.process_id GROUP BY p.process_id	cre_Doc_Workflow
SELECT count(*) FROM Staff_in_processes WHERE document_id  =  0 AND process_id  =  9	cre_Doc_Workflow
SELECT staff.staff_id, COUNT(documents_processes.process_id) AS document_processes_count FROM staff LEFT JOIN staff_in_processes ON staff.staff_id = staff_in_processes.staff_id LEFT JOIN documents_processes ON staff_in_processes.document_id = documents_processes.document_id AND staff_in_processes.process_id = documents_processes.process_id GROUP BY staff.staff_id	cre_Doc_Workflow
SELECT staff_role_code, COUNT(*) FROM ( SELECT DISTINCT staff_role_code, document_id, process_id FROM Staff_in_Processes ) t GROUP BY staff_role_code	cre_Doc_Workflow
SELECT count(DISTINCT staff_role_code) FROM Staff_in_processes WHERE staff_id  =  3	cre_Doc_Workflow
SELECT count(*) FROM Agencies	advertising_agencies
SELECT count(*) FROM Agencies	advertising_agencies
SELECT agency_id ,  agency_details FROM Agencies	advertising_agencies
SELECT agency_id ,  agency_details FROM Agencies	advertising_agencies
SELECT count(*) FROM Clients	advertising_agencies
SELECT count(*) FROM Clients	advertising_agencies
SELECT client_id ,  client_details FROM Clients	advertising_agencies
SELECT client_id ,  client_details FROM Clients	advertising_agencies
SELECT agency_id, (SELECT COUNT(*) FROM clients WHERE clients.agency_id = agencies.agency_id) AS num_clients FROM agencies	advertising_agencies
SELECT a.agency_id, COUNT(c.client_id) AS number_of_clients FROM agencies a LEFT JOIN clients c ON a.agency_id = c.agency_id GROUP BY a.agency_id	advertising_agencies
WITH ClientCount AS ( SELECT a.agency_id, COUNT(c.agency_id) AS cnt FROM Agencies a LEFT JOIN Clients c ON a.agency_id = c.agency_id GROUP BY a.agency_id ) SELECT a.agency_id, a.agency_details FROM Agencies a JOIN ClientCount c ON a.agency_id = c.agency_id WHERE c.cnt = (SELECT MAX(cnt) FROM ClientCount)	advertising_agencies
WITH ClientCount AS ( SELECT a.agency_id, COUNT(c.agency_id) AS cnt FROM Agencies a LEFT JOIN Clients c ON a.agency_id = c.agency_id GROUP BY a.agency_id ) SELECT a.agency_id, a.agency_details FROM Agencies a JOIN ClientCount c ON a.agency_id = c.agency_id WHERE c.cnt = (SELECT MAX(cnt) FROM ClientCount)	advertising_agencies
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2	advertising_agencies
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2	advertising_agencies
SELECT T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id WHERE T1.client_details  =  'Mac'	advertising_agencies
SELECT T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id WHERE T1.client_details  =  'Mac'	advertising_agencies
SELECT T1.client_details ,  T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id	advertising_agencies
SELECT T1.client_details ,  T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id	advertising_agencies
SELECT sic_code ,  count(*) FROM Clients GROUP BY sic_code	advertising_agencies
SELECT sic_code ,  count(*) FROM Clients GROUP BY sic_code	advertising_agencies
SELECT client_id ,  client_details FROM Clients WHERE sic_code  =  "Bad";	advertising_agencies
SELECT client_id ,  client_details FROM Clients WHERE sic_code  =  "Bad";	advertising_agencies
SELECT DISTINCT agencies.agency_id, agencies.agency_details FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id	advertising_agencies
SELECT DISTINCT agencies.agency_id, agencies.agency_details FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id	advertising_agencies
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM Clients	advertising_agencies
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM Clients	advertising_agencies
SELECT count(*) FROM Invoices	advertising_agencies
SELECT count(*) FROM Invoices	advertising_agencies
SELECT invoice_id ,  invoice_status ,  invoice_details FROM Invoices	advertising_agencies
SELECT invoice_id ,  invoice_status ,  invoice_details FROM Invoices	advertising_agencies
SELECT c.client_id, IFNULL(COUNT(i.invoice_id), 0) as total_invoices FROM clients c LEFT JOIN invoices i ON c.client_id = i.client_id GROUP BY c.client_id	advertising_agencies
SELECT c.client_id, COUNT(i.invoice_id) as total_invoices FROM clients c LEFT JOIN invoices i ON c.client_id = i.client_id GROUP BY c.client_id	advertising_agencies
WITH InvoiceCount AS ( SELECT c.client_id, COUNT(i.client_id) AS cnt FROM Clients c LEFT JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id ) SELECT c.client_id, c.client_details FROM Clients c JOIN InvoiceCount i ON c.client_id = i.client_id WHERE i.cnt = (SELECT MAX(cnt) FROM InvoiceCount)	advertising_agencies
WITH InvoiceCount AS ( SELECT c.client_id, COUNT(i.client_id) AS cnt FROM Clients c LEFT JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id ) SELECT c.client_id, c.client_details FROM Clients c JOIN InvoiceCount i ON c.client_id = i.client_id WHERE i.cnt = (SELECT MAX(cnt) FROM InvoiceCount)	advertising_agencies
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2	advertising_agencies
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2	advertising_agencies
SELECT invoice_status ,  count(*) FROM Invoices GROUP BY invoice_status	advertising_agencies
SELECT invoice_status ,  count(*) FROM Invoices GROUP BY invoice_status	advertising_agencies
SELECT invoice_status FROM invoices GROUP BY invoice_status HAVING COUNT(invoice_status) = (SELECT MAX(Count) FROM (SELECT COUNT(invoice_status) Count FROM invoices GROUP BY invoice_status) Temp)	advertising_agencies
WITH cnt AS ( SELECT invoice_status, COUNT(*) AS cnt FROM Invoices GROUP BY invoice_status ) SELECT invoice_status FROM cnt WHERE cnt = (SELECT MAX(cnt) FROM cnt)	advertising_agencies
SELECT T1.invoice_status ,  T1.invoice_details ,  T2.client_id ,  T2.client_details ,  T3.agency_id ,  T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id JOIN Agencies AS T3 ON T2.agency_id  =  T3.agency_id	advertising_agencies
SELECT T1.invoice_status ,  T1.invoice_details ,  T2.client_id ,  T2.client_details ,  T3.agency_id ,  T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id JOIN Agencies AS T3 ON T2.agency_id  =  T3.agency_id	advertising_agencies
SELECT meeting_type ,  other_details FROM meetings	advertising_agencies
SELECT meeting_type ,  other_details FROM meetings	advertising_agencies
SELECT meeting_outcome ,  purpose_of_meeting FROM meetings	advertising_agencies
SELECT meeting_outcome ,  purpose_of_meeting FROM meetings	advertising_agencies
SELECT T1.payment_id ,  T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  'Working'	advertising_agencies
SELECT T1.payment_id ,  T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  'Working'	advertising_agencies
SELECT invoice_id ,  invoice_status FROM Invoices EXCEPT SELECT T1.invoice_id ,  T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id	advertising_agencies
SELECT invoice_id ,  invoice_status FROM Invoices EXCEPT SELECT T1.invoice_id ,  T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id	advertising_agencies
SELECT count(*) FROM Payments	advertising_agencies
SELECT count(*) FROM Payments	advertising_agencies
SELECT payment_id ,  invoice_id ,  payment_details FROM Payments	advertising_agencies
SELECT payment_id ,  invoice_id ,  payment_details FROM Payments	advertising_agencies
SELECT DISTINCT T1.invoice_id ,  T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id	advertising_agencies
SELECT DISTINCT T1.invoice_id ,  T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id	advertising_agencies
SELECT invoices.invoice_id, COUNT(payments.payment_id) AS payment_count FROM invoices LEFT JOIN payments ON invoices.invoice_id = payments.invoice_id GROUP BY invoices.invoice_id	advertising_agencies
SELECT i.invoice_id, COUNT(p.payment_id) AS payment_count FROM invoices i LEFT JOIN payments p ON i.invoice_id = p.invoice_id GROUP BY i.invoice_id	advertising_agencies
WITH invoice_payments AS ( SELECT i.invoice_id, COUNT(p.invoice_id) AS total_payments FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id GROUP BY i.invoice_id ) SELECT i.invoice_id, i.invoice_status, i.invoice_details FROM Invoices i JOIN invoice_payments ON i.invoice_id = invoice_payments.invoice_id WHERE invoice_payments.total_payments = ( SELECT MAX(total_payments) FROM invoice_payments )	advertising_agencies
WITH invoice_payments AS ( SELECT i.invoice_id, COUNT(p.invoice_id) AS total_payments FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id GROUP BY i.invoice_id ) SELECT i.invoice_id, i.invoice_status, i.invoice_details FROM Invoices i JOIN invoice_payments ON i.invoice_id = invoice_payments.invoice_id WHERE invoice_payments.total_payments = ( SELECT MAX(total_payments) FROM invoice_payments )	advertising_agencies
SELECT count(*) FROM Staff	advertising_agencies
SELECT count(*) FROM Staff	advertising_agencies
SELECT a.agency_id, COUNT(s.staff_id) FROM agencies a LEFT JOIN staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id	advertising_agencies
SELECT a.agency_id, COUNT(s.staff_id) AS staff_count FROM agencies AS a LEFT JOIN staff AS s ON a.agency_id = s.agency_id GROUP BY a.agency_id	advertising_agencies
WITH StaffCount AS ( SELECT Agencies.agency_id, COUNT(Staff.agency_id) AS TotalStaff FROM Agencies LEFT JOIN Staff ON Agencies.agency_id = Staff.agency_id GROUP BY Agencies.agency_id ) SELECT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN StaffCount ON Agencies.agency_id = StaffCount.agency_id WHERE StaffCount.TotalStaff = ( SELECT MAX(TotalStaff) FROM StaffCount )	advertising_agencies
WITH StaffCount AS ( SELECT Agencies.agency_id, COUNT(Staff.agency_id) AS TotalStaff FROM Agencies LEFT JOIN Staff ON Agencies.agency_id = Staff.agency_id GROUP BY Agencies.agency_id ) SELECT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN StaffCount ON Agencies.agency_id = StaffCount.agency_id WHERE StaffCount.TotalStaff = ( SELECT MAX(TotalStaff) FROM StaffCount )	advertising_agencies
SELECT meeting_outcome ,  count(*) FROM Meetings GROUP BY meeting_outcome	advertising_agencies
SELECT meeting_outcome ,  count(*) FROM Meetings GROUP BY meeting_outcome	advertising_agencies
SELECT cl.client_id, (SELECT COUNT(*) FROM meetings mt WHERE mt.client_id = cl.client_id) AS meetings_sum FROM clients cl	advertising_agencies
SELECT c.client_id, COUNT(m.meeting_id) FROM clients c LEFT JOIN meetings m ON c.client_id = m.client_id GROUP BY c.client_id	advertising_agencies
SELECT client_id, meeting_type, COUNT(meeting_id) AS meeting_count FROM meetings GROUP BY client_id, meeting_type	advertising_agencies
SELECT meeting_type ,  count(*) FROM Meetings GROUP BY meeting_type	advertising_agencies
SELECT T1.meeting_id ,  T1.meeting_outcome ,  T1.meeting_type ,  T2.client_details FROM meetings AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id	advertising_agencies
SELECT T1.meeting_id ,  T1.meeting_outcome ,  T1.meeting_type ,  T2.client_details FROM meetings AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id	advertising_agencies
SELECT m.meeting_id, COUNT(si.staff_id) AS TotalStaff FROM meetings m LEFT JOIN staff_in_meetings si ON m.meeting_id = si.meeting_id GROUP BY m.meeting_id	advertising_agencies
SELECT m.meeting_id, COUNT(si.staff_id) AS TotalStaff FROM meetings m LEFT JOIN staff_in_meetings si ON m.meeting_id = si.meeting_id GROUP BY m.meeting_id	advertising_agencies
SELECT s.staff_id, COUNT(*) AS num_meetings FROM staff s JOIN staff_in_meetings sim ON s.staff_id = sim.staff_id GROUP BY s.staff_id HAVING num_meetings = (SELECT MIN(total_meetings) FROM (SELECT COUNT(*) AS total_meetings FROM staff_in_meetings GROUP BY staff_id))	advertising_agencies
SELECT s.staff_id FROM staff s JOIN staff_in_meetings sim ON s.staff_id = sim.staff_id GROUP BY s.staff_id HAVING COUNT(*) = (SELECT MIN(total_meetings) FROM (SELECT COUNT(*) AS total_meetings FROM staff_in_meetings GROUP BY staff_id))	advertising_agencies
SELECT count(DISTINCT staff_id) FROM Staff_in_meetings	advertising_agencies
SELECT count(DISTINCT staff_id) FROM Staff_in_meetings	advertising_agencies
SELECT count(*) FROM Staff WHERE staff_id NOT IN ( SELECT staff_id FROM Staff_in_meetings )	advertising_agencies
SELECT count(*) FROM Staff WHERE staff_id NOT IN ( SELECT staff_id FROM Staff_in_meetings )	advertising_agencies
SELECT T1.client_id ,  T1.client_details FROM Clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id UNION SELECT T1.client_id ,  T1.client_details FROM Clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id	advertising_agencies
SELECT T1.client_id ,  T1.client_details FROM Clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id UNION SELECT T1.client_id ,  T1.client_details FROM Clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id	advertising_agencies
SELECT DISTINCT staff.staff_id, staff.staff_details FROM staff JOIN staff_in_meetings ON staff.staff_id = staff_in_meetings.staff_id JOIN meetings ON staff_in_meetings.meeting_id = meetings.meeting_id WHERE staff.staff_details LIKE '%s%';	advertising_agencies
SELECT DISTINCT staff.staff_id, staff.staff_details FROM staff JOIN staff_in_meetings ON staff.staff_id = staff_in_meetings.staff_id JOIN meetings ON staff_in_meetings.meeting_id = meetings.meeting_id WHERE staff.staff_details LIKE '%s%';	advertising_agencies
SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id HAVING count(*)  =  1 INTERSECT SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id	advertising_agencies
SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id HAVING count(*)  =  1 INTERSECT SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id	advertising_agencies
SELECT T1.start_date_time ,  T1.end_date_time ,  T2.client_details ,  T4.staff_details FROM meetings AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id JOIN staff_in_meetings AS T3 ON T1.meeting_id  =  T3.meeting_id JOIN staff AS T4 ON T3.staff_id  =  T4.staff_id	advertising_agencies
SELECT T1.start_date_time ,  T1.end_date_time ,  T2.client_details ,  T4.staff_details FROM meetings AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id JOIN staff_in_meetings AS T3 ON T1.meeting_id  =  T3.meeting_id JOIN staff AS T4 ON T3.staff_id  =  T4.staff_id	advertising_agencies