# Airbnb Database Schema

## Overview
This directory contains the SQL Data Definition Language (DDL) script that defines the relational database schema for the Airbnb-like application.  
It follows proper normalization up to **Third Normal Form (3NF)** and includes all necessary relationships and constraints.

---

## Files
- **schema.sql** → Contains all `CREATE TABLE` statements for database setup.
- **README.md** → Provides context and instructions for usage.

---

## Entities
1. **User** – Stores user account information.
2. **Property** – Represents listed properties for rent.
3. **PropertyImage** – Holds multiple images per property.
4. **Booking** – Tracks reservations made by users.
5. **Payment** – Handles payments for bookings.
6. **Review** – Contains user reviews and ratings for properties.

---

## Relationships
- One **User** can own many **Properties**.
- One **User** can make many **Bookings**.
- One **Property** can have many **Bookings** and **Reviews**.
- One **Booking** has one **Payment**.
- One **Property** can have many **PropertyImages**.

---

## Setup Instructions
To create the database schema:
```bash
psql -U <username> -d <database_name> -f schema.sql
---

---

هل ترغب أضيف لك كمان سكريبت جاهز لـ **seeding data (DML)**؟  
يعني ملف SQL تقدر تستخدمه في المهمة القادمة “Populate the Database with Sample Data” عشان تعبّي القاعدة ببيانات تجريبية (Users, Properties, Bookings, إلخ)؟
