DELIMITER //

CREATE PROCEDURE AddCustomer(
    IN p_custName VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_custAddress VARCHAR(100),
    IN p_contactNo BIGINT,
    IN p_existing_username INT,
    IN p_existing_passcode BIGINT
)
BEGIN
    DECLARE v_userExists INT;

    # Check if the user login credentials are valid
    SELECT UserLogInFun(p_existing_username, p_existing_passcode) INTO v_userExists;
	

    IF v_userExists = 1 THEN
        # User login is valid, insert the customer
        INSERT INTO Customer (custName, email, custAddress, contactNo)
        VALUES (p_custName, p_email, p_custAddress, p_contactNo);
    ELSE
        # User login is not valid
        SELECT 'Log in with valid credentials.' AS Result;
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER AddCustomerAsUser
AFTER INSERT
ON Customer FOR EACH ROW
BEGIN
    DECLARE v_username INT;
    DECLARE v_passcode BIGINT;
    DECLARE v_email VARCHAR(100);

    # Get customer details from the inserted row
    SELECT NEW.customerID, NEW.contactNo, NEW.email INTO v_username, v_passcode, v_email;

    # Insert the customer as a user
    INSERT INTO Users (username, passcode, email)
    VALUES (v_username, v_passcode, v_email);
END //

DELIMITER ;

# Test
CALL AddCustomer('B', 'b@example.com', '234 Main St', 1478523969, existing_username_value, existing_passcode_value);

