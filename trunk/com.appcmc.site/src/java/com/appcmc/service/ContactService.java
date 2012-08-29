/**
 * 
 */
package com.appcmc.service;

import com.appcmc.domain.sub.Contacts;
import java.util.List;

/**
 * @author Sudarsan
 *
 */
public interface ContactService {
	
	void create(Contacts contacts);
	
	public Contacts findById(Long id);
        
        public Contacts findByEnrollmentNumber(String enrollmentNumber);
        
        public List<Contacts> findByMobile(String mobile);

}
