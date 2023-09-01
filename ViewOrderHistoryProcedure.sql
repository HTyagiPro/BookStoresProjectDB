DELIMITER //

CREATE PROCEDURE ViewOrderHistory(IN p_customerID INT)
BEGIN
	Declare p_SumAmount int;
    -- Calculate the total paid amount for the customer's orders
    SELECT IFNULL(SUM(amount), 0) INTO p_SumAmount
    FROM Payments
    WHERE customerID = p_customerID AND status = 'Paid';

    -- Retrieve the order history for the customer
    SELECT
        C.custName,
        O.orderID,
        O.orderDate,
        p_SumAmount AS TotalPaid,
        O.shippingAddress,
        O.taxAmount,
        O.discountAmount
    FROM
        Orders O
    INNER JOIN
        Customer C ON C.customerID = O.customerID
    WHERE
        C.customerID = p_customerID
    ORDER BY
        orderDate DESC;
END //

DELIMITER ;


# Test
CALL ViewOrderHistory(3);


