-- =====================================================
-- Airbnb Database Sample Data - seed.sql
-- Author: Mostafa Khamis
-- Project: ALX Airbnb Database - Task 3
-- =====================================================

-- ===============================
-- INSERT USERS
-- ===============================
INSERT INTO User (first_name, last_name, email, phone_number, password_hash)
VALUES
('Ahmed', 'Hassan', 'ahmed.hassan@example.com', '+201000000001', 'hashed_pw_ahmed'),
('Sara', 'Youssef', 'sara.youssef@example.com', '+201000000002', 'hashed_pw_sara'),
('John', 'Doe', 'john.doe@example.com', '+12025550123', 'hashed_pw_john'),
('Mona', 'Ali', 'mona.ali@example.com', '+201000000004', 'hashed_pw_mona'),
('David', 'Smith', 'david.smith@example.com', '+12025550124', 'hashed_pw_david');

-- ===============================
-- INSERT PROPERTIES
-- ===============================
INSERT INTO Property (owner_id, title, description, city, country, address, price_per_night, max_guests)
VALUES
(1, 'Cozy Apartment in Cairo', 'A beautiful 2-bedroom apartment in the heart of Cairo.', 'Cairo', 'Egypt', '123 Nile St', 80.00, 4),
(2, 'Seaside Villa', 'Luxury villa overlooking the Mediterranean.', 'Alexandria', 'Egypt', '45 Sea Road', 250.00, 6),
(3, 'Downtown Studio', 'Compact and modern studio apartment in NYC.', 'New York', 'USA', '77 Broadway Ave', 150.00, 2),
(4, 'Paris Apartment', 'Charming apartment near the Eiffel Tower.', 'Paris', 'France', '22 Rue de Rivoli', 200.00, 3),
(5, 'London Flat', 'Modern flat close to Hyde Park.', 'London', 'UK', '12 Kensington Rd', 180.00, 3);

-- ===============================
-- INSERT PROPERTY IMAGES
-- ===============================
INSERT INTO PropertyImage (property_id, image_url)
VALUES
(1, 'https://example.com/images/cairo1.jpg'),
(1, 'https://example.com/images/cairo2.jpg'),
(2, 'https://example.com/images/villa1.jpg'),
(3, 'https://example.com/images/nyc1.jpg'),
(4, 'https://example.com/images/paris1.jpg'),
(5, 'https://example.com/images/london1.jpg');

-- ===============================
-- INSERT BOOKINGS
-- ===============================
INSERT INTO Booking (user_id, property_id, start_date, end_date, total_price, status)
VALUES
(2, 1, '2025-12-01', '2025-12-05', 320.00, 'confirmed'),
(3, 2, '2025-11-20', '2025-11-25', 1250.00, 'confirmed'),
(1, 3, '2025-11-10', '2025-11-12', 300.00, 'pending'),
(4, 4, '2025-12-15', '2025-12-20', 1000.00, 'confirmed'),
(5, 5, '2025-12-25', '2025-12-28', 540.00, 'cancelled');

-- ===============================
-- INSERT PAYMENTS
-- ===============================
INSERT INTO Payment (booking_id, payment_method, payment_status, amount)
VALUES
(1, 'Credit Card', 'completed', 320.00),
(2, 'PayPal', 'completed', 1250.00),
(3, 'Credit Card', 'pending', 300.00),
(4, 'Debit Card', 'completed', 1000.00),
(5, 'Credit Card', 'refunded', 540.00);

-- ===============================
-- INSERT REVIEWS
-- ===============================
INSERT INTO Review (user_id, property_id, rating, comment)
VALUES
(2, 1, 5, 'The apartment was super clean and cozy! Highly recommend.'),
(3, 2, 4, 'Beautiful villa with a great view, but a bit pricey.'),
(1, 3, 5, 'Perfect location for a short NYC trip.'),
(4, 4, 4, 'Very nice apartment, walking distance to the Eiffel Tower.'),
(5, 5, 3, 'Good flat but the WiFi was slow.');

-- =====================================================
-- END OF SEED SCRIPT
-- =====================================================
