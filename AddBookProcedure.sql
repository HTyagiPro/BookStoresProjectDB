# Creating Stored Procedure for adding Book
DELIMITER //
CREATE PROCEDURE AddBook(
    IN p_authorID INT,
    IN p_publisherID INT,
    IN p_title VARCHAR(255),
    IN p_category VARCHAR(127),
    IN p_price DECIMAL(10, 2),
    IN p_ISBNcode BIGINT,
    IN p_pageCount INT,
    IN p_condition VARCHAR(5),
    IN p_publishedYear INT
)
BEGIN
    INSERT INTO Books (authorID, publisherID, title, category, price, ISBNcode, pageCount, publishedYear, bookCondition)
    VALUES (p_authorID, p_publisherID, p_title, p_category, p_price, p_ISBNcode, p_pageCount, p_publishedYear, p_condition);
END //

DELIMITER ;

# Test 
CALL AddBook(5, 4, 'The Vampire Diaries', 'Super Naturals', 1500.00, 1472361, 650, 'New', 2016);
