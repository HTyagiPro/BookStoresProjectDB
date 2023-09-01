DELIMITER //

CREATE PROCEDURE UserLogin(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(100)
)
BEGIN
    DECLARE v_storedPasswordHash VARCHAR(100);
	# DECLARE v_inputPasswordHash VARCHAR(100);
    # Get the stored password hash for the provided username
    SELECT passcode INTO v_storedPasswordHash
    FROM Users
    WHERE username = p_username;

    # Hash the provided password using the same algorithm
    
    #SET v_inputPasswordHash = SHA2(p_password, 512); # Use the same hashing algorithm as used during registration

    # Check if the provided password hash matches the stored password hash
    IF v_storedPasswordHash = v_storedPasswordHash THEN
        SELECT 'Login successful' AS Result;
        # You might add additional actions here, like setting a session token or updating login history.
    ELSE
        SELECT 'Login failed' AS Result;
    END IF;
END //

DELIMITER ;

Drop Function UserLogInFun;

DELIMITER //

CREATE FUNCTION UserLogInFun(
    p_username VARCHAR(50),
    p_password VARCHAR(100)
)
RETURNS BOOLEAN
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE v_storedPasswordHash VARCHAR(100);
	DECLARE v_inputPasswordHash VARCHAR(100);
    # Get the stored password hash for the provided username
    SELECT passcode INTO v_storedPasswordHash
    FROM Users
    WHERE username = p_username;

    # Hash the provided password using the same algorithm
    # SET v_inputPasswordHash = SHA2(p_password, 512); # Use the same hashing algorithm as used during registration

    # Check if the provided password hash matches the stored password hash
    IF v_storedPasswordHash = p_password THEN
        RETURN TRUE;
        # You might add additional actions here, like setting a session token or updating login history.
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;

# Test Procedure UserLogin
CALL UserLogin(0, 100000001);
#Test Function
SELECT UserLogInFun(0, 100000001);


