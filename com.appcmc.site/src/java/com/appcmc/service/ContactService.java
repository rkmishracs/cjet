/**
 * 
 */
package com.appcmc.service;

import com.appcmc.domain.sub.Contacts;

/**
 * @author Sudarsan
 *
 */
public interface ContactService {
	
	void create(Contacts contacts);
	
	public Contacts findById(Long id);
        
        public Contacts findByEnrollmentNumber(String enrollmentNumber);

}
