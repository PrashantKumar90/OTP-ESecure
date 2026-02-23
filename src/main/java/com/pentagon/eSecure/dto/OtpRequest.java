package com.pentagon.eSecure.dto;

public class OtpRequest {
	private String userEmail;

    private String apiKey;


    public OtpRequest(String userEmail, String apiKey, Long companyId) {
        this.userEmail = userEmail;
        this.apiKey = apiKey;
    }


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getApiKey() {
		return apiKey;
	}


	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}
    
    
}
