package com.hospitality.hotel_service.controller;

import java.util.UUID;

import org.springframework.http.ResponseEntity;

import com.hospitality.hotel_service.dto.UserAccountDTO;
import com.hospitality.hotel_service.service.UserAccountService;
import com.hospitality.hotel_service.service.UserAccountServiceImpl;

public class UserAccountAPIController implements UserAccountAPI{

    private final UserAccountService userAccountService;

    public UserAccountAPIController(UserAccountServiceImpl userAccountService) {
        this.userAccountService = userAccountService;
    }

    @Override
    public ResponseEntity<UserAccountDTO> getUserById(UUID id) {
        return ResponseEntity.ok(userAccountService.getUserAccount(id));
    }
    
}
