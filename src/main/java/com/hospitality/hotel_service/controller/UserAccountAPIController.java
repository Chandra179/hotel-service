package com.hospitality.hotel_service.controller;

import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hospitality.hotel_service.dto.UserAccountDTO;
import com.hospitality.hotel_service.service.UserAccountService;
import com.hospitality.hotel_service.service.UserAccountServiceImpl;

@RestController
@RequestMapping("/v1/api/user")
public class UserAccountApiController implements UserAccountApi{

    private final UserAccountService userAccountService;

    public UserAccountApiController(UserAccountServiceImpl userAccountService) {
        this.userAccountService = userAccountService;
    }

    @Override
    public ResponseEntity<UserAccountDTO> getUserById(UUID id) {
        return ResponseEntity.ok(userAccountService.getUserAccount(id));
    }
    
}
