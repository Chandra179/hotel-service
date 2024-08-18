package com.hospitality.hotel_service.service;

import java.util.UUID;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.hospitality.hotel_service.dto.UserAccountDTO;
import com.hospitality.hotel_service.exception.NotFoundException;
import com.hospitality.hotel_service.repository.UserAccountRepository;

@Service
public class UserAccountServiceImpl implements UserAccountService{

    private final UserAccountRepository userAccountRepository;

    public UserAccountServiceImpl(UserAccountRepository userAccountRepository) {
        this.userAccountRepository = userAccountRepository;
    }

    @Override
    public UserAccountDTO getUserAccount(UUID userAcountID) {
        try {
            return userAccountRepository.getUserById(userAcountID);
        } catch (EmptyResultDataAccessException e) {
            throw new NotFoundException("user not found");
        } catch (Exception e) {
            throw new RuntimeException("An internal error occurred while processing your request", e);
        }
    }
    
}
