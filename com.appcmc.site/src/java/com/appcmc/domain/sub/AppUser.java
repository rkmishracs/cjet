package com.appcmc.domain.sub;

import com.appcmc.domain.Domain;

public interface AppUser extends Domain {

	void setEnrollmentNumber(String enrollmentNumber);
	
	String getEnrollmentNumber();
	
	void setEmail(String email);

	String getEmail();

	void setPassword(String password);

	String getPassword();

	void setScreenName(String screenName);

	String getScreenName();

	void setFirstName(String firstName);

	String getFirstName();

	void setLastName(String lastName);

	String getLastName();

	void setStatusId(Long statusId);

	Long getStatusId();

	void setGender(String gender);

	String getGender();

	void setTimeZone(String timeZone);

	String getTimeZone();

	void setType(String type);

	String getType();
        
    void setSecurityQuestion(String securityQuestion);
        
    String getSecurityQuestion();
        
    void setSecurityAnswer(String securityAnswer);
        
    String getSecurityAnswer();

}
