-- ==========================================
-- Customers
-- ==========================================

INSERT INTO customers VALUES
(1,'Rahul','Sharma','rahul.sharma@gmail.com','Mumbai','West','Premium','2023-01-15'),
(2,'Priya','Patel','priya.patel@gmail.com','Ahmedabad','West','Regular','2023-02-10'),
(3,'Amit','Verma','amit.verma@yahoo.com','Delhi','North','Corporate','2023-03-05'),
(4,'Sneha','Kulkarni','sneha.k@gmail.com','Pune','West','Premium','2023-01-28'),
(5,'Rohan','Mehta','rohan.mehta@gmail.com','Surat','West','Regular','2023-04-18'),
(6,'Neha','Joshi','neha.joshi@yahoo.com','Nagpur','Central','Regular','2023-05-12'),
(7,'Karan','Singh','karan.singh@gmail.com','Jaipur','North','Premium','2023-06-14'),
(8,'Anjali','Rao','anjali.rao@gmail.com','Hyderabad','South','Corporate','2023-07-01'),
(9,'Vikas','Nair','vikas.nair@gmail.com','Kochi','South','Regular','2023-02-20'),
(10,'Pooja','Desai','pooja.desai@gmail.com','Vadodara','West','Premium','2023-03-15'),
(11,'Arjun','Kapoor','arjun.k@gmail.com','Chandigarh','North','Corporate','2023-05-21'),
(12,'Meera','Iyer','meera.iyer@gmail.com','Chennai','South','Regular','2023-06-03'),
(13,'Sanjay','Gupta','sanjay@gmail.com','Lucknow','North','Premium','2023-07-10'),
(14,'Kavita','Shah','kavita@yahoo.com','Indore','Central','Regular','2023-08-18'),
(15,'Deepak','Yadav','deepak@gmail.com','Bhopal','Central','Corporate','2023-09-09'),
(16,'Ritika','Malhotra','ritika@gmail.com','Delhi','North','Premium','2023-10-01'),
(17,'Mohit','Agarwal','mohit@gmail.com','Mumbai','West','Regular','2023-10-18'),
(18,'Divya','Menon','divya@gmail.com','Bengaluru','South','Corporate','2023-11-12'),
(19,'Harsh','Pandey','harsh@gmail.com','Patna','East','Regular','2023-11-25'),
(20,'Nisha','Roy','nisha@gmail.com','Kolkata','East','Premium','2023-12-01');

-- ==========================================
-- Products
-- ==========================================

INSERT INTO products VALUES
(101,'iPhone 15','Mobiles',85000,72000),
(102,'Samsung S24','Mobiles',76000,64000),
(103,'OnePlus 12','Mobiles',65000,55000),
(104,'Dell Inspiron','Laptops',62000,54000),
(105,'MacBook Air','Laptops',98000,86000),
(106,'HP Pavilion','Laptops',70000,61000),
(107,'Sony Headphones','Accessories',12000,8500),
(108,'Boat Earbuds','Accessories',3000,1800),
(109,'Logitech Mouse','Accessories',1800,900),
(110,'Mechanical Keyboard','Accessories',4500,2600),
(111,'Samsung TV','Electronics',55000,47000),
(112,'LG Refrigerator','Electronics',42000,35000),
(113,'Washing Machine','Electronics',36000,30000),
(114,'Office Chair','Furniture',9500,6500),
(115,'Study Table','Furniture',8500,6000),
(116,'Air Conditioner','Electronics',47000,39000),
(117,'Gaming Monitor','Electronics',28000,22000),
(118,'Smart Watch','Wearables',15000,10000),
(119,'Fitness Band','Wearables',4000,2500),
(120,'DSLR Camera','Cameras',65000,56000),
(121,'Clearance Phone X','Mobiles',28000,35000);

-- ==========================================
-- Orders
-- ==========================================

