CREATE  DATABASE EcommerceDB;
USE EcommerceDB;
-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert sample data into Customers
INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana'),
(5, 'Eva'); -- added customer 5

-- Orders table
INSERT INTO Orders VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 2, 150.00),
(104, 5, 100.00); -- now valid

-- INNER JOIN: Customers who have orders
SELECT c.customer_name, o.order_amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN: All customers, even if no order
SELECT c.customer_name, o.order_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT c.customer_name, o.order_amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN
SELECT c.customer_name, o.order_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
