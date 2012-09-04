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
public interface PlacedStudent extends Domain {
    
    void setEnrollmentNumber(String enrollmentNumber);
    
    String getEnrollmentNumber();
    
    void setFirstName(String firstName);
    
    String getFirstName();
    
    void setLastName(String lastName);

    String getLastName();
    
    void setGender(String gender);

    String getGender();
    
    void setPlacedCompany(String placedCompany);
    
    String getPlacedCompany();
    
    void setYearOfPlacement(String yearOfPlacement);
    
    String getYearOfPlacement();
    
    void setDesignation(String designation);
    
    String getDesignation();
    
    void setPackageDetails(String packageDetails);
    
    String getPackageDetails();
    
    void setOtherDetails(String otherDetails);
    
    String getOtherDetails();
    
    
}
