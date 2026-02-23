package com.pentagon.eSecure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pentagon.eSecure.model.APICredential;
import com.pentagon.eSecure.model.Company;
import com.pentagon.eSecure.repository.APIRepository;
import com.pentagon.eSecure.repository.CompanyRepository;
import com.pentagon.eSecure.functions.Functions;

@Service
public class DashboardService {

    @Autowired
    private APIRepository apiRepo;

    @Autowired
    private CompanyRepository companyRepo;

    @Autowired
    private Functions functions;

    public APICredential generateKey(String email, String passcode, Long companyId) {

        // Find company
    	Company company = companyRepo.findById(companyId)
    	        .orElseThrow(() -> new RuntimeException("Company not found"));


        // Generate API Key
        String generatedKey = functions.generateAPKeys();

        // Encrypt passcode

        // Create credential object
        APICredential cred = new APICredential();
        cred.setApiKey(generatedKey);
        cred.setAppPasscode(functions.encrypt(passcode));
        
        System.out.println( "Encrypted passcode " + functions.encrypt(passcode));
        
        cred.setEmail(email);
        cred.setStatus(1);
        cred.setCompany(company);

        // Save in DB
        return apiRepo.save(cred);
    }
    
//  revert a mail to company when api key is genereted  
    public void reveretEmailForKeys(Long id) {
    	Company company = companyRepo.findById(id)
    	        .orElseThrow(() -> new RuntimeException("Company not found")); 	
    	functions.apiKeygenerationEmail(company.getEmail(), company.getCompanyName());
    }
    
    
    //find API detail for API keys
    public List<APICredential> getApiKeysByCompany(Long companyId) {
        return apiRepo.findByCompanyIdAndStatusNot(companyId, 0);
    }
    
    //deactivate API keys 
    
    @Transactional
    public void deactivateKey(Long id) {
    	apiRepo.deactivateApiKey(id);   // repository wali query call hogi
    }
    
      
}
