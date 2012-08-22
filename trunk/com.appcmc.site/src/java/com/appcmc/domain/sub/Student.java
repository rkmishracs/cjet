package com.appcmc.domain.sub;

import java.util.Date;

import com.appcmc.domain.Domain;

public interface Student extends Domain {

	void setEnrollmentNumber(String enrollmentNumber);

	String getEnrollmentNumber();

	void setFirstName(String firstName);

	String getFirstName();

	void setLastName(String lastName);

	String getLastName();

	void setGender(String gender);

	String getGender();

	void setFatherName(String fatherName);

	String getFatherName();

	void setMotherName(String motherName);

	String getMotherName();

	void setDateOfBirth(Date dateOfBirth);

	Date getDateOfBirth();

	void setCategory(String category);

	String getCategory();

	void setOccupation(String occupation);

	String getOccupation();

	void setIncome(Double income);

	Double getIncome();

	void setNationality(String nationality);

	String getNationality();

	void setMaritalStatus(String maritalStatus);

	String getMaritalStatus();
        
        void setProfilePic(byte[] profilePic);
        byte[] getProfilePic();

	void setEmail(String email);

	String getEmail();

	void setContacts(Contacts contacts);

	Contacts getContacts();
}
