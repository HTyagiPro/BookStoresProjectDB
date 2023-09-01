-- Inserting 5 records into the Author table
INSERT INTO Author (authorName) VALUES
    ('Author 1'),
    ('Author 2'),
    ('Author 3'),
    ('Author 4'),
    ('Author 5');

-- Inserting 5 records into the Publisher table
INSERT INTO Publisher (publisherName) VALUES
    ('Publisher 1'),
    ('Publisher 2'),
    ('Publisher 3'),
    ('Publisher 4'),
    ('Publisher 5');

-- Inserting 5 records into the Customer table
INSERT INTO Customer (custName, email, custAddress, contactNo) VALUES
    ('Customer 1', 'customer1@example.com', 'Address 1', 1234567890),
    ('Customer 2', 'customer2@example.com', 'Address 2', 2345678901),
    ('Customer 3', 'customer3@example.com', 'Address 3', 3456789012),
    ('Customer 4', 'customer4@example.com', 'Address 4', 4567890123),
    ('Customer 5', 'customer5@example.com', 'Address 5', 5678901234);

-- Inserting 5 records into the Books table
-- Make sure to replace authorID and publisherID with the appropriate values from the Author and Publisher tables
INSERT INTO Books (authorID, publisherID, title, category, price, ISBNcode, pageCount, publishedYear, bookCondition) VALUES
    (1, 1, 'Book 1', 'Category 1', 19.99, 1234567890123, 300, 2022, 'New'),
    (2, 2, 'Book 2', 'Category 2', 24.99, 2345678901234, 250, 2021, 'Used'),
    (3, 3, 'Book 3', 'Category 1', 14.99, 3456789012345, 400, 2023, 'New'),
    (4, 4, 'Book 4', 'Category 3', 29.99, 4567890123456, 350, 2020, 'Used'),
    (5, 5, 'Book 5', 'Category 2', 22.99, 5678901234567, 320, 2022, 'New');

-- Inserting 5 records into the Inventory table
-- Make sure to replace bookID with the appropriate values from the Books table
INSERT INTO Inventory (bookID, stockLevelUsed, stockLevelNew) VALUES
    (2, 10, 20),
    (3, 5, 15),
    (4, 8, 22),
    (5, 12, 18),
    (6, 6, 14);

-- Inserting 5 records into the Orders table
-- Make sure to replace customerID with the appropriate values from the Customer table
INSERT INTO Orders (customerID, orderDate, totalAmount, shippingAddress, taxAmount, discountAmount) VALUES
    (1, '2023-09-01 10:00:00', 59.95, 'Shipping Address 1', 4.00, 0.00),
    (2, '2023-09-02 11:00:00', 74.99, 'Shipping Address 2', 5.00, 0.00),
    (3, '2023-09-03 12:00:00', 44.98, 'Shipping Address 3', 3.00, 0.00),
    (4, '2023-09-04 13:00:00', 89.97, 'Shipping Address 4', 6.00, 0.00),
    (5, '2023-09-05 14:00:00', 68.97, 'Shipping Address 5', 4.00, 0.00);

-- Inserting 5 records into the OrderItems table
-- Make sure to replace orderID, bookID, and customerID with the appropriate values from the Orders, Books, and Customer tables
INSERT INTO OrderItems (orderID, bookID, customerID, quantity, priceOfUnitQuantity) VALUES
    (1, 2, 1, 2, 19.99),
    (2, 3, 2, 3, 24.99),
    (3, 4, 3, 1, 14.99),
    (4, 5, 4, 4, 29.99),
    (5, 6, 5, 2, 22.99);

-- Inserting 5 records into the Payments table
-- Make sure to replace orderID and customerID with the appropriate values from the Orders and Customer tables
INSERT INTO Payments (orderID, customerID, paymentDate, amount, status) VALUES
    (1, 1, '2023-09-01 10:30:00', 59.95, 'Paid'),
    (2, 2, '2023-09-02 11:30:00', 74.99, 'Paid'),
    (3, 3, '2023-09-03 12:30:00', 44.98, 'Paid'),
    (4, 4, '2023-09-04 13:30:00', 89.97, 'Paid'),
    (5, 5, '2023-09-05 14:30:00', 68.97, 'Paid');
