CREATE database sales_datawarehouse;
USE sales_datawarehouse;

CREATE TABLE Dim_Customers 
(
CustomerID INT NOT NULL AUTO_INCREMENT,
AltCustomerID varchar(10),
CustomerName varchar(50),
Gender varchar(20),
Mobile varchar(12),
PRIMARY KEY (CustomerID)
);

CREATE TABLE Dim_Products
(
ProductID INT NOT NULL AUTO_INCREMENT,
AltProductID varchar(10),
ProductName varchar(50),
CostPrice int,
SalePrice int,
PRIMARY KEY (ProductID)
);

CREATE TABLE Dim_Stores
(
StoreID INT NOT NULL AUTO_INCREMENT,
AltStoreID varchar(10),
StoreName varchar(100),
StoreLocation varchar(100),
City varchar(50),
State varchar(10),
Country varchar(10),
PRIMARY KEY (StoreID)
);


CREATE TABLE Dim_SalesPersons
(
SalesPersonID INT NOT NULL AUTO_INCREMENT,
AltSalesPersonID varchar(10),
SalesPersonName varchar(50),
StoreID int,
City varchar(100),
State varchar(100),
Country varchar(100),
PRIMARY KEY (SalesPersonID)
);


CREATE TABLE Dim_Date
(
SalesDateKey INT NOT NULL AUTO_INCREMENT,
AltSalesDateKey varchar(10),
Date DATETIME,
DayOfMonth INT,
DayName varchar(10),
MonthName varchar(10),
QuarterNumber int,
PRIMARY KEY (SalesDateKey)
);



Create Table Fact_Sales

(
TransactionID INT NOT NULL AUTO_INCREMENT,
SalesInvoiceNumber int not null,
SalesDateKey int,
StoreID int not null,
CustomerID int not null,
ProductID int not null,
SalesPersonID int not null,
Quantity INT,
SalesTotalCost FLOAT,
ProductActualCost FLOAT,
Profit FLOAT,
PRIMARY KEY (TransactionID)
);



ALTER TABLE Fact_Sales ADD CONSTRAINT FK_StoreID FOREIGN KEY (StoreID)REFERENCES Dim_Stores(StoreID);

ALTER TABLE Fact_Sales ADD CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID)REFERENCES Dim_Customers(CustomerID);

ALTER TABLE Fact_Sales ADD CONSTRAINT FK_ProductKey FOREIGN KEY (ProductID)REFERENCES Dim_Products(ProductID);

ALTER TABLE Fact_Sales ADD CONSTRAINT FK_SalesPersonID FOREIGN KEY (SalesPersonID)REFERENCES Dim_SalesPersons(SalesPersonID);

ALTER TABLE Fact_Sales ADD CONSTRAINT FK_SalesDateKey FOREIGN KEY (SalesDateKey)REFERENCES Dim_Date(SalesDateKey);