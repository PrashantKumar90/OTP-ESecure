package com.pentagon.eSecure.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;


@Entity
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
           
        @NotBlank(message = "Name is required")
	    private String companyName;    
        
        public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		@NotBlank(message = "Email is required")
		@Column
		(unique = true, nullable = false)
        @Email(message= "Please Enter Valid Email")
	    private String email;
        
        @NotBlank(message = "Phone is required")
	    private String phone;  
        
        @NotBlank(message = "Contact is required")
	    private String contactPerson;  
        
        @NotBlank(message = "Website is required")
	    private String website;   
        
        @NotBlank(message = "Password is required")
	    private String password;
	    
	    
        // One company can have many API keys
        @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
        private List<APICredential> apiCredentials;
        
        
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getContactPerson() {
			return contactPerson;
		}
		public void setContactPerson(String contactPerson) {
			this.contactPerson = contactPerson;
		}
		public String getWebsite() {
			return website;
		}
		public void setWebsite(String website) {
			this.website = website;
		}
		public String getPassword() {
			return password;
		}
	
		public void setPassword(String password) {
			this.password = password;
		}
		@Override
		public String toString() {
			return "Company [companyName=" + companyName + ", email=" + email + ", phone=" + phone + ", contactPerson="
					+ contactPerson + ", website=" + website + ", password=" + password + "]";
		}  	    
	   
}
