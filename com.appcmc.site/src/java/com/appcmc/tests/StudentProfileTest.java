package com.appcmc.tests;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.StudentProfile;
import com.appcmc.service.StudentProfileService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import java.util.List;
import org.apache.log4j.Logger;

public class StudentProfileTest {

    private static Logger LOG = Logger.getLogger(StudentProfileTest.class);

    public static void main(String[] args) {

        LOG.debug("In StudentprofileTest");

        AppCmcSpringContext.init();

        StudentProfileService studentProfileService = (StudentProfileService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_PROFILE_SERVICE);

        /*StudentProfile studentProfile = (StudentProfile) AppContext.APPCONTEXT
                .getBean(ContextIdNames.STUDENT_PROFILE);

        studentProfile.setEnrollmentNumber("CJET235442012");
        studentProfile.setTitle("Software Developer");
        studentProfile.setTotalExperience("3");
        studentProfile.setKeySkills("JAVA HTML Java Script");
        studentProfile.setCurrentEmployer("CMC LTD");
        studentProfile.setRole("Developer");
        studentProfile.setPreviousEmployer("Satyam");
        studentProfile.setCreatedOn(new java.util.Date());
        studentProfile.setCreatedBy(1L);
        studentProfile.setModifiedOn(new java.util.Date());
        studentProfile.setModifiedBy(1L);
        studentProfile.setActive(Short.parseShort("1"));

        studentProfileService.create(studentProfile);*/
        
        /*studentProfile = studentProfileService.findStudentProfileByEnrollmentNumber("CJET198902012");
        
        if(studentProfile == null){
            LOG.debug("Record Not Found");
            return;
        }
        
        LOG.debug(studentProfile);*/
        
        List<StudentProfile> studentProfileList = studentProfileService.getAll();
        for(StudentProfile std : studentProfileList){
            LOG.debug(std);
        }

    }
}
