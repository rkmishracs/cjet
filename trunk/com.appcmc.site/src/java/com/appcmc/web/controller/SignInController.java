/**
 *
 */
package com.appcmc.web.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.AppMailService;
import com.appcmc.service.AppUserService;
import com.appcmc.service.ContactService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.EnrollmentForm;
import com.appcmc.web.forms.ForgotPasswordForm;
import com.appcmc.web.forms.SignInForm;
import org.apache.commons.logging.Log;
import org.springframework.mail.javamail.MimeMailMessage;

/**
 * @author Sudarsan
 *
 */
@Controller
@RequestMapping("/sign-in")
public class SignInController {

    private static Logger LOG = Logger.getLogger(SignInController.class);
    private AppUserService appUserService = null;
    private StudentService studentService = null;
    private Student student = null;
    private ContactService contactService = null;
    private AppMailService appMailService = null;
    private Contacts contacts = null;

    @RequestMapping(method = RequestMethod.GET)
    public String showSignInForm(@ModelAttribute SignInForm signInForm) {
        return "/home/signin";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/out")
    public String doSignOut(WebRequest request) {

        AppUser appUser = (AppUser) request.getAttribute("user",
                WebRequest.SCOPE_SESSION);

        if (appUser == null) {
            return "redirect:/appHome";

        }

        request.removeAttribute("user", WebRequest.SCOPE_SESSION);
        return "redirect:/appHome";
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String doSigIn(@ModelAttribute SignInForm signInForm,
            @ModelAttribute EnrollmentForm enrollmentForm, WebRequest request) {


        LOG.debug("In Sign In Controller");
        String userId = signInForm.getUserId();
        String password = signInForm.getPassword();

        AppCmcSpringContext.init();

        appUserService = (AppUserService) AppContext.APPCONTEXT
                .getBean(ContextIdNames.APP_USER_SERVICE);

        AppUser appUser = appUserService.authenticate(userId, password);

        if (appUser == null) {
            request.setAttribute("dbError", "Invalid UserId/Password",
                    WebRequest.SCOPE_SESSION);
            return "Invalid UserName/Password";
        }

        if (appUser.getType().equalsIgnoreCase("admin")) {
            LOG.debug("======================In Master");
            request.setAttribute("user", appUser, WebRequest.SCOPE_SESSION);
            // TO Do
            return "master";
        }

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

        request.setAttribute("user", appUser, WebRequest.SCOPE_SESSION);
        request.setAttribute("student", student, WebRequest.SCOPE_SESSION);
        request.setAttribute("contacts", contacts, WebRequest.SCOPE_SESSION);
        return "avtar";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/forgot-password")
    public String forgotPassword(@ModelAttribute ForgotPasswordForm forgotPasswordForm) {
        return "/home/forgotPassword";
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, value = "/get-forgot-password")
    public String GetForgotPassword(@ModelAttribute ForgotPasswordForm forgotPasswordForm) {

        LOG.debug("================================= In Post Method Of Forgot Password");
        String userName = forgotPasswordForm.getUsername();
        String securityQuestion = forgotPasswordForm.getSecurityQuestion();
        String answer = forgotPasswordForm.getAnswer();

        AppCmcSpringContext.init();

        appUserService = (AppUserService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER_SERVICE);
        
        AppUser appUser = appUserService.findByEnrollmentNumber(userName);
             
             
           
        if (appUser == null) {
            return "Invalid Data";

        }

        if (appUser.getSecurityQuestion().equalsIgnoreCase(securityQuestion) && appUser.getSecurityAnswer().equalsIgnoreCase(answer)) {
            //String password = appUser.getPassword();
            
            appMailService = (AppMailService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_MAIL_SERVICE);
            appMailService.sendMail(appUser);

            return "password";
        } else {
            return "Invalid Security Question Or Answer";
        }

    }
}
