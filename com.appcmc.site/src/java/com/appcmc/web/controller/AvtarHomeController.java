/**
 *
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.EducationalQualifications;
import com.appcmc.domain.sub.Student;
import com.appcmc.domain.sub.StudentContacts;
import com.appcmc.domain.sub.StudentProfile;
import com.appcmc.service.AppUserService;
import com.appcmc.service.ContactService;
import com.appcmc.service.EducationalQualificationsService;
import com.appcmc.service.StudentProfileService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.AvtarProfilePicForm;
import com.appcmc.web.forms.ChangePasswordForm;
import com.appcmc.web.forms.UpdateAvtarProfileForm;
import com.appcmc.web.forms.UpdateEducationalQualificationsForm;
import com.appcmc.web.forms.UpdateWorkExperienceForm;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Sudarsan
 *
 */
@Controller
@RequestMapping("/avtar")
public class AvtarHomeController {

    private static Logger LOG = Logger.getLogger(AvtarHomeController.class);
    private StudentService studentService = null;
    private Student student = null;
    private ContactService contactService = null;
    private AppUserService appUserService = null;
    private AppUser appUser = null;
    private Contacts contacts = null;
    private StudentContacts studentContacts = null;
    private Date date = null;
    private StudentProfile studentProfile = null;
    private StudentProfileService studentProfileService = null;
    private EducationalQualifications educationalQualifications = null;
    private EducationalQualificationsService educationalQualificationsService = null;

    @RequestMapping(method = RequestMethod.GET)
    public String showAvtarHome(@ModelAttribute ChangePasswordForm changePasswordForm,
            WebRequest request) {

        appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        if (appUser == null) {
            return "home";
        }
        String id = appUser.getEnrollmentNumber();
        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        student = studentService.findStudentByEnrollmentNumber(id);
        contacts = student.getContacts();
        request.setAttribute("contacts", contacts, WebRequest.SCOPE_REQUEST);
        request.setAttribute("student", student, WebRequest.SCOPE_REQUEST);

        return "avtar/avtarHome";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/update-profile")
    public String showProfile(@ModelAttribute UpdateAvtarProfileForm updateAvtarProfileForm, UpdateWorkExperienceForm updateWorkExperienceForm, WebRequest request) {

        String id = appUser.getEnrollmentNumber();
        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        student = studentService.findStudentByEnrollmentNumber(id);
        studentContacts = (StudentContacts) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_CONTACTS);
        contacts = student.getContacts();
        studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);
        studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber(id);
        educationalQualificationsService = (EducationalQualificationsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EDUCATIONAL_QUALIFICATIONS_SERVICE);
        educationalQualifications = educationalQualificationsService.findEducationalQualificationsByEnrollmentNumber(id);
        request.setAttribute("contacts", contacts, WebRequest.SCOPE_REQUEST);
        request.setAttribute("student", student, WebRequest.SCOPE_REQUEST);
        request.setAttribute("studentProfile", studentProfile, WebRequest.SCOPE_REQUEST);
        request.setAttribute("educationalQualifications", educationalQualifications, WebRequest.SCOPE_REQUEST);

