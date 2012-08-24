package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.FindByEnrollmentNumberForm;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @RequestMapping(method = RequestMethod.GET)
    public String showSearchPage(@ModelAttribute FindByEnrollmentNumberForm findByEnrollmentNumberForm) {

        return "/master/searchData";
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Student viewSearch(@ModelAttribute FindByEnrollmentNumberForm findByEnrollmentNumberForm, WebRequest request) {
        Student student = (Student) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT);
        studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        LOG.debug(findByEnrollmentNumberForm.getEnrollmentId());
        student = studentService.findStudentByEnrollmentNumber(findByEnrollmentNumberForm.getEnrollmentId());
        if (student == null) {
            return null;
        }

        return student;
    }
}
