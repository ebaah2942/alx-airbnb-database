EXPLAIN ANALYZE
SELECT 
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date,
  
  u.id AS user_id,
  u.username,
  u.email,
  
  p.id AS property_id,
  p.title,
  p.price_per_night,
  
  pay.id AS payment_id,
  pay.amount,
  pay.status

FROM 
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;

Identify Inefficiencies
Common problems:

No indexes on user_id, property_id, or booking_id

Retrieving all fields (SELECT *) instead of only what you need

LEFT JOIN payments when every booking is guaranteed to have a payment


Refactor for Performance
🔧 Optimized Query

SELECT 
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date,

  u.username,
  p.title,
  pay.amount,
  pay.status

FROM 
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

Improvements:
Select only required columns

Assume all bookings have a payment → use JOIN instead of LEFT JOIN

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);


Re-analyze with EXPLAIN ANALYZE

EXPLAIN ANALYZE
SELECT 
  b.id AS booking_id,
  b.check_in_date,
  b.check_out_date,

  u.username,
  p.title,
  pay.amount,
  pay.status

FROM 
  bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

The outcome:

Index Scan instead of Seq Scan

Lower estimated cost

Reduced actual execution time

