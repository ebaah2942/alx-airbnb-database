-- Users
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_users_username ON users(username);

-- Bookings
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);

-- Properties
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_title ON properties(title);
CREATE INDEX idx_properties_price ON properties(price_per_night);
