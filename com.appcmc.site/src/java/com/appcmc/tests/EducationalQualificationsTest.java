package com.appcmc.tests;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.EducationalQualifications;
import com.appcmc.service.EducationalQualificationsService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import java.util.List;
import org.apache.log4j.Logger;

public class EducationalQualificationsTest {

    private static Logger LOG = Logger.getLogger(EducationalQualificationsTest.class);

    public static void main(String[] args) {

        LOG.debug("In StudentprofileTest");

        AppCmcSpringContext.init();

        EducationalQualificationsService educationalQualificationsService = (EducationalQualificationsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EDUCATIONAL_QUALIFICATIONS_SERVICE);
        
        /*EducationalQualifications educationalQualifications = (EducationalQualifications) AppContext.APPCONTEXT
                .getBean(ContextIdNames.EDUCATIONAL_QUALIFICATIONS);
        
        educationalQualifications.setEnrollmentNumber("CJET212232012");
        educationalQualifications.setOneQualification("SSC");
        educationalQualifications.setOneYearOfPass("2003");
        educationalQualifications.setOneUniversity("SSC");
        educationalQualifications.setOneGrade("A");
        
        educationalQualifications.setTwoQualification("Inter");
        educationalQualifications.setTwoYearOfPass("2005");
        educationalQualifications.setTwoUniversity("Inter");
        educationalQualifications.setTwoGrade("B");
        
        educationalQualifications.setThreeQualification("B.sc");
        educationalQualifications.setThreeYearOfPass("2008");
        educationalQualifications.setThreeUniversity("JNTU");
        educationalQualifications.setThreeGrade("B");
        
        educationalQualifications.setFourQualification("MCA");
        educationalQualifications.setFourYearOfPass("2011");
        educationalQualifications.setFourUniversity("JNTU");
        educationalQualifications.setFourGrade("B");
        
        educationalQualifications.setAdditionalQualification("No");
        
        educationalQualifications.setCreatedOn(new java.util.Date());
        educationalQualifications.setCreatedBy(1L);
        educationalQualifications.setModifiedOn(new java.util.Date());
        educationalQualifications.setModifiedBy(1L);
        educationalQualifications.setActive(Short.parseShort("1"));
        
        educationalQualificationsService.create(educationalQualifications);*/
        
       /* educationalQualifications = educationalQualificationsService.findEducationalQualificationsByEnrollmentNumber("CJET235442012");
        if(educationalQualifications == null){
            LOG.debug("Record Not Found");
            return;
        }else{
            LOG.debug(educationalQualifications);
        }*/
        
        
        List<EducationalQualifications> educationalQualificationsList = educationalQualificationsService.getAll();
        for(EducationalQualifications ed : educationalQualificationsList){
            LOG.debug(ed);
        }
    }
}
