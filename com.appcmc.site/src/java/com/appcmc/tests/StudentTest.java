
package com.appcmc.tests;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import java.util.List;
import org.apache.log4j.Logger;

public class StudentTest {
    
    private static Logger LOG = Logger.getLogger(StudentTest.class);
    
    public static void main(String[] args) {
        
        AppCmcSpringContext.init();
        StudentService studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
        /*Student student = (Student) AppContext.APPCONTEXT
                .getBean(ContextIdNames.STUDENT);
        List<Student> studentList = studentService.getAll();
        for(Student std : studentList){
            LOG.debug(std);
        }*/
        
       /* List<Student> studentList = studentService.getByCurrentWeek();
       // LOG.debug("=================Student List With Weeks Matches are : "+studentList.size());
        
        for(Student std : studentList){
            LOG.debug(std.getId()+"\n");
        }*/
        
        List<Student> studentList = studentService.getByCurrentMonth();
        for(Student std : studentList){
            LOG.debug(std.getId()+"\n");
        }
        
        /*List<Student> studentList = studentService.getByDay();
        for(Student std : studentList){
            LOG.debug(std.getId()+"\n");
        }*/
    }
}
