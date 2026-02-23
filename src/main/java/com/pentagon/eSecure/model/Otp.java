package com.pentagon.eSecure.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Otp {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String otp;
    private String apiKey;
    private String userEmail;
    // used / unused / expired
    @Enumerated(EnumType.STRING)
    private OtpStatus status;
    private LocalDateTime expiryTime;
    private LocalDateTime createdAt;
    
    
    public Otp() {
        this.createdAt = LocalDateTime.now();
        this.status = OtpStatus.UNUSED;
    }


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getOtp() {
		return otp;
	}


	public void setOtp(String otp) {
		this.otp = otp;
	}


	public String getApiKey() {
		return apiKey;
	}


	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public OtpStatus getStatus() {
		return status;
	}


	public void setStatus(OtpStatus status) {
		this.status = status;
	}


	public LocalDateTime getExpiryTime() {
		return expiryTime;
	}


	public void setExpiryTime(LocalDateTime expiryTime) {
		this.expiryTime = expiryTime;
	}


	public LocalDateTime getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
}
