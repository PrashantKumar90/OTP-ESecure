package com.pentagon.eSecure.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pentagon.eSecure.functions.Functions;
import com.pentagon.eSecure.model.Company;
import com.pentagon.eSecure.repository.CompanyRepository;

@Service
public class LoginService {
	
		@Autowired
	    private CompanyRepository companyRepository;
		
		@Autowired
		Functions functions;
	    public Company login(String email, String password) {

	        // if company exists
	        Company company = companyRepository.findByEmail(email).orElse(null);

	        if (company == null) {
	            return null;
	        }
	        //password
	        String hashedPassword = functions.encryptPasscode(password);
	        
	        //Compare hashed password with DB password
	        if (hashedPassword.equals(company.getPassword())) {
	            return company;
	        } else {
	            return null;
	        }
	    }
	    
	    public Company getCompanyByEmail(String email) { 
	    	return companyRepository.findByEmail(email).orElse(null); 
	    }

}
