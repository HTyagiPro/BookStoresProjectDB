DELIMITER //

CREATE PROCEDURE GetReports(IN p_bookID INT)
BEGIN
    SELECT
        B.title,
        B.category,
        B.ISBNcode,
        B.price,
        A.authorName,
        P.publisherName,
        COUNT(OI.bookID) AS TotalOrders,
        I.stockLevelNew,
        I.stockLevelUsed
    FROM
        Books B
    INNER JOIN
        Author A ON B.authorID = A.authorID
    INNER JOIN
        Publisher P ON B.publisherID = P.publisherID
    INNER JOIN
        OrderItems OI ON B.bookID = OI.bookID
    INNER JOIN
        Inventory I ON B.bookID = I.bookID
    WHERE
        B.bookID = p_bookID
    GROUP BY
        OI.bookID,
        B.title,
        B.category,
        B.ISBNcode,
        B.price,
        A.authorName,
        P.publisherName,
        I.stockLevelNew,
        I.stockLevelUsed;
END //

DELIMITER ;

# Test
CALL GetReports(4);
