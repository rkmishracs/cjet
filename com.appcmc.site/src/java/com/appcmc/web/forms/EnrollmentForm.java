/**
 *
 */
package com.appcmc.web.forms;

/**
 * @author Sudarsan
 *
 */
public class EnrollmentForm {

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
    private Double annualIncome;
    private String city;
    private String state;
    private String country;
    private String pinCode;
    private String mobile;
    private String aletrnativeEmail;
    private String address;
    private String landPhone;

    public void setLandPhone(String landPhone) {
        this.landPhone = landPhone;
    }

    public String getLandPhone() {
        return landPhone;
    }

    public String getEnrollmentNumber() {
        return enrollmentNumber;
    }

    public void setEnrollmentNumber(String enrollmentNumber) {
        this.enrollmentNumber = enrollmentNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getCategorey() {
        return categorey;
    }

    public void setCategorey(String categorey) {
        this.categorey = categorey;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getOcupation() {
        return ocupation;
    }

    public void setOcupation(String ocupation) {
        this.ocupation = ocupation;
    }

    public Double getAnnualIncome() {
        return annualIncome;
    }

    public void setAnnualIncome(Double annualIncome) {
        this.annualIncome = annualIncome;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPinCode() {
        return pinCode;
    }

    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }
    

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAletrnativeEmail() {
        return aletrnativeEmail;
    }

    public void setAletrnativeEmail(String aletrnativeEmail) {
        this.aletrnativeEmail = aletrnativeEmail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        StringBuilder toStringBuilder = new StringBuilder();
        toStringBuilder.append(super.toString());
        toStringBuilder.append("\n");
        toStringBuilder.append("\nenrollmentNumber: ");
        toStringBuilder.append(enrollmentNumber);
        toStringBuilder.append("\nemail: ");
        toStringBuilder.append(email);
        toStringBuilder.append("\nfirstName: ");
        toStringBuilder.append(firstName);
        toStringBuilder.append("\nlastName: ");
        toStringBuilder.append(lastName);
        toStringBuilder.append("\ndateOfBirth: ");
        toStringBuilder.append(dateOfBirth);
        toStringBuilder.append("\ngender: ");
        toStringBuilder.append(gender);
        toStringBuilder.append("\nnationality: ");
        toStringBuilder.append(nationality);
        toStringBuilder.append("\ncategorey: ");
        toStringBuilder.append(categorey);
        toStringBuilder.append("\nstatus: ");
        toStringBuilder.append(status);
        toStringBuilder.append("\nfatherName: ");
        toStringBuilder.append(fatherName);
        toStringBuilder.append("\nmotherName: ");
        toStringBuilder.append(motherName);
        toStringBuilder.append("\nocupation: ");
        toStringBuilder.append(ocupation);
        toStringBuilder.append("\nannualIncome: ");
        toStringBuilder.append(annualIncome);
        toStringBuilder.append("\ncity: ");
        toStringBuilder.append(city);
        toStringBuilder.append("\nstate: ");
        toStringBuilder.append(state);
        toStringBuilder.append("\ncountry: ");
        toStringBuilder.append(country);
        toStringBuilder.append("\nmobile: ");
        toStringBuilder.append(mobile);
        toStringBuilder.append("\naletrnativeEmail: ");
        toStringBuilder.append(aletrnativeEmail);
        toStringBuilder.append("\naddress: ");
        toStringBuilder.append(address);
        return toStringBuilder.toString();
    }
}
