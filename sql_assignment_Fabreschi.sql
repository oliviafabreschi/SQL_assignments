CREATE DATABASE onlineShop;
use onlineShop;

CREATE TABLE customers
(customer_id INTEGER,
first_name VARCHAR(50),
surname VARCHAR(50),
telephone INTEGER);

INSERT INTO customers (customer_id, first_name, surname, telephone)
VALUES (1000, "john", "Smith", 074329284),
(1001, "Amy", "Robinson", 0700432484),
(1002, "James", "Janet", 070343234),
(1003, "Leo", "Sunny", 07009284);

ALTER table customers 
ADD PRIMARY KEY (customer_id);

CREATE TABLE employees
(employee_id INTEGER,
first_name VARCHAR(50),
surname VARCHAR(50),
location VARCHAR(50));
INSERT INTO employees (employee_id, first_name, surname, location)
VALUES (382, "Red", "Shen", "London"),
(383, "Isla", "Johanson", "Paris"),
(384, "Erin", "Isna", "London"),
(385, "Polly", "Ewn", "Paris");

CREATE TABLE products
(product_id INTEGER,
product_name VARCHAR(50),
product_price INTEGER);

INSERT INTO products (product_id, product_name, product_price)
VALUES (1302, "Iphone", 1500),
(1334, "Case", 10),
(1284, "Earphones", 50),
(1302, "Screen_protector", 5);

CREATE TABLE orders
(order_nr INTEGER,
customer_id INTEGER,
employee_id INTEGER);
ALTER table orders 
ADD PRIMARY KEY (order_nr);
ALTER table orders
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
INSERT INTO orders (order_nr, customer_id, employee_id)
VALUES (1, 1000, 382),
(2, 1001, 383),
(3, 1002, 382),
(4, 1000, 385);


CREATE TABLE orderDetails
(order_nr INTEGER,
product_id INTEGER,
quantity INTEGER,
price INTEGER);
ALTER table orderDetails
ADD FOREIGN KEY (order_nr) REFERENCES orders(order_nr);

INSERT INTO orderDetails (order_nr, product_id, quantity, price)
VALUES (1, 1302, 5, 2000),
(2, 1334, 100, 20),
(3, 1302, 2, 2000),
(4, 1284, 500, 100);

#procedure to view customer full name
DELIMITER //
CREATE PROCEDURE view_customers_sp()
BEGIN
	SELECT c.first_name, c.surname
	from customers c;
end //
DELIMITER ;

#calling the procedure
call view_customers_sp;

#calling the function
select concatenate_name_(c.first_name, c.surname) from customers c;

#stored function
DELIMITER //
CREATE FUNCTION concatenate_name_(first_nm CHAR(24), last_nm CHAR(24))
RETURNS CHAR(50) DETERMINISTIC
BEGIN
  RETURN CONCAT('Customer name is ', first_nm, ' ', last_nm);
END //
DELIMITER ;


#inner join to view both customers and orders tables

SELECT 
    c.*, o.*
FROM
    customers c
        INNER JOIN
    orders o 
        ON 
        c.customer_id = o.customer_id;

SELECT
country, teeth
FROM bad_teeth bd
INNER JOIN
gdp 
ON
bd.country = g.country;

SELECT first_name 
FROM employees
WHERE (location = "London");

#query example - total revenue from the orders
SELECT  (quantity*price) QP
FROM orderDetails
GROUP BY quantity, price 
ORDER BY QP ASC;

SELECT quantity, price FROM orderDetails CROSS JOIN 

#Showing all orders from a specific customer, sorted by the employee ID
SELECT * FROM orders
WHERE customer_id = 1000
order by employee_ID ASC;

