-- Indexes for users table
CREATE INDEX idx_users_email ON users(email);

-- Indexes for rooms table
CREATE INDEX idx_rooms_room_number ON rooms(room_number);
CREATE INDEX idx_rooms_room_type ON rooms(room_type);
CREATE INDEX idx_rooms_availability_status ON rooms(availability_status);

-- Indexes for room_pricing table
CREATE INDEX idx_room_pricing_room_id ON room_pricings(room_id);
CREATE INDEX idx_room_pricing_start_date ON room_pricings(available_date);

-- Indexes for bookings table
CREATE INDEX idx_bookings_order_id ON orders(order_id);
CREATE INDEX idx_bookings_booking_status ON bookings(booking_status);

-- Indexes for orders table
CREATE INDEX idx_orders_user_id ON orders(user_id);

-- Index for payments table
CREATE INDEX idx_payments_order_id ON payments(order_id);
CREATE INDEX idx_payments_status ON payments(payment_status);