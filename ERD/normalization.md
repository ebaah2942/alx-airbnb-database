# Database Normalization to 3NF

## Objective
To apply normalization principles to eliminate redundancy and ensure data integrity by bringing the database schema to **Third Normal Form (3NF)**.

---


## Third Normal Form (3NF)
**Rule:** Eliminate transitive dependencies. No non-key attribute should depend on another non-key attribute.

### 🔍 Detected Issue:
- In the `User` table: no transitive dependency.
- In the `Booking` table: `total_price` could be computed from `price_per_night` × number of nights — *considered a derived value*.
- In the `Property` table:
  - Attributes like `city` may suggest normalization into a separate `Location` table if reused across many properties, but this is optional based on project size.

---

## ✅ Adjusted Schema Highlights

- **Avoid storing derived data:** Remove `total_price` from `Booking` (it can be computed).
- **Optional** normalization of `city` into a `Location` table if there are multiple properties with shared locations.
- All foreign keys (`user_id`, `property_id`, `booking_id`) are in place, ensuring referential integrity.

---

## Final Adjusted Tables (3NF Compliant)

### User
- id (PK)
- full_name
- email
- password
- phone_number
- role
- date_joined

### Property
- id (PK)
- host_id (FK → User)
- title
- description
- address
- city
- price_per_night
- max_guests
- available
- created_at

### Booking
- id (PK)
- user_id (FK → User)
- property_id (FK → Property)
- check_in_date
- check_out_date
- status
- created_at

### Payment
- id (PK)
- booking_id (FK → Booking)
- amount
- payment_method
- payment_date
- payment_status

### Review
- id (PK)
- user_id (FK → User)
- property_id (FK → Property)
- rating
- comment
- created_at

---

## Summary
The schema is in **Third Normal Form (3NF)**. All functional and transitive dependencies have been addressed. Redundant or derived data like `total_price` has been removed or documented for calculation during runtime instead of storage.