INSERT INTO orders VALUES
(1001,1,'2024-01-05','Completed','Mumbai'),
(1002,2,'2024-01-06','Completed','Ahmedabad'),
(1003,3,'2024-01-08','Cancelled','Delhi'),
(1004,4,'2024-01-10','Completed','Pune'),
(1005,5,'2024-01-12','Returned','Surat'),
(1006,6,'2024-01-15','Completed','Nagpur'),
(1007,7,'2024-01-18','Completed','Jaipur'),
(1008,8,'2024-01-20','Completed','Hyderabad'),
(1009,9,'2024-01-22','Cancelled','Kochi'),
(1010,10,'2024-01-25','Completed','Vadodara'),
(1011,11,'2024-01-28','Completed','Chandigarh'),
(1012,12,'2024-02-01','Returned','Chennai'),
(1013,13,'2024-02-04','Completed','Lucknow'),
(1014,14,'2024-02-06','Completed','Indore'),
(1015,15,'2024-02-08','Completed','Bhopal'),
(1016,16,'2024-02-10','Completed','Delhi'),
(1017,17,'2024-02-12','Cancelled','Mumbai'),
(1018,18,'2024-02-14','Completed','Bengaluru'),
(1021,1,'2024-02-20','Completed','Mumbai'),
(1022,2,'2024-02-22','Completed','Ahmedabad'),
(1023,3,'2024-02-24','Completed','Delhi'),
(1024,4,'2024-02-26','Completed','Pune'),
(1025,5,'2024-03-01','Completed','Surat'),
(1026,6,'2024-03-03','Cancelled','Nagpur'),
(1027,7,'2024-03-05','Completed','Jaipur'),
(1028,8,'2024-03-07','Completed','Hyderabad'),
(1029,9,'2024-03-10','Completed','Kochi'),
(1030,10,'2024-03-12','Returned','Vadodara'),
(1031,11,'2024-03-15','Completed','Chandigarh'),
(1032,12,'2024-03-18','Completed','Chennai'),
(1033,13,'2024-03-20','Completed','Lucknow'),
(1034,14,'2024-03-22','Completed','Indore'),
(1035,15,'2024-03-24','Completed','Bhopal'),
(1036,16,'2024-03-26','Cancelled','Delhi'),
(1037,17,'2024-03-28','Completed','Mumbai'),
(1038,18,'2024-03-30','Completed','Bengaluru'),
(1040,1,'2024-04-05','Completed','Mumbai'),
(1041,1,'2024-04-08','Returned','Mumbai'),
(1042,2,'2024-04-10','Completed','Ahmedabad'),
(1043,3,'2024-04-12','Completed','Delhi'),
(1044,4,'2024-04-15','Completed','Pune'),
(1045,5,'2024-04-18','Completed','Surat'),
(1046,6,'2024-04-20','Completed','Nagpur'),
(1047,7,'2024-04-22','Completed','Jaipur'),
(1048,8,'2024-04-25','Cancelled','Hyderabad'),
(1049,9,'2024-04-27','Completed','Kochi'),
(1050,10,'2024-04-30','Completed','Vadodara'),
(1051,1,'2024-05-05','Completed','Mumbai'),
(1052,2,'2024-05-08','Completed','Ahmedabad'),
(1053,3,'2024-05-10','Completed','Delhi');

-- ==========================================
-- Order Items
-- ==========================================

INSERT INTO order_items VALUES
(1,1001,101,1,85000),
(2,1001,107,2,12000),

(3,1002,102,1,76000),
(4,1002,109,1,1800),

(5,1003,103,1,65000),

(6,1004,104,1,62000),
(7,1004,108,2,3000),

(8,1005,105,1,98000),

(9,1006,106,1,70000),
(10,1006,110,1,4500),

(11,1007,111,1,55000),
(12,1007,109,2,1800),

(13,1008,112,1,42000),
(14,1008,118,2,15000),

(15,1009,113,1,36000),

(16,1010,114,2,9500),
(17,1010,115,1,8500),

(18,1011,116,1,47000),
(19,1011,119,3,4000),

(20,1012,117,1,28000),

(21,1013,101,1,85000),
(22,1013,118,1,15000),

(23,1014,102,2,76000),

(24,1015,103,1,65000),
(25,1015,108,2,3000),

(26,1016,104,1,62000),

(27,1017,105,1,98000),

(28,1018,106,1,70000),
(29,1018,107,1,12000),

(30,1021,113,1,36000),
(33,1021,119,2,4000),

(34,1022,114,1,9500),
(35,1022,110,2,4500),

(36,1023,115,2,8500),

(37,1024,116,1,47000),
(38,1024,108,3,3000),

(39,1025,117,1,28000),
(40,1025,109,2,1800),

(41,1026,101,1,85000),

(42,1027,102,1,76000),
(43,1027,118,1,15000),

(44,1028,103,2,65000),

(45,1029,104,1,62000),
(46,1029,110,1,4500),

(47,1030,105,1,98000),

(48,1031,106,2,70000),

(49,1032,107,2,12000),
(50,1032,108,3,3000),

(51,1033,111,1,55000),
(52,1033,109,1,1800),

(53,1034,112,2,42000),

(54,1035,113,1,36000),
(55,1035,114,1,9500),

(56,1036,115,2,8500),

(57,1037,116,1,47000),
(58,1037,119,2,4000),

(59,1038,117,1,28000),
(60,1038,107,1,12000),

