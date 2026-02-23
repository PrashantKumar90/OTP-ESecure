package com.pentagon.eSecure.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.pentagon.eSecure.model.Company;

public interface CompanyRepository extends JpaRepository<Company, Long>{

	 Optional<Company> findByEmail(String email);
	
}
