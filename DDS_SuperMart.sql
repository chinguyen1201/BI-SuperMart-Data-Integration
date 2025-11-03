USE SuperMart;

DROP TABLE DDS.FactProductSales;
DROP TABLE DDS.DimDate;
DROP TABLE DDS.DimStore;
DROP TABLE DDS.DimProduct;
DROP TABLE DDS.DimCustomer;
DROP TABLE DDS.DimStaff;


-- Dimension Tables
CREATE TABLE DDS.DimDate (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    DateID INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT
);

CREATE TABLE DDS.DimStore (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Location VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE DDS.DimProduct (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE DDS.DimCustomer (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE DDS.DimStaff (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    Position VARCHAR(50)
);

-- Fact Table
CREATE TABLE DDS.FactProductSales (
    CreatedDate DATETIME,
    ModifiedDate DATETIME,
    SalesID INT PRIMARY KEY,
    DateID INT,
    StoreID INT,
    ProductID INT,
    CustomerID INT,
    StaffID INT,
    Quantity INT,
    LineTotal DECIMAL(10, 2),
    FOREIGN KEY (DateID) REFERENCES DDS.DimDate(DateID),
    FOREIGN KEY (StoreID) REFERENCES DDS.DimStore(StoreID),
    FOREIGN KEY (ProductID) REFERENCES DDS.DimProduct(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES DDS.DimCustomer(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES DDS.DimStaff(StaffID)
);
