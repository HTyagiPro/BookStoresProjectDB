# Creating Bookstore database
CREATE DATABASE BookStoresProject;

# Using Bookstore Database
USE BookStoresProject;

# Creating Books Table
CREATE TABLE Books (
	  bookID INT AUTO_INCREMENT,
	  authorID INT NOT NULL,
	  publisherID INT NOT NULL,
	  title VARCHAR(255) NOT NULL UNIQUE,
	  category VARCHAR(127) NOT NULL,
	  price DECIMAL(10,2) NOT NULL,
	  ISBNcode BIGINT NOT NULL UNIQUE,
	  pageCount INT NOT NULL,
	  publishedYear INT NOT NULL,
	  bookCondition VARCHAR(5) NOT NULL,
      ratingID double Default(0),
	  recordCreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
	  CONSTRAINT fk_authorBooks Foreign key (authorID) References Author(authorID),
	  CONSTRAINT fk_publisherBooks Foreign key (publisherID) References Publisher(publisherID),
	  PRIMARY KEY (bookID)
);



# Creating Author Table
CREATE TABLE Author (
	  authorID INT AUTO_INCREMENT PRIMARY KEY,
	  authorName VARCHAR(50) DEFAULT 'Anonymous',
	  recordCreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# Creating Publisher Table
CREATE TABLE Publisher (
	  publisherID INT AUTO_INCREMENT PRIMARY KEY,
	  publisherName VARCHAR(50) DEFAULT 'Prolifics',
	  recordCreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# Creating Inventory Table
CREATE TABLE Inventory (
	inventoryID INT AUTO_INCREMENT,
	bookID INT NOT NULL,
	stockLevelUsed INT NOT NULL,
	stockLevelNew INT NOT NULL,
	recordCreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_bookInv Foreign key (bookID) References Books(bookID),
    PRIMARY KEY (inventoryID)
);


# Creating Customer Table
CREATE TABLE Customer (
	  customerID INT AUTO_INCREMENT,
	  custName VARCHAR(255) NOT NULL,
	  email VARCHAR(100) NOT NULL UNIQUE,
	  custAddress VARCHAR(100) NOT NULL,
	  contactNo BIGINT NOT NULL UNIQUE,
	  recordCreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	  PRIMARY KEY(customerID)
);

ALTER TABLE Customer ALTER customerID SET DEFAULT 0;

# Creating Orders Table
CREATE TABLE Orders (
	  orderID INT AUTO_INCREMENT,
	  customerID INT NOT NULL,
	  orderDate DATETIME NOT NULL,
	  totalAmount DECIMAL(10,2) NOT NULL,
	  shippingAddress VARCHAR(100) NOT NULL,
	  taxAmount DECIMAL(10,2) NOT NULL,
	  discountAmount DECIMAL(10,2) NOT NULL,
	  recordCreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	  CONSTRAINT fk_customerOrd Foreign key (customerID) References Customer(customerID),
      PRIMARY KEY(orderID)
      
);

# Creating Order Items Table
CREATE TABLE OrderItems (
	  ID INT AUTO_INCREMENT ,
	  orderID INT NOT NULL,
	  bookID INT NOT NULL,
	  customerID INT NOT NULL,
	  quantity INT DEFAULT 0 NOT NULL,
	  priceOfUnitQuantity DECIMAL(10,2) NOT NULL,
	  recordCreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	  CONSTRAINT fk_customerOrdItms Foreign key (customerID) References Customer(customerID),
	  CONSTRAINT fk_bookOrdItms Foreign key (bookID) References Books(bookID),
	  PRIMARY KEY(ID)
);

# Creating Payments Table
CREATE TABLE Payments (
  paymentID INT AUTO_INCREMENT,
  orderID INT NOT NULL,
  customerID INT NOT NULL,
  paymentDate DATETIME NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  status VARCHAR(120) NOT NULL,
  recordCreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_customerPayments Foreign key (customerID) References Customer(customerID),
  CONSTRAINT fk_orderidPayments Foreign key (orderID) References Orders(orderID),
  PRIMARY KEY(paymentID)
);

/*
# Creating CustomerActivity log table
CREATE TABLE CustomerActivity (
	id int AUTO_INCREMENT Primary Key,
	customerID int Foreign Key References Customer(customerID),
	activity text Not Null,
	recordCreatedOn datetime Default CURRENT_TIMESTAMP,
	rowVersion timestamp
);
*/

# Creating user table for login actions
CREATE TABLE Users (
    userID INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    passcode TEXT NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    registrationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(userID)
);

# Describe Each Table
DESC Inventory;
DESC Publisher;
DESC Author;
DESC Order_Items;
DESC Cart_Item;
DESC Books;
DESC Orders;
DESC Customer;
DESC Payments;
DESC Users;



# Data retrieval
Select * from Author;
Select * from Publisher;
Select * from Customer;
Select * from Books;
Select * from Inventory;
Select * from Orders;
Select * from Customer;
Select * from Payments;
Select * from Order_Items;
Select * from Users;
Select * from Rating;



# Drop Sequence
Drop Table Inventory;
Drop Table Publisher;
Drop Table Author;
Drop Table OrderItems;
Drop Table Books;
Drop Table Orders;
Drop Table Customer;
Drop Table Payments;
Drop Table Users;

Show databases;
Use BookStoresProject;
# To view all stored procedures
SHOW PROCEDURE STATUS WHERE db = 'BookStoresProject';

ALTER TABLE Books ADD COLUMN rating double Default(0);
