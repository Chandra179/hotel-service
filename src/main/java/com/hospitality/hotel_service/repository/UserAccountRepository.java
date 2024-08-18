package com.hospitality.hotel_service.repository;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hospitality.hotel_service.dto.UserAccountDTO;

@Repository
public class UserAccountRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public UserAccountDTO getUserById(UUID userAccountID) {
        String sql = "SELECT * FROM user_account WHERE user_id = ?";
        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
            UserAccountDTO user = new UserAccountDTO();
            user.setUserEmail(rs.getString("email"));
            return user;
        }, 
        new Object[]{userAccountID});
    }
}
