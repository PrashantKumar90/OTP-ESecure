package com.pentagon.eSecure.model;

import jakarta.persistence.*;

@Entity
public class APICredential {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, unique = true)
	private String apiKey;

	@Column(nullable = false)
	private String email;

	@Column(nullable = false)
	private String appPasscode;

	@Column(nullable = false)
	private Integer status = 1;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "company_id", nullable = false)
	private Company company;

	public APICredential() {
	}

	// getters and setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getApiKey() {
		return apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAppPasscode() {
		return appPasscode;
	}

	public void setAppPasscode(String appPasscode) {
		this.appPasscode = appPasscode;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
}