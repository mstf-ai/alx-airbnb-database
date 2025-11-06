# Airbnb Database - ER Diagram Requirements

## Entities and Attributes

### 1. User
- **id** (PK)
- first_name
- last_name
- email
- phone_number
- password
- date_joined

### 2. Property
- **id** (PK)
- owner_id (FK → User.id)
- title
- description
- address
- city
- country
- price_per_night
- max_guests
- created_at

### 3. Booking
- **id** (PK)
- user_id (FK → User.id)
- property_id (FK → Property.id)
- check_in_date
- check_out_date
- total_price
- status

### 4. Payment
- **id** (PK)
- booking_id (FK → Booking.id)
- payment_method
- amount
- payment_date
- status

### 5. PropertyImage
- **id** (PK)
- property_id (FK → Property.id)
- image_url
- is_main (boolean)

### 6. Review
- **id** (PK)
- user_id (FK → User.id)
- property_id (FK → Property.id)
- rating (integer 1–5)
- comment
- created_at

---

## Relationships Summary

| Relationship | Type | Description |
|---------------|------|-------------|
| User → Property | 1-to-Many | A user can own multiple properties |
| User → Booking | 1-to-Many | A user can make multiple bookings |
| Property → Booking | 1-to-Many | A property can have multiple bookings |
| Booking → Payment | 1-to-1 | Each booking has one payment |
| Property → PropertyImage | 1-to-Many | Each property can have multiple images |
| Property → Review | 1-to-Many | Each property can have multiple reviews |
| User → Review | 1-to-Many | A user can write multiple reviews |

---

## Normalization Note
The database is designed up to **Third Normal Form (3NF)**:
- No repeating groups (1NF)
- All non-key attributes depend on the full primary key (2NF)
- No transitive dependencies (3NF)

---

## ER Diagram File
The visual ER diagram is included in this directory as:

---

┌────────────┐        ┌──────────────┐        ┌────────────┐
│   User     │ 1    n │   Property   │ 1    n │   Booking  │
│────────────│────────│──────────────│────────│────────────│
│ id (PK)    │        │ id (PK)      │        │ id (PK)    │
│ ...        │        │ owner_id (FK)│        │ user_id (FK)│
└────────────┘        │ ...          │        │ property_id │
                      └──────────────┘        │ ...        │
                                              └────────────┘
                                                     │
                                                     │1
                                                     │
                                                     n
                                              ┌────────────┐
                                              │  Payment   │
                                              └────────────┘

Property → Review (1:n)
Property → PropertyImage (1:n)
User → Review (1:n)

