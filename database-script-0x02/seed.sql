-- Sample Data: Airbnb System

-- USERS
INSERT INTO users (full_name, email, password, phone_number, role)
VALUES 
  ('Sarah Adu', 'sarah@example.com', 'hashed_pass_1', '0551234567', 'guest'),
  ('Michael Owusu', 'mike@example.com', 'hashed_pass_2', '0249876543', 'host'),
  ('Ama Boateng', 'ama@example.com', 'hashed_pass_3', '0201237890', 'guest');

-- PROPERTIES
INSERT INTO properties (host_id, title, description, address, city, price_per_night, max_guests, available)
VALUES 
  (2, 'Cozy Apartment in Accra', 'A nice 2-bedroom apartment in East Legon', '24 Banana Street', 'Accra', 350.00, 4, TRUE),
  (2, 'Beach House in Cape Coast', 'Oceanfront property with great views', '10 Sea View Ave', 'Cape Coast', 500.00, 6, TRUE);

-- BOOKINGS
INSERT INTO bookings (user_id, property_id, check_in_date, check_out_date, status)
VALUES
  (1, 1, '2025-07-01', '2025-07-05', 'confirmed'),
  (3, 2, '2025-07-10', '2025-07-15', 'pending');

-- PAYMENTS
INSERT INTO payments (booking_id, amount, payment_method, payment_status)
VALUES
  (1, 1400.00, 'card', 'completed'),
  (2, 2500.00, 'mobile_money', 'pending');

-- REVIEWS
INSERT INTO reviews (user_id, property_id, rating, comment)
VALUES
  (1, 1, 5, 'Amazing stay, very clean and comfortable!'),
  (3, 2, 4, 'Nice beach view but far from the city.');

-- MESSAGES
INSERT INTO messages (sender_id, receiver_id, property_id, message_text)
VALUES
  (1, 2, 1, 'Hi, is the apartment available in July?'),
  (2, 1, 1, 'Yes, it is available. Let me know your dates.'),
  (3, 2, 2, 'Can I bring pets to the beach house?');
