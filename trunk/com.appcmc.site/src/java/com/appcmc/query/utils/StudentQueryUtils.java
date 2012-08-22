package com.appcmc.query.utils;

public interface StudentQueryUtils {

	public static final String GETALL = "from Student student";
	public static final String FIND_STUDENT_BY_ENROLLMENTNUBER = "from Student student where student.enrollmentNumber=:EnrollmentNumber";
	public static final String FIND_STUDENT_BY_STUDENTGUID = "from Student student where student.guid =:Guid";

}