(61,1040,102,1,76000),
(62,1040,110,1,4500),

(63,1041,103,1,65000),
(64,1041,118,2,15000),

(65,1042,104,1,62000),

(66,1043,105,1,98000),
(67,1043,109,2,1800),

(68,1044,106,1,70000),

(69,1045,111,1,55000),
(70,1045,114,2,9500),

(71,1046,112,1,42000),
(72,1046,107,1,12000),

(73,1047,113,1,36000),
(74,1047,119,2,4000),

(75,1048,115,1,8500),

(76,1049,116,1,47000),

(77,1050,117,1,28000),
(78,1050,108,2,3000),

(79,1051,101,1,85000),
(80,1051,110,2,4500),

(81,1052,102,1,76000),
(82,1052,118,1,15000),

(83,1053,103,1,65000),
(84,1053,107,1,12000);

-- ==========================================
-- Payments
-- ==========================================

INSERT INTO payments VALUES
(1,1001,'UPI','Successful',109000,'2024-01-05'),
(2,1002,'Credit Card','Successful',77800,'2024-01-06'),
(3,1003,'Debit Card','Failed',65000,'2024-01-08'),
(4,1004,'UPI','Successful',68000,'2024-01-10'),
(5,1005,'Net Banking','Successful',98000,'2024-01-12'),
(6,1006,'Credit Card','Successful',74500,'2024-01-15'),
(7,1007,'UPI','Successful',58600,'2024-01-18'),
(8,1008,'Credit Card','Successful',72000,'2024-01-20'),
(9,1009,'Debit Card','Failed',36000,'2024-01-22'),
(10,1010,'Cash On Delivery','Successful',27500,'2024-01-25'),

(11,1011,'UPI','Successful',59000,'2024-01-28'),
(12,1012,'Credit Card','Successful',28000,'2024-02-01'),
(13,1013,'Net Banking','Successful',100000,'2024-02-04'),
(14,1014,'Debit Card','Successful',152000,'2024-02-06'),
(15,1015,'UPI','Successful',71000,'2024-02-08'),
(16,1016,'Credit Card','Successful',62000,'2024-02-10'),
(17,1017,'Net Banking','Failed',98000,'2024-02-12'),
(18,1018,'UPI','Successful',82000,'2024-02-14'),

(19,1021,'UPI','Successful',44000,'2024-02-20'),
(20,1022,'Credit Card','Successful',18500,'2024-02-22'),
(21,1023,'Debit Card','Successful',17000,'2024-02-24'),
(22,1024,'Net Banking','Successful',56000,'2024-02-26'),
(23,1025,'UPI','Successful',31600,'2024-03-01'),
(24,1026,'Credit Card','Failed',85000,'2024-03-03'),
(25,1027,'UPI','Successful',91000,'2024-03-05'),
(26,1028,'Credit Card','Successful',130000,'2024-03-07'),
(27,1029,'Debit Card','Successful',66500,'2024-03-10'),
(28,1030,'Net Banking','Successful',98000,'2024-03-12'),

(29,1031,'UPI','Successful',140000,'2024-03-15'),
(30,1032,'Credit Card','Successful',33000,'2024-03-18'),
(31,1033,'Cash On Delivery','Successful',56800,'2024-03-20'),
(32,1034,'UPI','Successful',84000,'2024-03-22'),
(33,1035,'Credit Card','Successful',45500,'2024-03-24'),
(34,1036,'Debit Card','Failed',17000,'2024-03-26'),
(35,1037,'UPI','Successful',55000,'2024-03-28'),
(36,1038,'Net Banking','Successful',40000,'2024-03-30'),
(37,1040,'UPI','Successful',80500,'2024-04-05'),

(38,1041,'Debit Card','Successful',95000,'2024-04-08'),
(39,1042,'Credit Card','Successful',62000,'2024-04-10'),
(40,1043,'UPI','Successful',101600,'2024-04-12'),
(41,1044,'Cash On Delivery','Successful',70000,'2024-04-15'),
(42,1045,'Credit Card','Successful',74000,'2024-04-18'),
(43,1046,'UPI','Successful',54000,'2024-04-20'),
(44,1047,'Net Banking','Successful',44000,'2024-04-22'),
(45,1048,'Debit Card','Failed',8500,'2024-04-25'),
(46,1049,'UPI','Successful',47000,'2024-04-27'),
(47,1050,'Credit Card','Successful',34000,'2024-04-30'),
(48,1051,'UPI','Successful',94000,'2024-05-05'),
(49,1052,'Credit Card','Successful',91000,'2024-05-08'),
(50,1053,'Net Banking','Successful',77000,'2024-05-10');