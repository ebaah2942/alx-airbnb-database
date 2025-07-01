-- 1. Rename the existing table
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create the parent partitioned table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    check_in_date DATE,
    check_out_date DATE,
    -- other fields...
    CONSTRAINT bookings_date_check CHECK (check_in_date IS NOT NULL)
) PARTITION BY RANGE (check_in_date);

-- 3. Create partitions (e.g., yearly)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


EXPLAIN ANALYZE
SELECT * 
FROM bookings 
WHERE check_in_date BETWEEN '2024-07-01' AND '2024-07-31';



