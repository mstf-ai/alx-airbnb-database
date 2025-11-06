-- =====================================================
-- Airbnb Database Schema - schema.sql
-- Author: Mostafa Khamis
-- Project: ALX Airbnb Database - Task 2
-- =====================================================

-- Drop tables if they exist (for re-runs)
DROP TABLE IF EXISTS Payment, Review, Booking, PropertyImage, Property, User CASCADE;

-- =====================================================
-- USERS TABLE
-- =====================================================
CREATE TABLE User (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON User(email);

-- =====================================================
-- PROPERTY TABLE
-- =====================================================
CREATE TABLE Property (
    id SERIAL PRIMARY KEY,
    owner_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    price_per_night DECIMAL(10, 2) NOT NULL,
    max_guests INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES User(id) ON DELETE CASCADE
);

CREATE INDEX idx_property_city ON Property(city);
CREATE INDEX idx_property_owner ON Property(owner_id);

-- =====================================================
-- PROPERTY IMAGES TABLE
-- =====================================================
CREATE TABLE PropertyImage (
    id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(id) ON DELETE CASCADE
);

CREATE INDEX idx_image_property ON PropertyImage(property_id);

-- =====================================================
-- BOOKING TABLE
-- =====================================================
CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES Property(id) ON DELETE CASCADE,
    CONSTRAINT chk_dates CHECK (end_date > start_date)
);

CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);

-- =====================================================
-- PAYMENT TABLE
-- =====================================================
CREATE TABLE Payment (
    id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(50) DEFAULT 'pending',
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Booking(id) ON DELETE CASCADE
);

CREATE INDEX idx_payment_booking ON Payment(booking_id);

-- =====================================================
-- REVIEW TABLE
-- =====================================================
CREATE TABLE Review (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES Property(id) ON DELETE CASCADE
);

CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_user ON Review(user_id);

-- =====================================================
-- END OF SCHEMA
-- =====================================================
