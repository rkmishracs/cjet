package com.appcmc.domain.sub.impl;

import com.appcmc.domain.sub.EducationalQualifications;
import java.util.Date;
import java.util.UUID;

public class EducationalQualificationsImpl implements EducationalQualifications {

    private Long id;
    private String guid;
    private String enrollmentNumber;
    private String oneQualification;
    private String oneYearOfPass;
    private String oneUniversity;
    private String oneGrade;
    private String twoQualification;
    private String twoYearOfPass;
    private String twoUniversity;
    private String twoGrade;
    private String threeQualification;
    private String threeYearOfPass;
    private String threeUniversity;
    private String threeGrade;
    private String fourQualification;
    private String fourYearOfPass;
    private String fourUniversity;
    private String fourGrade;
    private String additionalQualification;
    private Date createdOn;
    private Long createdBy;
    private Date modifiedOn;
    private Long modifiedBy;
    private Short active;

    public EducationalQualificationsImpl() {
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

    public String getOneQualification() {
        return oneQualification;
    }

    public void setOneQualification(String oneQualification) {
        this.oneQualification = oneQualification;
    }

    public String getOneYearOfPass() {
        return oneYearOfPass;
    }

    public void setOneYearOfPass(String oneYearOfPass) {
        this.oneYearOfPass = oneYearOfPass;
    }

    public String getOneUniversity() {
        return oneUniversity;
    }

    public void setOneUniversity(String oneUniversity) {
        this.oneUniversity = oneUniversity;
    }

    public String getOneGrade() {
        return oneGrade;
    }

    public void setOneGrade(String oneGrade) {
        this.oneGrade = oneGrade;
    }

    public String getTwoQualification() {
        return twoQualification;
    }

    public void setTwoQualification(String twoQualification) {
        this.twoQualification = twoQualification;
    }

    public String getTwoYearOfPass() {
        return twoYearOfPass;
    }

    public void setTwoYearOfPass(String twoYearOfPass) {
        this.twoYearOfPass = twoYearOfPass;
    }

    public String getTwoUniversity() {
        return twoUniversity;
    }

    public void setTwoUniversity(String twoUniversity) {
        this.twoUniversity = twoUniversity;
    }

    public String getTwoGrade() {
        return twoGrade;
    }

    public void setTwoGrade(String twoGrade) {
        this.twoGrade = twoGrade;
    }

    public String getThreeQualification() {
        return threeQualification;
    }

    public void setThreeQualification(String threeQualification) {
        this.threeQualification = threeQualification;
    }

    public String getThreeYearOfPass() {
        return threeYearOfPass;
    }

    public void setThreeYearOfPass(String threeYearOfPass) {
        this.threeYearOfPass = threeYearOfPass;
    }

    public String getThreeUniversity() {
        return threeUniversity;
    }

    public void setThreeUniversity(String threeUniversity) {
        this.threeUniversity = threeUniversity;
    }

    public String getThreeGrade() {
        return threeGrade;
    }

    public void setThreeGrade(String threeGrade) {
        this.threeGrade = threeGrade;
    }

    public String getFourQualification() {
        return fourQualification;
    }

    public void setFourQualification(String fourQualification) {
        this.fourQualification = fourQualification;
    }

    public String getFourYearOfPass() {
        return fourYearOfPass;
    }

    public void setFourYearOfPass(String fourYearOfPass) {
        this.fourYearOfPass = fourYearOfPass;
    }

    public String getFourUniversity() {
        return fourUniversity;
    }

    public void setFourUniversity(String fourUniversity) {
        this.fourUniversity = fourUniversity;
    }

    public String getFourGrade() {
        return fourGrade;
    }

    public void setFourGrade(String fourGrade) {
        this.fourGrade = fourGrade;
    }

    public String getAdditionalQualification() {
        return additionalQualification;
    }

    public void setAdditionalQualification(String additionalQualification) {
        this.additionalQualification = additionalQualification;
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
        builder.append("EducationalQualificationsImpl[id=");
        builder.append(id);
        builder.append(", guid=");
        builder.append(guid);
        builder.append(", enrollmentNumber=");
        builder.append(enrollmentNumber);
        builder.append(", oneQualification=");
        builder.append(oneQualification);
        builder.append(", oneYearOfPass=");
        builder.append(oneYearOfPass);
        builder.append(", oneUniversity=");
        builder.append(oneUniversity);
        builder.append(", oneGrade=");
        builder.append(oneGrade);
        builder.append(", twoQualification=");
        builder.append(twoQualification);
        builder.append(", twoYearOfPass=");
        builder.append(twoYearOfPass);
        builder.append(", twoUniversity=");
        builder.append(twoUniversity);
        builder.append(", twoGrade=");
        builder.append(twoGrade);
        builder.append(", threeQualification=");
        builder.append(threeQualification);
        builder.append(", threeYearOfPass=");
        builder.append(threeYearOfPass);
        builder.append(", threeUniversity=");
        builder.append(threeUniversity);
        builder.append(", threeGrade=");
        builder.append(threeGrade);
        builder.append(", fourQualification=");
        builder.append(fourQualification);
        builder.append(", fourYearOfPass=");
        builder.append(fourYearOfPass);
        builder.append(", fourUniversity=");
        builder.append(fourUniversity);
        builder.append(", fourGrade=");
        builder.append(fourGrade);
        builder.append(", additionalQualification=");
        builder.append(additionalQualification);
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
