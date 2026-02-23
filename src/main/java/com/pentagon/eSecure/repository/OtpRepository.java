package com.pentagon.eSecure.repository;

import org.springframework.stereotype.Repository;

import com.pentagon.eSecure.model.Otp;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface OtpRepository extends JpaRepository<Otp, Long> {

    Optional<Otp> findById(Long id);
}
