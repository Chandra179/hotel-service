package com.hospitality.hotel_service.model;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class RoomsModel extends AuditModel {
    private int roomId;
    private String roomNumber;
    private String roomType;
    private String description;
    private RoomAvailabilityStatus availabilityStatus;

    public enum RoomAvailabilityStatus {
        AVAILABLE, OCCUPIED, RESERVED, MAINTENANCE
    }
}
