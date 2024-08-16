package com.hospitality.hotel_service.model;

import java.math.BigDecimal;
import java.time.ZonedDateTime;
import java.util.UUID;

public class PaymentsModel {
    private UUID paymentId;
    private UUID orderId;
    private String paymentReferenceId;
    private PaymentStatus paymentStatus;
    private ZonedDateTime paymentDate;
    private PaymentMethod paymentMethod;
    private String paymentGateway;
    private BigDecimal amountPaid;
    private String currency;

    private enum PaymentStatus {
        PENDING, COMPLETED, FAILED, REFUNDED
    }
    
    private enum PaymentMethod {
        CREDIT_CARD, DEBIT_CARD, PAYPAL, BANK_TRANSFER
    }
}
