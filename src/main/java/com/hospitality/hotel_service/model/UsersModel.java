package com.hospitality.hotel_service.model;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class UsersModel extends AuditModel {
    private UUID userId;
    private String email;
    private String fullName;
    private String oauthProvider;
    private String oauthUid;
}
