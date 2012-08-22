package com.appcmc.domain.sub;

import com.appcmc.domain.Domain;

public interface EducationalQualifications extends Domain {

    void setEnrollmentNumber(String enrollmentNumber);

    String getEnrollmentNumber();

    //First Qualification
    
    void setOneQualification(String oneQualification);

    String getOneQualification();

    void setOneYearOfPass(String oneYearOfPass);

    String getOneYearOfPass();

    void setOneUniversity(String oneUniversity);

    String getOneUniversity();

    void setOneGrade(String oneGrade);

    String getOneGrade();

    //Second Qualification
    
    void setTwoQualification(String twoQualification);

    String getTwoQualification();

    void setTwoYearOfPass(String twoYearOfPass);

    String getTwoYearOfPass();

    void setTwoUniversity(String twoUniversity);

    String getTwoUniversity();

    void setTwoGrade(String twoGrade);

    String getTwoGrade();
    
    //Third Qualification
    
    void setThreeQualification(String threeQualification);

    String getThreeQualification();

    void setThreeYearOfPass(String threeYearOfPass);

    String getThreeYearOfPass();

    void setThreeUniversity(String threeUniversity);

    String getThreeUniversity();

    void setThreeGrade(String threeGrade);

    String getThreeGrade();
    
    //Fourth Qualification
    
    void setFourQualification(String fourQualification);

    String getFourQualification();

    void setFourYearOfPass(String fourYearOfPass);

    String getFourYearOfPass();

    void setFourUniversity(String fourUniversity);

    String getFourUniversity();

    void setFourGrade(String fourGrade);

    String getFourGrade();
    
    
    void setAdditionalQualification(String additionalQualification);
    
    String getAdditionalQualification();
}
