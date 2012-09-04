/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.domain.sub.impl;

import com.appcmc.domain.sub.PlacedStudent;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author cmc
 */
public class PlacedStudentImpl implements PlacedStudent{
    
        private Long id;
	private String guid;
        private String enrollmentNumber;
        private String firstName;
	private String lastName;
        private String gender;
        private String placedCompany;
        private String yearOfPlacement;
        private String designation;
        private String packageDetails;
        private String otherDetails;
        private Date createdOn;
	private Long createdBy;
	private Date modifiedOn;
	private Long modifiedBy;
	private Short active;

        
    public PlacedStudentImpl(){
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPlacedCompany() {
        return placedCompany;
    }

    public void setPlacedCompany(String placedCompany) {
        this.placedCompany = placedCompany;
    }

    public String getYearOfPlacement() {
        return yearOfPlacement;
    }

    public void setYearOfPlacement(String yearOfPlacement) {
        this.yearOfPlacement = yearOfPlacement;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getPackageDetails() {
        return packageDetails;
    }

    public void setPackageDetails(String packageDetails) {
        this.packageDetails = packageDetails;
    }

    public String getOtherDetails() {
        return otherDetails;
    }

    public void setOtherDetails(String otherDetails) {
        this.otherDetails = otherDetails;
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

    public void setModifiedBy(Long modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Short getActive() {
        return active;
    }

    public void setActive(Short active) {
        this.active = active;
    }
    
    @Override
    public String toString(){
        StringBuilder builder = new StringBuilder();
        builder.append("PlacedStudentImpl [id=");
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
        builder.append(", placedCompany=");
        builder.append(placedCompany);
        builder.append(", yearOfPlacement=");
        builder.append(yearOfPlacement);
        builder.append(", designation=");
        builder.append(designation);
        builder.append(", packageDetails");
        builder.append(packageDetails);
        builder.append(", otherDetails=");
        builder.append(otherDetails);
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
        
        return builder.toString();
    }
    
        
        
}
