#Total number of bookings made by each user

SELECT
    users.id AS user_id
    users.username,
    COUNT(bookings.id) AS total_bookings
FROM 
    users
JOIN 
    bookings
ON 
    users.id = bookings.user_id
GROUP BY 
    users.id, users.username
ORDER BY 
    total_bookings DESC;


#Rank properties based on total number of bookings

SELECT
    P.id AS property_id,
    P.title,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank
FROM
    properties P
LEFT JOIN
    bookings b ON p.id = b.property_id
GROUP BY
    P.id, P.title
ORDER BY
    rank;  