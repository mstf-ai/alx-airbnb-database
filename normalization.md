# Airbnb Database Normalization

## Objective
The goal of this document is to explain how the Airbnb database design was normalized to the **Third Normal Form (3NF)** in order to eliminate redundancy, ensure data integrity, and maintain scalability.

---

## 1️⃣ First Normal Form (1NF)
**Rule:**  
- Each table must have a primary key.  
- No repeating groups or arrays.  
- Each field contains atomic (indivisible) values.

**How it's applied:**
- All tables (User, Property, Booking, Payment, Review, PropertyImage) have **unique primary keys** (`id`).
- No table contains multiple values in one field.  
  Example: instead of having a `images` field inside `Property`, a separate table `PropertyImage` was created.
- Each column holds one value only (atomic).

✅ **Result:** Database is in 1NF.

---

## 2️⃣ Second Normal Form (2NF)
**Rule:**  
- Must be in 1NF.  
- All non-key attributes depend on the **entire primary key**, not part of it.

**How it's applied:**
- Every table has a single-field primary key (`id`), so partial dependency does not exist.  
- For junction-type relationships (like `Booking` linking `User` and `Property`), all attributes depend on the full key (booking details depend on both user and property).

✅ **Result:** Database is in 2NF.

---

## 3️⃣ Third Normal Form (3NF)
**Rule:**  
- Must be in 2NF.  
- No **transitive dependencies** (non-key attributes depending on other non-key attributes).

**How it's applied:**
- In `User`, personal details (name, email, password) depend only on `id`.
- In `Property`, attributes like `title`, `price_per_night`, etc., depend directly on `id`, not through another field.
- In `Booking`, `total_price` depends on `booking_id` (not through `user` or `property`), ensuring clear dependency.
- `Payment` and `Review` only contain attributes directly related to their primary key.
- Removed all possible transitive dependencies.

✅ **Result:** Database is fully normalized to **3NF**.

---

## Summary Table

| Normal Form | Description | Status |
|--------------|--------------|---------|
| 1NF | Atomic values, no repeating groups | ✅ Achieved |
| 2NF | Full functional dependency | ✅ Achieved |
| 3NF | No transitive dependency | ✅ Achieved |

---

## Example Before & After Normalization

### ❌ Before Normalization
---

Problems:
- Redundancy (owner info repeated across multiple properties).
- Update anomalies (if owner changes email).

### ✅ After Normalization
---
Fix:
- Owner data stored in `User` table.
- `owner_id` is a foreign key → eliminates redundancy.

---

## ✅ Final Result
The final database schema follows **Third Normal Form (3NF)**, ensuring:
- No redundant data.
- Easy updates and maintenance.
- Strong data integrity through foreign keys and relationships.

