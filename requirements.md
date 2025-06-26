 Entities and Attributes
1. User
id (PK)

full_name

email

password

phone_number

role (e.g., guest, host, admin)

date_joined

2. Property
id (PK)

host_id (FK → User)

title

description

address

city

price_per_night

max_guests

available (boolean)

created_at

3. Booking
id (PK)

user_id (FK → User)

property_id (FK → Property)

check_in_date

check_out_date

total_price

status (e.g., pending, confirmed, cancelled)

created_at

4. Review
id (PK)

user_id (FK → User)

property_id (FK → Property)

rating (1-5)

comment

created_at

5. Payment
id (PK)

booking_id (FK → Booking)

amount

payment_method

payment_date

payment_status

Relationships
User —< Booking: A user can make many bookings.

Property —< Booking: A property can be booked many times.

User —< Property: A user (host) can list multiple properties.

User —< Review: A user can write many reviews.

Property —< Review: A property can have many reviews.

Booking —1:1→ Payment: One booking has one corresponding payment.