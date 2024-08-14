-- Enum for Room Availability Status
CREATE TYPE room_availability_status AS ENUM ('AVAILABLE', 'RESERVED', 'BOOKED', 'BLOCKED');

-- Enum for Pricing Type
CREATE TYPE pricing_type AS ENUM ('STANDARD', 'DISCOUNTED', 'PREMIUM');

-- Enum for Booking Status
CREATE TYPE booking_status AS ENUM ('CONFIRMED', 'CANCELLED', 'CHECKED_IN', 'CHECKED_OUT');

-- Enum for Payment Status
CREATE TYPE payment_status AS ENUM ('PENDING', 'COMPLETED', 'FAILED');
