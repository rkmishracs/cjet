package com.appcmc.service;

import java.util.List;

import com.appcmc.domain.sub.AppUser;

public interface AppUserService {

	AppUser authenticate(String enrollmentNumber, String password);

	List<AppUser> getAll();

	AppUser findByUserEmail(String email);

	void create(AppUser appUser);

	AppUser findByEnrollmentNumber(String enrollmentNumber);
        
        AppUser findByGuid(String guid);

}
