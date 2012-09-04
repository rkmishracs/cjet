/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.tests;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.PlacedStudent;
import com.appcmc.domain.sub.StudentProfile;
import com.appcmc.service.PlacedStudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author cmc
 */
public class PlacedStudentTest {
    
    private static Logger LOG = Logger.getLogger(AppUserTest.class);

	public static void main(String[] args) {
            
            AppCmcSpringContext.init();
            
            PlacedStudentService placedStudentService = (PlacedStudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.PLACED_STUDENT_SERVICE);

            PlacedStudent placedStudent = (PlacedStudent) AppContext.APPCONTEXT
                .getBean(ContextIdNames.PLACED_STUDENT);
            
//         placedStudent.setEnrollmentNumber("CJET130632012");
//         placedStudent.setFirstName("Hasan");
//         placedStudent.setLastName("anwar");
//         placedStudent.setGender("M");
//         placedStudent.setPlacedCompany("Infosys");
//         placedStudent.setYearOfPlacement("2011");
//         placedStudent.setDesignation("Developer");
//         placedStudent.setPackageDetails("25000");
//         placedStudent.setOtherDetails("add");
//         placedStudent.setCreatedOn(new java.util.Date());
//         placedStudent.setCreatedBy(1L);
//         placedStudent.setModifiedOn(new java.util.Date());
//         placedStudent.setModifiedBy(1L);
//         placedStudent.setActive(Short.parseShort("1"));
//         
//         placedStudentService.create(placedStudent);
         
         
         List<PlacedStudent> placedStudentList = placedStudentService.getAll();
        for(PlacedStudent ps : placedStudentList){
            LOG.debug(ps);
        }
        }
    
}
