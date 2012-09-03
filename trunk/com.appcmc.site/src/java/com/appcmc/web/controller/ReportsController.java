/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Student;
import com.appcmc.domain.sub.StudentProfile;
import com.appcmc.service.StudentProfileService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

/**
 *
 * @author cmc
 */
@Controller
@RequestMapping("/reports")
public class ReportsController {

   private Contacts contacts = null;
   private StudentService studentService = null;
   private Student student = null;
   private StudentProfileService studentProfileService = null;
   private StudentProfile studentProfile = null;
   static Logger LOG = Logger.getLogger(ReportsController.class);

   @RequestMapping(method = RequestMethod.GET)
   public String reports() {

      return "";
   }

   @RequestMapping(method = RequestMethod.GET, value = "/all")
   public String allReports(WebRequest request) {
      LOG.debug("=================In AllReports Controller");
      AppCmcSpringContext.init();
      studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
      List<Student> studentList = studentService.getAll();
      Iterator<Student> iterator = studentList.iterator();
      while (iterator.hasNext()) {
         student = iterator.next();

         LOG.debug(student);
      }
      request.setAttribute("student", studentList, WebRequest.SCOPE_REQUEST);
      return "/master/allEnrolls";
   }

   @ResponseBody
   @RequestMapping(method = RequestMethod.GET, value = "/studentEnrl", params = {"enrlNo"})
   public Student studentReport(@RequestParam String enrlNo) throws JSONException {
      LOG.debug("=================In studentReports Controller");
      //LOG.debug(enrlNo);
      studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
      student = studentService.findStudentByEnrollmentNumber(enrlNo);
      LOG.debug(student);
      //contacts = student.getContacts();

      return student;
   }

   @RequestMapping(method = RequestMethod.GET, value = "/monthlyReport")
   public String monthlyReport(WebRequest request) {
      LOG.debug("=================In monthlyReports Controller");
      AppCmcSpringContext.init();
      studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
      List<Student> studentMonthlyList = studentService.getByCurrentMonth();
      Iterator<Student> iterator = studentMonthlyList.iterator();
      while (iterator.hasNext()) {
         student = iterator.next();
         LOG.debug(student);
      }
      request.setAttribute("studentsMonthlyList", studentMonthlyList, WebRequest.SCOPE_REQUEST);
      return "/master/monthlyReport";
   }

   @RequestMapping(method = RequestMethod.GET, value = "/weeklyReport")
   public String weeklyReport(WebRequest request) {
      LOG.debug("=================In weeklyReports Controller");
      AppCmcSpringContext.init();
      studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
      List<Student> studentWeeklyList = studentService.getByCurrentWeek();
      Iterator<Student> iterator = studentWeeklyList.iterator();
      while (iterator.hasNext()) {
         student = iterator.next();
         LOG.debug(student);
      }
      request.setAttribute("studentsWeeklyList", studentWeeklyList, WebRequest.SCOPE_REQUEST);
      return "/master/weeklyReport";
   }

   @RequestMapping(method = RequestMethod.GET, value = "/dailyReport")
   public String dailyReport(WebRequest request) {
      LOG.debug("=================In dailyReports Controller");
      AppCmcSpringContext.init();
      studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
      List<Student> studentDailyList = studentService.getByDay();
      Iterator<Student> iterator = studentDailyList.iterator();
      while (iterator.hasNext()) {
         student = iterator.next();
         LOG.debug(student);
      }
      request.setAttribute("studentsDailyList", studentDailyList, WebRequest.SCOPE_REQUEST);
      return "/master/dailyReport";
   }

   @RequestMapping(method = RequestMethod.GET, value = "/viewAllProfiles")
   public String viewAllProfiles(WebRequest request) {
      LOG.debug("=================In dailyReports Controller");
      AppCmcSpringContext.init();
      studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
      List<Student> studentList = studentService.getAll();
      List<Contacts> contactsList = new ArrayList<Contacts>();

      studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);
      List<StudentProfile> studentProfiles = studentProfileService.getAll();

      for (Student std : studentList) {
         contactsList.add(std.getContacts());
      }

      request.setAttribute("student", studentList, WebRequest.SCOPE_REQUEST);
      request.setAttribute("contacts", contactsList, WebRequest.SCOPE_REQUEST);
      request.setAttribute("studentProfile", studentProfiles, WebRequest.SCOPE_REQUEST);

      return "/master/viewAllProfiles";
   }

   @RequestMapping(method = RequestMethod.GET, value = "/download/{id}")
   public String downloadProfile(@PathVariable("id") String id, HttpServletResponse response) {
      LOG.debug("=======================Id : " + id);
      studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);
      studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber(id);

      if (studentProfile == null) {
         // TO DO
         return "";

      }
      
      byte[] resumeBytes = studentProfile.getResume();
      try {         
         response.setHeader("Content-Disposition", "attachment;inline;filename=\""
                 + studentProfile.getFileName() + "\"");
         OutputStream out = response.getOutputStream();
         response.setContentType(studentProfile.getType());
         response.setContentLength(resumeBytes.length);
         FileCopyUtils.copy(resumeBytes, response.getOutputStream());
         out.flush();
         out.close();
      } catch (Exception exception) {
         LOG.debug("EX", exception);
      } finally {
         
      }
      return null;
   }
}
