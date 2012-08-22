package com.appcmc.query.utils;

public interface StudentProfileQueryUtils {
    
    public static final String GETALL = "from StudentProfile";
    public static final String FIND_STUDENT_PROFILE_BY_ENROLLMENTNUBER = "from StudentProfile studentProfile where studentProfile.enrollmentNumber =:EnrollmentNumber";
}
