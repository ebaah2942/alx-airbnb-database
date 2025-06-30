#SUB QUERY

SELECT *
FROM 
properties
WHERE 
id IN (
    SELECT property_id 
    FROM reviews 
    GROUP BY property_id 
    HAVING AVG(rating) > 4.0
    
    );


# USERS WITH 3 OR MORE BOOKINGS

SELECT *
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
    ) > 3;