CREATE DATABASE Books;
use Books;

select*from books;
select*from customers;
select*from orders;


-- 1) Retrieve all books in the "Fiction" genre
select*from books where Genre = "Fiction";

-- 2) Find books published after the year 1950
select*from books where Published_Year > 1950;

--  3) List all customers from the Canada
select *  from customers where Country = "Canada";

--  4) Show orders placed in November 2023
select * from orders where Order_Date between "2023-11-01" and "2023-11-30";

-- 5) Retrieve the total stock of books available
select * from books where Stock > 0;
-- (DONT LEAVE SPACE)
SELECT SUM(Stock) AS total_stock FROM books;
select count(Stock) as total_stock from books;  

 -- 6) Find the details of the most expensive book
 select * from books ORDER BY price desc limit 1;
 
 -- 7) Show all customers who ordered more than 1 quantity of a book
 select * from orders where Quantity > 1;
 
 -- 8) Retrieve all orders where the total amount exceeds $20
 select * from orders where Total_Amount > 20;
 
 -- 9) List all genres available in the Books table
 select Distinct Genre from books;
 
 -- 10) Find the book with the lowest stock
 select * from books ORDER BY Stock limit 1;
 
 -- 11) Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS REVENUE FROM ORDERS;
 
 -- 12) Retrieve the total number of books sold for each genre
 SELECT * FROM BOOKS;
 SELECT * FROM ORDERS;
 SELECT b.Genre, SUM(o.Quantity) AS Total_books_sold
 FROM Orders o
 JOIN Books b ON o.book_id = b.book_id
 GROUP BY b.Genre; 
 
-- 13) Find the average price of books in the "Fantasy" genre
 select AVG(price) as avg_price
 from books
 where Genre = "Fantasy"; 
 
 -- 14) List customers who have placed at least 2 orders
 select * from orders;
 select customer_id ,COUNT(Order_id) AS ORDER_COUNT
 FROM orders
 GROUP BY customer_id
 HAVING COUNT(Order_id) >=2;
 
 -- 15) List the name of customers who have placed at least 2 orders
 SELECT c.Name, COUNT(o.quantity) AS order_count
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.Name
HAVING COUNT(o.quantity) >= 2;

-- 16) Find the most frequently ordered book
select * from books;
select * from orders;
SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
join books b ON o.book_id = b.book_id
GROUP BY o.book_id , b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;
 
-- 17) Show the top 3 most expensive books of 'Fantasy' Genre 
select * from books;
 SELECT * FROM BOOKS WHERE GENRE = "Fantasy"
 ORDER BY price DESC LIMIT 3;
 
-- 18)Retrieve the total quantity of books sold by each author
select * from books;
select * from orders;
SELECT b.Author, SUM(o.Quantity) AS total_orders
FROM ORDERS o 
JOIN books b ON b.book_id = o.book_id
GROUP BY b.Author;

-- 19) List the cities where customers who spent over $30 are located
select * from customers;
select*from orders;
select distinct c.city,total_amount
from orders o
join customers c on o.customer_id = c.customer_id
where o.total_amount > 30;

-- 20)Find the customer who spent the most on orders
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMERS;
select c.customer_id,c.Name, SUM(o.Total_Amount) as total_spend
from orders o 
join customers c on c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spend LIMIT 1;

-- 21) Calculate the stock remaining after fulfilling all orders
select* from books;
select*from orders;
SELECT b.book_id,b.title, b.stock, o.quantity, b.stock - o.quantity AS remaining_stock
FROM orders o
JOIN books b ON b.book_id = o.book_id;

