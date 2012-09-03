/**
 *
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.AppUserService;
import com.appcmc.service.ContactService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.appcmc.web.forms.SignInForm;
import com.appcmc.web.utils.CookieUtils;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.web.context.request.WebRequest;

/**
 * @author Sudarsan
 *
 */
@Controller
@RequestMapping("/appHome")
public class HomeController {

   private static Logger LOG = Logger.getLogger(HomeController.class);
   private AppUserService appUserService = null;
   private AppUser appUser = null;
   private Student student = null;
   private StudentService studentService = null;
   private Contacts contacts = null;
   private ContactService contactService = null;

   @RequestMapping(method = RequestMethod.GET)
   public String showHome(@ModelAttribute SignInForm signInForm, HttpServletRequest request, WebRequest req) {
      AppCmcSpringContext.init();
      String cookieValue = CookieUtils.getCookieValue("appUser", request);
      LOG.debug("=================Cookie Value ====" + cookieValue);

      if (cookieValue == null) {
         return "/home/appHome";
      }

      appUserService = (AppUserService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER_SERVICE);
      appUser = appUserService.findByGuid(cookieValue);

      if (appUser == null) {
         return "/home/appHome";
      }

      if (appUser.getType().equalsIgnoreCase("admin")) {
         LOG.debug("In Admin====================Cookie");
         req.setAttribute("user", appUser, WebRequest.SCOPE_SESSION);
         return "redirect:/master";
      }

      if (appUser.getType().equalsIgnoreCase("student")) {
         LOG.debug("In Student ====================Cookie");
         studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
         contactService = (ContactService) AppContext.APPCONTEXT.getBean(ContextIdNames.CONTACT_SERVICE);
         student = studentService.findStudentByEnrollmentNumber(appUser.getEnrollmentNumber());

         LOG.debug(student);
         if (student == null) {
            // TO Do
            LOG.debug("========================Not Found");
            return "";
         }

         contacts = contactService.findByEnrollmentNumber(student.getEnrollmentNumber());
         LOG.debug("Contacts ========" + contacts);
         LOG.debug("======================In Student");

         req.setAttribute("user", appUser, WebRequest.SCOPE_SESSION);
         req.setAttribute("student", student, WebRequest.SCOPE_SESSION);
         req.setAttribute("contacts", contacts, WebRequest.SCOPE_SESSION);
         return "redirect:/avtar";

      }



      return "/home/appHome";


   }
}
