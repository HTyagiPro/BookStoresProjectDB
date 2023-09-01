-- For User Registration
CALL RegisterUser('user', 'hello', 'user@example.com');

-- To Add Book
CALL AddBook(1004, 10004, 'How to become rich', 'Pleasure reading', 1600, 1472366, 657, 'New', 2022);

-- To Search Book By Id
CALL SearchBookByID(3);

-- To Search Book By Title
CALL SearchBookByTitle('Coding Masterclass');

-- To Search Book By AuthorName
CALL SearchBookByAuthor('Mark Johnson');

-- To Get Popular Books
CALL GeneratePopularBook(5);

-- To Place Order
CALL PlaceOrder(7, '2023-08-30 10:00:00', '123 Main St', 3, 15, 25.99, 3.00, 1.00, 'New', @OrderID);

-- To add Customer
CALL AddCustomer('C', 'c@example.com', '123 Main St', 97989879897, 111, 1295136396);

-- To add to StockLevelNew
CALL AddToStockLevelNew(5);

-- To add to StockLevelUsed
CALL AddToStockLevelUsed(5);

-- To subtract from StockLevelUsed
CALL SubstractToStockLevelUsed(5);

-- To subtract from StockLevelNew
CALL SubstractToStockLevelNew(5);

-- To Generate Report
CALL GetReports(3);

-- To View Order History Of a Customer
CALL ViewOrderHistory(102, @TotalPaid);
