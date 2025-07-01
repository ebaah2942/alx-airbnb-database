User Table
id (used in joins: bookings.user_id)

username (used in SELECT or filters)

Booking Table
user_id (join)

property_id (join)

check_in_date (filter, order)

Property Table
id (join: bookings.property_id, reviews.property_id)

title (filter, order)

price_per_night (filter, sort)


🔎 Before Indexing

EXPLAIN ANALYZE
SELECT * 
FROM bookings 
WHERE user_id = 5 
ORDER BY check_in_date DESC;

Expect higher cost, sequential scan, slower time.


✅ After Adding Indexes

EXPLAIN ANALYZE
SELECT * 
FROM bookings 
WHERE user_id = 5 
ORDER BY check_in_date DESC;

You should now see:

Index Scan instead of Seq Scan

Lower cost

Improved execution time