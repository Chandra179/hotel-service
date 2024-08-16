package com.hospitality.hotel_service.model;

import java.time.ZonedDateTime;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
class BookingModel extends AuditModel{
    private UUID bookingId;
    private UUID orderId;
    private int roomId;
    private ZonedDateTime checkInDate;
    private ZonedDateTime checkOutDate;
    private BookingStatus bookingStatus;

    private enum BookingStatus {
        PENDING, CONFIRMED, CANCELLED, CHECKED_IN, CHECKED_OUT
    }
}