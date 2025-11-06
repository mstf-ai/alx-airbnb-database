# Airbnb Database - Sample Data

## Overview
This script (`seed.sql`) populates the Airbnb database with realistic sample data to simulate production use cases.  
It includes users, properties, bookings, payments, reviews, and images to test relationships and queries.

---

## Files
- **seed.sql** → Contains all `INSERT` statements for populating the database.
- **README.md** → Provides details on the inserted data and usage instructions.

---

## Data Summary
| Table | Description | Sample Rows |
|--------|--------------|-------------|
| User | Platform users (guests & hosts) | 5 |
| Property | Listed properties for rent | 5 |
| PropertyImage | Images for each property | 6 |
| Booking | Reservations between users and properties | 5 |
| Payment | Payments for bookings | 5 |
| Review | Feedback and ratings from guests | 5 |

---

## How to Use
Run this command in your PostgreSQL environment **after** executing `schema.sql`:
```bash
psql -U <username> -d <database_name> -f seed.sql
---

---

هل تحب أجهز لك كمان ملف **requirements.md** و **normalization.md** من المهام السابقة بحيث يبقوا كلهم متكاملين وجاهزين للرفع على GitHub دفعة واحدة؟
