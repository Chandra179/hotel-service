-- Indexes for user_account table
CREATE INDEX idx_user_account_email ON user_account(email);

-- Indexes for room table
CREATE INDEX idx_room_room_number ON room(room_number);
CREATE INDEX idx_room_room_type ON room(room_type);
CREATE INDEX idx_room_availability_status ON room(availability_status);

-- Indexes for room_pricing table
CREATE INDEX idx_room_pricing_room_id ON room_pricing(room_id);
CREATE INDEX idx_room_pricing_available_date ON room_pricing(available_date);

-- Indexes for user_order table
CREATE INDEX idx_user_order_user_id ON user_order(user_id);

-- Indexes for room_booking table
CREATE INDEX idx_room_booking_order_id ON room_booking(order_id);
CREATE INDEX idx_room_booking_room_id ON room_booking(room_id);
CREATE INDEX idx_room_booking_check_in_date ON room_booking(check_in_date);
CREATE INDEX idx_room_booking_check_out_date ON room_booking(check_out_date);
CREATE INDEX idx_room_booking_booking_status ON room_booking(booking_status);

-- Indexes for payment table
CREATE INDEX idx_payment_order_id ON payment(order_id);
CREATE INDEX idx_payment_payment_status ON payment(payment_status);
