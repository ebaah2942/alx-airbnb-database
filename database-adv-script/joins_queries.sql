

SELECT booking.id AS booking_id, users.username
FROM booking
INNER JOIN users
ON booking.user_id = users.id;



SELECT 
properties.id AS property_id,
properties.title AS property_title,
reviews.id AS review_id,
reviews.coments,
reviews.rating
FROM properties
LEFT JOIN reviews
ON properties.id = reviews.property_id;


SELECT
users.id AS user_id,
users.username,
bookings.id AS booking_id,
bookings.check_in_date,
FROM 
users
FULL OUTER JOIN 
bookings ON users.id = bookings.user_id;
