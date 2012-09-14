/**
 *
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Events;
import com.appcmc.domain.sub.PlacedStudent;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.AppUserService;
import com.appcmc.service.ContactService;
import com.appcmc.service.EventsService;
import com.appcmc.service.PlacedStudentService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.SignInForm;
import com.appcmc.web.utils.CookieUtils;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    private Events events = null;
    private StudentService studentService = null;
    private Contacts contacts = null;
    private ContactService contactService = null;
    private EventsService eventsService = null;
    private PlacedStudentService placedStudentService = null;
    List<PlacedStudent> placedStudents = null;
    
    public HomeController(){
        AppCmcSpringContext.init();
    }

    @RequestMapping(method = RequestMethod.GET)
    public String showHome(@ModelAttribute SignInForm signInForm, HttpServletRequest request, WebRequest req) {

        eventsService = (EventsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EVENT_SERVICE);
        List<Events> eventList = eventsService.getAll();
        Date presentDate = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
        Events eventsJobFair = null;
        Events canceledEvent = null;
        for (Events evnt : eventList) {
            if (evnt.getEventType().equalsIgnoreCase("Walk-In") && evnt.getActive().equals(Short.parseShort("1"))) {
                if (evnt.getEventOn().after(presentDate)) {
                    events = evnt;
                    break;
                }
            }
        }
        for (Events evnt : eventList) {
            if (evnt.getEventType().equalsIgnoreCase("Job Fair") && evnt.getActive().equals(Short.parseShort("1"))) {
                if (evnt.getEventOn().after(presentDate)) {
                    eventsJobFair = evnt;
                    break;
                }
            }
        }

        for (Events evnt : eventList) {
            if (evnt.getActive().equals(Short.parseShort("0"))) {
                canceledEvent = evnt;
            }
        }
        
        placedStudentService = (PlacedStudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.PLACED_STUDENT_SERVICE);
        
        placedStudents = placedStudentService.getAll();
        
        req.setAttribute("canceledEvent", canceledEvent, WebRequest.SCOPE_REQUEST);
        req.setAttribute("walkInEvent", events, WebRequest.SCOPE_REQUEST);
        req.setAttribute("jobFairEvent", eventsJobFair, WebRequest.SCOPE_REQUEST);
        req.setAttribute("placedStudents", placedStudents, WebRequest.SCOPE_REQUEST);

        String cookieValue = CookieUtils.getCookieValue("appUser", request);
        if (cookieValue == null) {
            return "/home/appHome";
        }

        appUserService = (AppUserService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER_SERVICE);
        appUser = appUserService.findByGuid(cookieValue);
        if (appUser == null) {
            return "/home/appHome";
        }
        if (appUser.getType().equalsIgnoreCase("admin")) {
            req.setAttribute("user", appUser, WebRequest.SCOPE_SESSION);
            return "redirect:/master";
        }
        if (appUser.getType().equalsIgnoreCase("student")) {
            studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
            contactService = (ContactService) AppContext.APPCONTEXT.getBean(ContextIdNames.CONTACT_SERVICE);
            student = studentService.findStudentByEnrollmentNumber(appUser.getEnrollmentNumber());

            LOG.debug(student);
            if (student == null) {
                // TO Do
                LOG.debug("===============Not Found");
                return "";
            }

            contacts = contactService.findByEnrollmentNumber(student.getEnrollmentNumber());
            req.setAttribute("user", appUser, WebRequest.SCOPE_SESSION);
            req.setAttribute("student", student, WebRequest.SCOPE_SESSION);
            req.setAttribute("contacts", contacts, WebRequest.SCOPE_SESSION);
            return "redirect:/avtar";

        }

        return "/home/appHome";
    }
    
    @RequestMapping(method= RequestMethod.GET ,value="/about")
    public String aboutUs(){
        return "/home/aboutUs";
    }
    @RequestMapping(method= RequestMethod.GET ,value="/contact")
    public String contactUs(){
        return "/home/contactUs";
    }
}
