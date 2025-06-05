SELECT * FROM customers;
SELECT * FROM books;
SELECT * FROM authors;
SELECT * FROM order_items;
SELECT * FROM orders;

-- Project Task

-- Q.1
-- Show each customer’s total number of orders.

SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;

-- Q.2
-- Total revenue per customer.

SELECT c.customer_id, c.name, ROUND(SUM(oi.quantity * b.price)) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;


-- Q.3
-- Most sold books with quantity > 30.
 
SELECT b.book_id, b.title, SUM(oi.quantity) AS total_sold
FROM books b
JOIN order_items oi ON b.book_id = oi.book_id
GROUP BY b.book_id, b.title
HAVING total_sold > 30
ORDER BY total_sold DESC;

-- Q.4
-- Top 5 authors by revenue. 

SELECT a.author_id, a.name AS author, ROUND(SUM(oi.quantity * b.price)) AS revenue
FROM authors a
JOIN books b ON a.author_id = b.author_id
JOIN order_items oi ON b.book_id = oi.book_id
GROUP BY a.author_id, a.name
ORDER BY revenue DESC
LIMIT 5;


-- Q.5
-- What is the revenue generated each month in 2024?

SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       ROUND(SUM(oi.quantity * b.price)) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
WHERE YEAR(o.order_date) = 2024
GROUP BY month
ORDER BY month;


-- Q.6
-- Which books have never been sold?

SELECT b.book_id, b.title
FROM books b
LEFT JOIN order_items oi ON b.book_id = oi.book_id
WHERE oi.book_id IS NULL;


-- Q.7
-- What is the highest value single order?

SELECT o.order_id, ROUND(SUM(oi.quantity * b.price)) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
GROUP BY o.order_id
ORDER BY total_value DESC
LIMIT 1;


-- Q.8
-- What are the 5 least sold books?

SELECT b.book_id, b.title, ROUND(SUM(oi.quantity)) AS total_sold
FROM books b
JOIN order_items oi ON b.book_id = oi.book_id
GROUP BY b.book_id, b.title
ORDER BY total_sold ASC
LIMIT 5;


-- Q.9
-- Which customers never placed an order?

SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


-- Q.10
-- Which book has the highest average price (based on orders)?

SELECT b.book_id, b.title, ROUND(AVG(b.price)) AS avg_price
FROM books b
JOIN order_items oi ON b.book_id = oi.book_id
GROUP BY b.book_id, b.title
ORDER BY avg_price DESC
LIMIT 1;


-- Q.11
-- Which orders contain more than 5 different books?

SELECT o.order_id, COUNT(DISTINCT oi.book_id) AS book_count
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING book_count > 5;


-- Q.12
-- Who are the top 3 customers by number of books purchased?

SELECT c.customer_id, c.name, ROUND(SUM(oi.quantity)) AS total_books
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_books DESC
LIMIT 3;


-- Q.13
-- Which orders were worth less than ₹200?

SELECT o.order_id, ROUND(SUM(oi.quantity * b.price)) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
GROUP BY o.order_id
HAVING total_value < 200;


-- Q.14
-- What is the average gap between orders for each customer?

SELECT customer_id, ROUND(AVG(DATEDIFF(next_order, order_date))) AS avg_gap_days
FROM (
  SELECT o.customer_id, o.order_date,
         LEAD(o.order_date) OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS next_order
  FROM orders o
) AS t
WHERE next_order IS NOT NULL
GROUP BY customer_id;


-- Q.15
-- What is the reorder rate for each book?

SELECT book_id, COUNT(DISTINCT order_id) AS order_count,
       COUNT(*) AS total_rows,
       ROUND((COUNT(*) - COUNT(DISTINCT order_id)) * 100.0 / COUNT(*), 2) AS reorder_rate_percent
FROM order_items
GROUP BY book_id
ORDER BY reorder_rate_percent DESC;

-- Q.16
-- Who are the top 3 authors by number of books sold?

SELECT a.name, ROUND(SUM(oi.quantity)) AS total_copies_sold
FROM authors a
JOIN books b ON a.author_id = b.author_id
JOIN order_items oi ON b.book_id = oi.book_id
GROUP BY a.author_id, a.name
ORDER BY total_copies_sold DESC
LIMIT 3;

-- Q.17
-- Which customer made the single largest order?

SELECT c.name, o.order_id, ROUND(SUM(oi.quantity * b.price)) AS order_total
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
GROUP BY o.order_id, c.name
ORDER BY order_total DESC
LIMIT 1;

-- Q.18
-- How many orders were placed each day in the last 30 days?

SELECT DATE(order_date) AS order_day, COUNT(*) AS total_orders
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY order_day
ORDER BY order_day;

-- Q.19
-- Which customers spent less than ₹500 in total?

SELECT c.customer_id, c.name, ROUND(SUM(oi.quantity * b.price)) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
GROUP BY c.customer_id, c.name
HAVING total_spent < 500
ORDER BY total_spent ASC;

-- Q.20
-- Which 3 customers ordered the most expensive books (by book price)?

SELECT c.customer_id, c.name, MAX(b.price) AS max_book_price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id
GROUP BY c.customer_id, c.name
ORDER BY max_book_price DESC
LIMIT 3;


