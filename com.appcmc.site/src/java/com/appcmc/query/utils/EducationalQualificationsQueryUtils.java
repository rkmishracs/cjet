package com.appcmc.query.utils;

public interface EducationalQualificationsQueryUtils {
    
    public static final String GETALL = "from EducationalQualifications";
    public static final String FIND_EDUCATIONAL_QUALIFICATIONS_BY_ENROLLMENTNUBER = "from EducationalQualifications edu where edu.enrollmentNumber =:EnrollmentNumber";
    
}
