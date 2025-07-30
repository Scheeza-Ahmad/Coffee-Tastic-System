CREATE DATABASE CoffeeTASTICsystem;
USE CoffeeTASTICsystem;
-- ***************************************** CREATING TABLES *********************************************************
-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Amount DECIMAL(10, 2)
);
describe suppliers;

-- Product Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(255),
    Category VARCHAR(100),
    Price int
);
describe products;


-- Supplies Table
CREATE TABLE Supplies (
    SupplierID INT,
    ProductID INT,
    CONSTRAINT fk_1 FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)        
    ON UPDATE CASCADE
	ON DELETE CASCADE,
    CONSTRAINT fk_2 FOREIGN KEY (ProductID) REFERENCES Products(ProductID) 
	ON UPDATE CASCADE
    ON DELETE CASCADE

);
describe supplies;


-- SuppliersDetails Table
CREATE TABLE SupplierDetails (
    Sd_id INT PRIMARY KEY, 
    OrderDetails VARCHAR(100),
    TotalQuantity INT,
    SupplierID INT,
    CONSTRAINT fk_3 FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
describe SupplierDetails;


-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    ProductID INT,
    Phone VARCHAR(15),
    Salary DECIMAL(10, 2),
    DateHired DATE,
    TotalSales INT,
    House_NO INT,
    Street_NO INT,
    City Varchar(30),
   CONSTRAINT fk_4 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
Describe Employees;


-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Phone VARCHAR(15),
    Balance DECIMAL(10, 2),
    ProductID INT, 
    CONSTRAINT fk_5 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
describe customers;


-- OrderTo Table
CREATE TABLE OrderTo (
    CustomerID INT,
    EmployeeID INT,
    CONSTRAINT fk_6 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
    CONSTRAINT fk_7 FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
	ON UPDATE CASCADE
	ON DELETE CASCADE

);
describe OrderTo;


-- StoreInfo Table
CREATE TABLE Store_info(
    StoreID INT PRIMARY KEY,
    Location VARCHAR(255),
    Revenue DECIMAL(10, 2)
);
describe store_info;


-- EmployeeIDHaveStoreInfo table
CREATE TABLE EmployeeIDHaveStoreInfo(
EmployeeID INT,
StoreID INT,
CONSTRAINT fk_8 FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
CONSTRAINT fk_9 FOREIGN KEY (StoreID) REFERENCES Store_info(StoreID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
describe EmployeeIDHaveStoreInfo;


-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderName VARCHAR(100),
    CustomerID INT,
    CONSTRAINT fk_10 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);
describe orders;


-- Order Details Table
CREATE TABLE OrderDetails (
    SerialNo INT PRIMARY KEY,
    quantity INT
);
describe orderDetails;


-- OrderStoresOrderDetails Table 
CREATE TABLE OrderStoresOrderDetails ( 
    SerialNo INT,
    OrderId INT,
    CONSTRAINT fk_11 FOREIGN KEY (SerialNo) REFERENCES OrderDetails(SerialNo)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_12 FOREIGN KEY (OrderId) REFERENCES Orders(OrderID) 
		ON UPDATE CASCADE
        ON DELETE CASCADE
);
describe OrderStoresOrderDetails;


-- ************************************* INSERTING VALUES  ******************************************************************
-- Inserting data into Suppliers table
INSERT INTO Suppliers (SupplierID, Name, Phone, Amount)
VALUES
(1, 'Alpha Supply Co.', '1111111111', 5000.00),
(2, 'Beta Supplies Ltd.', '2222222222', 10000.00),
(3, 'Gamma Traders', '3333333333', 7500.00),
(4, 'Delta Wholesale', '4444444444', 8000.00),
(5, 'Epsilon Goods', '5555555555', 6500.00),
(6, 'Zeta Corporation', '6666666666', 9000.00),
(7, 'Eta Enterprises', '7777777777', 12000.00),
(8, 'Theta Industries', '8888888888', 8500.00),
(9, 'Iota Supplies', '9999999999', 7000.00),
(10, 'Kappa Logistics', '1212121212', 9500.00),
(11, 'Lambda Co.', '1313131313', 10500.00),
(12, 'Mu Resources', '1414141414', 11000.00),
(13, 'Nu Distribution', '1515151515', 9800.00),
(14, 'Xi Partners', '1616161616', 10200.00),
(15, 'Omicron Goods', '1717171717', 8900.00),
(16, 'Pi Logistics', '1818181818', 9400.00),
(17, 'Rho Trade', '1919191919', 8100.00),
(18, 'Sigma Suppliers', '2020202020', 7400.00),
(19, 'Tau Merchandise', '2121212121', 6000.00),
(20, 'Upsilon Deals', '2222222222', 7100.00),
(21, 'Phi Traders', '2323232323', 7700.00),
(22, 'Chi Goods', '2424242424', 6800.00),
(23, 'Psi Enterprises', '2525252525', 8500.00),
(24, 'Omega Distributors', '2626262626', 7200.00),
(25, 'Vega Solutions', '2727272727', 6700.00),
(26, 'Alpha Plus Co.', '2828282828', 5600.00),
(27, 'Beta Deals', '2929292929', 8800.00),
(28, 'Gamma Provisions', '3030303030', 9300.00),
(29, 'Delta Group', '3131313131', 6500.00),
(30, 'Epsilon Partners', '3232323232', 7000.00);
select* from Suppliers;


-- inserting data into supplier Details
INSERT INTO SupplierDetails (Sd_id, OrderDetails, TotalQuantity, SupplierID)
VALUES
(1, 'Electronics Items', 500, 1),
(2, 'Furniture Parts', 300, 2),
(3, 'Appliances', 400, 3),
(4, 'Clothing Materials', 250, 4),
(5, 'Accessories', 600, 5),
(6, 'Electronics Items', 520, 6),
(7, 'Furniture Parts', 310, 7),
(8, 'Appliances', 430, 8),
(9, 'Clothing Materials', 260, 9),
(10, 'Accessories', 610, 10),
(11, 'Electronics Items', 530, 11),
(12, 'Furniture Parts', 320, 12),
(13, 'Appliances', 450, 13),
(14, 'Clothing Materials', 270, 14),
(15, 'Accessories', 620, 15),
(16, 'Electronics Items', 540, 16),
(17, 'Furniture Parts', 330, 17),
(18, 'Appliances', 460, 18),
(19, 'Clothing Materials', 280, 19),
(20, 'Accessories', 630, 20),
(21, 'Electronics Items', 550, 21),
(22, 'Furniture Parts', 340, 22),
(23, 'Appliances', 470, 23),
(24, 'Clothing Materials', 290, 24),
(25, 'Accessories', 640, 25),
(26, 'Electronics Items', 560, 26),
(27, 'Furniture Parts', 350, 27),
(28, 'Appliances', 480, 28),
(29, 'Clothing Materials', 300, 29),
(30, 'Accessories', 650, 30);
select* from SupplierDetails;


-- inserting into Products
INSERT INTO Products (ProductID, ProductName, Description, Category, Price)
VALUES
(1, 'Laptop', '15-inch screen, 16GB RAM', 'Electronics', 1200),
(2, 'Smartphone', '5G enabled, 128GB storage', 'Electronics', 800),
(3, 'Tablet', '10-inch screen, 64GB storage', 'Electronics', 500),
(4, 'Monitor', '24-inch, Full HD', 'Electronics', 300),
(5, 'Keyboard', 'Mechanical, RGB lighting', 'Electronics', 100),
(6, 'Mouse', 'Wireless, ergonomic', 'Electronics', 50),
(7, 'Chair', 'Ergonomic office chair', 'Furniture', 200),
(8, 'Desk', 'Wooden desk with drawers', 'Furniture', 350),
(9, 'Bookshelf', '5-tier wooden shelf', 'Furniture', 250),
(10, 'Sofa', '3-seater, fabric', 'Furniture', 700),
(11, 'Dining Table', '6-seater, wooden', 'Furniture', 900),
(12, 'Bed', 'Queen size, with mattress', 'Furniture', 1200),
(13, 'Wardrobe', '3-door, with mirror', 'Furniture', 1500),
(14, 'TV Stand', 'Modern design, wooden', 'Furniture', 400),
(15, 'Refrigerator', '500L, energy-efficient', 'Appliances', 1000),
(16, 'Washing Machine', 'Front-load, 7kg', 'Appliances', 700),
(17, 'Microwave', 'Convection, 20L', 'Appliances', 150),
(18, 'Air Conditioner', '1.5 Ton, Inverter', 'Appliances', 1200),
(19, 'Vacuum Cleaner', 'Bagless, 1200W', 'Appliances', 300),
(20, 'Blender', 'Multi-purpose, 1.5L', 'Appliances', 100),
(21, 'Shoes', 'Running shoes, size 10', 'Clothing', 120),
(22, 'Jacket', 'Winter, waterproof', 'Clothing', 250),
(23, 'T-shirt', 'Cotton, medium size', 'Clothing', 25),
(24, 'Jeans', 'Denim, slim fit', 'Clothing', 50),
(25, 'Hat', 'Sun hat, unisex', 'Clothing', 20),
(26, 'Watch', 'Digital, waterproof', 'Accessories', 200),
(27, 'Bag', 'Leather backpack', 'Accessories', 150),
(28, 'Sunglasses', 'UV protection', 'Accessories', 80),
(29, 'Wallet', 'Leather, compact', 'Accessories', 50),
(30, 'Belt', 'Leather, adjustable', 'Accessories', 30);
select* from products;


-- inserting into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Phone, Balance, ProductID)
VALUES
(1, 'John', 'Doe', '1111111111', 300.00, 1),
(2, 'Jane', 'Smith', '2222222222', 200.00, 2),
(3, 'Alice', 'Johnson', '3333333333', 150.00, 3),
(4, 'Robert', 'Brown', '4444444444', 500.00, 4),
(5, 'Emily', 'Davis', '5555555555', 250.00, 5),
(6, 'Michael', 'Wilson', '6666666666', 400.00, 6),
(7, 'Sarah', 'Taylor', '7777777777', 350.00, 7),
(8, 'David', 'Anderson', '8888888888', 450.00, 8),
(9, 'Sophia', 'Thomas', '9999999999', 300.00, 9),
(10, 'Daniel', 'Moore', '1212121212', 200.00, 10),
(11, 'Mia', 'Jackson', '1313131313', 150.00, 11),
(12, 'James', 'Martin', '1414141414', 500.00, 12),
(13, 'Isabella', 'Thompson', '1515151515', 250.00, 13),
(14, 'Logan', 'White', '1616161616', 400.00, 14),
(15, 'Charlotte', 'Harris', '1717171717', 350.00, 15),
(16, 'Henry', 'Clark', '1818181818', 450.00, 16),
(17, 'Grace', 'Lewis', '1919191919', 300.00, 17),
(18, 'Samuel', 'Walker', '2020202020', 200.00, 18),
(19, 'Evelyn', 'Hall', '2121212121', 150.00, 19),
(20, 'Lucas', 'Young', '2222222222', 500.00, 20),
(21, 'Liam', 'King', '2323232323', 250.00, 21),
(22, 'Ava', 'Scott', '2424242424', 400.00, 22),
(23, 'Noah', 'Green', '2525252525', 350.00, 23),
(24, 'Harper', 'Adams', '2626262626', 450.00, 24),
(25, 'Ella', 'Baker', '2727272727', 300.00, 25),
(26, 'Oliver', 'Gonzalez', '2828282828', 200.00, 26),
(27, 'Lily', 'Nelson', '2929292929', 150.00, 27),
(28, 'Mason', 'Carter', '3030303030', 500.00, 28),
(29, 'Amelia', 'Mitchell', '3131313131', 250.00, 29),
(30, 'Benjamin', 'Perez', '3232323232', 400.00, 30);
select* from customers;


-- inserting data into Employee table
INSERT INTO Employees (EmployeeID, ProductID, Phone, Salary, DateHired, TotalSales, House_NO, Street_NO, City)
VALUES
(1, 1, '1234567890', 45000.00, '2022-01-15', 120, 101, 10, 'New York'),
(2, 2, '1234567891', 48000.00, '2021-06-12', 140, 102, 11, 'Los Angeles'),
(3, 3, '1234567892', 42000.00, '2020-03-10', 110, 103, 12, 'Chicago'),
(4, 4, '1234567893', 47000.00, '2019-07-18', 130, 104, 13, 'Houston'),
(5, 5, '1234567894', 43000.00, '2023-02-20', 125, 105, 14, 'Phoenix'),
(6, 6, '1234567895', 50000.00, '2022-09-01', 150, 106, 15, 'Philadelphia'),
(7, 7, '1234567896', 39000.00, '2021-12-11', 95, 107, 16, 'San Antonio'),
(8, 8, '1234567897', 44000.00, '2020-05-05', 100, 108, 17, 'San Diego'),
(9, 9, '1234567898', 46000.00, '2022-07-23', 105, 109, 18, 'Dallas'),
(10, 10, '1234567899', 49000.00, '2018-11-03', 135, 110, 19, 'San Jose'),
(11, 11, '2234567890', 47000.00, '2020-08-14', 112, 111, 20, 'Austin'),
(12, 12, '2234567891', 52000.00, '2023-01-27', 155, 112, 21, 'Jacksonville'),
(13, 13, '2234567892', 41000.00, '2019-04-20', 101, 113, 22, 'Fort Worth'),
(14, 14, '2234567893', 43000.00, '2021-10-19', 108, 114, 23, 'Columbus'),
(15, 15, '2234567894', 51000.00, '2020-06-06', 145, 115, 24, 'Charlotte'),
(16, 16, '2234567895', 55000.00, '2022-03-03', 160, 116, 25, 'San Francisco'),
(17, 17, '2234567896', 40000.00, '2021-05-25', 98, 117, 26, 'Indianapolis'),
(18, 18, '2234567897', 42000.00, '2019-09-30', 104, 118, 27, 'Seattle'),
(19, 19, '2234567898', 53000.00, '2023-04-07', 152, 119, 28, 'Denver'),
(20, 20, '2234567899', 48000.00, '2018-12-19', 143, 120, 29, 'Washington DC'),
(21, 21, '3234567890', 46000.00, '2020-01-11', 122, 121, 30, 'Boston'),
(22, 22, '3234567891', 52000.00, '2023-06-14', 150, 122, 31, 'El Paso'),
(23, 23, '3234567892', 40000.00, '2019-02-22', 95, 123, 32, 'Detroit'),
(24, 24, '3234567893', 45000.00, '2021-03-17', 115, 124, 33, 'Nashville'),
(25, 25, '3234567894', 49000.00, '2020-07-01', 135, 125, 34, 'Memphis'),
(26, 26, '3234567895', 50000.00, '2022-11-09', 140, 126, 35, 'Portland'),
(27, 27, '3234567896', 47000.00, '2021-08-28', 125, 127, 36, 'Oklahoma City'),
(28, 28, '3234567897', 51000.00, '2019-01-05', 145, 128, 37, 'Las Vegas'),
(29, 29, '3234567898', 43000.00, '2022-10-13', 110, 129, 38, 'Baltimore'),
(30, 30, '3234567899', 48000.00, '2020-09-29', 133, 130, 39, 'Milwaukee');
select* from Employees;


-- inserting into Orders
INSERT INTO Orders (OrderID, OrderName, CustomerID)
VALUES
(1, 'Electronics Order 1', 1),
(2, 'Electronics Order 2', 2),
(3, 'Furniture Order 1', 3),
(4, 'Appliances Order 1', 4),
(5, 'Clothing Order 1', 5),
(6, 'Accessories Order 1', 6),
(7, 'Electronics Order 3', 7),
(8, 'Furniture Order 2', 8),
(9, 'Appliances Order 2', 9),
(10, 'Clothing Order 2', 10),
(11, 'Accessories Order 2', 11),
(12, 'Electronics Order 4', 12),
(13, 'Furniture Order 3', 13),
(14, 'Appliances Order 3', 14),
(15, 'Clothing Order 3', 15),
(16, 'Accessories Order 3', 16),
(17, 'Electronics Order 5', 17),
(18, 'Furniture Order 4', 18),
(19, 'Appliances Order 4', 19),
(20, 'Clothing Order 4', 20),
(21, 'Accessories Order 4', 21),
(22, 'Electronics Order 6', 22),
(23, 'Furniture Order 5', 23),
(24, 'Appliances Order 5', 24),
(25, 'Clothing Order 5', 25),
(26, 'Accessories Order 5', 26),
(27, 'Electronics Order 7', 27),
(28, 'Furniture Order 6', 28),
(29, 'Appliances Order 6', 29),
(30, 'Clothing Order 6', 30);
select* from orders;


-- inserting into orderDEtails
INSERT INTO OrderDetails (SerialNo, Quantity)
VALUES
(1, 5),
(2, 10),
(3, 8),
(4, 12),
(5, 15),
(6, 20),
(7, 6),
(8, 14),
(9, 9),
(10, 11),
(11, 7),
(12, 13),
(13, 16),
(14, 4),
(15, 18),
(16, 22),
(17, 5),
(18, 17),
(19, 19),
(20, 21),
(21, 6),
(22, 12),
(23, 14),
(24, 8),
(25, 10),
(26, 9),
(27, 11),
(28, 7),
(29, 5),
(30, 20);
select* from OrderDetails;


-- inserting into OrderStoresOrderDetails
INSERT INTO OrderStoresOrderDetails (SerialNo, OrderId)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30);
select* from OrderStoresOrderDetails;


