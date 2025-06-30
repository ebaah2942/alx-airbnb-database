🔗 INNER JOIN — Bookings and Users
Query:


SELECT bookings.id AS booking_id, users.username, bookings.check_in_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;
Purpose:
Retrieves all bookings along with the users who made them. Useful for admin dashboards, reports, or history views.

🧩 LEFT JOIN — Properties and Reviews
Query:

SELECT 
  properties.id AS property_id,
  properties.title,
  reviews.id AS review_id,
  reviews.rating,
  reviews.comment
FROM 
  properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
Purpose:
Returns all properties, including those that don’t have any reviews yet. Helps hosts see which listings haven’t received feedback.

🌐 FULL OUTER JOIN — Users and Bookings
Query:

SELECT 
  users.id AS user_id,
  users.username,
  bookings.id AS booking_id,
  bookings.check_in_date
FROM 
  users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
Purpose:
Combines all users and all bookings. Includes:

Users without bookings

Bookings without a user (orphaned rows)

Fully matched records


SELECT * 
FROM properties 
WHERE id IN (
    SELECT property_id 
    FROM reviews 
    GROUP BY property_id 
    HAVING AVG(rating) > 4.0
);
🔍 Explanation:
The subquery finds all property_ids where the average review rating is greater than 4.0.

The main query fetches those full property records.



SELECT * 
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM bookings b 
    WHERE b.user_id = u.id
) > 3;
🔍 Explanation:
This is a correlated subquery, meaning it runs once per row in the outer query.

For each user , it counts how many bookings they’ve made.

Only includes users with more than 3 bookings.
