/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.PlacedStudent;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.PlacedStudentService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.SuccessStoryCreationForm;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

/**
 *
 * @author HOME
 */
@Controller
@RequestMapping("/successStories")
public class SuccessStoryController {
    
    static Logger LOG = Logger.getLogger(SuccessStoryController.class);
    private StudentService studentService = null;
    private Student student = null;
    private PlacedStudent placedStudent = null;
    private PlacedStudentService placedStudentService = null;
    private Date date = null;
    private AppUser appUser = null;
    private List<PlacedStudent> placedStudentList = null;
    
    @RequestMapping(method = RequestMethod.GET)
    public String showSuccessStories() {
        
        return "/master/successStoriesHome";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/createSuccessStories")
    public String showCreateSuccessStories(@ModelAttribute SuccessStoryCreationForm successStoryCreationForm) {
        return "/master/createSuccessStory";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "viewAllSuccessStories")
    public String viewAllSuccessStories(WebRequest request) {
        
        placedStudentService = (PlacedStudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.PLACED_STUDENT_SERVICE);
        
        placedStudentList = placedStudentService.getAll();
        
        
        request.setAttribute("placeStudentList", placedStudentList, WebRequest.SCOPE_REQUEST);
        
        return "/master/viewAllSuccessStories";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/getPersonName", params = {"enrollmentNumber"})
    @ResponseBody
    public String showFirstNameLastName(@ModelAttribute SuccessStoryCreationForm successStoryCreationForm, @RequestParam String enrollmentNumber) {
        
        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        
        student = studentService.findStudentByEnrollmentNumber(enrollmentNumber);
        
        String name = null;
        
        if (student != null) {
            name = student.getFirstName() + student.getLastName();
            return name;
        }
        return "";
        
    }
    
    @RequestMapping(method = RequestMethod.POST, value = "/createSuccessStory")
    @ResponseBody
    public String createSuccessStories(@ModelAttribute SuccessStoryCreationForm successStoryCreationForm, WebRequest request) {
        
        appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        
        date = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
        
        placedStudentService = (PlacedStudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.PLACED_STUDENT_SERVICE);
        
        placedStudent = (PlacedStudent) AppContext.APPCONTEXT.getBean(ContextIdNames.PLACED_STUDENT);
        
        LOG.debug("EnrollmentNumber = " + successStoryCreationForm.getSucessStoriesEnrollmentNumber());
        
        placedStudent.setEnrollmentNumber(successStoryCreationForm.getSucessStoriesEnrollmentNumber());
        placedStudent.setFirstName(successStoryCreationForm.getPersonName());
        placedStudent.setGender("");
        placedStudent.setLastName("");
        placedStudent.setPlacedCompany(successStoryCreationForm.getPlacedCompanyName());
        placedStudent.setYearOfPlacement(successStoryCreationForm.getYearOfPlacement());
        placedStudent.setDesignation(successStoryCreationForm.getDesignation());
        placedStudent.setPackageDetails(successStoryCreationForm.getPackageDetails());
        placedStudent.setOtherDetails(successStoryCreationForm.getOtherDetails());
        placedStudent.setCreatedBy(appUser.getCreatedBy());
        placedStudent.setCreatedOn(date);
        placedStudent.setModifiedBy(appUser.getModifiedBy());
        placedStudent.setModifiedOn(date);
        placedStudent.setActive(Short.parseShort("0"));
        
        placedStudentService.create(placedStudent);
        
        return "success";
    }
}