-- inserting into Store_info
INSERT INTO Store_info (StoreID, Location, Revenue)
VALUES
(1, 'New York', 150000.00),
(2, 'Los Angeles', 180000.00),
(3, 'Chicago', 120000.00),
(4, 'Houston', 140000.00),
(5, 'Phoenix', 130000.00),
(6, 'Philadelphia', 125000.00),
(7, 'San Antonio', 110000.00),
(8, 'San Diego', 105000.00),
(9, 'Dallas', 155000.00),
(10, 'San Jose', 160000.00),
(11, 'Austin', 170000.00),
(12, 'Jacksonville', 115000.00),
(13, 'Fort Worth', 102000.00),
(14, 'Columbus', 108000.00),
(15, 'Charlotte', 112000.00),
(16, 'San Francisco', 182000.00),
(17, 'Indianapolis', 95000.00),
(18, 'Seattle', 140000.00),
(19, 'Denver', 123000.00),
(20, 'Washington DC', 177000.00),
(21, 'Boston', 189000.00),
(22, 'El Paso', 98000.00),
(23, 'Detroit', 93000.00),
(24, 'Nashville', 97000.00),
(25, 'Memphis', 91000.00),
(26, 'Portland', 99000.00),
(27, 'Oklahoma City', 88000.00),
(28, 'Las Vegas', 112000.00),
(29, 'Baltimore', 94000.00),
(30, 'Milwaukee', 87000.00);
select* from Store_info;


