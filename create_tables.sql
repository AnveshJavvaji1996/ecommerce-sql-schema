create database ECommerce;
Use Ecommerce;

-- Table: Customers
Create table customers(
	CustomerId int primary key,
    CustomerName varchar(35),
    Email varchar(35),
    Phone bigint,
    registerdDate date
);


Insert into customers (CustomerId, CustomerName, Email, Phone, registerdDate) values
(1, 'Alice Doe', 'alice@example.com', 998562345, UNIX_TIMESTAMP('2024-01-01')),
(2, 'Bob Smith', 'bob@example.com', 6452698534, UNIX_TIMESTAMP('2025-10-01')),
(3, 'Charlie Ray', 'charlie.ray@example.com', 9123456780, UNIX_TIMESTAMP('2023-12-15')),
(4, 'Diana Prince', 'diana.p@example.com', 9876543210, UNIX_TIMESTAMP('2024-05-20')),
(5, 'Ethan Hunt', 'ethan.h@example.com', 9012345678, UNIX_TIMESTAMP('2025-03-30'));

-- Table: Categories

Create table Categories(
CategoryId int Primary Key,
Category_name varchar(35)
);

INSERT INTO Categories (CategoryId, Category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Toys & Games'),
(6, 'Sports & Outdoors'),
(7, 'Health & Beauty'),
(8, 'Automotive'),
(9, 'Grocery'),
(10, 'Office Supplies');




-- Table: Products

Create table Products(
Product_Id int Primary Key,
Product_name varchar(35),
Product_price int,
Category_id int,
foreign key(Category_id) references Categories(CategoryId)
ON delete cascade
ON update cascade
);

INSERT INTO Products (Product_Id, Product_name, Product_price, Category_id) VALUES
(101, 'Smartphone', 699, 1),
(102, 'T-shirt', 25, 2),
(103, 'Blender', 120, 3),
(104, 'Novel: The Great Adventure', 15, 4),
(105, 'Building Blocks Set', 40, 5),
(106, 'Yoga Mat', 30, 6),
(107, 'Facial Cleanser', 22, 7),
(108, 'Car Air Freshener', 12, 8),
(109, 'Organic Coffee Beans', 18, 9),
(110, 'Ballpoint Pens Pack', 8, 10);



-- Table: Orders

create table Orders(
Order_id int primary key,
CustomerId int,
order_date bigint,
status varchar(35),
foreign key(CustomerId) references customers(CustomerId)
on delete cascade
on update cascade);

INSERT INTO Orders (Order_id, CustomerId, order_date, status) VALUES
(5001, 1, UNIX_TIMESTAMP('2024-06-01'), 'Shipped'),
(5002, 2, UNIX_TIMESTAMP('2025-06-01'), 'Processing'),
(5003, 3, UNIX_TIMESTAMP('2024-07-15'), 'Delivered'),
(5004, 4, UNIX_TIMESTAMP('2024-08-10'), 'Cancelled'),
(5005, 1, UNIX_TIMESTAMP('2024-09-05'), 'Processing');

-- Table: OrderItems

CREATE TABLE OrderItems (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),          -- Composite Primary Key
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
 Insert into OrderItems(order_id,product_id,quantity,unit_price) values
 (5001,	101,	1,	699),
  (5002,	101,	1,	699);


  -- Table: Payments
  
  Create table Payments(
  Payment_Id int Primary key,
  Order_Id int,
  Payment_date date,
  Payment_method varchar(20),
  Status varchar(20),
  foreign key(Order_Id) References Orders(Order_Id));
  
  INSERT INTO Payments (Payment_Id, Order_Id, Payment_date, Payment_method, Status) 
VALUES 
  (1, 5001, '2024-06-01', 'Card', 'Paid'),
  (2, 5002, '2024-06-03', 'PayPal', 'Pending'),
  (3, 5003, '2024-06-05', 'Bank Transfer', 'Failed');


-- Table: ProductReviews

CREATE TABLE ProductReviews (
    Review_id int PRIMARY KEY,
    CustomerId INT,
    Product_Id INT,
    rating INT,
    comment VARCHAR(255),
    FOREIGN KEY (CustomerId) REFERENCES customers(CustomerId),
    FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id)
);

INSERT INTO ProductReviews (Review_id, CustomerId, Product_Id, rating, comment) 
VALUES 
  (1, 1, 101, 5, 'Great phone!'),
  (2, 2, 102, 4, 'Nice shirt');


  -- Table: ProductInventory
  
  CREATE TABLE ProductInventory (
    Product_Id INT PRIMARY KEY,
    quantity_in_stock INT,
    last_updated DATE
);

INSERT INTO ProductInventory (Product_id, quantity_in_stock, last_updated)
VALUES 
  (101, 50, '2024-06-01'),
  (102, 100, '2024-06-01');



-- Table: ShippingAddresses

CREATE TABLE ShippingAddresses (
    address_id int  PRIMARY KEY,
    CustomerId INT,
    Order_id INT,
    address_line VARCHAR(255),
    city VARCHAR(100),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);
INSERT INTO ShippingAddresses (address_id, CustomerId, Order_id, address_line, city)
VALUES 
  (1, 1, 5001, '123 Maple St.', 'Toronto'),
  (2, 2, 5002, '456 Oak Avenue', 'Vancouver');

Select * from ShippingAddresses;
