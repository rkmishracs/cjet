/**
 *
 */
package com.appcmc.web.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.AppUserService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.EnrollmentNumberGenarator;
import com.appcmc.web.forms.EnrollmentForm;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Sudarsan
 *
 */
@Controller
@RequestMapping("/enrl-home")
public class EnrollmentController {

    private static Logger LOG = Logger.getLogger(EnrollmentController.class);
    private StudentService studentService = null;
    private Student student = null;
    private AppUser appUser = null;
    private AppUserService appUserService = null;

    @RequestMapping(method = RequestMethod.GET, value = "/enrl-number")
    @ResponseBody
    public String genarateEnrollmentNumber() {
        return EnrollmentNumberGenarator.genarateEnrollmentNumber();

    }

    @RequestMapping(method = RequestMethod.GET)
    public String postEnrollForm(@ModelAttribute EnrollmentForm enrollmentForm,
            WebRequest request) {

//		AppCmcSpringContext.init();
//
//		studentService = (StudentService) AppContext.APPCONTEXT
//				.getBean(ContextIdNames.STUDENT_SERVICE);
//
//		appUserService = (AppUserService) AppContext.APPCONTEXT
//				.getBean(ContextIdNames.APP_USER_SERVICE);
//
//		student = (Student) AppContext.APPCONTEXT
//				.getBean(ContextIdNames.STUDENT);
//
//		// Creating Student
//
//		student.setEnrollmentNumber(enrollmentForm.getEnrollmentNumber());
//		student.setEmail(enrollmentForm.getEmail());
//		student.setFirstName(enrollmentForm.getFirstName());
//		student.setLastName(enrollmentForm.getLastName());
//		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
//		try {
//			Date dateOfBirth = format.parse(enrollmentForm.getDateOfBirth());
//			student.setDateOfBirth(dateOfBirth);
//		} catch (ParseException e) {
//			LOG.warn("ENROLLMENT CONTROLLER", e);
//		}
//		student.setGender(enrollmentForm.getGender());
//		student.setNationality(enrollmentForm.getNationality());
//		student.setCategory(enrollmentForm.getCategorey());
//		student.setMaritalStatus(enrollmentForm.getStatus());
//		student.setFatherName(enrollmentForm.getFatherName());
//		student.setMotherName(enrollmentForm.getMotherName());
//		student.setOccupation(enrollmentForm.getOcupation());
//		student.setIncome(enrollmentForm.getAnnualIncome());
//		student.setContacts(null);
//		student.setCreatedOn(new java.util.Date());
//		student.setCreatedBy(1L);
//		student.setModifiedOn(new java.util.Date());
//		student.setModifiedBy(1L);
//		student.setActive(new Short("1"));
//
//		studentService.create(student);
//
//		// Create AppUser
//
//		LOG.debug("Student Created With Enrollement Number : "
//				+ student.getEnrollmentNumber());
//
//		appUser = (AppUser) AppContext.APPCONTEXT
//				.getBean(ContextIdNames.APP_USER);
//
//		appUser.setEmail(student.getEmail());
//		appUser.setEnrollmentNumber(student.getEnrollmentNumber());
//		appUser.setPassword("default");
//		appUser.setScreenName(student.getFirstName());
//		appUser.setFirstName(student.getFirstName());
//		appUser.setLastName(student.getLastName());
//		appUser.setStatusId(1L);
//		appUser.setGender(student.getGender());
//		appUser.setTimeZone("timeZone");
//		appUser.setType("student");
//		appUser.setCreatedOn(new java.util.Date());
//		appUser.setCreatedBy(1L);
//		appUser.setModifiedOn(new java.util.Date());
//		appUser.setModifiedBy(1L);
//		appUser.setActive(new Short("1"));
//
//		appUserService.create(appUser);
//		
//		LOG.debug("User Created with EnrollNumber" + appUser.getEnrollmentNumber());
//
//		request.setAttribute("dbSuccess", "Enrollment Number Genarated !",
//				WebRequest.SCOPE_SESSION);
        return "/master/enrlHome";
    }
}