-- inserting into EmployeeIDHaveStoreInfo
INSERT INTO EmployeeIDHaveStoreInfo (EmployeeID, StoreID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30);
select* from EmployeeIDHaveStoreInfo;


-- inserting data into orderTO table
INSERT INTO OrderTo (CustomerID, EmployeeID)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 24), (25, 25),
(26, 26), (27, 27), (28, 28), (29, 29), (30, 30);
select* from OrderTo;


-- inserting data into supplies
INSERT INTO Supplies (SupplierID, ProductID)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 24), (25, 25),
(26, 26), (27, 27), (28, 28), (29, 29), (30, 30);
select* from Supplies;





-- *********************************************** DROPING ALL TABLES **************************************************
-- Drop dependent tables first
DROP TABLE OrderStoresOrderDetails;
DROP TABLE OrderDetails;
DROP TABLE OrderTo;
DROP TABLE Orders;
DROP TABLE Employees;
DROP TABLE Customers;
DROP TABLE Supplies;
DROP TABLE SupplierDetails;
DROP TABLE Suppliers;
DROP TABLE EmployeeIDHaveStoreInfo;
DROP TABLE Store_info;
DROP TABLE Products;

-- *********************************************** DROPING DATABASE **************************************************
DROP DATABASE CoffeeTASTICsystem;
