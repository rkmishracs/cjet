/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.domain.sub;

import java.util.Date;

/**
 *
 * @author CMC
 */
public interface StudentContacts {
    
    String getFirstName();
    
    void setFirstName(String firstName);
    
    String getLastName();
    
    void setLastName(String lastName);
    
    String getGender();
    
    void setGender(String gender);
    
    String getDateOfBirth();
    
    void setDateOfBirth(String dateOfBirth);
    
    String getNationality();
    
    void setNationality(String nationality);
    
    String getEmail();
    
    void setEmail(String email);
    
    String getAlternativeEmail();
    
    void setAlternativeEmail(String alternativeEmail);
    
    String getMobile();
    
    void setMobile(String mobile);
    
    String getLandPhone();
    
    void setLandPhone(String landPhone);
    
    String getAddress();
    
    void setAddress(String address);
    
    String getEnrollmentNumber();
    
    void setEnrollmentNumber(String enrollmentNumber);
    
    String getPin();
    
    void setPin(String pin);
    
}
