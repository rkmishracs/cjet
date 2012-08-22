/**
 * 
 */
package com.appcmc.web.forms;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * @author Sudarsan
 * 
 */
public class AvtarProfileForm {

	private String enrollmentNumber;
	private String email;
	private String firstName;
	private String lastName;
	private String dateOfBirth;
	private String gender;
	private String nationality;
	private String categorey;
	private String status;
	private String fatherName;
	private String motherName;
	private String ocupation;
	private String annualIncome;
	private String city;
	private String state;
	private String country;
	private String alternativeEmail;
	private String mobile;
	private String address;
	private CommonsMultipartFile profilePic;

	/**
	 * @return the enrollmentNumber
	 */
	public String getEnrollmentNumber() {
		return enrollmentNumber;
	}

	/**
	 * @param enrollmentNumber
	 *            the enrollmentNumber to set
	 */
	public void setEnrollmentNumber(String enrollmentNumber) {
		this.enrollmentNumber = enrollmentNumber;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName
	 *            the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName
	 *            the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the dateOfBirth
	 */
	public String getDateOfBirth() {
		return dateOfBirth;
	}

	/**
	 * @param dateOfBirth
	 *            the dateOfBirth to set
	 */
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender
	 *            the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the nationality
	 */
	public String getNationality() {
		return nationality;
	}

	/**
	 * @param nationality
	 *            the nationality to set
	 */
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	/**
	 * @return the categorey
	 */
	public String getCategorey() {
		return categorey;
	}

	/**
	 * @param categorey
	 *            the categorey to set
	 */
	public void setCategorey(String categorey) {
		this.categorey = categorey;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the fatherName
	 */
	public String getFatherName() {
		return fatherName;
	}

	/**
	 * @param fatherName
	 *            the fatherName to set
	 */
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	/**
	 * @return the motherName
	 */
	public String getMotherName() {
		return motherName;
	}

	/**
	 * @param motherName
	 *            the motherName to set
	 */
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	/**
	 * @return the ocupation
	 */
	public String getOcupation() {
		return ocupation;
	}

	/**
	 * @param ocupation
	 *            the ocupation to set
	 */
	public void setOcupation(String ocupation) {
		this.ocupation = ocupation;
	}

	/**
	 * @return the annualIncome
	 */
	public String getAnnualIncome() {
		return annualIncome;
	}

	/**
	 * @param annualIncome
	 *            the annualIncome to set
	 */
	public void setAnnualIncome(String annualIncome) {
		this.annualIncome = annualIncome;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city
	 *            the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state
	 *            the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country
	 *            the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**
	 * @return the alternativeEmail
	 */
	public String getAlternativeEmail() {
		return alternativeEmail;
	}

	/**
	 * @param alternativeEmail
	 *            the alternativeEmail to set
	 */
	public void setAlternativeEmail(String alternativeEmail) {
		this.alternativeEmail = alternativeEmail;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile
	 *            the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the profilePic
	 */
	public CommonsMultipartFile getProfilePic() {
		return profilePic;
	}

	/**
	 * @param profilePic
	 *            the profilePic to set
	 */
	public void setProfilePic(CommonsMultipartFile profilePic) {
		this.profilePic = profilePic;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AvtarProfileForm [enrollmentNumber=");
		builder.append(enrollmentNumber);
		builder.append(", email=");
		builder.append(email);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", dateOfBirth=");
		builder.append(dateOfBirth);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", nationality=");
		builder.append(nationality);
		builder.append(", categorey=");
		builder.append(categorey);
		builder.append(", status=");
		builder.append(status);
		builder.append(", fatherName=");
		builder.append(fatherName);
		builder.append(", motherName=");
		builder.append(motherName);
		builder.append(", ocupation=");
		builder.append(ocupation);
		builder.append(", annualIncome=");
		builder.append(annualIncome);
		builder.append(", city=");
		builder.append(city);
		builder.append(", state=");
		builder.append(state);
		builder.append(", country=");
		builder.append(country);
		builder.append(", alternativeEmail=");
		builder.append(alternativeEmail);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", address=");
		builder.append(address);
		builder.append("]");
		return builder.toString();
	}

}
