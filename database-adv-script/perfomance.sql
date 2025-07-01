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
