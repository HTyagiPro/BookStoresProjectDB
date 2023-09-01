DELIMITER //

CREATE PROCEDURE RegisterUser(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(100)
)
BEGIN
    # DECLARE v_passcode VARCHAR(100);
    
    -- Hash the password using SHA2 (you can choose an appropriate hashing algorithm)
    # SET v_passcode = SHA2(p_password, 512);
    
    -- Insert user data into Users table
    INSERT INTO Users (username, passcode, email)
    VALUES (p_username, p_password, p_email);
END //

DELIMITER ;

# Test  
CALL RegisterUser(0,100000001 , 'admin@example.com');
