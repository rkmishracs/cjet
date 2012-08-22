/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.domain.sub;

import com.appcmc.domain.Domain;

/**
 *
 * @author cmc
 */
public interface StudentProfile extends Domain{
    
    void setEnrollmentNumber(String enrollmentNumber);
    
    String getEnrollmentNumber();
    
    void setTitle(String title);
    
    String getTitle();
    
    void setTotalExperience(String totalExperience);
    
    String getTotalExperience();
    
    void setKeySkills(String keySkills);
    
    String getKeySkills();
    
    void setCurrentEmployer(String currentEmployer);
    
    String getCurrentEmployer();
    
    void setRole(String role);
    
    String getRole();
    
    void setPreviousEmployer(String previousEmployer);
    
    String getPreviousEmployer();
    
}
