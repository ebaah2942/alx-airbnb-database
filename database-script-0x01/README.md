# Property Booking System – SQL Schema

This project defines the SQL database schema for a Airbnb like project 

The database has been normalized to **Third Normal Form (3NF)** to ensure:
- Clean data structure
- No redundancy
- Easier maintenance and scaling

---

## 📦 Entities & Tables

### 1. `users`
Stores all registered users, including guests, hosts, and admins.

### 2. `properties`
Lists properties available for booking. Each is owned by a user (host).

### 3. `bookings`
Tracks bookings made by users for properties, with check-in/check-out dates and status.

### 4. `payments`
Records payments made for bookings. Each booking has one payment entry.

### 5. `reviews`
Stores reviews users leave on properties after bookings.

### 6. `messages`
Handles messages between users (e.g., guest ↔ host) related to a specific property.

---

## 🔐 Keys & Constraints

- Primary keys: Auto-incrementing `id` fields in each table.
- Foreign keys: Enforce relationships between users, properties, bookings, etc.
- Constraints: Prevent invalid data (e.g., rating must be 1–5, unique emails).
- Unique constraints: Users can only review a property once.

---

## ⚙️ Indexes for Performance

- Email, city, dates, and foreign keys are indexed to speed up search queries.
- Indexes also exist on message sender/receiver combinations and review ratings.

---

## ✅ Normalization Summary (3NF)

- No transitive dependencies like `total_price` (3NF).
- Derived data (like total price) is calculated on the fly.

---

## 📁 Files Included

- `property_booking_schema.sql` – full schema with constraints and indexes
- `Normalization_to_3NF.md` – explanation of the normalization process

---

## 🙋‍♂️ Author
Enoch Baah  