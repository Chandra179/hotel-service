package com.hospitality.hotel_service.controller;

import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.hospitality.hotel_service.dto.UserAccountDTO;
import com.hospitality.hotel_service.exception.NotFoundException;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "User Account", description = "User Account API")
public interface UserAccountApi {

    
    @Operation(
        summary = "Get User by ID",
        description = "Retrieve a user account by its unique ID.",
        responses = {
            @ApiResponse(
                responseCode = "200",
                description = "User found",
                content = @Content(schema = @Schema(implementation = UserAccountDTO.class))
            ),
            @ApiResponse(
                responseCode = "404",
                description = "User not found",
                content = @Content(schema = @Schema(implementation = String.class))
            )
        }
    )
    @GetMapping("/{id}")
    ResponseEntity<UserAccountDTO> getUserById(@PathVariable UUID id);
}
