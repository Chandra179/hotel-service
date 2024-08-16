package com.hospitality.hotel_service.model;

import java.math.BigDecimal;
import java.time.ZonedDateTime;

public class RoomPricingsModel extends AuditModel{
    private int pricingId;
    private int roomId;
    private BigDecimal pricePerNight;
    private ZonedDateTime availableDate;
    private PricingType pricingType;

    private enum PricingType {
        STANDARD, SEASONAL, DISCOUNTED
    }
}
