CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    oauth_provider VARCHAR(50), -- For OAuth provider name (e.g., Google, Facebook)
    oauth_uid VARCHAR(255), -- Unique ID provided by OAuth provider
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL -- Soft delete column with timezone
);

CREATE TABLE rooms (
    room_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_number VARCHAR(50) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    description TEXT,
    availability_status room_availability_status DEFAULT 'AVAILABLE',
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL -- Soft delete column with timezone
);

CREATE TABLE room_pricings (
    pricing_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_id INT,
    price_per_night DECIMAL(10, 2) NOT NULL,
    available_date TIMESTAMPTZ NOT NULL,
    pricing_type pricing_type, -- Reference to enum type
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL, -- Soft delete column with timezone
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE orders (
    order_id UUID PRIMARY KEY, -- Unique identifier for the order
    user_id UUID,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL, -- Soft delete column with timezone
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    order_id UUID,
    room_id INT,
    check_in_date TIMESTAMPTZ NOT NULL,
    check_out_date TIMESTAMPTZ NOT NULL,
    booking_status booking_status,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL, -- Soft delete column with timezone
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
    payment_id UUID PRIMARY KEY, -- Unique identifier for the payment
    order_id UUID NOT NULL, -- Reference to the order associated with this payment
    payment_reference_id VARCHAR(255) UNIQUE, -- Reference ID from the payment gateway
    payment_status payment_status, -- Status of the payment (Pending, Completed, etc.)
    payment_date TIMESTAMPTZ, -- Date and time of the payment transaction
    payment_method payment_method, -- Payment method used
    payment_gateway VARCHAR(100), -- Payment gateway provider
    amount_paid DECIMAL(10, 2) NOT NULL, -- Amount paid in this transaction
    currency CHAR(3) DEFAULT 'USD', -- ISO 4217 currency code
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL, -- Soft delete column with timezone
    FOREIGN KEY (order_id) REFERENCES orders(order_id) -- Foreign key to Orders table
);
