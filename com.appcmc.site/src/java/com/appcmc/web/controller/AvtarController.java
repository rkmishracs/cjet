/**
 *
 */
package com.appcmc.web.controller;


import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.ContactService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.AvtarProfileForm;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@RequestMapping("/avtar-profile")
public class AvtarController {

    private StudentService studentService = null;
    private AppUser appUser = null;
    private Student student = null;
    private Contacts contacts = null;
    private ContactService contactsService = null;
    private static Logger LOG = Logger.getLogger(AvtarController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String showAvtarHome(
            @ModelAttribute AvtarProfileForm avtarProfileForm,
            WebRequest request) {
        
        appUser = (AppUser) request.getAttribute("user",
                WebRequest.SCOPE_SESSION);
        studentService = (StudentService) AppContext.APPCONTEXT
                .getBean(ContextIdNames.STUDENT_SERVICE);
        contactsService = (ContactService) AppContext.APPCONTEXT
                .getBean(ContextIdNames.CONTACT_SERVICE);
        student = (Student) studentService
                .findStudentByEnrollmentNumber(appUser.getEnrollmentNumber());
        if (student == null) {
            // TODO
            LOG.debug("===============Student is Null===============");
            return "";
        }
        avtarProfileForm.setEnrollmentNumber(student.getEnrollmentNumber());
        avtarProfileForm.setEmail(student.getEmail());
        avtarProfileForm.setFirstName(student.getFirstName());
        avtarProfileForm.setLastName(student.getLastName());
        SimpleDateFormat simpleDateFormat = (SimpleDateFormat) AppContext.APPCONTEXT.getBean(ContextIdNames.SIMPLE_DATE_FORMAT);
        try {
            simpleDateFormat.parse("dd-MM-yyyy");
        } catch (ParseException exception) {
            LOG.warn("AvtarController", exception);
        }
        Date dateOfBirth = student.getDateOfBirth();
        avtarProfileForm.setDateOfBirth(simpleDateFormat.format(dateOfBirth));
        avtarProfileForm.setGender(student.getGender());
        avtarProfileForm.setNationality(student.getNationality());
        avtarProfileForm.setCategorey(student.getCategory());
        avtarProfileForm.setStatus(student.getMaritalStatus());
        avtarProfileForm.setFatherName(student.getFatherName());
        avtarProfileForm.setMotherName(student.getMotherName());
        avtarProfileForm.setOcupation(student.getOccupation());
        avtarProfileForm.setAnnualIncome(String.valueOf(student.getIncome()));
        if (student.getContacts() == null) {
            avtarProfileForm.setCity("");
            avtarProfileForm.setState("");
            avtarProfileForm.setCountry("");
            avtarProfileForm.setAlternativeEmail("");
            avtarProfileForm.setMobile("");
            avtarProfileForm.setAddress("");
            avtarProfileForm.setProfilePic(null);
        }
        contacts = contactsService.findById(student.getId());
        if (contacts == null) {
            // TODO
            LOG.debug("===============Contact Not Available for Student===============");
            return "";
        }
        avtarProfileForm.setCity(contacts.getCity());
        avtarProfileForm.setState(contacts.getState());
        avtarProfileForm.setCountry(contacts.getCountry());
        avtarProfileForm.setAlternativeEmail(contacts.getAlternativeEmail());
        avtarProfileForm.setMobile(contacts.getMobile());
        avtarProfileForm.setAddress(contacts.getAddress());
        avtarProfileForm.setProfilePic(null);
       
        return "/avtar/avtarDen";
    }
}
