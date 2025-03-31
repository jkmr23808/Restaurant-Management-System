create database management;
 use management;
 
 Create table customers (
 customerid int Primary Key,
 name varchar(40),
 phone_no varchar(20)
 );
 
 Insert into customers values
 (1, 'Jai', '9978985487'),
 (2, 'Kumar', '9168475207'),
 (3, 'Petta', '8851426340'),
 (4, 'Muthu', '9875456512'),
 (5, 'Veera', '9945546517'),
 (6, 'Rajini', '9877455612'),
 (7, 'Muthuvel Pandian', '9845266517'),
 (8, 'Leo das', '9776687688'),
 (9, 'Antony das', '9879766644'),
 (10, 'Harold das', '9495656563'),
 (11, 'Vikram', '8754631288'),
 (12, 'Rolex', '9786647907'),
 (13, 'Annamalai', '9176846207'),
 (14, 'Baasha', '9723474078'),
 (15, 'Baba', '8800233212');
 
 Create table menu_items (
 itemid int Primary key,
 name varchar(50),
 price float
 );
 
 insert into menu_items values
 (1, 'Chicken Biryani', 200.50),
 (2, 'Mutton Biryani', 300.80),
 (3, 'Chicken Roast', 100.50),
 (4, 'Mutton Chukka', 250.80),
 (5, 'Chicken Pirattal', 220.60),
 (6, 'Egg Rice', 80.90),
 (7, 'Fish fry', 300.50),
 (8, 'Pepper Chicken ',250.50),
 (9, 'Dragon Chicken', 140.70),
 (10, 'Egg Kothu Parotta', 140.60),
 (11, 'Chicken Kothu Parotta', 160.70),
 (12, 'Chicken 65', 180.77),
 (13, 'Chicken rice', 140.30),
 (14, 'Egg Podimass', 100.90),
 (15, 'Mutton Gravy', 300.80),
 (16, 'Parotta', 18.90),
 (17, 'Boneless Chicken Fry', 160.85),
 (18, 'Chicken Thokku', 180.55),
 (19, 'Chicken Lolipop', 140.78),
 (20, 'Chicken Noodles', 170.67);
 
 Create table orders (
 orderid int Primary key,
 customerid int,
 order_date date,
 totalamount decimal(10,2),
 status enum('pending', 'shipped', 'delivered') default 'pending',
 Foreign key (customerid) References customers(customerid)
 );
 
 Insert into orders(orderid, order_date, totalamount, status) values
 (1, '2025-02-01', 99, 'shipped'),
 (2, '2025-02-04', 59, 'delivered'),
 (3, '2025-02-06', 50, 'pending'),
 (4, '2025-02-03', 59, 'delivered'),
 (5, '2025-02-03', 100, 'delivered'),
 (6, '2025-02-03', 99, 'delivered'),
 (7, '2025-02-03', 49, 'pending'),
 (8, '2025-02-03', 99, 'pending'),
 (9, '2025-02-03', 59, 'delivered'),
 (10, '2025-02-03', 100, 'pending'),
 (11, '2025-02-03', 100, 'delivered'),
 (12, '2025-02-03', 50, 'pending'),
 (13, '2025-02-03', 40, 'delivered'),
 (14, '2025-02-03', 50, 'shipped'),
 (15, '2025-02-03', 60, 'delivered'),
 (16, '2025-02-03', 100, 'shipped'),
 (17, '2025-02-03', 50, 'delivered'),
 (18, '2025-02-03', 40, 'pending'),
 (19, '2025-02-03', 60, 'delivered'),
 (20, '2025-02-08', 100, 'shipped');
 
 Create table reservations (
 reservationid int primary key,
 customerid int not null,
 reservationdate date not null,
 reservationtime time not null ,
 numberofpeople int not null,
 specialrequests varchar(255),
 status enum('pending', 'confirmed', 'cancelled') default 'pending',
 Foreign key (customerid) references customers(customerid)
 );
 
 Insert into reservations values
 (1, 1, '2025-02-05', '18:30:00', 4, 'Chicken Biryani', 'confirmed'),
 (2, 2, '2025-02-06', '19:00:00', 3, 'Chicken Noodles', 'cancelled'),
 (3, 3, '2025-02-07', '20:10:00', 8, 'Mutton Gravy, Chicken Biryani, Mutton Biryani', 'pending'),
 (4, 4, '2025-02-08', '17:30:00', 7, 'Chicken Kothu Parotta', 'confirmed'),
 (5, 5, '2025-02-08', '18:20:00', 7, 'Mutton Biryani', 'pending'),
 (6, 6, '2025-02-07', '18:40:00', 7, 'Egg rice', 'cancelled'),
 (7, 7, '2025-02-09', '19:20:00', 7, 'Chicken 65', 'confirmed'),
 (8, 8, '2025-02-01', '19:10:00', 7, 'Chicken Biryani', 'pending'),
 (9, 9, '2025-02-02', '20:50:00', 7, 'Chicken 65', 'confirmed'),
 (10, 10, '2025-02-07', '17:40:00', 7, 'Chicken rice', 'cancelled'),
 (11, 11, '2025-02-08', '22:00:00', 7, 'Parotta', 'confirmed'),
 (12, 12, '2025-02-02', '21:20:00', 7, 'Mutton Biryani', 'confirmed'),
 (13, 13, '2025-02-01', '13:40:00', 7, 'Egg rice', 'pending'),
 (14, 14, '2025-02-03', '11:30:00', 7, 'Chicken 65', 'confirmed'),
 (15, 15, '2025-02-04', '21:00:00', 5, 'Chicken Pirattal', 'pending');
 
 Select
 o.orderid,
 o.customerid,
 c.name as customer_name,
 o.totalamount,
 o.order_date,
 c.phone_no as phone_number,
 o.status
 from orders as o
 inner join customers as c on o.customerid = c.customerid;      
 
 
 Create table orderitems (
     orderitemid int primary key, 
     orderid int, 
     menuitemid int, 
     quantity Int not null check (quantity > 0),
     FOREIGN KEY (orderid) References orders(orderid),
     FOREIGN KEY (menuitemid) References menu_items(itemid)
 );
 
 
 
 SELECT orderid From orderitems 
 WHERE orderid = 1 
 GROUP BY orderid;
 
 
 UPDATE orders 
 SET status = 'delivered' 
 WHERE orderid = 1;
 
 
 UPDATE reservations 
 SET status = 'cancelled' 
 WHERE reservationid = 1;
 
 
 
 DELETE FROM orderitems 
 WHERE orderitemid = 1;
 
 
 
 SELECT 
     r.reservationid AS reservation_id, 
     c.name AS customer,
     r.reservationtime, 
     r.status 
 FROM reservations r 
 JOIN customers c ON r.customerid = c.customerid 
 ORDER BY r.reservationtime;