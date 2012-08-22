package com.appcmc.service;

import com.appcmc.domain.sub.EducationalQualifications;
import java.util.List;

public interface EducationalQualificationsService {
    
    void create(EducationalQualifications educationalQualifications);
    
    List<EducationalQualifications> getAll();
    
    EducationalQualifications findEducationalQualificationsByEnrollmentNumber(String enrollmentNumber);
}