        return "/avtar/avtarDen";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/editPersonalInfo/{enrollmentNumber}")
    public ModelAndView showUpdateAvtarProfile(@PathVariable String enrollmentNumber, @ModelAttribute UpdateAvtarProfileForm updateAvtarProfileForm, UpdateEducationalQualificationsForm updateEducationalQualificationsForm) {

        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        student = studentService.findStudentByEnrollmentNumber(enrollmentNumber);

        updateAvtarProfileForm.setFirstName(student.getFirstName());
        updateAvtarProfileForm.setLastName(student.getLastName());
        updateAvtarProfileForm.setGender(student.getGender());
        date = student.getDateOfBirth();
        SimpleDateFormat dateFormat = (SimpleDateFormat) AppContext.APPCONTEXT.getBean(ContextIdNames.SIMPLE_DATE_FORMAT);
        updateAvtarProfileForm.setDateOfBirth(dateFormat.format(date));
        updateAvtarProfileForm.setNationality(student.getNationality());
        updateAvtarProfileForm.setEmail(student.getContacts().getEmail());
        updateAvtarProfileForm.setAlternativeEmail(student.getContacts().getAlternativeEmail());
        updateAvtarProfileForm.setMobileNumber(student.getContacts().getMobile());
        updateAvtarProfileForm.setLandPhone(student.getContacts().getLandPhone());
        updateAvtarProfileForm.setPin(student.getContacts().getPinCode());
        updateAvtarProfileForm.setAddress(student.getContacts().getAddress());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("avtar/editPerInfo");

        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updatedPersonalInfo")
    @ResponseBody
    public String updateAvtarProfile(@ModelAttribute UpdateAvtarProfileForm updateAvtarProfileForm) {
        String enrollmentNumber = updateAvtarProfileForm.getEnrollmentNumber();
        contactService = (ContactService) AppContext.APPCONTEXT.getBean(ContextIdNames.CONTACT_SERVICE);
        appUserService = (AppUserService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER_SERVICE);
        contactService = (ContactService) AppContext.APPCONTEXT.getBean(ContextIdNames.CONTACT_SERVICE);
        appUser = appUserService.findByEnrollmentNumber(enrollmentNumber);
        student = studentService.findStudentByEnrollmentNumber(enrollmentNumber);
        if (student == null) {
            return "";
        }
        contacts = contactService.findByEnrollmentNumber(enrollmentNumber);
        Date dob = null;
        SimpleDateFormat simpleDateFormat = (SimpleDateFormat) AppContext.APPCONTEXT.getBean(ContextIdNames.SIMPLE_DATE_FORMAT);
        try {
            dob = simpleDateFormat.parse(updateAvtarProfileForm.getDateOfBirth());
        } catch (ParseException parseException) {
            LOG.debug("AvtarHomeController", parseException);
        }
        date = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);

        student.setEnrollmentNumber(enrollmentNumber);
        student.setFirstName(updateAvtarProfileForm.getFirstName());
        student.setLastName(updateAvtarProfileForm.getLastName());
        student.setGender(updateAvtarProfileForm.getGender());
        student.setDateOfBirth(dob);
        student.setNationality(updateAvtarProfileForm.getNationality());
        student.setModifiedOn(date);
        studentService.create(student);

        contacts.setEnrollmentNumber(enrollmentNumber);
        contacts.setEmail(updateAvtarProfileForm.getEmail());
        contacts.setAlternativeEmail(updateAvtarProfileForm.getAlternativeEmail());
        contacts.setMobile(updateAvtarProfileForm.getMobileNumber());
        contacts.setLandPhone(updateAvtarProfileForm.getLandPhone());
        contacts.setAddress(updateAvtarProfileForm.getAddress());
        contacts.setPinCode(updateAvtarProfileForm.getPin());
        contacts.setModifiedOn(date);
        contactService.create(contacts);

        appUser.setEnrollmentNumber(enrollmentNumber);
        appUser.setId(appUser.getId());
        appUser.setGuid(appUser.getGuid());
        appUser.setTimeZone(appUser.getTimeZone());
        appUser.setType(appUser.getType());
        appUser.setActive(appUser.getActive());
        appUser.setCreatedBy(appUser.getCreatedBy());
        appUser.setCreatedOn(appUser.getCreatedOn());
        appUser.setModifiedBy(appUser.getModifiedBy());
        appUser.setModifiedOn(date);
        appUser.setFirstName(updateAvtarProfileForm.getFirstName());
        appUser.setLastName(updateAvtarProfileForm.getLastName());
        appUser.setGender(updateAvtarProfileForm.getGender());
        appUser.setEmail(updateAvtarProfileForm.getEmail());
        appUser.setPassword(appUser.getPassword());
        appUser.setScreenName(appUser.getScreenName());
        appUser.setSecurityAnswer(appUser.getSecurityAnswer());
        appUser.setSecurityQuestion(appUser.getSecurityQuestion());
        appUser.setStatusId(appUser.getStatusId());
        appUserService.create(appUser);

        return "success";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateWorkExperience")
    @ResponseBody
    public String updateWorkExperience(@ModelAttribute UpdateWorkExperienceForm updateWorkExperienceForm) {

        String enrollmentNumber = updateWorkExperienceForm.getEnrollmentNumber();
        studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);
        studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber(enrollmentNumber);
        if (studentProfile == null) {
            //ToDo
            return null;
        }
        int months = Integer.parseInt(updateWorkExperienceForm.getTotalExperienceMonths());
        int years =   12 * Integer.parseInt(updateWorkExperienceForm.getTotalExperienceYears());
        int totalExperience = (months + years);

        studentProfile.setEnrollmentNumber(enrollmentNumber);
        studentProfile.setTitle(updateWorkExperienceForm.getTitle());
        studentProfile.setTotalExperience(String.valueOf(totalExperience));
        studentProfile.setKeySkills(updateWorkExperienceForm.getKeySkills());
        studentProfile.setCurrentEmployer(updateWorkExperienceForm.getCurrentEmployer());
        studentProfile.setRole(updateWorkExperienceForm.getRole());
        studentProfile.setPreviousEmployer(updateWorkExperienceForm.getPreviousEmployers());
        studentProfileService.create(studentProfile);
        
        //studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber(enrollmentNumber);

        return "success";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/update", params = {"id"})
    @ResponseBody
    public StudentContacts getAvtarProfile(@RequestParam String id) {
        LOG.debug("==========In getAvtarProfile");
        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        student = studentService.findStudentByEnrollmentNumber(id);
        studentContacts = (StudentContacts) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_CONTACTS);
        contacts = student.getContacts();
        SimpleDateFormat simpleDateFormat = (SimpleDateFormat) AppContext.APPCONTEXT.getBean(ContextIdNames.SIMPLE_DATE_FORMAT);

        studentContacts.setFirstName(student.getFirstName());
        studentContacts.setLastName(student.getLastName());
        studentContacts.setGender(student.getGender());
        studentContacts.setDateOfBirth(simpleDateFormat.format(student.getDateOfBirth()));
        studentContacts.setNationality(student.getNationality());
        studentContacts.setEnrollmentNumber(student.getEnrollmentNumber());
        studentContacts.setEmail(contacts.getEmail());
        studentContacts.setAlternativeEmail(contacts.getAlternativeEmail());
        studentContacts.setMobile(contacts.getMobile());
        studentContacts.setLandPhone(contacts.getLandPhone());
        studentContacts.setAddress(contacts.getAddress());
        studentContacts.setPin(contacts.getPinCode());

        return studentContacts;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/updateWorkExperience", params = {"id"})
    @ResponseBody
    public StudentProfile getWorkExperience(@RequestParam String id) {

        studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);
        studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber(id);
        if (studentProfile == null) {
            //ToDo
            return null;
        }

        return studentProfile;
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, value = "/changePassword")
    public String changePasswordAvtar(@ModelAttribute ChangePasswordForm changePasswordForm) {

        String userName = changePasswordForm.getUserName();
        String currentPassword = changePasswordForm.getCurrentPassword();
        String newPassword = changePasswordForm.getNewPassword();
        appUserService = (AppUserService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER_SERVICE);
        appUser = appUserService.authenticate(userName, currentPassword);
        if (appUser == null) {
            // TO DO
            LOG.debug("===============User Not Available");
            return "fail";
        }
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
        appUser.setModifiedOn(new java.util.Date());
        appUser.setActive(appUser.getActive());

        appUserService.create(appUser);

        return "success";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/avtarPic")
    public String updateProfilePic(@ModelAttribute AvtarProfilePicForm avtarProfilePicForm, WebRequest request) {

        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        student = studentService.findStudentByEnrollmentNumber(avtarProfilePicForm.getEnrollmentNumber());
        if (student == null) {
            // TO DO
            return null;
        }
        byte[] profilePic = avtarProfilePicForm.getProfilePic().getBytes();

        // Set Remaining fields for the Student
        student.setId(student.getId());
        student.setGuid(student.getGuid());
        student.setProfilePic(profilePic);
        student.setActive(student.getActive());
        student.setCategory(student.getCategory());
        student.setCreatedBy(student.getCreatedBy());
        student.setCreatedOn(student.getCreatedOn());
        student.setDateOfBirth(student.getDateOfBirth());
        student.setEmail(student.getEmail());
        student.setEnrollmentNumber(student.getEnrollmentNumber());
        student.setFatherName(student.getFatherName());
        student.setFirstName(student.getFirstName());
        student.setGender(student.getGender());
        student.setIncome(student.getIncome());
        student.setLastName(student.getLastName());
        student.setMaritalStatus(student.getMaritalStatus());
        student.setModifiedBy(student.getModifiedBy());
        student.setModifiedOn((Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE));
        student.setMotherName(student.getMotherName());
        student.setNationality(student.getNationality());
        student.setOccupation(student.getOccupation());

        studentService.create(student);
        student = studentService.findStudentByEnrollmentNumber(avtarProfilePicForm.getEnrollmentNumber());
        request.setAttribute("student", student, WebRequest.SCOPE_REQUEST);
        request.setAttribute("successProfilePic", "Profile Picture Changed Successfully", WebRequest.SCOPE_REQUEST);

        return "avtar/avtarProfilePic";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/avtarPic")
    public String showAvtarProfilePic(@ModelAttribute AvtarProfilePicForm avtarProfilePicForm, WebRequest request) {

        avtarProfilePicForm.setEnrollmentNumber(student.getEnrollmentNumber());
        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        student = studentService.findStudentByEnrollmentNumber(student.getEnrollmentNumber());
        request.setAttribute("student", student, WebRequest.SCOPE_REQUEST);

        return "/avtar/avtarProfilePic";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/eduEdit")
    public String avtraEducationEdit(@ModelAttribute UpdateEducationalQualificationsForm updateEducationalQualificationsForm, WebRequest request) {

        appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        if (appUser == null) {
            return "home";
        }
        String id = appUser.getEnrollmentNumber();
        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        student = studentService.findStudentByEnrollmentNumber(id);
        educationalQualificationsService = (EducationalQualificationsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EDUCATIONAL_QUALIFICATIONS_SERVICE);
        educationalQualifications = educationalQualificationsService.findEducationalQualificationsByEnrollmentNumber(id);
        request.setAttribute("student", student, WebRequest.SCOPE_REQUEST);
        request.setAttribute("educationalQualifications", educationalQualifications, WebRequest.SCOPE_REQUEST);

        return "/avtar/editEducation";
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, value = "/updateEducation")
    public String updateEducationalQualifications(@ModelAttribute UpdateEducationalQualificationsForm updateEducationalQualificationsForm, WebRequest request) {

        String id = updateEducationalQualificationsForm.getEnrollmentNumber();
        date = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);

        educationalQualificationsService = (EducationalQualificationsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EDUCATIONAL_QUALIFICATIONS_SERVICE);
        educationalQualifications = educationalQualificationsService.findEducationalQualificationsByEnrollmentNumber(id);
        educationalQualifications.setOneQualification(updateEducationalQualificationsForm.getOneQualification());
        educationalQualifications.setOneUniversity(updateEducationalQualificationsForm.getOneUniversity());
        educationalQualifications.setOneYearOfPass(updateEducationalQualificationsForm.getOneYearOfPass());
        educationalQualifications.setOneGrade(updateEducationalQualificationsForm.getOneGrade());
        educationalQualifications.setTwoQualification(updateEducationalQualificationsForm.getTwoQualification());
        educationalQualifications.setTwoSpecialization(updateEducationalQualificationsForm.getTwoSpecialization());
        educationalQualifications.setTwoUniversity(updateEducationalQualificationsForm.getTwoUniversity());
        educationalQualifications.setTwoYearOfPass(updateEducationalQualificationsForm.getTwoYearOfPass());
        educationalQualifications.setTwoGrade(updateEducationalQualificationsForm.getTwoGrade());
        educationalQualifications.setThreeQualification(updateEducationalQualificationsForm.getThreeQualification());
        educationalQualifications.setThreeSpecialization(updateEducationalQualificationsForm.getThreeSpecialization());
        educationalQualifications.setThreeUniversity(updateEducationalQualificationsForm.getThreeUniversity());
        educationalQualifications.setThreeYearOfPass(updateEducationalQualificationsForm.getThreeYearOfPass());
        educationalQualifications.setThreeGrade(updateEducationalQualificationsForm.getThreeGrade());
        educationalQualifications.setFourQualification(updateEducationalQualificationsForm.getFourQualification());
        educationalQualifications.setFourSpecialization(updateEducationalQualificationsForm.getFourSpecialization());
        educationalQualifications.setFourUniversity(updateEducationalQualificationsForm.getFourUniversity());
        educationalQualifications.setFourYearOfPass(updateEducationalQualificationsForm.getFourYearOfPass());
        educationalQualifications.setFourGrade(updateEducationalQualificationsForm.getFourGrade());
        educationalQualifications.setModifiedOn(date);
        educationalQualificationsService.create(educationalQualifications);

        contactService = (ContactService) AppContext.APPCONTEXT.getBean(ContextIdNames.CONTACT_SERVICE);
        contacts = contactService.findByEnrollmentNumber(id);
        contacts.setEnrollmentNumber(id);
        contacts.setModifiedOn(date);
        contactService.create(contacts);

        return "success";
    }

    @RequestMapping(method = RequestMethod.GET, value = {"/editWork/{enrollmentNumber}"})
    public String editWorkExperiance(@ModelAttribute UpdateWorkExperienceForm updateWorkExperienceForm, @PathVariable String enrollmentNumber) {
        LOG.debug("--------------------------" + enrollmentNumber);

        studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);
        studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber(enrollmentNumber);

        if (studentProfile == null) {
            //ToDo
            return null;
        }


        if (studentProfile.getTotalExperience().equalsIgnoreCase("Not Updated")) {
            updateWorkExperienceForm.setTotalExperienceMonths("");
            updateWorkExperienceForm.setTotalExperienceYears("");
        } else {
            int totalExperience = Integer.parseInt(studentProfile.getTotalExperience());
            String months = String.valueOf(totalExperience % 12);
            String years = String.valueOf(totalExperience / 12);
            updateWorkExperienceForm.setTotalExperienceMonths(months);
            updateWorkExperienceForm.setTotalExperienceYears(years);
        }
        updateWorkExperienceForm.setTitle(studentProfile.getTitle());
        updateWorkExperienceForm.setKeySkills(studentProfile.getKeySkills());
        updateWorkExperienceForm.setCurrentEmployer(studentProfile.getCurrentEmployer());
        updateWorkExperienceForm.setRole(studentProfile.getRole());
        updateWorkExperienceForm.setPreviousEmployers(studentProfile.getPreviousEmployer());
        return "/avtar/editWorkExp";
    }
}
