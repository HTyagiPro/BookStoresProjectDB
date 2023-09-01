DELIMITER //

CREATE TRIGGER AfterInsertBook
AFTER INSERT
ON Books FOR EACH ROW
BEGIN
    # Insert the new book into the Inventory table with default stock levels
    INSERT INTO Inventory (bookID, stockLevelUsed, stockLevelNew)
    VALUES (NEW.bookID, 0, 0);
END;

//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddToStockLevelNew(
	IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_oldStock INT;
    SELECT stockLevelNew INTO v_oldStock FROM Inventory WHERE bookID = p_bookID;
    UPDATE Inventory SET stockLevelNew = v_oldStock + p_quantity WHERE bookID = p_bookID;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddToStockLevelUsed(
	IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_oldStock INT;
    SELECT stockLevelUsed INTO v_oldStock FROM Inventory WHERE bookID = p_bookID;
    UPDATE Inventory SET stockLevelUsed = v_oldStock + p_quantity WHERE bookID = p_bookID;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SubstractToStockLevelUsed(
	IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_oldStock INT;
    SELECT stockLevelUsed INTO v_oldStock FROM Inventory WHERE bookID = p_bookID;
    IF v_oldStock - p_quantity > 0 THEN
        UPDATE Inventory SET stockLevelUsed = v_oldStock - p_quantity WHERE bookID = p_bookID;
	ELSE 
		SELECT 'Ordered Quanitity is not available.' AS Message;
    END IF;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SubstractToStockLevelNew(
	IN p_bookID INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_oldStock INT;
    SELECT stockLevelNew INTO v_oldStock FROM Inventory WHERE bookID = p_bookID;
    IF v_oldStock - p_quantity > 0 THEN
        UPDATE Inventory SET stockLevelNew = v_oldStock - p_quantity WHERE bookID = p_bookID;
	ELSE 
		SELECT 'Ordered Quanitity is not available.' AS Message;
    END IF;
END //

DELIMITER ;

# Test
CALL AddToStockLevelNew(3, 10);
CALL AddToStockLevelUsed(3, 10);
CALL SubstractToStockLevelUsed(3, 10);
CALL SubstractToStockLevelNew(3, 10);
