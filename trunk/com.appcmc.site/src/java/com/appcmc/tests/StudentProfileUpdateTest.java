/**
 * 
 */
package com.appcmc.tests;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.AppUserService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;

/**
 * @author Sudarsan
 * 
 */
public class StudentProfileUpdateTest {

	/**
	 * @param args
	 */

	static Logger LOG = Logger.getLogger(StudentProfileUpdateTest.class);

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		AppCmcSpringContext.init();

		// Creating Contact info to Update Student Profile

		
		
		
		
		Contacts contacts = (Contacts) AppContext.APPCONTEXT
				.getBean(ContextIdNames.CONTACTS);

		contacts.setCity("VSP");
		contacts.setState("AP");
		contacts.setCountry("India");
		contacts.setEmail("Email");
		contacts.setAlternativeEmail("alternativeEmail");
		contacts.setMobile("9848584581");
		contacts.setAddress("address");
		contacts.setCreatedOn(new java.util.Date());
		contacts.setCreatedBy(1L);
		contacts.setModifiedOn(new java.util.Date());
		contacts.setModifiedBy(1L);
		contacts.setActive(new Short("1"));

		// Find the Student by Enrollment Number

		StudentService studentService = (StudentService) AppContext.APPCONTEXT
				.getBean(ContextIdNames.STUDENT_SERVICE);

		Student student = studentService.findStudentByEnrollmentNumber("222");

		if (student == null) {
			LOG.debug("STUDENT NOT FOUND");
			return;
		}

		student.setId(student.getId());
		student.setGuid(student.getGuid());
		student.setEnrollmentNumber(student.getEnrollmentNumber());
		student.setEmail("pl@live.com");
		student.setFirstName("Lakshmi");
		student.setLastName("Prasannam");
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		try {
			Date dateOfBirth = format.parse("14-08-1987");
			student.setDateOfBirth(dateOfBirth);
		} catch (ParseException e) {
			LOG.warn("STUDENT TEST", e);
		}
		student.setGender("Female");
		student.setNationality("Indian");
		student.setCategory("Genral");
		student.setMaritalStatus("Married");
		student.setFatherName("Kota S Sarma");
		student.setMotherName("Ahalya");
		student.setOccupation("Farmer");
		student.setIncome(4500.50);
		// Setting Contact Details for the User
		student.setContacts(contacts);
		student.setCreatedOn(student.getCreatedOn());
		student.setCreatedBy(1L);
		student.setModifiedOn(new java.util.Date());
		student.setModifiedBy(1L);
		student.setActive(new Short("1"));

		studentService.create(student);

		LOG.debug("Contact Details are Created for the Student and the Student Profile Updated");

		AppUserService appUserService = (AppUserService) AppContext.APPCONTEXT
				.getBean(ContextIdNames.APP_USER_SERVICE);

		// Find By Enrollment Number and Update AppUser

		AppUser appUser = appUserService.findByEnrollmentNumber(student
				.getEnrollmentNumber());

		appUser.setId(appUser.getId());
		appUser.setGuid(appUser.getGuid());
		appUser.setEmail(student.getEmail());
		appUser.setEnrollmentNumber(student.getEnrollmentNumber());
		appUser.setPassword("default");
		appUser.setScreenName(student.getFirstName());
		appUser.setFirstName(student.getFirstName());
		appUser.setLastName(student.getLastName());
		appUser.setStatusId(1L);
		appUser.setGender(student.getGender());
		appUser.setTimeZone("timeZone");
		appUser.setType("student");
		appUser.setCreatedOn(appUser.getCreatedOn());
		appUser.setCreatedBy(1L);
		appUser.setModifiedOn(new java.util.Date());
		appUser.setModifiedBy(1L);
		appUser.setActive(new Short("1"));

		appUserService.create(appUser);

		LOG.debug("Student Data is Updated in AppUser");

	}

}
