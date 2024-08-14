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

CREATE TABLE room_pricing (
    pricing_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_id INT,
    price_per_night DECIMAL(10, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE, -- NULL if the price is currently valid with no specific end date
    pricing_type pricing_type, -- Reference to enum type
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL, -- Soft delete column with timezone
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    user_id UUID,
    room_id INT,
    check_in_date TIMESTAMPTZ NOT NULL,
    check_out_date TIMESTAMPTZ NOT NULL,
    booking_status booking_status,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL, -- Soft delete column with timezone
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE orders (
    order_id UUID PRIMARY KEY, -- Unique identifier for the order
    booking_id UUID NOT NULL, -- Reference to the booking associated with this order
    total_amount DECIMAL(10, 2) NOT NULL, -- Total amount for the order
    currency CHAR(3) DEFAULT 'USD', -- ISO 4217 currency code
    payment_status payment_status,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL, -- Soft delete column with timezone
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) -- Foreign key to Bookings table
);
