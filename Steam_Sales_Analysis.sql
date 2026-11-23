CREATE DATABASE STEAM_Sales_Analysis;
USE STEAM_Sales_Analysis;

CREATE TABLE Genres(
Genre_id INTEGER PRIMARY KEY,
Genre_name VARCHAR(50) NOT NULL);
 
CREATE TABLE Platforms(
Platform_id INTEGER PRIMARY KEY,
Platform_name VARCHAR(50) NOT NULL);
 
CREATE TABLE Games(
Game_id INTEGER PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Genre_id INTEGER REFERENCES Genres(Genre_id),
Platform_id  INTEGER REFERENCES Platforms(Platform_id),
Price DECIMAL(6,2) NOT NULL,
Release_year INTEGER,
Stock INTEGER DEFAULT 0);
 
CREATE TABLE Customers(
Customer_id INTEGER PRIMARY KEY,
Full_name VARCHAR(100) NOT NULL,
Email VARCHAR(100),
City VARCHAR(50),
Country VARCHAR(50),
Join_date DATE);
 
CREATE TABLE Orders(
Order_id INTEGER PRIMARY KEY,
Customer_id INTEGER REFERENCES Customers(Customer_id),
Order_date DATE NOT NULL,
OrderStatus VARCHAR(20),      
Payment_method VARCHAR(20)      
);
 
CREATE TABLE Order_Items(
Item_id INTEGER PRIMARY KEY,
Order_id INTEGER REFERENCES Orders(Order_id),
Game_id INTEGER REFERENCES Games(Game_id),
Quantity INTEGER NOT NULL,
Unit_price DECIMAL(6,2) NOT NULL
);
 
CREATE TABLE Reviews (
Review_id INTEGER PRIMARY KEY,
Game_id INTEGER REFERENCES Games(Game_id),
Customer_id INTEGER REFERENCES Customers(Customer_id),
Rating DECIMAL(2,1) ,
Review_date DATE
);
 
---------[INSERTING THE DATA INTO THE TABLES ]---------

INSERT INTO Genres VALUES
(1,'Action'),
(2,'RPG'),
(3,'Sports'),
(4,'Strategy'),
(5,'Adventure'),
(6,'Racing');
 
INSERT INTO Platforms VALUES
(1,'PC'),
(2,'PlayStation 5'),
(3,'Xbox Series X'),
(4,'Nintendo Switch');
 
INSERT INTO Games VALUES
(1,'Elden Ring',2,1,39.99,2022,50),
(2,'God of War Ragnarok',1,2,59.99,2022,35),
(3,'FIFA 24',3,2,49.99,2023,80),
(4,'Forza Horizon 5',6,3,44.99,2021,40),
(5,'Zelda: Tears of the Kingdom',5,4,69.99,2023,60),
(6,'Civilization VI',4,1,29.99,2016,70),
(7,'Cyberpunk 2077',2,1,34.99,2020,45),
(8,'Spider-Man 2',1,2,69.99,2023,30),
(9,'Halo Infinite',1,3,39.99,2021,25),
(10,'Mario Kart 8 Deluxe',6,4,59.99,2017,90),
(11,'Gran Turismo 7',6,2,49.99,2022,28),
(12,'Age of Empires IV',4,1,39.99,2021,33),
(13,'NBA 2K24',3,3,49.99,2023,55),
(14,'Baldur''s Gate 3',2,1,59.99,2023,65),
(15,'Animal Crossing: New Horizons',5,4,49.99,2020,75),
(16,'Hogwarts Legacy',5,2,54.99,2023,42),
(17,'Starfield',2,3,59.99,2023,38),
(18,'Red Dead Redemption 2',1,1,39.99,2018,52),
(19,'Super Smash Bros Ultimate',1,4,59.99,2018,48),
(20,'Stellaris',4,1,24.99,2016,60);
 
INSERT INTO Customers VALUES
(1,'Aarav Sharma','aarav@mail.com','Mumbai','India','2024-01-15'),
(2,'Andrew Rebello','Andrew@mail.com','Miami','USA','2024-02-10'),
(3,'Thomas Muller','Thomas@mail.com','Berlin','Germany','2024-03-05'),
(4,'Sneha Iyer','sneha@mail.com','Bengaluru','India','2024-03-22'),
(5,'John Smith','john@mail.com','New York','USA','2024-04-12'),
(6,'Emily Clark','emily@mail.com','London','UK','2024-05-01'),
(7,'Kenji Tanaka','kenji@mail.com','Tokyo','Japan','2024-05-18'),
(8,'Vikram Singh','vikram@mail.com','Mumbai','India','2024-06-09'),
(9,'Matteo Ricci','Matteo@mail.com','Parma','Italy','2024-07-21'),
(10,'Liam Wilson','liam@mail.com','Sydney','Australia','2024-08-14'),
(11,'Neha Gupta','neha@mail.com','Pune','India','2024-09-30'),
(12,'Carlos Diaz','carlos@mail.com','Madrid','Spain','2024-10-25');
 
