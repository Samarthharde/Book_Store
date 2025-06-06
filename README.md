# 📚 Bookstore Management System using SQL

This project demonstrates the implementation of a **Bookstore Management System** using **MySQL**. It includes the creation and management of relational tables, data analysis using advanced SQL queries, and insight generation for business decision-making.

---

## 🎯 Objectives

- Design a structured relational database for managing books, customers, orders, and authors.
- Analyze transactional and behavioral data using SQL.
- Discover trends to improve customer engagement, sales, and inventory.

---

## 🛠 Technologies Used

- **Database**: MySQL  
- **Tool**: MySQL Workbench  
- **Language**: SQL (Structured Query Language)

---

## 🧱 Database Schema

The system includes the following core tables:

- `customers`: Bookstore customers  
- `orders`: Order records made by customers  
- `order_items`: Individual books included in each order  
- `books`: Information about books (title, genre, price, etc.)  
- `authors`: Author details for each book  

---

## 🗂 Schema Diagram

![Bookstore Schema](Output/Book_store_schema.png)

---

## 📊 Key SQL Queries for Insights

Here are examples of some important queries used in the project:

1. "Show each customer’s total number of orders."

![](Output/Q1.png)

2. "Total revenue per customer."

![](Output/Q2.png)


3. "Most sold books with quantity > 30."


![](Output/Q3.png)


4. "Top 5 authors by revenue."


![](Output/Q4.png)


5. "What is the revenue generated each month in 2024?"


![](Output/Q5.png)

6. "Which books have never been sold?"


![](Output/Q6.png)

7. "What is the highest value single order?"


![](Output/Q7.png)

8. "What are the 5 least sold books?"


![](Output/Q8.png)

9. "Which customers never placed an order?"


![](Output/Q9.png)

10. "Which book has the highest average price (based on orders)?"


![](Output/Q10.png)

11. "Which orders contain more than 5 different books?"


![](Output/Q11.png)

12. "Who are the top 3 customers by number of books purchased?"


![](Output/Q12.png)

13. "Which orders were worth less than ₹200?"

![](Output/Q13.png)

14. "What is the average gap between orders for each customer?"


![](Output/Q14.png)

15. "What is the reorder rate for each book?"


![](Output/Q15.png)

16. "Who are the top 3 authors by number of books sold?"

![](Output/Q16.png)

17. "Which customer made the single largest order?"


![](Output/Q17.png)

18. "How many orders were placed each day in the last 30 days?"

![](Output/Q18.png)

19. "Which customers spent less than ₹500 in total?"


![](Output/Q19.png)

20. "Which 3 customers ordered the most expensive books (by book price)?"


![](Output/Q20.png)

👉 Full list of *20+ analytical queries* available in [Book_store_code.sql](Book_store_code.sql)

---
## 📌 Key Insights

- Repeat Customers Matter: Top 10% of customers contribute to over 60% of total revenue.

- Fiction & Technology Dominate: These genres make up the majority of sales.

- Long Tail Effect: 25% of books are never sold, indicating inefficient inventory.

- Peak Orders: Most orders are placed on weekends.

- High-Value Orders: Bundled book orders (3+ items) lead to significantly higher average revenue.

---

## 📖 Data Story

The bookstore's SQL data reveals behavioral patterns such as:

- Strong loyalty from returning customers.

- Genre-based seasonal spikes (e.g., romance near holidays).

- Need to revise stock strategy for unsold titles.

- Value of bundle promotions to drive revenue.

---

## 💡 Recommendations

- 📦 Remove or discount slow-moving titles.

- 🎁 Bundle bestsellers with low-selling books.

- 💌 Email discounts to repeat customers.

- 📊 Add dashboards for monthly genre trends.

- 📚 Track author-wise performance for marketing.
