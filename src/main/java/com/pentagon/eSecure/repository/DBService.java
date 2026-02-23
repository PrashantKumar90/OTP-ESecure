package com.pentagon.eSecure.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pentagon.eSecure.functions.Functions;
import com.pentagon.eSecure.model.Company;



@Service
public class DBService {
	
    @Autowired
    private CompanyRepository companyRepository;
    
    @Autowired
    Functions functions;
    
    public void registration(Company company) {
    	company.setPassword(functions.encryptPasscode(company.getPassword()));
        companyRepository.save(company);
    }
	
}