INSERT INTO Orders VALUES
(1,1,'2025-01-05','Delivered','UPI'),
(2,2,'2025-01-12','Delivered','Card'),
(3,5,'2025-01-20','Delivered','PayPal'),
(4,3,'2025-02-02','Delivered','Card'),
(5,4,'2025-02-14','Delivered','UPI'),
(6,6,'2025-02-25','Cancelled','PayPal'),
(7,1,'2025-03-03','Delivered','UPI'),
(8,7,'2025-03-15','Delivered','Card'),
(9,8,'2025-03-28','Delivered','Cash'),
(10,9,'2025-04-06','Delivered','UPI'),
(11,2,'2025-04-18','Delivered','Card'),
(12,10,'2025-05-01','Delivered','PayPal'),
(13,11,'2025-05-12','Shipped','UPI'),
(14,3,'2025-05-27','Delivered','Card'),
(15,5,'2025-06-08','Delivered','PayPal'),
(16,12,'2025-06-19','Delivered','Card'),
(17,1,'2025-07-04','Delivered','UPI'),
(18,4,'2025-07-16','Cancelled','Card'),
(19,8,'2025-08-02','Delivered','UPI'),
(20,6,'2025-08-21','Delivered','PayPal'),
(21,9,'2025-09-09','Delivered','Cash'),
(22,2,'2025-09-25','Delivered','UPI'),
(23,7,'2025-10-11','Shipped','Card'),
(24,11,'2025-11-03','Delivered','UPI'),
(25,1,'2025-11-20','Delivered','Card');
 
INSERT INTO Order_Items VALUES
(1,1,1,1,39.99),
(2,1,6,1,29.99),
(3,2,5,1,69.99),
(4,3,18,2,39.99),
(5,4,3,1,49.99),
(6,4,13,1,49.99),
(7,5,14,1,59.99),
(8,6,8,1,69.99),
(9,7,7,1,34.99),
(10,7,20,1,24.99),
(11,8,10,1,59.99),
(12,8,19,1,59.99),
(13,9,2,1,59.99),
(14,10,15,1,49.99),
(15,10,5,1,69.99),
(16,11,14,1,59.99),
(17,12,17,1,59.99),
(18,12,9,1,39.99),
(19,13,16,1,54.99),
(20,14,1,1,39.99),
(21,14,12,1,39.99),
(22,15,4,1,44.99),
(23,16,3,2,49.99),
(24,17,18,1,39.99),
(25,17,14,1,59.99),
(26,18,11,1,49.99),
(27,19,8,1,69.99),
(28,19,2,1,59.99),
(29,20,16,1,54.99),
(30,21,10,1,59.99),
(31,21,15,1,49.99),
(32,22,6,2,29.99),
(33,23,19,1,59.99),
(34,24,7,1,34.99),
(35,24,1,1,39.99),
(36,25,5,1,69.99),
(37,25,17,1,59.99),
(38,25,13,1,49.99);
 
INSERT INTO Reviews VALUES
(1,1,1,5,'2025-01-20'),
(2,5,2,5,'2025-01-30'),
(3,18,5,5,'2025-02-05'),
(4,3,3,3,'2025-02-18'),
(5,14,4,5,'2025-03-01'),
(6,7,1,3,'2025-03-20'),
(7,10,7,4,'2025-04-01'),
(8,2,8,4,'2025-04-15'),
(9,15,9,4,'2025-04-25'),
(10,17,10,3,'2025-05-20'),
(11,9,10,2,'2025-05-22'),
(12,12,3,4,'2025-06-10'),
(13,4,5,4,'2025-06-25'),
(14,16,6,4,'2025-09-05'),
(15,8,8,5,'2025-08-20'),
(16,6,2,4,'2025-10-02'),
(17,13,1,2,'2025-12-01');

														-- SHOWING EVERY TABLE DATA --
SELECT *
FROM Genres;

SELECT *
FROM Platforms;

SELECT *
FROM Customers;

SELECT *
FROM Games;

SELECT *
FROM Orders;

SELECT *
FROM Order_Items;

SELECT *
FROM Reviews;

															-- Analytical question regarding Genres Table --

-- How many games belong to each genre --

SELECT g.Genre_name,COUNT(gm.Title) AS Game_by_genre
FROM Genres g
JOIN Games gm
ON g.Genre_id = gm.Genre_id
GROUP BY g.Genre_name
ORDER BY Game_by_genre DESC;

-- What is the average price of games in each genre --

SELECT g.Genre_name, AVG(gm.Price) AS Average_Price_by_Genre
FROM Genres g
JOIN Games gm
ON g.Genre_id = gm.Genre_id
GROUP BY g.Genre_name
ORDER BY Average_Price_by_Genre DESC;

