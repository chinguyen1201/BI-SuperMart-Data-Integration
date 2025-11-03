-- Normalized Data Store (NDS) Schema for SuperMart
USE SuperMart

--- Drop the existing NDS tables ---
/*
DROP TABLE NDS.InvoiceDetails;
DROP TABLE NDS.Invoices;
DROP TABLE NDS.Staff;
DROP TABLE NDS.Customers;
DROP TABLE NDS.Products;
DROP TABLE NDS.Stores;
*/

CREATE TABLE NDS.Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Location VARCHAR(255),
    PhoneNumber VARCHAR(20),
    CreatedDate DATETIME,
    ModifiedDate DATETIME
);

CREATE TABLE NDS.Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    CreatedDate DATETIME,
    ModifiedDate DATETIME
);

CREATE TABLE NDS.Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255),
    CreatedDate DATETIME,
    ModifiedDate DATETIME
);

CREATE TABLE NDS.Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    Position VARCHAR(50),
    StoreID INT,
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    FOREIGN KEY (StoreID) REFERENCES NDS.Stores(StoreID)
);

CREATE TABLE NDS.Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    StaffID INT,
    StoreID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES NDS.Customers(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES NDS.Staff(StaffID),
    FOREIGN KEY (StoreID) REFERENCES NDS.Stores(StoreID)
);

CREATE TABLE NDS.InvoiceDetails (
    InvoiceDetailID INT PRIMARY KEY,
    InvoiceID INT,
    ProductID INT,
    Quantity INT,
    LineTotal DECIMAL(10, 2),
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    FOREIGN KEY (InvoiceID) REFERENCES NDS.Invoices(InvoiceID),
    FOREIGN KEY (ProductID) REFERENCES NDS.Products(ProductID)
);
