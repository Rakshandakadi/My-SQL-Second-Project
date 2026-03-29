-- 🛒 ONLINE SHOPPING PROJECT
CREATE DATABASE online_shopping;
USE online_shopping;
-- 1️⃣ User
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    created_at DATE
);
-- 2️⃣ Addresses
CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);
-- 3️⃣ Categories
CREATE TABLE categorie (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);
-- 4️⃣ Suppliers
CREATE TABLE supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_email VARCHAR(100),
    city VARCHAR(50)
);
-- 5️⃣ Products
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    supplier_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES categorie(category_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

-- 6️⃣ Product Images
CREATE TABLE product_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
-- 7️⃣ Orders
CREATE TABLE orderss (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    address_id INT,
    order_date DATE,
    status ENUM('Pending','Delivered','Cancelled'),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (address_id) REFERENCES addresses(address_id)
);
-- 8️⃣ Order Items
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orderss(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
-- 9️⃣ Payments
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method ENUM('Card','UPI','NetBanking','Cash'),
    FOREIGN KEY (order_id) REFERENCES orderss(order_id)
);
-- 🔟 Reviews
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO user (name,email,phone,created_at) VALUES
('Amit','amit@gmail.com','9000000001','2024-01-01'),
('Neha','neha@gmail.com','9000000002','2024-01-02'),
('Rahul','rahul@gmail.com','9000000003','2024-01-03'),
('Sneha','sneha@gmail.com','9000000004','2024-01-04'),
('Karan','karan@gmail.com','9000000005','2024-01-05'),
('Pooja','pooja@gmail.com','9000000006','2024-01-06'),
('Rohit','rohit@gmail.com','9000000007','2024-01-07'),
('Anjali','anjali@gmail.com','9000000008','2024-01-08'),
('Vikas','vikas@gmail.com','9000000009','2024-01-09'),
('Nisha','nisha@gmail.com','9000000010','2024-01-10');

select * from user;

INSERT INTO addresses (user_id,address,city,state,pincode) VALUES
(1,'Rohini','Delhi','Delhi','110001'),
(2,'Andheri','Mumbai','Maharashtra','400001'),
(3,'T Nagar','Chennai','Tamil Nadu','600001'),
(4,'Salt Lake','Kolkata','West Bengal','700001'),
(5,'Indiranagar','Bangalore','Karnataka','560001'),
(6,'Banjara Hills','Hyderabad','Telangana','500001'),
(7,'Kothrud','Pune','Maharashtra','411001'),
(8,'MG Road','Kochi','Kerala','682001'),
(9,'Civil Lines','Jaipur','Rajasthan','302001'),
(10,'Alambagh','Lucknow','Uttar Pradesh','226001');

select * from addresses;

INSERT INTO categorie (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Footwear'),
('Furniture'),
('Beauty'),
('Sports'),
('Toys'),
('Groceries'),
('Stationery');

select * from Categorie;

INSERT INTO supplier (supplier_name,contact_email,city) VALUES
('TechWorld','tech@sup.com','Delhi'),
('FashionHub','fashion@sup.com','Mumbai'),
('BookHouse','books@sup.com','Chennai'),
('FootStyle','foot@sup.com','Pune'),
('FurniMart','furni@sup.com','Bangalore'),
('BeautyPlus','beauty@sup.com','Delhi'),
('Sportify','sports@sup.com','Mumbai'),
('ToyLand','toys@sup.com','Kolkata');

INSERT INTO supplier (supplier_name,contact_email,city) VALUES
('FreshMart','fresh@sup.com','Hyderabad'),
('OfficePro','office@sup.com','Chennai');

select * from supplier;

INSERT INTO product (product_name,category_id,supplier_id,price,stock) VALUES
('Laptop',1,1,55000,20),
('Smartphone',1,1,25000,30),
('T-Shirt',2,2,800,50),
('Novel',3,3,500,40),
('Running Shoes',4,4,3000,25),
('Sofa',5,5,40000,10),
('Face Cream',6,6,600,60),
('Cricket Bat',7,7,2500,15),
('Toy Car',8,8,700,35),
('Notebook',10,10,100,100);

select * from product;

INSERT INTO product_images (product_id,image_url) VALUES
(21,'laptop.jpg'),
(22,'phone.jpg'),
(23,'tshirt.jpg'),
(24,'novel.jpg'),
(25,'shoes.jpg'),
(26,'sofa.jpg'),
(27,'cream.jpg'),
(28,'bat.jpg'),
(29,'toycar.jpg'),
(30,'notebook.jpg');

select * from product_images;

INSERT INTO orderss (user_id,address_id,order_date,status) VALUES
(1,1,'2024-04-01','Delivered'),
(2,2,'2024-04-02','Pending'),
(3,3,'2024-04-03','Delivered'),
(4,4,'2024-04-04','Cancelled'),
(5,5,'2024-04-05','Delivered'),
(6,6,'2024-04-06','Pending'),
(7,7,'2024-04-07','Delivered'),
(8,8,'2024-04-08','Pending'),
(9,9,'2024-04-09','Delivered'),
(10,10,'2024-04-10','Delivered');

select * from orderss;

INSERT INTO order_items (order_id,product_id,quantity,price) VALUES
(1,21,1,55000),
(2,22,2,800),
(3,23,1,500),
(4,24,1,3000),
(5,25,1,25000),
(6,26,3,600),
(7,27,1,2500),
(8,28,2,700),
(9,29,1,40000),
(10,30,5,100);

select * from order_items;

INSERT INTO payments (order_id,payment_date,amount,payment_method) VALUES
(1,'2024-04-01',55000,'Card'),
(2,'2024-04-02',1600,'UPI'),
(3,'2024-04-03',500,'Cash'),
(4,'2024-04-04',3000,'Card'),
(5,'2024-04-05',25000,'NetBanking'),
(6,'2024-04-06',1800,'UPI'),
(7,'2024-04-07',2500,'Card'),
(8,'2024-04-08',1400,'Cash'),
(9,'2024-04-09',40000,'Card'),
(10,'2024-04-10',500,'UPI');

select * from payments;

INSERT INTO reviews (user_id,product_id,rating,comment,review_date) VALUES
(1,21,5,'Excellent','2024-04-02'),
(2,23,4,'Good','2024-04-03'),
(3,24,5,'Nice book','2024-04-04'),
(4,25,3,'Average','2024-04-05'),
(5,26,5,'Very good','2024-04-06'),
(6,28,4,'Useful','2024-04-07'),
(7,29,5,'Loved it','2024-04-08'),
(8,27,4,'Nice toy','2024-04-09'),
(9,29,5,'Comfortable','2024-04-10'),
(10,30,4,'Good quality','2024-04-11');

select * from reviews;

-- 🔹 1. Total Revenue
SELECT SUM(amount) AS total_revenue FROM payments;

-- 🔹 2. Top Selling Products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN product p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- 🔹 3. Customer Order Count
SELECT u.name, COUNT(o.order_id) AS total_orders
FROM user u
LEFT JOIN orderss o ON u.user_id = o.user_id
GROUP BY u.name;

-- 🔹 4. Category-wise Revenue
SELECT c.category_name, SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN product p ON oi.product_id = p.product_id
JOIN categorie c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- 🔹 5. Customers Who Never Ordered
SELECT name
FROM user
WHERE user_id NOT IN (SELECT user_id FROM orderss);

-- 🔹 6. Best Rated Products
SELECT p.product_name, AVG(r.rating) AS avg_rating
FROM reviews r
JOIN product p ON r.product_id = p.product_id
GROUP BY p.product_name
HAVING avg_rating >= 4;

-- 🔹 7. Supplier-wise Product Count
SELECT s.supplier_name, COUNT(p.product_id) AS total_products
FROM supplier s
LEFT JOIN product p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name;

-- 🔹 8. Customers from Selected Cities
SELECT name, city
FROM user u
JOIN addresses a ON u.user_id = a.user_id
WHERE city IN ('Delhi','Mumbai');

-- 🔹 9. Products Low Stock OR High Price
SELECT product_name, price, stock
FROM product
WHERE stock < 15 OR price > 30000;

-- 🔹 10. Total Orders
SELECT COUNT(*) AS total_orders
FROM orderss;

-- 🔹 11. Average Product Price
SELECT AVG(price) AS avg_price
FROM product;

-- 🔹 12. Total Revenue
SELECT SUM(amount) AS total_revenue
FROM payments;

-- 🔹 13. Email Domain Extraction
SELECT email, SUBSTRING_INDEX(email,'@',-1) AS domain
FROM user;




