-- Which genres generate the highest total sales revenue and units sold --

SELECT g.Genre_name, SUM(oi.Quantity * oi.Unit_price) AS Total_Revenue,
SUM(oi.Quantity) AS Total_Units_Sold
FROM Genres g
JOIN Games gm ON g.Genre_id = gm.Genre_id
JOIN Order_Items oi ON gm.Game_id = oi.Game_id
JOIN Orders o ON oi.Order_id = o.Order_id
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY g.Genre_id, g.Genre_name
ORDER BY Total_Revenue DESC;

-- Which genre has the highest average customer rating
SELECT g.Genre_name,AVG(Rating) AS Average_Rating
FROM Genres g
JOIN Games gm ON g.Genre_id = gm.Genre_id
JOIN Reviews r ON r.Game_id = gm.Game_id
GROUP BY g.Genre_name
ORDER BY Average_Rating DESC;

                                                       -- Analytical question regarding Platform Table --
 
 -- How many games are available on each platform --
 
 SELECT p.Platform_name,COUNT(gm.Title) AS Platform_Games
 FROM Platforms p
 JOIN Games gm ON p.Platform_id = gm.Platform_id
 GROUP BY p.Platform_name
 ORDER BY Platform_Games DESC;
 
 -- Which platform has the highest average game price --
 SELECT p.Platform_name,AVG(gm.Price) AS Average_Game_Price
 FROM Platforms p
 JOIN Games gm ON p.Platform_id = gm.Platform_id
 GROUP BY p.Platform_name
 ORDER BY Average_Game_Price DESC;
 
 -- Which platform generates the highest total sales revenue --
 SELECT p.Platform_name,SUM(oi.Quantity * oi.Unit_price) AS Total_Revenue,
 FROM Platforms p
 JOIN Games gm ON gm.Platform_id = p.Platform_id
 JOIN Order_items oi ON oi.Game_id = gm.Game_id 
 GROUP BY p.Platform_name
 ORDER BY Total_Revenue DESC;
 
 -- Which platform has sold the highest total quantity of games --
 SELECT p.Platform_name,SUM(oi.Quantity) AS Highest_Quantity_Sold
 FROM Platforms p
 JOIN Games gm ON p.Platform_id = gm.Platform_id
 JOIN Order_items oi ON oi.Game_id = gm.Game_id
 GROUP BY p.Platform_name
 ORDER by Highest_Quantity_Sold DESC;
 
 -- Which platform has the highest average customer rating --
 SELECT p.Platform_name,AVG(r.Rating) AS Average_Rating
 FROM Platforms p
 JOIN Games gm ON p.Platform_id = gm.Platform_id
 JOIN Reviews r ON gm.Game_id = r.Game_id  
 GROUP BY p.Platform_name
 ORDER BY Average_Rating DESC;
 
                                                          -- Analytical question regarding Games table --
 
 -- What are the top 5 best-selling games based on total quantity sold --
 SELECT gm.Title,SUM(oi.Quantity) as Total_Quantity_Sold
 FROM Games gm
 JOIN Order_items oi ON gm.Game_id = oi.Game_id
 GROUP BY gm.Title
 ORDER BY Total_Quantity_Sold DESC LIMIT 5;
 
 -- Which games generate the highest total revenue --
 SELECT gm.Title,SUM(oi.Quantity * oi.Unit_price) AS Highest_Total_Revenue
 FROM Games gm
 JOIN Order_items oi ON gm.Game_id = oi.Game_id
 GROUP BY gm.Title
 ORDER BY Highest_Total_Revenue DESC;
 
 -- Which games have stock below 35 units --
 SELECT Title,Stock
 FROM Games
 WHERE Stock < 35
 ORDER BY Stock DESC;
 
 -- Which games have never been purchased --
 SELECT gm.Title
 FROM Games gm
 LEFT JOIN Order_items oi ON gm.Game_id = oi.Game_id
 WHERE oi.Quantity IS NULL;
 
 -- Which games have a price above the average price of all games --
 SELECT Title,Price
 FROM Games
 WHERE Price > (SELECT AVG(Price) FROM Games)
 ORDER BY Price DESC;
 
                                                 -- Analytical question regarding Customers table --

-- Which are the top 5 customers by total spending --
SELECT c.Full_name,SUM(oi.Quantity * oi.Unit_price) AS Total_Spending
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
JOIN Order_items oi ON oi.Order_id = o.Order_id
GROUP BY c.Full_name
ORDER BY Total_Spending DESC LIMIT 5;

-- Which customers have placed more than 2 orders --
SELECT c.Full_name, COUNT(o.Order_id) AS Total_Order_Placed
FROM Customers c 
JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.Customer_id, c.Full_name 
HAVING COUNT(o.Order_id) > 2
ORDER BY Total_Order_Placed DESC;

