CREATE TABLE Users (
    user_id UUID PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    oauth_provider VARCHAR(50), -- For OAuth provider name (e.g., Google, Facebook)
    oauth_uid VARCHAR(255), -- Unique ID provided by OAuth provider
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL DEFAULT NULL, -- Soft delete column with timezone
);

CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(50) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    description TEXT,
    availability_status ENUM('AVAILABLE', 'RESERVED', 'BOOKED', 'BLOCKED') DEFAULT 'AVAILABLE',
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL DEFAULT NULL -- Soft delete column with timezone
);

CREATE TABLE RoomPricing (
    pricing_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    price_per_night DECIMAL(10, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE, -- NULL if the price is currently valid with no specific end date
    pricing_type ENUM,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL DEFAULT NULL, -- Soft delete column with timezone
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Bookings (
    booking_id UUID PRIMARY KEY,
    user_id UUID,
    room_id INT,
    check_in_date TIMESTAMPTZ NOT NULL,
    check_out_date TIMESTAMPTZ NOT NULL,
    booking_status ENUM('CONFIRMED', 'CANCELLED', 'CHECKED_IN', 'CHECKED_OUT') DEFAULT 'CONFIRMED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMPTZ NULL DEFAULT NULL, -- Soft delete column with timezone
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Orders (
    order_id UUID PRIMARY KEY, -- Unique identifier for the order
    booking_id UUID NOT NULL, -- Reference to the booking associated with this order
    total_amount DECIMAL(10, 2) NOT NULL, -- Total amount for the order
    currency CHAR(3) DEFAULT 'USD', -- ISO 4217 currency code
    payment_status ENUM('PENDING', 'COMPLETED', 'FAILED') DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Creation timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Last update timestamp
    deleted_at TIMESTAMPTZ NULL DEFAULT NULL, -- Soft delete column with timezone
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) -- Foreign key to Bookings table
);
