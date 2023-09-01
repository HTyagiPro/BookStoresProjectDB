
DELIMITER //

CREATE PROCEDURE SearchBookByID(IN p_id INT)
BEGIN
    SELECT * FROM Books WHERE bookID = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SearchBookByTitle(IN p_title VARCHAR(255))
BEGIN
    SELECT * FROM Books WHERE title = p_title;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE SearchBookByAuthor(IN p_Author VARCHAR(255))
BEGIN
    DECLARE v_authorID INT;
    SELECT authorID INTO v_authorID FROM Author WHERE authorName = p_Author;
    SELECT * FROM Books WHERE authorID = v_authorID;
END //

DELIMITER ;

# Test Above Procedures
Select * from Books;
CALL SearchBookByAuthor('Author 1');
CALL SearchBookByTitle('Book 3');
CALL SearchBookByID(3);
