package com.hospitality.hotel_service.service;

import java.util.UUID;

import com.hospitality.hotel_service.dto.UserAccountDTO;

public interface UserAccountService {
    UserAccountDTO getUserAccount(UUID userAccountID);
}
