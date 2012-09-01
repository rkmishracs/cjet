package com.appcmc.query.utils;

public interface AppUserQueryUtils {

	public static final String AUTHENTICATE = "from AppUser appUser where appUser.enrollmentNumber=:EnrollmentNumber and appUser.password=:Password";
	public static final String GETALL = "from AppUser appUser";
	public static final String FINDBYEMAIL = "from AppUser appUser where appUser.email=:Email";
	public static final String FIND_BY_ENROLLMENT_NUMBER = "from AppUser appUser where appUser.enrollmentNumber=:EnrollmentNumber";
        public static final String FIND_BY_GUID = "from AppUser appUser where appUser.guid =:Guid";
}
