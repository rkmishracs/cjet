/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.domain.sub;

/**
 *
 * @author HOME
 */
public interface StudentContactsProfile {
    
    String getEnrollmentNumber();
    
    void setEnrollmentNumber(String enrollmentNumber);
    
    String getFirstName();
    
    void setFirstName(String firstName);
    
    String getLastName();
    
    void setLastName(String lastName);
    
    String getEmail();
    
    void setEmail(String email);
    
    String getMobile();
    
    void setMobile(String mobile);
    
    String getKeySkills();
    
    void setKeySkills(String keySkills);
}
