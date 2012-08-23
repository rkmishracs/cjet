/**
 *
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.AppMailService;
import com.appcmc.service.AppUserService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.ChangePasswordForm;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.appcmc.web.forms.EnrollmentForm;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Sudarsan
 *
 */
@Controller
@RequestMapping("/master")
public class MasterController {

    private Logger LOG = Logger.getLogger(MasterController.class);
    private StudentService studentService = null;
    private AppUserService appUserService = null;
    private Student student = null;
    private Contacts contacts = null;
    private AppUser appUser = null;
    private InputStream inputStream = null;

    private AppMailService appMailService = null;

    private Date date = null;

    @RequestMapping(method = RequestMethod.GET)
    public String showMaster(@ModelAttribute EnrollmentForm enrollmentForm, ChangePasswordForm changePasswordForm) {
        LOG.debug("In Master Controller");        
        return "/master/masterHome";
    }
    
    @RequestMapping(method = RequestMethod.GET, value="/showEnrollment")
    public String showEnrollment(@ModelAttribute EnrollmentForm enrollmentForm, ChangePasswordForm changePasswordForm) {
        LOG.debug("In Master Controller");        
        return "/master/enrlHome";
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String doEnrollment(@ModelAttribute EnrollmentForm enrollmentForm, HttpServletRequest request) {
        LOG.debug("In Enrollment POST");

        AppCmcSpringContext.init();

        studentService = (StudentService) AppContext.APPCONTEXT
                .getBean(ContextIdNames.STUDENT_SERVICE);

        appUserService = (AppUserService) AppContext.APPCONTEXT
                .getBean(ContextIdNames.APP_USER_SERVICE);
        
       

        student = (Student) AppContext.APPCONTEXT
                .getBean(ContextIdNames.STUDENT);

        // Creating Contact Details

        contacts = (Contacts) AppContext.APPCONTEXT
                .getBean(ContextIdNames.CONTACTS);

        // Creating a Student

        student.setEnrollmentNumber(enrollmentForm.getEnrollmentNumber());
        student.setEmail(enrollmentForm.getEmail());
        student.setFirstName(enrollmentForm.getFirstName());
        student.setLastName(enrollmentForm.getLastName());
        SimpleDateFormat simpleDateFormat = (SimpleDateFormat)AppContext.APPCONTEXT.getBean(ContextIdNames.SIMPLE_DATE_FORMAT);
                
        try {
            
            Date dateOfBirth = simpleDateFormat.parse(enrollmentForm.getDateOfBirth());
            student.setDateOfBirth(dateOfBirth);
        } catch (ParseException e) {
            LOG.warn("STUDENT TEST", e);
        }
        date = (Date)AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
        student.setGender(enrollmentForm.getGender());
        student.setNationality(enrollmentForm.getNationality());
        student.setCategory(enrollmentForm.getCategorey());
        student.setMaritalStatus(enrollmentForm.getStatus());
        student.setFatherName(enrollmentForm.getFatherName());
        student.setMotherName(enrollmentForm.getMotherName());
        student.setOccupation(enrollmentForm.getOcupation());
        student.setIncome(enrollmentForm.getAnnualIncome());

        contacts.setEnrollmentNumber(student.getEnrollmentNumber());
        contacts.setCity(enrollmentForm.getCity());
        contacts.setState(enrollmentForm.getState());
        contacts.setCountry(enrollmentForm.getCountry());
        contacts.setEmail(student.getEmail());
        contacts.setAlternativeEmail(enrollmentForm.getAletrnativeEmail());
        contacts.setMobile(enrollmentForm.getMobile());
        contacts.setLandPhone(enrollmentForm.getLandPhone());
        contacts.setPinCode(enrollmentForm.getPinCode());
        contacts.setAddress(enrollmentForm.getAddress());
        contacts.setCreatedOn(date);
        contacts.setCreatedBy(1L);
        contacts.setModifiedOn(date);
        contacts.setModifiedBy(1L);
        contacts.setActive(new Short("1"));

        String fileName =  request.getSession().getServletContext().getRealPath("/resources/images/content/user-img-40.jpg");
        byte[] imageBytes = null;
        
        try {
           inputStream = new FileInputStream(fileName);
           
           imageBytes = new byte[inputStream.available()];
           
           inputStream.read(imageBytes);
           
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(MasterController.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        
        student.setContacts(contacts);
        student.setProfilePic(imageBytes);
        student.setCreatedOn(date);
        student.setCreatedBy(1L);
        student.setModifiedOn(date);
        student.setModifiedBy(1L);
        student.setActive(new Short("1"));

        studentService.create(student);

        // Creating Application User

        appUser = (AppUser) AppContext.APPCONTEXT
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
        appUser.setCreatedOn(date);
        appUser.setCreatedBy(1L);
        appUser.setModifiedOn(date);
        appUser.setModifiedBy(1L);
        appUser.setActive(new Short("1"));

        appUserService.create(appUser);
        
        //Sending EnrollmentNumber  to the Student through java mail
        appMailService = (AppMailService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_MAIL_SERVICE);
       
        appMailService.sendMail(appUser);
        

       

        return "Enrollment Genarated";
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, value = "/changePassword")
    public String changePasswordAction(@ModelAttribute ChangePasswordForm changePasswordForm) {


        String userName = changePasswordForm.getUserName();
        String currentPassword = changePasswordForm.getCurrentPassword();
        String newPassword = changePasswordForm.getNewPassword();
        //String confirmPassword = changePasswordForm.getConfirmPassword();

        appUserService = (AppUserService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER_SERVICE);

        LOG.debug("===============In changePasswordAction Post");
            
        appUser = appUserService.authenticate(userName, currentPassword);
        
        if(appUser == null){
            // TO DO
            LOG.debug("===============User Not Available");
            return "fail";
        }
        date =  (Date)AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
        appUser.setId(appUser.getId());
        appUser.setGuid(appUser.getGuid());
        appUser.setEmail(appUser.getEmail());
        appUser.setEnrollmentNumber(userName);
        appUser.setPassword(newPassword);
        appUser.setScreenName(appUser.getScreenName());
        appUser.setFirstName(appUser.getFirstName());
        appUser.setLastName(appUser.getLastName());
        appUser.setStatusId(appUser.getStatusId());
        appUser.setGender(appUser.getGender());
        appUser.setTimeZone(appUser.getTimeZone());
        appUser.setType(appUser.getType());
        appUser.setCreatedOn(appUser.getCreatedOn());
        appUser.setCreatedBy(appUser.getCreatedBy());
        appUser.setModifiedOn(date);
        appUser.setActive(appUser.getActive());
        
        appUserService.create(appUser);
        return "success";
    }
    }