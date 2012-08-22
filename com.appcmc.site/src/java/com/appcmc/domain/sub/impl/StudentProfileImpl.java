/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.domain.sub.impl;

import com.appcmc.domain.sub.StudentProfile;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author cmc
 */
public class StudentProfileImpl implements StudentProfile {

    private Long id;
    private String guid;
    private String enrollmentNumber;
    private String title;
    private String totalExperience;
    private String keySkills;
    private String currentEmployer;
    private String role;
    private String previousEmployer;
    private Date createdOn;
    private Long createdBy;
    private Date modifiedOn;
    private Long modifiedBy;
    private Short active;
    
    public StudentProfileImpl(){
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTotalExperience() {
        return totalExperience;
    }

    public void setTotalExperience(String totalExperience) {
        this.totalExperience = totalExperience;
    }

    public String getKeySkills() {
        return keySkills;
    }

    public void setKeySkills(String keySkills) {
        this.keySkills = keySkills;
    }

    public String getCurrentEmployer() {
        return currentEmployer;
    }

    public void setCurrentEmployer(String currentEmployer) {
        this.currentEmployer = currentEmployer;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPreviousEmployer() {
        return previousEmployer;
    }

    public void setPreviousEmployer(String previousEmployer) {
        this.previousEmployer = previousEmployer;
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
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("StudentProfileImpl [id=");
        builder.append(id);
        builder.append(", guid=");
        builder.append(guid);
        builder.append(", enrollmentNumber=");
        builder.append(enrollmentNumber);
        builder.append(", title=");
        builder.append(title);
        builder.append(", totalExperience=");
        builder.append(totalExperience);
        builder.append(", keySkills=");
        builder.append(keySkills);
        builder.append(", currentEmployer=");
        builder.append(currentEmployer);
        builder.append(", role=");
        builder.append(role);
        builder.append(", previousEmployer=");
        builder.append(previousEmployer);
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
        builder.append("]");
        return builder.toString();
    }
}
