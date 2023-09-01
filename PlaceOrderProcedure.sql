DELIMITER //

CREATE PROCEDURE PlaceOrder(
    IN p_customerID INT,
    IN p_orderDate DATETIME,
    IN p_shippingAddress VARCHAR(100),
    IN p_bookID INT,
    IN p_quantity INT,
    IN p_priceOfUnitQuantity DECIMAL(10, 2),
    IN p_taxAmount DECIMAL(10, 2),
    IN p_discountAmount DECIMAL(10, 2),
    IN p_bookType VARCHAR(16),
    OUT p_orderID INT
)
BEGIN
    DECLARE v_presentStockLevelNew INT;
    DECLARE v_presentStockLevelUsed INT;
    DECLARE v_passcode VARCHAR(100);

    # Get the current stock levels
    SELECT stockLevelNew, stockLevelUsed INTO v_presentStockLevelNew, v_presentStockLevelUsed
    FROM Inventory
    WHERE bookID = p_bookID;

    # Check if the customer login credentials are valid
    SELECT passcode INTO v_passcode
    FROM Users
    WHERE username = p_customerID;

    IF (UserLogInFun(p_customerID, v_passcode) = 1) THEN
        IF (p_bookType = 'New') THEN
            IF (v_presentStockLevelNew >= p_quantity) THEN
                CALL SubstractToStockLevelNew(p_bookID, p_quantity);
  
                # Insert into Orders table
                INSERT INTO Orders (customerID, orderDate, totalAmount, shippingAddress, taxAmount, discountAmount)
                VALUES (p_customerID, p_orderDate, p_quantity * p_priceOfUnitQuantity, p_shippingAddress, p_taxAmount, p_discountAmount);

                # Get the generated orderID
                SELECT LAST_INSERT_ID() INTO p_orderID;

                # Insert into OrderItems table
                INSERT INTO OrderItems (orderID, bookID, quantity, priceOfUnitQuantity)
                VALUES (p_orderID, p_bookID, p_quantity, p_priceOfUnitQuantity);

                # Insert into Payments table
                INSERT INTO Payments (orderID, customerID, paymentDate, amount, status)
                VALUES (p_orderID, p_customerID, p_orderDate, p_quantity * p_priceOfUnitQuantity - p_discountAmount + p_taxAmount, 'Paid');
            ELSE
                SELECT 'The order quantity is not available.' AS Result;
            END IF;
        ELSEIF (p_bookType = 'Used') THEN
            IF (v_presentStockLevelUsed >= p_quantity) THEN
                    CALL SubstractToStockLevelUsed(p_bookID, p_quantity);

                # Insert into Orders table
                INSERT INTO Orders (customerID, orderDate, totalAmount, shippingAddress, taxAmount, discountAmount)
                VALUES (p_customerID, p_orderDate, p_quantity * p_priceOfUnitQuantity, p_shippingAddress, p_taxAmount, p_discountAmount);

                # Get the generated orderID
                SELECT LAST_INSERT_ID() INTO p_orderID;

                # Insert into OrderItems table
                INSERT INTO OrderItems (orderID, bookID, quantity, priceOfUnitQuantity)
                VALUES (p_orderID, p_bookID, p_quantity, p_priceOfUnitQuantity);

                # Insert into Payments table
                INSERT INTO Payments (orderID, customerID, paymentDate, amount, status)
                VALUES (p_orderID, p_customerID, p_orderDate, p_quantity * p_priceOfUnitQuantity - p_discountAmount + p_taxAmount, 'Pending');
            ELSE
                SELECT 'The order quantity is not available.' AS Result;
            END IF;
        ELSE
            SELECT 'Invalid book type.' AS Result;
        END IF;
    ELSE
        SELECT 'Customer needs to be added.' AS Result;
    END IF;
END //

DELIMITER ;

Drop procedure PlaceOrder;

CALL PlaceOrder(
	7,
    '2023-08-30 10:00:00',
    '123 Main St',
    3,
    1,
    25.99,
    3.00,
    1.00,
    'New',
    @orderID
);



Select @orderID as OrderID;
