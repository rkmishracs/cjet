package com.appcmc.domain.sub;

import com.appcmc.domain.Domain;

public interface Contacts extends Domain {

	
	void setEnrollmentNumber(String enrollmentNumber);
	
	String getEnrollmentNumber();
	
	void setCity(String city);

	String getCity();

	void setState(String state);

	String getState();

	void setCountry(String country);

	String getCountry();

	void setEmail(String email);

	String getEmail();

	void setAlternativeEmail(String alternativeEmail);

	String getAlternativeEmail();

	void setMobile(String mobile);

	String getMobile();
        
        void setLandPhone(String landPhone);
        
        String getLandPhone();
	
	void setAddress(String address);
	
	String getAddress();
        
        void setPinCode(String pinCode);
        
        String getPinCode();

}
