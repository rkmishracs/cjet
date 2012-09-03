/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.domain.sub.impl;

import com.appcmc.domain.sub.StudentContactsProfile;

/**
 *
 * @author HOME
 */
public class StudentsContactProfileImpl implements StudentContactsProfile{

    private String enrollmentNumber;
    private String firstName;
    private String lastName;
    private String email;
    private String mobile;
    private String keySkills;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getKeySkills() {
        return keySkills;
    }

    public void setKeySkills(String keySkills) {
        this.keySkills = keySkills;
    }
    
}
