package com.appcmc.domain.sub.impl;

import java.util.Date;
import java.util.UUID;

import com.appcmc.domain.sub.Contacts;

public class ContactsImpl implements Contacts {

    private Long id;
    private String guid;
    private String enrollmentNumber;
    private String city;
    private String state;
    private String country;
    private String mobile;
    private String landPhone;
    private String email;
    private String alternativeEmail;
    private String address;
    private String pinCode;
    private Date createdOn;
    private Long createdBy;
    private Date modifiedOn;
    private Long modifiedBy;
    private Short active;

    public ContactsImpl() {
        setGuid(UUID.randomUUID().toString());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getEnrollmentNumber() {
        return enrollmentNumber;
    }

    public void setEnrollmentNumber(String enrollmentNumber) {
        this.enrollmentNumber = enrollmentNumber;
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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAlternativeEmail() {
        return alternativeEmail;
    }

    public void setAlternativeEmail(String alternativeEmail) {
        this.alternativeEmail = alternativeEmail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getPinCode(){
        return pinCode;
    }
    
    public void setPinCode(String pinCode){
        this.pinCode = pinCode;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public Date getModifiedOn() {
        return modifiedOn;
    }

    public void setModifiedOn(Date modifiedOn) {
        this.modifiedOn = modifiedOn;
    }

    public Long getModifiedBy() {
        return modifiedBy;
    }

    public String getLandPhone() {
        return landPhone;
    }

    public void setLandPhone(String landPhone) {
        this.landPhone = landPhone;
    }

    public void setModifiedBy(Long modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Short getActive() {
        return active;
    }

    public void setActive(Short active) {
        this.active = active;
    }

    public String toString() {
        StringBuilder toStringBuilder = new StringBuilder();
        toStringBuilder.append(super.toString());
        toStringBuilder.append("\n");
        toStringBuilder.append("\nid: ");
        toStringBuilder.append(id);
        toStringBuilder.append("\nguid: ");
        toStringBuilder.append(guid);
        toStringBuilder.append("\nenrollmentNumber: ");
        toStringBuilder.append(enrollmentNumber);
        toStringBuilder.append("\ncity: ");
        toStringBuilder.append(city);
        toStringBuilder.append("\nstate: ");
        toStringBuilder.append(state);
        toStringBuilder.append("\ncountry: ");
        toStringBuilder.append(country);
        toStringBuilder.append("\nmobile: ");
        toStringBuilder.append(mobile);
        toStringBuilder.append("\nlandPhone: ");
        toStringBuilder.append(landPhone);
        toStringBuilder.append("\nemail: ");
        toStringBuilder.append(email);
        toStringBuilder.append("\nalternativeEmail: ");
        toStringBuilder.append(alternativeEmail);
        toStringBuilder.append("\naddress: ");
        toStringBuilder.append(address);
        toStringBuilder.append("\npinCode: ");
        toStringBuilder.append(pinCode);
        toStringBuilder.append("\ncreatedOn: ");
        toStringBuilder.append(createdOn);
        toStringBuilder.append("\ncreatedBy: ");
        toStringBuilder.append(createdBy);
        toStringBuilder.append("\nmodifiedOn: ");
        toStringBuilder.append(modifiedOn);
        toStringBuilder.append("\nmodifiedBy: ");
        toStringBuilder.append(modifiedBy);
        toStringBuilder.append("\nactive: ");
        toStringBuilder.append(active);
        return toStringBuilder.toString();
    }
    
}
