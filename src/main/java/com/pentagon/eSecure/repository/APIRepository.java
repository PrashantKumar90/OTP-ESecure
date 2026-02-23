package com.pentagon.eSecure.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.pentagon.eSecure.model.APICredential;

public interface APIRepository extends JpaRepository<APICredential, Long> {

    List<APICredential> findByCompanyIdAndStatusNot(Long companyId, Integer status);

    @Modifying
    @Transactional
    @Query("UPDATE APICredential a SET a.status = 0 WHERE a.id = :id")
    void deactivateApiKey(@Param("id") Long id);

    APICredential findByApiKeyAndStatus(String apiKey, Integer status);

}
