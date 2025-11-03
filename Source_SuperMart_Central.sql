DROP DATABASE SuperMart; -- Drop the existing Database

CREATE DATABASE SuperMart

USE SuperMart


CREATE SCHEMA Store1;

CREATE TABLE Store1.Stores (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Location VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Store1.Products (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    QuantityInStock INT
);

CREATE TABLE Store1.Customers (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Store1.Staff (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    Position VARCHAR(50),
    StoreID INT,
    FOREIGN KEY (StoreID) REFERENCES Store1.Stores(StoreID)
);

CREATE TABLE Store1.Invoices (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    StaffID INT,
    StoreID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Store1.Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Store1.Staff(StaffID),
    FOREIGN KEY (StoreID) REFERENCES Store1.Stores(StoreID)
);

CREATE TABLE Store1.InvoiceDetails (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    InvoiceDetailID INT PRIMARY KEY,
    InvoiceID INT,
    ProductID INT,
    Quantity INT,
    LineTotal DECIMAL(10, 2),
    FOREIGN KEY (InvoiceID) REFERENCES Store1.Invoices(InvoiceID),
    FOREIGN KEY (ProductID) REFERENCES Store1.Products(ProductID)
);

-- Insert synthetic data into Store1 schema
INSERT INTO Store1.Stores (CreatedDate, ModifiedDate, StoreID, StoreName, Location, PhoneNumber) VALUES ('2024-11-01', '2024-11-01', 1, 'SuperMart Central', '123 Main St, Springfield', '123-456-7890');

INSERT INTO Store1.Products (CreatedDate, ModifiedDate, ProductID, ProductName, Category, Price, QuantityInStock) VALUES 
('2024-11-01', '2024-11-01', 1, 'Apple', 'Fruits', 0.50, 500),
('2024-11-01', '2024-11-01', 2, 'Milk', 'Dairy', 1.20, 200),
('2024-11-01', '2024-11-01', 3, 'Bread', 'Bakery', 1.00, 150),
('2024-11-01', '2024-11-01', 4, 'Eggs', 'Dairy', 2.50, 300),
('2024-11-01', '2024-11-01', 5, 'Orange Juice', 'Beverages', 3.00, 100);

INSERT INTO Store1.Customers (CreatedDate, ModifiedDate, CustomerID, CustomerName, PhoneNumber, Email, Address) VALUES 
('2024-11-01', '2024-11-01', 1, 'John Doe', '555-123-4567', 'johndoe@example.com', '789 Maple St, Springfield');


INSERT INTO Store1.Staff (CreatedDate, ModifiedDate, StaffID, StaffName, Position, StoreID) VALUES 
('2024-11-01', '2024-11-01', 1, 'Alice Johnson', 'Cashier', 1),
('2024-11-01', '2024-11-01', 2, 'Bob Brown', 'Manager', 1);

INSERT INTO Store1.Invoices (CreatedDate, ModifiedDate, InvoiceID, CustomerID, StaffID, StoreID, InvoiceDate, TotalAmount) VALUES 
('2024-11-01', '2024-11-01', 1, 1, 1, 1, '2024-11-01', 7.30),
('2024-11-01', '2024-11-01', 3, 1, 2, 1, '2024-11-03', 4.00);

INSERT INTO Store1.InvoiceDetails (CreatedDate, ModifiedDate, InvoiceDetailID, InvoiceID, ProductID, Quantity, LineTotal) VALUES 
('2024-11-01', '2024-11-01', 1, 1, 1, 5, 2.50),
('2024-11-01', '2024-11-01', 2, 1, 2, 4, 4.80),
('2024-11-01', '2024-11-01', 5, 3, 3, 4, 4.00);
