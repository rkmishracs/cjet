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
import com.appcmc.utils.EnrollmentNumberGenarator;

/**
 * @author Sudarsan
 * 
 */
public class AppUserCreationTest {

	static Logger LOG = Logger.getLogger(AppUserCreationTest.class);

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		AppCmcSpringContext.init();

		StudentService studentService = (StudentService) AppContext.APPCONTEXT
				.getBean(ContextIdNames.STUDENT_SERVICE);

		AppUserService appUserService = (AppUserService) AppContext.APPCONTEXT
				.getBean(ContextIdNames.APP_USER_SERVICE);

		Student student = (Student) AppContext.APPCONTEXT
				.getBean(ContextIdNames.STUDENT);

		// Creating Contact Details

		Contacts contacts = (Contacts) AppContext.APPCONTEXT
				.getBean(ContextIdNames.CONTACTS);

		// Creating a Student

		student.setEnrollmentNumber(EnrollmentNumberGenarator
				.genarateEnrollmentNumber());
		student.setEmail("sudarsan.a@live.com");
		student.setFirstName("Ambatipudi");
		student.setLastName("Chakravarthy");
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		try {
			Date dateOfBirth = format.parse("14-08-1984");
			student.setDateOfBirth(dateOfBirth);
		} catch (ParseException e) {
			LOG.warn("STUDENT TEST", e);
		}
		student.setGender("Male");
		student.setNationality("Indian");
		student.setCategory("Genral");
		student.setMaritalStatus("Married");
		student.setFatherName("Satyanarayana Sarma");
		student.setMotherName("Bharathi");
		student.setOccupation("Employee");
		student.setIncome(1000.00);

		contacts.setEnrollmentNumber(student.getEnrollmentNumber());
		contacts.setCity("VSP");
		contacts.setState("AP");
		contacts.setCountry("India");
		contacts.setEmail(student.getEmail());
		contacts.setAlternativeEmail("zarvis.a@gmail.com");
		contacts.setMobile("9676534400");
		contacts.setAddress("Some Address");
		contacts.setCreatedOn(new java.util.Date());
		contacts.setCreatedBy(1L);
		contacts.setModifiedOn(new java.util.Date());
		contacts.setModifiedBy(1L);
		contacts.setActive(new Short("1"));

		student.setContacts(contacts);
		student.setCreatedOn(new java.util.Date());
		student.setCreatedBy(1L);
		student.setModifiedOn(new java.util.Date());
		student.setModifiedBy(1L);
		student.setActive(new Short("1"));

		studentService.create(student);

		// Creating Application User

		AppUser appUser = (AppUser) AppContext.APPCONTEXT
				.getBean(ContextIdNames.APP_USER);

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
		appUser.setCreatedOn(new java.util.Date());
		appUser.setCreatedBy(1L);
		appUser.setModifiedOn(new java.util.Date());
		appUser.setModifiedBy(1L);
		appUser.setActive(new Short("1"));

		appUserService.create(appUser);

	}

}
