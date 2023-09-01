DELIMITER //

CREATE PROCEDURE GeneratePopularBook(IN p_topPopular INT)
BEGIN
    SELECT
        B.title,
        B.category,
        B.ISBNcode,
        B.price,
        A.authorName,
        P.publisherName,
        COUNT(OI.bookID) AS OrderedTimes
    FROM
        Books B
    JOIN
        Author A ON B.authorID = A.authorID
    INNER JOIN
        Publisher P ON B.publisherID = P.publisherID
    LEFT JOIN
        OrderItems OI ON OI.bookID = B.bookID
    GROUP BY
        OI.bookID,
        B.title,
        B.category,
        B.ISBNcode,
        B.price,
        A.authorName,
        P.publisherName
    ORDER BY
        OrderedTimes DESC
    LIMIT p_topPopular;
END //

DELIMITER ;

# Test
CALL GeneratePopularBook(2);
