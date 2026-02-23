package com.pentagon.eSecure.controller;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pentagon.eSecure.dto.OtpRequest;
import com.pentagon.eSecure.model.Otp;
import com.pentagon.eSecure.repository.OtpRepository;
import com.pentagon.eSecure.service.OtpService;

@RestController
@RequestMapping("/api")
public class UserOTPController {
	
	@Autowired
	OtpService otpService;
	@Autowired
	OtpRepository otpRepository;
	
	 @PostMapping("/sendOtp")
	 public ResponseEntity<Map<String, Object>> sendOtp(@RequestBody OtpRequest request) {

		    Long otpId = otpService.generateAndSendOtp(request);

		    Map<String, Object> resp = new HashMap<>();
		    resp.put("otpId", otpId);
		    resp.put("message", "OTP sent successfully");

		    return ResponseEntity.ok(resp);
		}
	 
	 
	 @PostMapping("/verifyOtp")
	 public ResponseEntity<?> verifyOtp(@RequestBody Map<String, Object> request) {

	     Long otpId = Long.valueOf(request.get("otpId").toString());
	     String enteredOtp = request.get("otp").toString();

	     Map<String, Object> response = new HashMap<>();

	     // 1️⃣ OTP record fetch
	     Otp otpRecord = otpRepository.findById(otpId).orElse(null);

	     if (otpRecord == null) {
	         response.put("status", "FAILED");
	         response.put("message", "Invalid OTP ID");
	         return ResponseEntity.ok(response);
	     }

	     // 2️⃣ Check: Expiry time must be > current time
	     LocalDateTime now = LocalDateTime.now();
	     if (otpRecord.getExpiryTime().isBefore(now)) {
	         response.put("status", "FAILED");
	         response.put("message", "OTP Expired");
	         return ResponseEntity.ok(response);
	     }

	     // 3️⃣ OTP Compare
	     if (!otpRecord.getOtp().equals(enteredOtp)) {
	         response.put("status", "FAILED");
	         response.put("message", "Incorrect OTP");
	         return ResponseEntity.ok(response);
	     }

	     // 4️⃣ SUCCESS
	     response.put("status", "SUCCESS");
	     response.put("message", "OTP Verified Successfully");

	     // Optional: Mark as used
	     return ResponseEntity.ok(response);
	 }


}
