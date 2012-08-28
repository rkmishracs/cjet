
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.StudentProfile;
import com.appcmc.service.AppUserService;
import com.appcmc.service.StudentProfileService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.AvtarResumeForm;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;


import javax.xml.transform.stream.StreamResult;
import org.apache.log4j.Logger;
import org.apache.poi.hwpf.HWPFDocumentCore;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.converter.WordToHtmlUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.w3c.dom.Document;

/**
 *
 * @author Sudarsan
 */
@Controller
@RequestMapping("/resume")
public class UploadResumeController {
    
    private AppUserService appUserService = null;
    private AppUser appUser = null;
    private StudentProfileService studentProfileService = null;
    private StudentProfile studentProfile = null;
    private static Logger LOG = Logger.getLogger(UploadResumeController.class);
    
    @RequestMapping(method = RequestMethod.GET)
    public String showResumeUploadView(@ModelAttribute AvtarResumeForm avtarResumeForm, WebRequest request) {
        
        AppCmcSpringContext.init();
        appUserService = (AppUserService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER_SERVICE);
        
        appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        appUser = appUserService.findByEnrollmentNumber(appUser.getEnrollmentNumber());
        if (appUser == null) {
            //TODO
            return "";
        }
        
        return "/avtar/uploadResume";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/view")
    public String viewResume(WebRequest request, HttpServletRequest httpServletRequest) {
        
        LOG.debug("==============================In View Resume");
        appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        
        if (appUser == null) {
            // TO DO
            LOG.debug("==========App User Null");
            return "";
        }
        
        studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);
        studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber(appUser.getEnrollmentNumber());
        
        if (studentProfile == null) {
            LOG.debug("==========StudentProfile Null");
            return "";
        }
        
        ByteArrayInputStream bais = null;
        OutputStream outputStream = null;
        try {
            bais = new ByteArrayInputStream(studentProfile.getResume());
            
            HWPFDocumentCore wordDocument = WordToHtmlUtils.loadDoc(bais);
            WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(
                    DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
            wordToHtmlConverter.processDocument(wordDocument);
            Document htmlDocument = wordToHtmlConverter.getDocument();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            DOMSource domSource = new DOMSource(htmlDocument);
            StreamResult streamResult = new StreamResult(out);
            
            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer serializer = tf.newTransformer();
            serializer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
            serializer.setOutputProperty(OutputKeys.INDENT, "yes");
            serializer.setOutputProperty(OutputKeys.METHOD, "html");
            serializer.transform(domSource, streamResult);
            out.close();
            
            String result = new String(out.toByteArray());
            String path = httpServletRequest.getSession().getServletContext().getRealPath("/WEB-INF/views/avtar/");
            
            
            File htmlTemp = new File(path + "/showResume.jsp");
            outputStream = new FileOutputStream(htmlTemp);
            outputStream.write(result.getBytes());
            
            
        } catch (Exception exception) {
            LOG.debug("Exception", exception);
        } finally {
            
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (Exception exception) {
                    LOG.debug("Ex", exception);
                }
                
            }
        }
        
        return "/avtar/viewResume";
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String postResume(@ModelAttribute AvtarResumeForm avtarResumeForm) {
        
        AppCmcSpringContext.init();
        LOG.debug("================in Post Resume" + avtarResumeForm.getEnrollmentNumber());
        String enrollmentNumber = avtarResumeForm.getEnrollmentNumber();
        studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);
        studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber(enrollmentNumber);
        
        if (studentProfile == null) {
            // TO DO
            LOG.debug("====================Student Profile Null");
            return "";
        }        
        
        byte[] resume = avtarResumeForm.getResumeDoc().getBytes();
        
        studentProfile.setId(studentProfile.getId());
        studentProfile.setGuid(studentProfile.getGuid());
        studentProfile.setEnrollmentNumber(studentProfile.getEnrollmentNumber());
        studentProfile.setTitle(studentProfile.getTitle());
        studentProfile.setTotalExperience(studentProfile.getTotalExperience());
        studentProfile.setKeySkills(studentProfile.getKeySkills());
        studentProfile.setCurrentEmployer(studentProfile.getCurrentEmployer());
        studentProfile.setRole(studentProfile.getRole());
        studentProfile.setPreviousEmployer(studentProfile.getPreviousEmployer());
        studentProfile.setResume(resume);
        studentProfile.setCreatedOn(studentProfile.getCreatedOn());
        studentProfile.setCreatedBy(1L);
        studentProfile.setModifiedOn(new java.util.Date());
        studentProfile.setModifiedBy(1L);
        studentProfile.setActive(Short.parseShort("1"));
        
        studentProfileService.create(studentProfile);
        
        return "/resume";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/iframe")
    public String getView() {                
        return "/avtar/showResume";
    }
}
