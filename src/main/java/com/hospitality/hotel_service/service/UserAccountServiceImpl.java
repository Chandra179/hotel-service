package com.hospitality.hotel_service.service;

import java.util.UUID;

import org.springframework.stereotype.Service;

import com.hospitality.hotel_service.dto.UserAccountDTO;
import com.hospitality.hotel_service.repository.UserAccountRepository;

@Service
public class UserAccountServiceImpl implements UserAccountService{

    private final UserAccountRepository userAccountRepository;

    public UserAccountServiceImpl(UserAccountRepository userAccountRepository) {
        this.userAccountRepository = userAccountRepository;
    }

    @Override
    public UserAccountDTO getUserAccount(UUID userAcountID) {
        return userAccountRepository.getUserById(userAcountID);
    }
    
}
