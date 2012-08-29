package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.FindByEnrollmentNumberForm;
import com.appcmc.web.forms.FindByMobileForm;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping("/search")
public class SearchController {

    private static Logger LOG = Logger.getLogger(AvtarHomeController.class);
    StudentService studentService = null;
    Student student = null;

    @RequestMapping(method = RequestMethod.GET)
    public String showSearchPage(@ModelAttribute FindByEnrollmentNumberForm findByEnrollmentNumberForm, @ModelAttribute FindByMobileForm findByMobileForm) {

        return "/master/searchData";
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Student viewSearch(@ModelAttribute FindByEnrollmentNumberForm findByEnrollmentNumberForm, WebRequest request) {
        student = (Student) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT);
        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        LOG.debug(findByEnrollmentNumberForm.getEnrollmentId());
        student = studentService.findStudentByEnrollmentNumber(findByEnrollmentNumberForm.getEnrollmentId());
        if (student == null) {
            return null;
        }

        return student;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/searchByMobile")
    @ResponseBody
    public String getByMobile(@ModelAttribute FindByMobileForm findByMobileForm){
     
            studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
            List<Student> studentList = studentService.findByMobile(findByMobileForm.getMobile());
            StringBuilder builder = new StringBuilder(); 
            builder.append("<table class='ui-widget ui-widget-content'><tr class='ui-widget-header'><th>EnrollmentNumber</th><th>FirstName</th><th>LastName</th><th>Mobile</th></tr><tr>");
            for (Student std : studentList) {
                builder.append("<td><label>" + std.getEnrollmentNumber() + "</label></td>");
                builder.append("<td><label>" + std.getFirstName() + "</label></td>");
                builder.append("<td><label>" + std.getLastName() + "</label></td>");
                builder.append("<td><label>" + std.getContacts().getMobile() + "</label></td>");
            }
            builder.append("</tr></table>");
        
        return builder.toString();
    }
}