-- Which country has the highest number of customers --
SELECT Country,COUNT(Customer_id) AS Country_Count_Customer
FROM Customers
GROUP BY Country
ORDER BY Country_Count_Customer DESC;

-- Which customers have never placed an order --
SELECT c.Customer_id, c.Full_name, c.Email
FROM Customers c
LEFT JOIN Orders o ON c.Customer_id = o.Customer_id
WHERE o.Order_id IS NULL;

-- Who are the most valuable customers based on total spending and number of orders --
SELECT c.Full_name,Sum(oi.Quantity * oi.Unit_price) AS Total_Spending,
COUNT(DISTINCT oi.Order_id) AS Number_of_Orders
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
JOIN Order_items oi ON oi.Order_id = o.Order_id
GROUP BY c.Full_name
ORDER BY Total_Spending DESC;

                                                             -- Analytical question regarding Orders table --

-- How many orders were placed each month in 2025 --
SELECT MONTHNAME(Order_date) AS Month_Name,
YEAR(Order_date) AS Order_Year,
COUNT(Order_id) AS Total_Orders
FROM Orders
WHERE Order_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY YEAR(Order_date), MONTH(Order_date), MONTHNAME(Order_date)
ORDER BY MONTH(Order_date) ASC;

-- What is the distribution of orders by order status --
SELECT OrderStatus,COUNT(Order_id) AS Order_by_OrderStatus
FROM Orders
GROUP BY OrderStatus
ORDER BY Order_by_OrderStatus DESC;

-- Which payment method is used for the highest number of orders --
SELECT Payment_method,COUNT(Order_id) AS Orders_by_PaymentMethod
FROM Orders
GROUP BY Payment_method
ORDER BY Orders_by_PaymentMethod DESC;

-- What percentage of total orders were cancelled --
SELECT COUNT(Order_id) AS Total_Orders,
SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled_Orders,
ROUND((SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1.0 ELSE 0.0 END) / COUNT(Order_id)) * 100,2) AS Cancellation_Percentage
FROM Orders;

														-- Analytical question regarding Order_items table --

-- What is the total quantity sold for each game --
SELECT gm.Title,SUM(Quantity)  AS Total_Quantity
FROM Order_items oi
JOIN Games gm ON gm.Game_id = oi.Game_id
GROUP BY gm.Title
ORDER BY Total_Quantity DESC LIMIT 5;

-- Which are the top 5 games by revenue --
SELECT gm.Title,SUM(oi.Quantity * oi.Unit_price) AS Total_Revenue_by_Game
FROM Order_items oi
JOIN Games gm ON gm.Game_id = oi.Game_id
GROUP BY gm.Title
ORDER BY Total_Revenue_by_Game DESC LIMIT 5;

-- What is the average order value for each order --
SELECT Order_id, AVG(Quantity * Unit_price) AS Average_Order_Value
FROM Order_Items
GROUP BY Order_id
ORDER BY Average_Order_Value DESC;

-- Which orders contain more than one game item
SELECT Order_id, COUNT(Game_id) AS Total_Unique_Games
FROM Order_Items
GROUP BY Order_id
HAVING COUNT(Game_id) > 1 
ORDER BY Order_id;

                                                 -- Analytical question reegarding Reviews table --

-- Which are the top 5 highest-rated games --

SELECT gm.Title,ROUND(AVG(r.Rating), 2) AS Average_Rating,
COUNT(r.Review_id) AS Total_Reviews
FROM Games gm
JOIN Reviews r
ON gm.Game_id = r.Game_id
GROUP BY gm.Game_id, gm.Title
ORDER BY Average_Rating DESC, Total_Reviews DESC LIMIT 5;

-- Which games have an average rating below 3.5 --
SELECT gm.Title,ROUND(AVG(r.Rating), 2) AS Average_Rating
FROM Games gm
JOIN Reviews r ON gm.Game_id = r.Game_id
GROUP BY gm.Game_id, gm.Title
HAVING AVG(r.Rating) < 3.5
ORDER BY Average_Rating ASC;

-- Which games have received the highest number of reviews --
SELECT gm.Title, COUNT(r.Game_id) AS Review_Count 
FROM Games gm
LEFT JOIN Reviews r ON gm.Game_id = r.Game_id
GROUP BY gm.Game_id, gm.Title
ORDER BY Review_Count DESC;

-- Which customers have submitted more than one review --
SELECT c.Full_name, COUNT(r.Review_id) AS Total_Reviews_Submitted
FROM Customers c
JOIN Reviews r ON c.Customer_id = r.Customer_id
GROUP BY c.Full_name
HAVING COUNT(r.Review_id) > 1
ORDER BY Total_Reviews_Submitted DESC;





