package com.pentagon.eSecure.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pentagon.eSecure.dto.OtpRequest;
import com.pentagon.eSecure.functions.Functions;
import com.pentagon.eSecure.model.APICredential;
import com.pentagon.eSecure.model.Otp;
import com.pentagon.eSecure.repository.APIRepository;
import com.pentagon.eSecure.repository.OtpRepository;

import com.pentagon.eSecure.service.OtpService;

@Service
public class OtpService {
	
	@Autowired
	private Functions functions;
	
    @Autowired
    private OtpRepository otpRepository;
    


    @Autowired
    private EmailService emailService;
    
    @Autowired
    APIRepository apiRepository;
    
    public Long generateAndSendOtp(OtpRequest request) {
    	
    	APICredential credential = apiRepository.findByApiKeyAndStatus(request.getApiKey(), 1);
    	
    	String genOtp = functions.Otpgenrator();
    	String appPasscode = functions.decrypt(credential.getAppPasscode()); 
    	System.out.println(appPasscode);
    	String fromEmail = credential.getEmail();
    	String toEmail = request.getUserEmail();
    	emailService.sendOtp(toEmail, genOtp, fromEmail, appPasscode);
    	
    		Otp  otp = new Otp();
    	    otp.setOtp(genOtp);
    	    otp.setApiKey(request.getApiKey());
    	    otp.setUserEmail(request.getUserEmail());
    	    otp.setCreatedAt(LocalDateTime.now());
    	    otp.setExpiryTime(LocalDateTime.now().plusMinutes(5));

    	    Otp savedOtp = otpRepository.save(otp);
    	    return savedOtp.getId();
    }
}