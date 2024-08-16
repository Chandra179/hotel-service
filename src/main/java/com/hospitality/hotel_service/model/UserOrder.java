package com.hospitality.hotel_service.model;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class UserOrder extends AuditModel{
    private UUID orderId;
    private UUID userId;
}
