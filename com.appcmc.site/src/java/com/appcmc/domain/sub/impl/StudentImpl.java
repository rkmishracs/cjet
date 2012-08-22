package com.appcmc.domain.sub.impl;

import java.util.Date;
import java.util.UUID;

import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Student;

public class StudentImpl implements Student {
	private Long id;
	private String guid;
	private String enrollmentNumber;
	private String firstName;
	private String lastName;
	private String gender;
	private String fatherName;
	private String motherName;
	private Date dateOfBirth;
	private String category;
	private String occupation;
	private Double income;
	private String nationality;
	private String email;
	private String maritalStatus;
        private byte[] profilePic;
	private Date createdOn;
	private Long createdBy;
	private Date modifiedOn;
	private Long modifiedBy;
	private Short active;
	private Contacts contacts;

	public StudentImpl() {
		setGuid(UUID.randomUUID().toString());
	}

	@Override
	public void setEnrollmentNumber(String enrollmentNumber) {
		// TODO Auto-generated method stub
		this.enrollmentNumber = enrollmentNumber;
	}

	@Override
	public String getEnrollmentNumber() {
		// TODO Auto-generated method stub
		return enrollmentNumber;
	}

	

	@Override
	public void setFirstName(String firstName) {
		// TODO Auto-generated method stub
		this.firstName = firstName;
	}

	@Override
	public String getFirstName() {
		// TODO Auto-generated method stub
		return firstName;
	}

	@Override
	public void setLastName(String lastName) {
		// TODO Auto-generated method stub
		this.lastName = lastName;
	}

	@Override
	public String getLastName() {
		// TODO Auto-generated method stub
		return lastName;
	}

	@Override
	public void setGender(String gender) {
		// TODO Auto-generated method stub
		this.gender = gender;
	}

	@Override
	public String getGender() {
		// TODO Auto-generated method stub
		return gender;
	}

	@Override
	public void setFatherName(String fatherName) {
		// TODO Auto-generated method stub
		this.fatherName = fatherName;
	}

	@Override
	public String getFatherName() {
		// TODO Auto-generated method stub
		return fatherName;
	}

	@Override
	public void setMotherName(String motherName) {
		// TODO Auto-generated method stub
		this.motherName = motherName;
	}

	@Override
	public String getMotherName() {
		// TODO Auto-generated method stub
		return motherName;
	}

	@Override
	public void setDateOfBirth(Date dateOfBirth) {
		// TODO Auto-generated method stub
		this.dateOfBirth = dateOfBirth;
	}

	@Override
	public Date getDateOfBirth() {
		// TODO Auto-generated method stub
		return dateOfBirth;
	}

	@Override
	public void setCategory(String category) {
		// TODO Auto-generated method stub
		this.category = category;
	}

	@Override
	public String getCategory() {
		// TODO Auto-generated method stub
		return category;
	}

	@Override
	public void setOccupation(String occupation) {
		// TODO Auto-generated method stub
		this.occupation = occupation;
	}

	@Override
	public String getOccupation() {
		// TODO Auto-generated method stub
		return occupation;
	}

	@Override
	public void setIncome(Double income) {
		// TODO Auto-generated method stub
		this.income = income;
	}

	@Override
	public Double getIncome() {
		// TODO Auto-generated method stub
		return income;
	}

	@Override
	public void setNationality(String nationality) {
		// TODO Auto-generated method stub
		this.nationality = nationality;
	}

	@Override
	public String getNationality() {
		// TODO Auto-generated method stub
		return nationality;
	}

	
	@Override
	public void setMaritalStatus(String maritalStatus) {
		// TODO Auto-generated method stub
		this.maritalStatus = maritalStatus;
	}

	@Override
	public String getMaritalStatus() {
		// TODO Auto-generated method stub
		return maritalStatus;
	}

	@Override
	public void setEmail(String email) {
		// TODO Auto-generated method stub
		this.email = email;
	}

	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return email;
	}

	@Override
	public void setId(Long id) {
		// TODO Auto-generated method stub
		this.id = id;

	}

	@Override
	public Long getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setGuid(String guid) {
		// TODO Auto-generated method stub
		this.guid = guid;

	}

	@Override
	public String getGuid() {
		// TODO Auto-generated method stub
		return guid;
	}

	@Override
	public void setCreatedOn(Date createdOn) {
		// TODO Auto-generated method stub
		this.createdOn = createdOn;
	}

	@Override
	public Date getCreatedOn() {
		// TODO Auto-generated method stub
		return createdOn;
	}

	@Override
	public void setCreatedBy(Long createdBy) {
		// TODO Auto-generated method stub
		this.createdBy = createdBy;
	}

	@Override
	public Long getCreatedBy() {
		// TODO Auto-generated method stub
		return createdBy;
	}

	@Override
	public void setModifiedOn(Date modifiedOn) {
		// TODO Auto-generated method stub
		this.modifiedOn = modifiedOn;
	}

	@Override
	public Date getModifiedOn() {
		// TODO Auto-generated method stub
		return modifiedOn;
	}

	@Override
	public void setModifiedBy(Long modifiedBy) {
		// TODO Auto-generated method stub
		this.modifiedBy = modifiedBy;
	}

	@Override
	public Long getModifiedBy() {
		// TODO Auto-generated method stub
		return modifiedBy;
	}

	@Override
	public void setActive(Short active) {
		// TODO Auto-generated method stub
		this.active = active;
	}

	@Override
	public Short getActive() {
		// TODO Auto-generated method stub
		return active;
	}
        
        public void setProfilePic(byte[] profilePic){
            this.profilePic = profilePic;
        }
        
        public byte[] getProfilePic(){
            return profilePic;
        }

	public Contacts getContacts() {
		return contacts;
	}

	public void setContacts(Contacts contacts) {
		this.contacts = contacts;
	}
        


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StudentImpl [id=");
		builder.append(id);
		builder.append(", guid=");
		builder.append(guid);
		builder.append(", enrollmentNumber=");
		builder.append(enrollmentNumber);		
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", fatherName=");
		builder.append(fatherName);
		builder.append(", motherName=");
		builder.append(motherName);
		builder.append(", dateOfBirth=");
		builder.append(dateOfBirth);
		builder.append(", category=");
		builder.append(category);
		builder.append(", occupation=");
		builder.append(occupation);
		builder.append(", income=");
		builder.append(income);
		builder.append(", nationality=");
		builder.append(nationality);
		builder.append(", email=");
		builder.append(email);
		builder.append(", maritalStatus=");
		builder.append(maritalStatus);
                builder.append(", profilePic=");
                builder.append(profilePic);
		builder.append(", createdOn=");
		builder.append(createdOn);
		builder.append(", createdBy=");
		builder.append(createdBy);
		builder.append(", modifiedOn=");
		builder.append(modifiedOn);
		builder.append(", modifiedBy=");
		builder.append(modifiedBy);
		builder.append(", active=");
		builder.append(active);
		builder.append(", contacts=");
		builder.append(contacts);
		builder.append("]");
		return builder.toString();
	}

   
	

}
