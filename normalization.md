# Database Normalization to 3NF

## Objective
To apply normalization principles to eliminate redundancy and ensure data integrity by bringing the database schema to **Third Normal Form (3NF)**.


## Third Normal Form (3NF)
**Rule:** Eliminate transitive dependencies — no non-key column should depend on another non-key column.

---

### 🔍 What this means in simple terms

Let’s take the `Booking` table.

Originally, we had a column called `total_price`. But this value can be **calculated** from:

> `total_price = number of nights × price per night`

That means:
- `total_price` depends on the **check-in and check-out dates** and the **property’s price**.
- It doesn’t depend directly on the `booking_id` (which is the primary key).
- So it **violates 3NF**.

---

### 💡 Why is that a problem?

Because if the property price changes or the dates are updated:
- The stored `total_price` might become incorrect.
- You’d have to update it in multiple places (which is risky and messy).

---

### ✅ The fix

We removed `total_price` from the `Booking` table.  
Instead, we’ll calculate it when needed in our app or view logic.

This keeps our database:
- Accurate ✅
- Clean ✅
- Easy to manage ✅

That’s what **3NF** is all about — making sure every column depends only on the primary key and nothing else.

---

## Final Tables (3NF Compliant)

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
The database is now in **Third Normal Form (3NF)**.
- No repeating or multi-valued fields.
- No partial dependencies.
- No transitive dependencies.